//
//  HomeViewPresenter.swift
//  MVVMSample
//
//  Created by Mabed on 25/04/2022.
//

import Foundation

struct HomeViewPresentation: Presentation {
    
    typealias rowType = (identifier: String, presentation: Presentation)
    var rows:[rowType] = []
    
    mutating func update(state: HomeState) {
        
        var newRows:[rowType] = []
        for item in state.songsData?.results ?? [] {
            let presentation = SongTableViewPresentation(imagePath: item.artworkUrl100, artistName: item.artistName, songName: item.trackName)
            newRows.append((SongTableViewCell.identifier,presentation))
        }
        rows = newRows
    }
}
