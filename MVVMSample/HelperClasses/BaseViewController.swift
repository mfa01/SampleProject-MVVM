//
//  BaseViewController.swift
//  MVVMSample
//
//  Created by Mabed on 25/04/2022.
//

import Foundation
import UIKit

protocol BaseViewControllerProtocol {
    func applyStyling()
    func updateUI()
    func addStateHandlers()
}

class BaseViewController: UIViewController,BaseViewControllerProtocol {
    
    private lazy var loadingView: UIActivityIndicatorView = {
        let loginSpinner = UIActivityIndicatorView(style: .large)
        loginSpinner.translatesAutoresizingMaskIntoConstraints = false
        loginSpinner.hidesWhenStopped = true
        view.addSubview(loginSpinner)
        loginSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginSpinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return loginSpinner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyling()
        configureViews()
        addStateHandlers()
    }
    
    func applyStyling() {}
    
    func updateUI() {}
    
    func addStateHandlers() {}
    
    func configureViews() {}
    
    func showLoadingView() {
        loadingView.startAnimating()
    }
    
    func hideLoadingView() {
        loadingView.stopAnimating()
    }
    
}
