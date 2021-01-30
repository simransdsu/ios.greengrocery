import UIKit

protocol HomeView: class {
    func updateTitle(title: String)
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var containerStackView: UIStackView!
    lazy var addBagControl: AddBagControl = {
        let control = AddBagControl.loadFromNib()
        let viewModel = AddBagViewModel(title: "ADD TO BAG", stepValue: 0)
        control.configure(usingViewModel: viewModel) { stepperValue in
            print("Bag Step Value: \(stepperValue)")
        }
        return control
    }()
    
    
    // ViewController only knows about the presenter. It just talks with it, rest is the responsibility of the Presenter to hold ther VIPER objects.
    var presenter: HomePresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.containerStackView.addArrangedSubview(addBagControl)
    }
}

extension HomeViewController : HomeView {
    func updateTitle(title: String) {
        
    }
}

