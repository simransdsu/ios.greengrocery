import UIKit

protocol HomeView: class {
    func updateTitle(title: String)
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    
    // ViewController only knows about the presenter. It just talks with it, rest is the responsibility of the Presenter to hold ther VIPER objects.
    var presenter: HomePresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // To do anything, VC calls something from the presenter
        self.presenter.viewDidLoad()
    }
}

extension HomeViewController : HomeView {
    
    // This method is called through the presenter to talk back to the VC
    func updateTitle(title: String) {
        helloLabel.text = title
    }
}

