//
//  Constants.swift
//  FormTableView
//
//  Created by José Miguel on 20/10/2018.
//

import Foundation

//MARK: Regular expresions
let REG_EX_EMAIL = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
let REG_EX_WEB = "^[wW]{3}+.[a-zA-Z]{3,}+.[a-z]{2,}"

//MARK: ViewController
let count: Int = UIApplication.shared.delegate?.window??.rootViewController?.children.count ?? 0
let root = UIApplication.shared.delegate?.window??.rootViewController
let last =  UIApplication.shared.delegate?.window??.rootViewController?.children.last
