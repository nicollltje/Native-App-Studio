//
//  ViewController.swift
//  Nicol Heijtbrink-pset2
//
//  Created by Nicol Heijtbrink on 07/11/16.
//  Copyright © 2016 Nicol Heijtbrink. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {

    
    @IBOutlet weak var welcomeMessage: UITextView!
    
    @IBOutlet weak var storyPicker: UIPickerView!
    
    var pickerDataSource = ["Simple", "Tarzan", "University", "Clothes", "Dance"];
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    var fileName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeMessage.text = "Welcome to Mad Libs! I will ask you to fill in words to complete a story. You won't be able to see the whole story until you are done filling in all the missing words. That's part of the fun. Choose a story and click below to get started..."
        
        storyPicker.dataSource = self;
        storyPicker.delegate = self;
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
    }
    
    func getFileNameForRow(row : Int) -> String?
    {
        switch row {
        case 0:
            return "madlib0_simple"
        case 1:
            return "madlib1_tarzan"
        case 2:
            return "madlib2_university"
        case 3:
            return "madlib3_clothes"
        case 4:
            return "madlib4_dance"
        default:
            return nil
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let placeHolderViewController = segue.destination as? SecondViewController {
            if let fileName = getFileNameForRow(row: storyPicker.selectedRow(inComponent: 0)){
                placeHolderViewController.fileName = fileName
            }
        }  else{
            print("Error, view controller not found")
        }
    }

}

