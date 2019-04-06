# Custom-Input-Textfield

![Swift](https://img.shields.io/badge/Swift-v4.2-orange.svg) 
![Xcode](https://img.shields.io/badge/XCode-10.0-blue.svg)
![UITextfield](https://img.shields.io/badge/UITextfield-Helper-blue.svg)

Custom Input Textfield is created to reduce the time taken to design simple forms to take input from users. Just create an object of `customInputView` and add it UIStackView,UIView or UIScrollView whatever you like. 

![Screen Shot 2019-04-06 at 5 20 02 PM](https://user-images.githubusercontent.com/20557360/55669040-40f76200-5890-11e9-9924-231446e911b0.png)

The above form was created with the number of lines
    
    
    for index in 1...10 {
        let title = "Title " + "\(index)"
        let placeholder = "Placeholder " + "\(index)"
        let inputView = customInputView(title: title, image:#imageLiteral(resourceName: "icon3"), placeHolder:placeholder)             inputView.delegate = self // to get textfield delegate
        stackView.addArrangedSubview(inputView)
    }
    stackView.spacing = 15.0
    

MIT License

Copyright (c) 2019 Wabbit 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

The Software Is Provided "As Is", Without Warranty Of Any Kind, Express Or
Implied, Including But Not Limited To The Warranties Of Merchantability,
Fitness For A Particular Purpose And Noninfringement. In No Event Shall The
Authors Or Copyright Holders Be Liable For Any Claim, Damages Or Other
Liability, Whether In An Action Of Contract, Tort Or Otherwise, Arising From,
Out Of Or In Connection With The Software Or The Use Or Other Dealings In The Software.
    
    
