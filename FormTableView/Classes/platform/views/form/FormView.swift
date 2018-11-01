//
//  FormView.swift
//  FormTableView
//
//  Created by jmhdevep on 10/19/2018.
//  Copyright (c) 2018 jmhdevep. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

// - View Class -
@IBDesignable
public class FormView: UIView {
    
    var presenter: FormViewPresenter!
    var connector: FormViewConnector!
    
    //MARK: IBInspectable parameters
    var fontSize: CGFloat = 18
    var fontName: String = "Helvetica"
    var fontSubtitleSize: CGFloat = 18
    var fontSubtitleName: String = "Helvetica-Thin"
    var fontTextleSize: CGFloat = 18
    var fontTextName: String = "Helvetica-Light"
    var fonterrorSize: CGFloat = 11
    var fontErrorName: String = "Helvetica-Light"

    //MARK: IBOutlets
    var view: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var viewLine: UIView!
    @IBOutlet weak var labelError: UILabel!
    
    var field: Field?
    
    //MARK: - Lifecycle methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        self.layoutSubviews()
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "FormView", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {
            return UIView()
        }
        
        return view
    }
    
    private func xibSetup() {
        configureView()
    }
    
    private func configureView() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }
}

//MARK: Public methods
extension FormView {
    /// Used to set the parameters.
    ///
    /// - Parameter field: Model of the infieldation that it's going to be display.
    public func configure(field: Field) {
        self.field = field
        IQKeyboardManager.shared.enable = true
        presenter.viewReady()
    }
}

//MARK: FormViewView
extension FormView: FormViewView {
    func clean() {
        self.labelTitle.text = ""
        self.labelSubtitle.text = ""
        self.textField.text = ""
        self.textField.placeholder = ""
        self.labelError.text = ""
        self.labelError.isHidden = true
    }
    
    func configureLabels() {
        self.labelTitle.text = field?.title
        self.labelSubtitle.text = field?.subtitle
        self.labelError.text = field?.error
    }
    
    func configureTextField() {
        self.textField.delegate = self
        
        if let value = field?.value as? String {
            self.textField.text = value
        }
        self.textField.placeholder = field?.placeholder
    }
    
    func configureKeyboard() {
        guard let type = field?.type else {
            return
        }
        
        switch type {
        case .none, .picker, .date, .address:
            self.textField.keyboardType = .default
            
        case .number, .phone:
            self.textField.keyboardType = .numberPad
            
        case .email:
            self.textField.keyboardType = .emailAddress
            
        case .password:
            self.textField.keyboardType = .default
            self.textField.isSecureTextEntry = true
            
        case .url:
            self.textField.keyboardType = .URL
            
        }
    }
    
    func configureAction() {
        guard let type = field?.type else {
            return
        }
        switch type {
        case .address:
            configureAddressAction()
            
        case .date:
            configureDateAction()
            
        default:
            break
        }
    }
    
    func configureAddressAction() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction))
        self.textField.isUserInteractionEnabled = true
        self.textField.addGestureRecognizer(tap)
    }
    
    func configureDateAction() {
        let datePickerView = self.datePicker()
        let formatter = self.dateMediumFormat()
        
        textField.tintColor = UIColor.clear
        textField.inputView = datePickerView
        
        if let defaultValue = field?.value as? String, !defaultValue.isEmpty {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
            
            if let date = dateFormatter.date(from: defaultValue) {
                textField.text = formatter.string(from: date)
                datePickerView.date = date
            }else {
                textField.text = nil
            }
        }else if let date = field?.value as? Date {
            textField.text = formatter.string(from: date)
            datePickerView.date = date
        }else {
            textField.text = nil
        }
        
        datePickerView.addTarget(self, action: #selector(FormView.datePickerDidChange(_:)), for: UIControl.Event.valueChanged)
    }
    
    func updateTable() {
        let vc = (count > 0) ? last : root
        
        if let views = vc?.view.subviews {
            self.searchForTable(views: views)
        }
    }
    
    func searchForTable(views: [UIView]) {
        let formViews = views.map({ $0 as? UITableView })
        
        guard let tableView = formViews.first else {
            return
        }
    
        UIView.performWithoutAnimation {
            tableView?.beginUpdates()
            tableView?.endUpdates()
        }
    }
    
    func updateTexField(value: String) {
        textField.text = value
    }
    
    @objc fileprivate func tapFunction(sender:UITapGestureRecognizer) {
        let vc = (count > 0) ? last : root
        let bundle = Bundle(for: self.classForCoder)
        let storyboard = UIStoryboard(name: "Search", bundle: bundle)
        if let searchVC = storyboard.instantiateViewController(withIdentifier: SearchAddressViewController.ID) as? SearchAddressViewController {
            let connector = SearchAddressViewConnector()
            connector.connect(view: searchVC)
            vc?.present(searchVC, animated: true, completion: nil)
        }
    }
    
    @objc func datePickerDidChange(_ pickerDate: UIDatePicker) {
        let value = pickerDate.date
        field?.value = value as AnyObject
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale.current
        textField.text = formatter.string(from: value)
    }
}

//MARK: UITextFieldDelegate
extension FormView: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let texFieldText = textField.text else {
            return true
        }
        
        var text = ""
        var deleted = texFieldText
        if !deleted.isEmpty {
            deleted.removeLast()
        }
        
        text = (string.isEmpty) ? deleted : (texFieldText + string)
        
        self.labelError.isHidden = text.isValid(field: self.field)
        updateTable()
  
        return true
    }
}
