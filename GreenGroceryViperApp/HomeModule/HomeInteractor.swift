//
//  HomeInteractor.swift
//  GreenGroceryViperApp
//
//  Created by jc on 2020-12-18.
//

import Foundation

protocol HomeUseCase {
    func getTitle() -> HomeModel
}

class HomeInteractor { }

extension HomeInteractor : HomeUseCase {
    func getTitle() -> HomeModel {
        return HomeModel(title: "Hello VIPER")
    }
}
