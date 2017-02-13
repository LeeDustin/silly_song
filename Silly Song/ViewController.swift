//
//  ViewController.swift
//  Silly Song
//
//  Created by Marwan Alani on 2017-02-12.
//  Copyright © 2017 Marwan Alani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(_ sender: Any) {
    }
}

// Helper Functions
func shortNameFromName(name: String) -> String {
    let input = name.lowercased()
    var output = ""
    let consonants = "bcdfghjklmnpqrstvwxyz".characters
    var firstNonConsonantFound = false
    for char in input.characters {
        if (firstNonConsonantFound) {
            output.append(char)
        } else {
            if (!consonants.contains(char)) {
                output.append(char)
                firstNonConsonantFound = true
            }
        }
    }
    return output
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    var output = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    output = output.replacingOccurrences(of: "<SHORT_NAME>", with: shortNameFromName(name: fullName))
    return output
}

// Templates Defenitions
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

