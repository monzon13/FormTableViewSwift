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
    
    var presenter: SearchAddressViewPresenter!
    var connector: SearchAddressViewConnector!
    
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
    
    //MARK:-Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewReady()
    }
}

//MARK: MKLocalSearchCompleterDelegate
extension SearchAddressViewController: MKLocalSearchCompleterDelegate {
    @available(iOS 9.3, *)
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        presenter.searchSource = completer.results.map { return Address(localSearch: $0) }
        presenter.reload()
    }
    
    @available(iOS 9.3, *)
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print(error.localizedDescription)
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
        return presenter.rows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: SearchAddressTableViewCell = tableView.dequeueReusableCell(withIdentifier: SearchAddressTableViewCell.ID, for: indexPath) as? SearchAddressTableViewCell else {
            return UITableViewCell()
        }
        
        if let address = presenter.address(row: indexPath.row) {
            cell.configure(address)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.searchBar.resignFirstResponder()
        
        if let title = presenter.address(row: indexPath.row)?.title,
           let subtitle = presenter.address(row: indexPath.row)?.subtitle {
           let value = title + " " + subtitle
            updateField(value: value)
            self.dismiss(animated: true, completion: nil)
        }
    }
}

//MARK: SearchAddressView
extension SearchAddressViewController: SearchAddressView {
    
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
    
    func reload() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func updateField(value: String) {
        let vc: UIViewController? = (count > 0) ? first : root
        
        if let views = vc?.view.subviews {
            presenter.searchForTable(value: value, views: views)
        }
    }
}
