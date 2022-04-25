//
//  SongTableViewCell.swift
//  MVVMSample
//
//  Created by Mabed on 25/04/2022.
//

import UIKit

struct SongTableViewPresentation: Presentation {
    let imagePath: String?
    let artistName: String?
    let songName: String?
}

class SongTableViewCell: BaseTableViewCell {

    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    var presentation: SongTableViewPresentation? {
        didSet {
            setupUI()
        }
    }
    
    func setupUI() {
        artistNameLabel.text = presentation?.artistName
        albumNameLabel.text = presentation?.songName
        coverImageView.setImageUsing(path: presentation?.imagePath)
    }
    
    override func applyStyling() {
        coverImageView.cornerRounds(radius: 5)
    }
}
