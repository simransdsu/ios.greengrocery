import UIKit

protocol HomeView: class {
    func updateGroceries(groceriesList: [GroceryItemViewModel])
    func addedToCart()
}

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    // ViewController only knows about the presenter. It just talks with it, rest is the responsibility of the Presenter to hold ther VIPER objects.
    var presenter: HomePresentation!
    
    var dataSource: [GroceryItemViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
        self.tableView.register(UINib(nibName: "\(GroceryItemCell.self)", bundle: nil), forCellReuseIdentifier: "\(GroceryItemCell.self)")
        self.title = "Fresh Groceries"
    }
}

extension HomeViewController : HomeView {
    func addedToCart() {
        print("Item added to cart successfully")
    }
    
    func updateGroceries(groceriesList: [GroceryItemViewModel]) {
        dataSource = groceriesList
        self.tableView.reloadData()
    }
}

// MARK: TableView DataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(GroceryItemCell.self)", for: indexPath) as! GroceryItemCell
        cell.configure(withViewModel: viewModel) { (skuItem) in
            self.presenter.onAddToCart(skuItem: skuItem)
        }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
}

