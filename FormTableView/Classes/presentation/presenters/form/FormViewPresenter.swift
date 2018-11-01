//
//  FormViewPresenter.swift
//  FormTableView
//
//  Created by José Miguel on 01/11/2018.
//

import Foundation

class FormViewPresenter {
    
    weak var view: FormViewView!
    
    func viewReady() {
        view.clean()
        view.configureLabels()
        view.configureTextField()
        view.configureKeyboard()
        view.configureAction()
    }
    
}
