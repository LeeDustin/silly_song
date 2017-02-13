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
        nameField.delegate = self
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
        var lyrics = ""
        if let inputName = nameField.text {
            lyrics = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: inputName)
        }
        lyricsView.text = lyrics
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
    var output = ""
    if fullName != "" {
        output = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        output = output.replacingOccurrences(of: "<SHORT_NAME>", with: shortNameFromName(name: fullName))
    }
    return output
}

// Templates Defenitions
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

// Extending the ViewController to deal with UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
