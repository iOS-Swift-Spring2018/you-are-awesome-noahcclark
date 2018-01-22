//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Noah Clark on 1/21/18.
//  Copyright © 2018 Noah Clark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    let message1 = "You are awesome!"
    let message2 = "You are great!"
    var index = 0
    
    //Code below executes when app's view first loads
    override func viewDidLoad() {
        super.viewDidLoad()
        print("The View Loaded")
    }
    
    @IBAction func showMessagePressed(_ sender: UIButton) {
        print("*** Show Message Pressed")
        messageLabel.text = message1
        messageLabel.textColor = UIColor.red
        messageLabel.textAlignment = NSTextAlignment.left
    }
    
    @IBAction func showAnotherMessagePressed(_ sender: UIButton) {
        print("*** Show Another Message Pressed")
        messageLabel.text = message2
        messageLabel.textColor = UIColor.blue
        messageLabel.textAlignment = NSTextAlignment.right
    }
    
    @IBAction func changeMessagePressed(_ sender: UIButton) {
        

        
        if messageLabel.text == message1 {
            messageLabel.text = message2
            messageLabel.textAlignment = NSTextAlignment.center
        }
        else {
            messageLabel.text = message1
            messageLabel.textAlignment = NSTextAlignment.center
        }
    }
    
    @IBAction func cycleMessagesPressed(_ sender: UIButton) {
        let messages = [message1,
                        message2,
                        "You are the best!",
                        "You are da bomb!"]
        
        messageLabel.textAlignment = NSTextAlignment.center
        messageLabel.textColor = UIColor.green
        messageLabel.text = messages[index]
        
        index += 1
        if index == messages.count {
            index = 0
        }
        
    }
    
}

