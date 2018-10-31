//
//  Field.swift
//  FormTableView
//
//  Created by jmhdevep on 10/19/2018.
//  Copyright (c) 2018 jmhdevep. All rights reserved.
//

import Foundation


public enum Type {
    case none
    case email
    case password
    case number
    case address
    case picker
    case date
    case phone
    case url
}

/// Model of the information that it's going to be display.
public class Field {
    var type: Type
    var id: Int
    var title: String
    var subtitle: String?
    var value: AnyObject?
    var placeholder: String?
    var regEx: String?
    var error: String?
    
    /// Model of the information that it's going to be display.
    ///
    /// - Parameters:
    ///   - type: It's used to configure the FormView.
    ///   - id: Unique identifier of the Form.
    ///   - title: Name of the value its going to set.
    ///   - subtitle: Description of the value its going to set.
    ///   - value: The input value set in the field.
    ///   - placeholder: An example of the value its going to set in the field.
    ///   - regEx: A regular expression to verify the field value.
    ///   - error: The error message its going to be displayed when it's not true the regular expression.
    public init(type: Type, id: Int, title: String, subtitle: String? = nil, value: AnyObject? = nil, placeholder: String? = nil, regEx: String? = nil, error: String? = nil) {
        self.type = type
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.value = value
        self.placeholder = placeholder
        self.regEx = regEx
        self.error = error
    }
}
