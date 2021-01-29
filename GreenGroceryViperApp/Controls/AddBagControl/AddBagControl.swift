import UIKit

class AddBagControl: UIView, ViewLoadable {

    // Coming from `ViewLoading` protocol.
    static var nibname: String = "\(AddBagControl.self)"
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var stepLabel: UILabel!
    
    var closure: BagClosure?
    
    var stepperValue: Int = 0 {
        didSet {
            let isHidden = stepperValue > 0
            
            addButton.isHidden = isHidden
            plusButton.isHidden = !isHidden
            minusButton.isHidden = !isHidden
            stepLabel.isHidden = !isHidden
            stepLabel.text = "\(stepperValue)"
        }
    }
    
    @IBAction func addToBag(_ sender: Any) {
        stepperValue = 1
        self.closure?(stepperValue)
    }
    
    @IBAction func incrementButton(_ sender: Any) {
        guard stepperValue < 10 else { return }
        stepperValue += 1
        self.closure?(stepperValue)
    }
    
    @IBAction func decrementButton(_ sender: Any) {
        guard stepperValue > 0 else { return }
        stepperValue -= 1
        self.closure?(stepperValue)
    }
    
    
    typealias BagClosure = (Int) -> Void
    func configure(bagClosure: @escaping BagClosure) {
        stepperValue = 0
        self.closure = bagClosure
    }

}

