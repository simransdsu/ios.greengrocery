import UIKit
typealias BagClosure = (SkuItem) -> Void

@IBDesignable
class AddBagControl: UIView, ViewLoadable {

    // Coming from `ViewLoading` protocol.
    static var nibname: String = "\(AddBagControl.self)"
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var stepLabel: UILabel!
    
    var closure: BagClosure?
    
    var viewModel: AddBagViewModel! {
        didSet {
            let isHidden = viewModel.showStepper
            addButton.isHidden = isHidden
            plusButton.isHidden = !isHidden
            minusButton.isHidden = !isHidden
            stepLabel.isHidden = !isHidden
            stepLabel.text = "\(viewModel.stepValue)"
        }
    }

    @IBAction func addToBag(_ sender: Any) {
        self.viewModel = self.viewModel.onAddToBag()
        self.closure?((self.viewModel.id, self.viewModel.stepValue))
    }
    
    @IBAction func incrementButton(_ sender: Any) {
        self.viewModel = self.viewModel.onIncrement()
        self.closure?((self.viewModel.id, self.viewModel.stepValue))
    }
    
    @IBAction func decrementButton(_ sender: Any) {
        self.viewModel = self.viewModel.onDecrement()
        self.closure?((self.viewModel.id, self.viewModel.stepValue))
    }
    
    
    func configure(usingViewModel viewModel: AddBagViewModel, onStepperTap: @escaping BagClosure) {
        self.viewModel = viewModel
        self.addButton.setTitle(viewModel.title, for: .normal)
        self.closure = onStepperTap
    }

}



struct AddBagViewModel {
    let id: String
    let title: String
    let stepValue: Int
    let showStepper: Bool

    init(id: String = "", title: String, stepValue: Int) {
        self.id = id
        self.title = title
        self.stepValue = stepValue
        self.showStepper = stepValue > 0
    }
}

extension AddBagViewModel {
    func onAddToBag() -> AddBagViewModel {
        return AddBagViewModel(title: self.title, stepValue: 1)
    }
    
    func onIncrement() -> AddBagViewModel {
        guard stepValue < 10 else { return self }
        return AddBagViewModel(title: self.title, stepValue: self.stepValue + 1)
    }
    
    func onDecrement() -> AddBagViewModel {
        guard stepValue > 0 else { return self }
        return AddBagViewModel(title: self.title, stepValue: self.stepValue - 1)
    }
}
