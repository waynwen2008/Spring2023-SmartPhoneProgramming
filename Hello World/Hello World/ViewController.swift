//
//  ViewController.swift
//  Hello World
//
//  Created by Wayne Wen on 1/14/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var buttonValue: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("view has already loaded")
    }
    
    @IBAction func pressMeAction(_ sender: UIButton) {
        print("button was pressed")
        buttonValue.text = "buttonValue changed!"
    }
}

