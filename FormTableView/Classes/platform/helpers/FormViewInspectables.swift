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
            fontSize = newValue
            labelTitle.font = UIFont(name: fontName, size: fontSize)
        }
        get {
            return fontSize
        }
    }
    
    ///To set the font name of the title
    @IBInspectable
    var titleFont: String {
        set {
            fontName = newValue
            labelTitle.font = UIFont(name: fontName, size: fontSize)
        }
        get {
            return fontName
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
            fontSubtitleSize = newValue
            labelTitle.font = UIFont(name: fontName, size: fontSubtitleSize)
        }
        get {
            return fontSubtitleSize
        }
    }
    
    ///To set the font name of the subtitle
    @IBInspectable
    var subtitleFont: String {
        set {
            fontSubtitleName = newValue
            labelTitle.font = UIFont(name: fontSubtitleName, size: fontSubtitleSize)
        }
        get {
            return fontSubtitleName
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
            fontTextleSize = newValue
            labelTitle.font = UIFont(name: fontTextName, size: fontTextleSize)
        }
        get {
            return fontSubtitleSize
        }
    }
    
    ///To set the font name of the textField
    @IBInspectable
    var fieldFont: String {
        set {
            fontTextName = newValue
            labelTitle.font = UIFont(name: fontTextName, size: fontSubtitleSize)
        }
        get {
            return fontSubtitleName
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
            viewLine.isHidden = newValue
        }
        get {
            return viewLine.isHidden
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
            fonterrorSize = newValue
            labelError.font = UIFont(name: fontName, size: fonterrorSize)
        }
        get {
            return fonterrorSize
        }
    }
    
    ///To set the font name of the error
    @IBInspectable
    var errorFont: String {
        set {
            fontErrorName = newValue
            labelError.font = UIFont(name: fontErrorName, size: fonterrorSize)
        }
        get {
            return fontErrorName
        }
    }
    
    ///To hide the error
    @IBInspectable
    var errorHidden: Bool {
        set {
            labelError.isHidden = newValue
        }
        get {
            return labelError.isHidden
        }
    }
}
