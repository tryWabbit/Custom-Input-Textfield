//
//  ViewController.swift
//  Custom Input Textfield
//
//  Created by ajm on 4/6/19.
//  Copyright © 2019 Wabbit. All rights reserved.
//

import UIKit

class ScrollViewExampleViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        addTextfields()
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardNotification(notification:)),
                                               name:UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.endEditing(true)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func addTextfields() {
        // Multiple textfields at once
        for index in 1...10 {
            let title = "Title " + "\(index)"
            let placeholder = "Placeholder " + "\(index)"
            let inputView = customInputView(title: title, image: #imageLiteral(resourceName: "icon3"), placeHolder:placeholder)
            inputView.delegate = self // to get textfield delegate
            stackView.addArrangedSubview(inputView)
        }
        stackView.spacing = 15.0
        
        // Textfield without image
        let inputView11 = customInputView(title: "Without image example", image: nil, placeHolder:"Textfield without image")
        inputView11.delegate = self
        
        // Without title
        let inputView12 = customInputView(title:nil, image: nil, placeHolder:"Textfield without title")
        inputView12.delegate = self
        
        let inputView13 = customInputView(title:"Be careful with this title because it is going to very big you better handle this case!", image: nil, placeHolder:"Yes! the border is changed")
        inputView13.textfieldBorderColor = UIColor.red
        inputView13.delegate = self
        
        stackView.addArrangedSubview(inputView11)
        stackView.addArrangedSubview(inputView12)
        stackView.addArrangedSubview(inputView13)
        stackView.layoutIfNeeded()
    }
    

    @objc public func keyboardNotification(notification: NSNotification)->Void {
        var kRect = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let window = UIApplication.shared.keyWindow
        kRect = window!.convert(kRect, to: self.view)
        let animationOption = (notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt)
        let animationDuration = (notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! CGFloat)
        let position = self.view.frame.height - kRect.minY
        UIView.animate(withDuration: TimeInterval(animationDuration), delay: 0, options: UIView.AnimationOptions(rawValue: animationOption), animations: {
            let scrollview = self.stackView.superview as! UIScrollView
            scrollview.contentInset=UIEdgeInsets(top: 0, left: 0, bottom: position, right: 0)
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
extension ScrollViewExampleViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

