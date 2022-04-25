//
//  HomeViewModel.swift
//  MVVMSample
//
//  Created by Mabed on 25/04/2022.
//

import Foundation

struct HomeState {
    
    enum Change: StateChange {
        case failed(error: Error?)
        case loading
        case loaded
    }
    
    var songsData: SongsResponse?
}

class HomeViewModel: StatefulViewModel<HomeState.Change> {
    
    var state: HomeState = HomeState()
    let networking = NetworkHandler()
    
    func fetchData() {
        emit(change: .loading)
        networking.loadSampleData(model: SongsResponse.self) { [weak self] result, error  in
            guard let self = self else {
                return
            }
            guard let result = result else {
                self.emit(change: .failed(error: error))
                return
            }
            self.state.songsData = result
            self.emit(change: .loaded)
        }
    }
}
