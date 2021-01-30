import UIKit

class GroceryItemCell: UITableViewCell {

    @IBOutlet weak var groceryImageView: UIImageView!
    @IBOutlet weak var groceryTitleLabel: UILabel!
    @IBOutlet weak var groceryDescriptionLabel: UILabel!
    @IBOutlet weak var groceryPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
}
