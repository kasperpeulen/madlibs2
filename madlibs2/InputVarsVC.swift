//
//  InputVarsVC.swift
//  madlibs2
//
//  Created by Kasper Peulen on 11/14/15.
//  Copyright © 2015 Kasper Peulen. All rights reserved.
//

import UIKit

class InputVarsVC: UIViewController {

    var counter: Int = 7
    
    @IBOutlet weak var wordInput: UITextField!
    @IBOutlet weak var wordCounter: UILabel!
    
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var generateButton: UIButton!
    var model: Story = Story.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func okAction(sender: AnyObject) {
        let word = wordInput.text!
        switch counter {
        case 7:
            model.noun = word
            wordInput.placeholder = "Please type a plural noun."
        case 6:
            model.pluralNoun = word
            wordInput.placeholder = "Please type an adjective."
        case 5:
            model.adjective = word
            wordInput.placeholder = "Please type a place"
        case 4:
            model.place = word
            wordInput.placeholder = "Please type a funny noise"
        case 3:
            model.funnyNoise = word
            wordInput.placeholder = "Please type a persons name"
        case 2:
            model.personsName = word
            wordInput.placeholder = "Please type a job"
        case 1:
            model.job = word
            wordInput.enabled = false
            okButton.enabled = false
            generateButton.hidden = false
        default:
            return
        }
        wordInput.text = ""
        counter--
        wordCounter.text = "\(counter) word(s) left"
        if counter == 0 {
            

        }
    }
}


