//
//  ViewExtension.swift
//  FormTableView
//
//  Created by José Miguel on 01/11/2018.
//

import Foundation

extension UIView {
    func datePicker() -> UIDatePicker {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        datePickerView.maximumDate = Calendar.current.date(byAdding: .year, value: 0, to: Date())
        
        return datePickerView
    }
}
