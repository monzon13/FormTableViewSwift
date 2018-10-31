//
//  SearchAddressViewController.swift
//  FormTableView
//
//  Created by José Miguel on 22/10/2018.
//

import UIKit
import MapKit

class SearchAddressViewController: UIViewController {
    static let ID = "SearchAddressViewController"
    
    //MARK:IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    //create a completer
    @available(iOS 9.3, *)
    lazy var searchCompleter: MKLocalSearchCompleter = {
        let sC = MKLocalSearchCompleter()
        sC.delegate = self
        return sC
    }()
    
    var searchSource: [Address]?
    var vc: UIViewController?
    
    
    //MARK:-Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTable()
        configureSearch()
    }
    
    //MARK:Configure methods
    func configureTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = SearchAddressTableViewCell.estimateheigth
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView()
        
        let bundle = Bundle(for: self.classForCoder)
        tableView.register(UINib(nibName: SearchAddressTableViewCell.ID, bundle: bundle),
                           forCellReuseIdentifier: SearchAddressTableViewCell.ID)
        
    }
    
    func configureSearch() {
        self.searchBar.delegate = self
        self.searchBar.becomeFirstResponder()
    }
    
    private func updateField(value: String) {
        vc = (count > 0) ? last : root
        
        if let views = vc?.view.subviews {
            self.searchForTable(value: value, views: views)
        }
    }
    
    private func searchForTable(value: String, views: [UIView]) {
        for view in views {
            let tableView = view as? UITableView
            if let cells = tableView?.visibleCells {
                self.searchForCell(value: value, cells: cells)
            }
        }
    }
    
    private func searchForCell(value: String, cells: [UITableViewCell]) {
        for cell in cells {
            let cellViews = cell.contentView.subviews
            self.searchForFormView(value: value, views: cellViews)
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
}

//MARK: UISearchBarDelegate
extension SearchAddressViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //change searchCompleter depends on searchBar's text
        if !searchText.isEmpty {
            if #available(iOS 9.3, *) {
                searchCompleter.queryFragment = searchText
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
        self.searchBar.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension SearchAddressViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchAddressTableViewCell = tableView.dequeueReusableCell(withIdentifier: SearchAddressTableViewCell.ID, for: indexPath) as! SearchAddressTableViewCell
        
        cell.configure(searchSource?[indexPath.row])
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.searchBar.resignFirstResponder()
        
        let value = (searchSource?[indexPath.row].title ?? "") + " " + (searchSource?[indexPath.row].subtitle ?? "")
        updateField(value: value)
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SearchAddressViewController: MKLocalSearchCompleterDelegate {
    @available(iOS 9.3, *)
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.searchSource = completer.results.map { return Address(localSearch: $0) }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @available(iOS 9.3, *)
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
