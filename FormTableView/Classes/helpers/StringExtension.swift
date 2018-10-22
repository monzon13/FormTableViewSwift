//
//  StringExtension.swift
//  FormTableView
//
//  Created by José Miguel on 20/10/2018.
//

import Foundation

extension String {
    func isValid(field: Field?) -> Bool {
        if  let field = field,
            let newRegEx = configureRegEx(field) {
            let valueTest = NSPredicate(format:"SELF MATCHES %@", newRegEx)
            
            return valueTest.evaluate(with: self)
        }
        else {
            return true
        }
    }
    
    private func configureRegEx(_ field: Field) -> String? {
        var regEx: String?
        
        if let newRegEx = field.regEx, !newRegEx.isEmpty {
            regEx = newRegEx
        }
        else {
            switch field.type {
            case .email:
                regEx = REG_EX_EMAIL
                
            case .url:
                regEx = REG_EX_WEB
                
            default:
                break
            }
        }
        
        return regEx
    }
}
