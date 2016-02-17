//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var returnKeyboardButton: UIButton!
    @IBOutlet var deleteKeyboardButton: UIButton!
    @IBOutlet var randomYeezyQuoteButton: UIButton!
    
    var keyboardView: UIView!
    
    var yeezyQuotes = [
        "I can’t let these people play me", "When did I become A-list?",
        "Yeezy, Yeezy, Yeezy, I feel so accomplished",
        "We on a ultra light beam, we on a ultra light beam",
        "We'll buy a lot of clothes when we don't really need 'em",
        "You know what the Midwest is? ... Young & restless",
        "I wish I could buy me a spaceship",
        "Fore the day I die, I'mma touch the sky",
        "Damn, them new loafers hurt my pocket"
    ]

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
        returnKeyboardButton.addTarget(self, action: "returnKey", forControlEvents: .TouchUpInside)
        deleteKeyboardButton.addTarget(self, action: "deleteBackwards", forControlEvents: .TouchUpInside)
        randomYeezyQuoteButton.addTarget(self, action: "randomYeezy", forControlEvents: .TouchUpInside)
    }
    
    func randomYeezy() {
        let rand = Int(arc4random_uniform(UInt32(yeezyQuotes.count)))
        self.textDocumentProxy.insertText(yeezyQuotes[rand])
    }
    
    func returnKey() {
        self.textDocumentProxy.insertText("\n")
    }
    
    func deleteBackwards() {
        self.textDocumentProxy.deleteBackward()
    }


}
