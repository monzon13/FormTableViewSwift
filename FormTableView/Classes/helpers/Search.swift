//
//  Search.swift
//  FormTableView
//
//  Created by José Miguel on 31/10/2018.
//

import Foundation

func searchForTable(value: String, views: [UIView]) {
    for view in views {
        let tableView = view as? UITableView
        if let cells = tableView?.visibleCells {
            searchForCell(value: value, cells: cells)
        }
    }
}

private func searchForCell(value: String, cells: [UITableViewCell]) {
    for cell in cells {
        let cellViews = cell.contentView.subviews
        searchForFormView(value: value, views: cellViews)
    }
}

private func searchForFormView(value: String, views: [UIView]) {
    for view in views {
        if let formView = view as? FormView,
            let field = formView.field {
            if field.type == .address {
                formView.updateTexField(value: value)
            }
        }
    }
}
