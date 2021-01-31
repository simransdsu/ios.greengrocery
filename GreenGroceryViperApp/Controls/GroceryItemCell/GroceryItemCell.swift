import UIKit

class GroceryItemCell: UITableViewCell {

    @IBOutlet weak var groceryImageView: UIImageView!
    @IBOutlet weak var groceryTitleLabel: UILabel!
    @IBOutlet weak var groceryDescriptionLabel: UILabel!
    @IBOutlet weak var groceryPriceLabel: UILabel!
    @IBOutlet weak var groceryAddBagStepperStackView: UIStackView!
    
    var groceryAddBagStepper: AddBagControl = AddBagControl.loadFromNib()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupStepperControl()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(withViewModel viewModel: GroceryItemViewModel) {
        self.groceryImageView.image = UIImage(named: viewModel.image)
        self.groceryTitleLabel.text = viewModel.title
        self.groceryPriceLabel.text = viewModel.price
        self.groceryDescriptionLabel.text = viewModel.details
    }
    
    fileprivate func setupStepperControl() {
        groceryAddBagStepper.configure(usingViewModel: AddBagViewModel(title: "Add To Bag", stepValue: 0)) { (result) in
            print(result)
        }
        groceryAddBagStepper.translatesAutoresizingMaskIntoConstraints = false
        groceryAddBagStepperStackView.addArrangedSubview(groceryAddBagStepper)
    }
}
