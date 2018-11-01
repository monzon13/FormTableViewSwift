//
//  SearchAddressView.swift
//  FormTableView
//
//  Created by José Miguel on 01/11/2018.
//

import Foundation

protocol SearchAddressView: class {
    func configureTable()
    func configureSearch()
    func reload()
}
