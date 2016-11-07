//
//  ViewController.swift
//  Nicol Heijtbrink-pset1
//
//  Created by Nicol Heijtbrink on 01/11/16.
//  Copyright © 2016 Nicol Heijtbrink. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // links all the images to outlets to the viewcontroller in an outlet collection
    @IBOutlet var attributes: [UIImageView]!
    
    // the function for switch attributes on and off
    @IBAction func toggleSwitch(_ sender: UISwitch) {

        for imageView in attributes{
            
            // each sender has been given the same tag as its corresponding image
            if imageView.tag == sender.tag{
                
                // the image shoud be hidden if the switch is off
                imageView.isHidden = !sender.isOn
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

