//
//  SearchAddressViewConnector.swift
//  FormTableView
//
//  Created by José Miguel on 01/11/2018.
//

import Foundation

class SearchAddressViewConnector {
    
    // MARK: - Dependency injection
    func connect(view: SearchAddressViewController) {
        let presenter = SearchAddressViewPresenter()
        view.presenter = presenter
        view.connector = self
        presenter.view = view
    }
}
