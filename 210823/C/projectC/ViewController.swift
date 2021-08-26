//
//  ViewController.swift
//  projectC
//
//  Created by SW_mac04 on 2021/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segA: UISegmentedControl!
    @IBOutlet weak var stepA: UIStepper!
    @IBOutlet weak var acti: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.stepA.minimumValue = 0
        self.stepA.maximumValue = 30
    }
    
    @IBAction func segFun(_ sender: UISegmentedControl) {
        print(self.segA.selectedSegmentIndex)
        if self.segA.selectedSegmentIndex == 0 {
            self.acti.isHidden = true
            self.acti.stopAnimating()
        } else {
            self.acti.isHidden = false
            self.acti.startAnimating()
        }
    }
    
    @IBAction func stepFun(_ sender: UIStepper) {
        print(sender.value)
    }


}

