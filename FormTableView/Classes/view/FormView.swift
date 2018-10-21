//
//  FormView.swift
//  FormTableView
//
//  Created by jmhdevep on 10/19/2018.
//  Copyright (c) 2018 jmhdevep. All rights reserved.
//

import UIKit

// - View Class -
@IBDesignable
public class FormView: UIView {

    //MARK: IBOutlets
    var view: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var viewLine: UIView!
    @IBOutlet weak var labelError: UILabel!
    
    var form: Form?
    
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
    
    
    override public var description : String {
        return "It's a view that simplify the configuration of a form and can be easily configure on the attributes inspector."
    }
    
    //MARK: Public methods
    
    /// Used to set the parameters.
    ///
    /// - Parameter form: Model of the information that it's going to be display.
    public func configure(form: Form) {
        self.form = form
        clean()
        configureLabels()
        configureTextField()
        configureKeyboard()
    }
    
    //MARK: Form view properties
    ///To change background color of the view
    @IBInspectable
    var viewColor: UIColor! {
        didSet {
            self.view.backgroundColor = viewColor
        }
    }
    
    //MARK: Title properties
    ///To set the text of the title
    @IBInspectable
    var titleText: String! {
        didSet {
            labelTitle.text = titleText
        }
    }
    
    ///To change the text color of the title
    @IBInspectable
    var titleColor: UIColor! {
        didSet {
            labelTitle.textColor = titleColor
        }
    }
    
    ///To set the font size of the title
    fileprivate var _fontSize:CGFloat = 18
    @IBInspectable
    var titleSize:CGFloat {
        set {
            _fontSize = newValue
            labelTitle.font = UIFont(name: _fontName, size: _fontSize)
        }
        get {
            return _fontSize
        }
    }
    
    ///To set the font name of the title
    fileprivate var _fontName:String = "Helvetica"
    @IBInspectable
    var titleFont: String {
        set {
            _fontName = newValue
            labelTitle.font = UIFont(name: _fontName, size: _fontSize)
        }
        get {
            return _fontName
        }
    }
    
    //MARK: Subtitle properties
    ///To set the text of the subtitle
    @IBInspectable
    var subtitleText: String! {
        didSet {
            labelSubtitle.text = titleText
        }
    }
    
    ///To change the text color of the subtitle
    @IBInspectable
    var subtitleColor: UIColor! {
        didSet {
            labelSubtitle.textColor = titleColor
        }
    }
    
    ///To set the font size of the subtitle
    fileprivate var _fontSubtitleSize:CGFloat = 18
    @IBInspectable
    var subtitleSize: CGFloat {
        set {
            _fontSubtitleSize = newValue
            labelTitle.font = UIFont(name: _fontName, size: _fontSubtitleSize)
        }
        get {
            return _fontSubtitleSize
        }
    }
    
    ///To set the font name of the subtitle
    fileprivate var _fontSubtitleName:String = "Helvetica-Thin"
    @IBInspectable
    var subtitleFont: String {
        set {
            _fontSubtitleName = newValue
            labelTitle.font = UIFont(name: _fontSubtitleName, size: _fontSubtitleSize)
        }
        get {
            return _fontSubtitleName
        }
    }
    
    //MARK: Textfield properties
    ///To set the text of the textField
    @IBInspectable
    var fieldText: String! {
        didSet {
            textField.text = fieldText
        }
    }
    
    ///To change the text color of the textField
    @IBInspectable
    var fieldColor: UIColor! {
        didSet {
            textField.textColor = titleColor
        }
    }
    
    ///To set the font size of the textField
    fileprivate var _fontTextleSize:CGFloat = 18
    @IBInspectable
    var fieldSize: CGFloat {
        set {
            _fontTextleSize = newValue
            labelTitle.font = UIFont(name: _fontTextName, size: _fontTextleSize)
        }
        get {
            return _fontSubtitleSize
        }
    }
    
    ///To set the font name of the textField
    fileprivate var _fontTextName:String = "Helvetica-Light"
    @IBInspectable
    var fieldFont: String {
        set {
            _fontTextName = newValue
            labelTitle.font = UIFont(name: _fontTextName, size: _fontSubtitleSize)
        }
        get {
            return _fontSubtitleName
        }
    }
    
    ///To set the text of the placeholder
    @IBInspectable
    var placeholder: String! {
        didSet {
            textField.placeholder = placeholder
        }
    }
    
    ///To change the text color of the placeholder
    @IBInspectable
    var placehColor: UIColor? {
        didSet {
            self.textField.attributedPlaceholder = NSAttributedString(string:textField.placeholder != nil ? textField.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: placehColor!])
        }
    }
    
    
    //MARK: ViewLine properties
    ///To change the line color
    @IBInspectable
    var lineColor: UIColor! {
        didSet {
            viewLine.backgroundColor = lineColor
        }
    }
    
    ///To hide the line
    fileprivate var _lineHidden: Bool = false
    @IBInspectable
    var lineHidden: Bool {
        set {
            _lineHidden = newValue
            viewLine.isHidden = _lineHidden
        }
        get {
            return _lineHidden
        }
    }
    
    //MARK: Error
    ///To set the text of the error
    @IBInspectable
    var errorText: String! {
        didSet {
            labelError.text = errorText
        }
    }
    
    ///To change the text color of the error
    @IBInspectable
    var errorColor: UIColor! {
        didSet {
            labelError.textColor = errorColor
        }
    }
    
    ///To set the font size of the error
    fileprivate var _fonterrorSize:CGFloat = 11
    @IBInspectable
    var errorSize: CGFloat {
        set {
            _fonterrorSize = newValue
            labelError.font = UIFont(name: _fontName, size: _fonterrorSize)
        }
        get {
            return _fonterrorSize
        }
    }
    
    ///To set the font name of the error
    fileprivate var _fontErrorName:String = "Helvetica-Light"
    @IBInspectable
    var errorFont: String {
        set {
            _fontErrorName = newValue
            labelError.font = UIFont(name: _fontErrorName, size: _fonterrorSize)
        }
        get {
            return _fontErrorName
        }
    }
    
    ///To hide the error
    fileprivate var _errorHidden: Bool = false
    @IBInspectable
    var errorHidden: Bool {
        set {
            _errorHidden = newValue
            labelError.isHidden = _errorHidden
        }
        get {
            return _errorHidden
        }
    }
}

//MARK: Configure methods
extension FormView {
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "FormView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func xibSetup() {
        configureView()
    }
    
    func configureView() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }
    
    func clean() {
        self.labelTitle.text = ""
        self.labelSubtitle.text = ""
        self.textField.text = ""
        self.textField.placeholder = ""
        self.labelError.text = ""
        self.labelError.isHidden = true
    }
    
    func configureLabels() {
        self.labelTitle.text = form?.title
        self.labelSubtitle.text = form?.subtitle
        self.labelError.text = form?.error
    }
    
    func configureTextField() {
        self.textField.delegate = self
        
        if let value = form?.value as? String {
            self.textField.text = value
        }
        self.textField.placeholder = form?.placeholder
    }
    
    func configureKeyboard() {
        guard let type = form?.type else {
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
}

//MARK: UITextFieldDelegate
extension FormView: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let texFieldText = textField.text else {
            return true
        }
        let text: String = texFieldText + string
        
        self.labelError.isHidden = text.isValid(form: self.form)
        
        return true
    }
}

