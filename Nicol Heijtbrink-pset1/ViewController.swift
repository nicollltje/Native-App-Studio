//
//  ViewController.swift
//  Nicol Heijtbrink-pset1
//
//  Created by Nicol Heijtbrink on 01/11/16.
//  Copyright © 2016 Nicol Heijtbrink. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // links all the images to outlets to the viewcontroller
    @IBOutlet weak var arms: UIImageView!
    @IBOutlet weak var nose: UIImageView!
    @IBOutlet weak var shoes: UIImageView!
    @IBOutlet weak var mustache: UIImageView!
    @IBOutlet weak var mouth: UIImageView!
    @IBOutlet weak var hat: UIImageView!
    @IBOutlet weak var glasses: UIImageView!
    @IBOutlet weak var eyes: UIImageView!
    @IBOutlet weak var eyebrows: UIImageView!
    @IBOutlet weak var ears: UIImageView!

    @IBAction func toggleSwitch(_ sender: UISwitch) {
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

