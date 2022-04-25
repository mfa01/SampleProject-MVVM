//
//  View.swift
//  MVVMSample
//
//  Created by Mabed on 25/04/2022.
//

import Foundation
import UIKit

extension UIView {
    func cornerRounds(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
