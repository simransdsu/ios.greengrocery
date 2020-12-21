//
//  ViewController.swift
//  GreenGroceryViperApp
//
//  Created by jc on 2020-12-17.
//

import UIKit

protocol HomeView: class {
    func updateTitle(title: String)
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    
    var presenter: HomePresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }
}

extension HomeViewController : HomeView {
    func updateTitle(title: String) {
        helloLabel.text = title
    }
}

