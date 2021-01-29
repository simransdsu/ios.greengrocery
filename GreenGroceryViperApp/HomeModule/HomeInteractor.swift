import Foundation

// Interactor is responsible for all the uses cases such making network calls for the View it is attached to via presenter
// Making Db operations etc etc.
protocol HomeUseCase {
    func getTitle() -> HomeModel
}

class HomeInteractor { }

extension HomeInteractor : HomeUseCase {
    func getTitle() -> HomeModel {
        return HomeModel(title: "Hello VIPER")
    }
}
