//
//  FormViewView.swift
//  FormTableView
//
//  Created by José Miguel on 01/11/2018.
//

import Foundation

protocol FormViewView: class {
    func clean()
    func configureLabels()
    func configureTextField()
    func configureKeyboard()
    func configureAction()
}
