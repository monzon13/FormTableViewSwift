//
//  SearchAddressViewPresenter.swift
//  FormTableView
//
//  Created by José Miguel on 01/11/2018.
//

import Foundation

class SearchAddressViewPresenter {
    
    weak var view: SearchAddressView!
    
    var searchSource: [Address]?
    
    
    func viewReady() {
        view.configureSearch()
        view.configureTable()
    }
    
    func rows() -> Int {
        return searchSource?.count ?? 0
    }
    
    func address(row: Int) -> Address? {
        return searchSource?[row]
    }
    
    func reload() {
        view.reload()
    }
    
    func searchForTable(value: String, views: [UIView]) {
        for view in views {
            let tableView = view as? UITableView
            if let cells = tableView?.visibleCells {
                searchForCell(value: value, cells: cells)
            }
        }
    }
    
    func searchForCell(value: String, cells: [UITableViewCell]) {
        for cell in cells {
            let cellViews = cell.contentView.subviews
            searchForFormView(value: value, views: cellViews)
        }
    }
    
    func searchForFormView(value: String, views: [UIView]) {
        let formViews = views.map({ $0 as? FormView })
        
        guard let formView = formViews.first,
            let field = formView?.field else {
                return
        }
        
        if field.type == .address {
            formView?.updateTexField(value: value)
        }
    }
}


