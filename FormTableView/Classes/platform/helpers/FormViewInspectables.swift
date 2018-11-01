//
//  FormViewInspectables.swift
//  FormTableView
//
//  Created by José Miguel on 01/11/2018.
//

import Foundation
import UIKit

extension FormView {
    //MARK: field view properties
    ///To change background color of the view
    @IBInspectable
    var viewColor: UIColor! {
        set {
            view.backgroundColor = newValue
        }
        get {
            return view.backgroundColor
        }
    }
    
    //MARK: Title properties
    ///To set the text of the title
    @IBInspectable
    var titleText: String! {
        set {
             labelTitle.text = newValue
        }
        get {
            return labelTitle.text
        }
    }
    
    ///To change the text color of the title
    @IBInspectable
    var titleColor: UIColor! {
        set {
            labelTitle.textColor = newValue
        }
        get {
           return labelTitle.textColor
        }
    }
    
    ///To set the font size of the title
    @IBInspectable
    var titleSize: CGFloat {
        set {
            _fontSize = newValue
            labelTitle.font = UIFont(name: _fontName, size: _fontSize)
        }
        get {
            return _fontSize
        }
    }
    
    ///To set the font name of the title
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
        set {
            labelSubtitle.text = newValue
        }
        get {
            return labelSubtitle.text
        }
    }
    
    ///To change the text color of the subtitle
    @IBInspectable
    var subtitleColor: UIColor! {
        set {
            labelSubtitle.textColor = newValue
        }
        get {
            return labelSubtitle.textColor
        }
    }
    
    ///To set the font size of the subtitle
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
        set {
            textField.text = newValue
        }
        get {
            return textField.text
        }
    }
    
    ///To change the text color of the textField
    @IBInspectable
    var fieldColor: UIColor! {
        set {
            textField.textColor = newValue
        }
        get {
            return textField.textColor
        }
    }
    
    ///To set the font size of the textField
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
        set {
            textField.placeholder = newValue
        }
        get {
            return textField.placeholder
        }
    }
    
    ///To change the text color of the placeholder
    @IBInspectable
    var placehColor: UIColor {
        set {
            self.textField.attributedPlaceholder = NSAttributedString(string:textField.placeholder != nil ? textField.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue])
        }
        get {
            return self.placehColor
        }
    }
    
    
    //MARK: ViewLine properties
    ///To change the line color
    @IBInspectable
    var lineColor: UIColor! {
        set {
            viewLine.backgroundColor = newValue
        }
        get {
            return viewLine.backgroundColor
        }
    }
    
    ///To hide the line
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
        set {
            labelError.text = newValue
        }
        get {
            return labelError.text
        }
    }
    
    ///To change the text color of the error
    @IBInspectable
    var errorColor: UIColor! {
        set {
            labelError.textColor = newValue
        }
        get {
            return labelError.textColor
        }
    }
    
    ///To set the font size of the error
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
