//
//  HomePresenter.swift
//  GreenGroceryViperApp
//
//  Created by jc on 2020-12-18.
//

import Foundation

protocol HomePresentation {
    func viewDidLoad() -> Void
}

class HomePresenter {
    weak var view: HomeView?
    var interactor: HomeUseCase
    var router: HomeRouting
    
    init(view: HomeView, interactor: HomeUseCase, router: HomeRouting) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension HomePresenter : HomePresentation {
    func viewDidLoad() {
        let homeModel = self.interactor.getTitle()
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view?.updateTitle(title: homeModel.title)
        }
        
        
    }
}
