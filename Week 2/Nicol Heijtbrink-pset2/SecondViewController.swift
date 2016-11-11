//
//  SecondViewController.swift
//  Nicol Heijtbrink-pset2
//
//  Created by Nicol Heijtbrink on 07/11/16.
//  Copyright © 2016 Nicol Heijtbrink. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var showStoryButton: UIButton!
    
    @IBOutlet weak var confirmPlaceHolderButton: UIButton!
    @IBOutlet weak var textInputField: UITextField!
    var story : Story?
    
    var fileName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filePath = Bundle.main.path(forResource: fileName, ofType: "txt")
        
        do {
            let storyFile = try String(contentsOf: URL(fileURLWithPath: filePath!))
            story = Story(stream: storyFile)
            
        } catch {
            print ("error")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.story = story
        showStoryButton.isEnabled = false
        confirmPlaceHolderButton.isHidden = false
        showStoryButton.isEnabled = false
        layout()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func layout(){
        if story != nil {
            var completionButtonTitle = "Show story!"
            if story!.getPlaceholderRemainingCount() > 0{
                completionButtonTitle = "\(story!.getPlaceholderRemainingCount()) words to fill"
            }
            showStoryButton.setTitle(completionButtonTitle, for: .normal)
            if story!.isFilledIn() {
                print(story!.toString())
                showStoryButton.isEnabled = true
                confirmPlaceHolderButton.isHidden = true
            } else{
                
            }
            textInputField.text = ""
            textInputField.placeholder = story!.getNextPlaceholder()
        }
    }
    
    func fillTextField () {
        layout()
    }
    
    @IBAction func placeholderConfirmed(_ sender: UIButton) {
        if (!textInputField.text!.isEmpty) {
            story!.fillInPlaceholder(word: textInputField.text!)
            fillTextField()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let storyView = segue.destination as? ThirdViewController {
            storyView.storyText = story!.toString()
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
