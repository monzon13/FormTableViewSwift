//
//  FormViewConnector.swift
//  FormTableView
//
//  Created by José Miguel on 01/11/2018.
//

import Foundation

public class FormViewConnector {
    
    // MARK: - Dependency injection
    public init (view: FormView) {
        let presenter = FormViewPresenter()
        view.presenter = presenter
        view.connector = self
        presenter.view = view
    }
}
