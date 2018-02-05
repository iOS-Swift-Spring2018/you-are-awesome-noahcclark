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
    @IBOutlet weak var soundSwitch: UISwitch!
    
    var awesomePlayer = AVAudioPlayer()
    let message1 = "You are awesome!"
    let message2 = "You are great!"
    var index = -1
    var lastIndex = -1
    var imageNumber = -1
    let numberOfImages = 5
    var soundNumber = -1
    let numberOfSounds = 3
    
    //MARK: - Functions
    
    //Code below executes when app's view first loads
    override func viewDidLoad() {
        super.viewDidLoad()
        print("The View Loaded")
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        //try it
        if let sound = NSDataAsset(name: soundName) {
            //check if sound
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
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
    
    //MARK: - Actions
    
    @IBAction func cycleMessagesPressed(_ sender: UIButton) {
        //messages
        let messages = [message1,
                        message2,
                        "You are the best!",
                        "You are da bomb!",
                        "Fabulous? That's you!"]
        
        messageLabel.textAlignment = NSTextAlignment.center
        messageLabel.textColor = UIColor.green

        
        //show message
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        //show image
        awesomeImage.isHidden = false
        imageNumber = nonRepeatingRandom(lastNumber: imageNumber, maxValue: numberOfImages)
        awesomeImage.image = UIImage(named: "image\(imageNumber)")
        
        
        //play sound
        if soundSwitch.isOn {
            soundNumber = nonRepeatingRandom(lastNumber: soundNumber, maxValue: numberOfSounds)
            let soundName = "sound\(soundNumber)"
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        }
        

        
    }
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if !soundSwitch.isOn && soundNumber != -1 {
            awesomePlayer.stop()
        }
    }
    
    
    
}

