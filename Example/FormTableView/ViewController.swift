//
//  ViewController.swift
//  FormTableView
//
//  Created by jmhdevep on 10/19/2018.
//  Copyright (c) 2018 jmhdevep. All rights reserved.
//

import UIKit
import FormTableView

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
    }
    
    
    func configureTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = CustomTableViewCell.estimateheigth
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView()
        
       tableView.register(UINib(nibName: CustomTableViewCell.ID, bundle: nil),
                          forCellReuseIdentifier: CustomTableViewCell.ID)
    }
    
    func forms() -> [Form] {
        return [Form.init(type: .none, id: 0, title: "Name"),
                Form.init(type: .none, id: 1, title: "Surname"),
                Form.init(type: .email, id: 2, title: "Email", placeholder: "example@example.com", error: "This e-mail address is not valid"),
                Form.init(type: .password, id: 3, title: "Password", placeholder: "", error: ""),
                Form.init(type: .url, id: 4, title: "Web", placeholder: "www.example.com", error: "Not a valid URL format")]
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forms().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.ID, for: indexPath) as! CustomTableViewCell
        
        cell.formView.configure(form: forms()[indexPath.row])
    
        return cell
    }
    
    
}

