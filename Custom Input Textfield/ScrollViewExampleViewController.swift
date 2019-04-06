//
//  ViewController.swift
//  Custom Input Textfield
//
//  Created by ajm on 4/6/19.
//  Copyright © 2019 Wabbit. All rights reserved.
//

import UIKit

class NormalExampleViewController: UIViewController {
    @IBOutlet weak var stackview: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let input1 = customInputView(title: "First Name", image: #imageLiteral(resourceName: "icon3"), placeHolder: "Please enter firstname")
        let input2 = customInputView(title: "Last Name", image: #imageLiteral(resourceName: "icon3"), placeHolder: "Please enter lastname")
        input1.delegate = self
        input2.delegate = self
        stackview.addArrangedSubview(input1)
        stackview.addArrangedSubview(input2)
        stackview.spacing = 10.0
    }
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
extension NormalExampleViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

