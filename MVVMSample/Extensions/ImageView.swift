//
//  ImageView.swift
//  MVVMSample
//
//  Created by Mabed on 25/04/2022.
//

import Foundation
import UIKit

extension UIImageView {
    func setImageUsing(path: String?) {
        guard let path = path, let url = URL(string: path) else {
            return
        }
        
        NetworkHandler().getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = UIImage(data: data)
            }
        }
    }
}
