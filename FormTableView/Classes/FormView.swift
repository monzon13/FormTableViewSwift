//
//  FormView.swift
//  
//
//  Created by José Miguel Herrero on 18/10/2018.
//  Copyright © 2018 José Miguel Herrero. All rights reserved.
//

import UIKit

@IBDesignable
public class FormView: UIView {
    // Our custom view from the XIB file
    var view: UIView!
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var viewLine: UIView!
    @IBOutlet weak var labelError: UILabel!
    
    func xibSetup() {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "FormView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        self.layoutSubviews()
    }
    
    public func configure(title: String) {
        self.labelTitle.text = title
    }

    //Form View
    @IBInspectable var viewColor: UIColor! {
        didSet {
            self.view.backgroundColor = viewColor
        }
    }
    
    //TITLE
    @IBInspectable
    var titleText: String! {
        didSet {
            labelTitle.text = titleText
        }
    }
    
    @IBInspectable
    var titleColor: UIColor! {
        didSet {
            labelTitle.textColor = titleColor
        }
    }
    
    
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
    
    //SUBTITLE
    @IBInspectable
    var subtitleText: String! {
        didSet {
            labelSubtitle.text = titleText
        }
    }
    
    @IBInspectable
    var subtitleColor: UIColor! {
        didSet {
            labelSubtitle.textColor = titleColor
        }
    }
    
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
    
    //TEXTFIELD
    @IBInspectable
    var fieldText: String! {
        didSet {
            textField.text = fieldText
        }
    }
    
    @IBInspectable
    var fieldColor: UIColor! {
        didSet {
            textField.textColor = titleColor
        }
    }
    
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
    
    @IBInspectable
    var placeholder: String! {
        didSet {
            textField.placeholder = placeholder
        }
    }
    
    @IBInspectable
    var placehColor: UIColor? {
        didSet {
            self.textField.attributedPlaceholder = NSAttributedString(string:textField.placeholder != nil ? textField.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: placehColor!])
        }
    }
    
    
    //VIEWLINE
    @IBInspectable
    var lineColor: UIColor! {
        didSet {
            viewLine.backgroundColor = lineColor
        }
    }
    
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
    
    //ERROR
    @IBInspectable
    var errorText: String! {
        didSet {
            labelError.text = errorText
        }
    }
    
    @IBInspectable
    var errorColor: UIColor! {
        didSet {
            labelError.textColor = errorColor
        }
    }
    
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

