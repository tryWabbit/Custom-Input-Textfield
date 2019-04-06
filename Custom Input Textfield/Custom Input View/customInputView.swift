//
//  customInputView.swift
//  Ditto
//
//  Created by ajm on 4/6/19.
//  Copyright © 2019 AJM. All rights reserved.
//

import UIKit
enum customViewType {
    case textfield
    case action
}
class customInputView: UIView {
    var contentView : UIView?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var constraintTextfieldHeight: NSLayoutConstraint!
    
    var textfieldBorderColor : UIColor? {
        didSet {
            guard let backgroundColor = textfieldBorderColor else {return}
            let view = textField.superview?.superview
            view?.borderColour = backgroundColor
        }
    }
    var textfieldBorderLength : Double? {
        didSet {
            guard let length = textfieldBorderLength else {return}
            let view = textField.superview?.superview
            view?.borderLength = length
        }
    }
    var textfielCornerRadius : CGFloat? {
        didSet {
            guard let radius = textfielCornerRadius else {return}
            let view = textField.superview?.superview
            view?.layer.cornerRadius = radius
        }
    }
    var textfieldHeight : CGFloat? {
        didSet {
            guard let height = textfieldHeight else {return}
            constraintTextfieldHeight.constant = height
        }
    }
    var delegate : UITextFieldDelegate? {
        didSet {
            guard let delegate = delegate else {return}
            textField.delegate = delegate
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
        defaultSettings()
    }
    init(title:String?,image:UIImage?,placeHolder:String?) {
        self.init()
        titleLabel.text = title
        titleLabel.isHidden = title==nil
        imageView.image = image
        imageView.isHidden = image==nil
        textField.placeholder = placeHolder
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
        defaultSettings()
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "customInputView", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func defaultSettings() {
        textfieldBorderColor = UIColor.lightGray
        textfieldBorderLength = 1.0
        textfielCornerRadius = 5.0
        contentView?.backgroundColor = UIColor.clear
    }
    
}
extension UIView {
    @IBInspectable var borderLength: Double {
        get {
            return Double(self.layer.borderWidth)
        }set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    @IBInspectable var borderColour: UIColor {
        get {
            return UIColor(cgColor: self.layer.borderColor ?? UIColor.white.cgColor)
        }set {
            self.layer.borderColor = newValue.cgColor
        }
    }

}
