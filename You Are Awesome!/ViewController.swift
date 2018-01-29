//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Noah Clark on 1/21/18.
//  Copyright © 2018 Noah Clark. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var awesomeImage: UIImageView!
    
    var awesomePlayer = AVAudioPlayer()
    let message1 = "You are awesome!"
    let message2 = "You are great!"
    var index = -1
    var lastIndex = -1
    var imageNumber = -1
    let numberOfImages = 5
    var soundNumber = -1
    let numberOfSounds = 3
    
    //Code below executes when app's view first loads
    override func viewDidLoad() {
        super.viewDidLoad()
        print("The View Loaded")
    }
    
    func playSound(soundName: String) {
        //try it
        if let sound = NSDataAsset(name: soundName) {
            //check if sound
            do {
                try awesomePlayer = AVAudioPlayer(data: sound.data)
                awesomePlayer.play()
            } catch {
                //if sound.data is not a valid audio file
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
        } else {
            //if reading NSDataAsset didn't work, report error
            print("ERROR: file \(soundName) didn't load")
        }
    }
    
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex = -1
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(maxValue)))
        } while lastNumber == newIndex
        return newIndex
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
        //messages
        let messages = [message1,
                        message2,
                        "You are the best!",
                        "You are da bomb!",
                        "Fabulous? That's you!"]
        
        messageLabel.textAlignment = NSTextAlignment.center
        messageLabel.textColor = UIColor.green
        
//        var randomIndex = Int(arc4random_uniform(UInt32(messages.count)))
//        var newIndex = -1
//        repeat {
//            newIndex = Int(arc4random_uniform(UInt32(messages.count)))
//        } while index == newIndex
        
        //show message
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        //show image
        awesomeImage.isHidden = false
//        repeat {
//            newIndex = Int(arc4random_uniform(UInt32(numberOfImages)))
//        } while imageNumber == newIndex
//        imageNumber = newIndex
        imageNumber = nonRepeatingRandom(lastNumber: imageNumber, maxValue: numberOfImages)
        awesomeImage.image = UIImage(named: "image\(imageNumber)")
        
        //play sound
//        repeat {
//            newIndex = Int(arc4random_uniform(UInt32(numberOfSounds)))
//        } while soundNumber == newIndex
//        soundNumber = newIndex
        soundNumber = nonRepeatingRandom(lastNumber: soundNumber, maxValue: numberOfSounds)
        let soundName = "sound\(soundNumber)"
        playSound(soundName: soundName)
        
//        messageLabel.text = messages[index]
//
//        index += 1
//        if index == messages.count {
//            index = 0
//        }
        

        
    }
    
}

