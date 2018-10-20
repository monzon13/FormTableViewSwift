//
//  StringExtension.swift
//  FormTableView
//
//  Created by José Miguel on 20/10/2018.
//

import Foundation

extension String {
    func isValid(form: Form?) -> Bool {
        if  let form = form,
            let newRegEx = configureRegEx(form) {
            let valueTest = NSPredicate(format:"SELF MATCHES %@", newRegEx)
            
            return valueTest.evaluate(with: self)
        }
        else {
            return true
        }
    }
    
    private func configureRegEx(_ form: Form) -> String? {
        var regEx: String?
        
        if let newRegEx = form.regEx {
            regEx = newRegEx
        }
        else {
            switch form.type {
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
