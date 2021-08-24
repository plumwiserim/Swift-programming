//
//  ViewController.swift
//  projectB
//
//  Created by SW_mac04 on 2021/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var btnA: UIButton!
    @IBOutlet weak var swA: UISwitch!
    
    var btnB: UIButton!
    var numZ = 0
    var sliderA: UISlider!
    var textF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnB = UIButton(frame: CGRect(x: (self.view.bounds.width/2)-50, y: (self.view.bounds.height/2)+100, width: 100, height: 50))
        self.btnB.setTitle("BTN B", for: UIControl.State.normal)
        self.btnB.backgroundColor = .blue
        self.btnB.addTarget(self, action: #selector(printChar(sender:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(self.btnB)
        
        self.sliderA = UISlider(frame: CGRect(x: 50, y: 50, width: (self.view.bounds.width)-100, height: 50))
        self.sliderA.minimumValue = 0
        self.sliderA.maximumValue = 100
        self.sliderA.addTarget(self, action: #selector(showValue(sender:)), for: UIControl.Event.valueChanged)
        self.view.addSubview(self.sliderA)
        
        self.textF = UITextField(frame: CGRect(x: 100, y: 150, width: (self.view.bounds.width)-200, height: 50))
        self.textF.backgroundColor = .gray
        self.textF.textAlignment = .center
        self.view.addSubview(self.textF)
    }

    @objc func printChar(sender: UIButton) {
        numZ+=1
        self.labelA.text = String(numZ)
    
    }

    @IBAction func btnPressed(_ sender: Any) {
        numZ-=1
        self.labelA.text = String(numZ)
    }
    
    @IBAction func swPressed(_ sender: UISwitch) {
        if sender.isOn {
            self.view.backgroundColor = .brown
        } else {
            self.view.backgroundColor = .red
        }
    }
    
    @objc func showValue(sender: UISlider) {
        self.labelA.text = String(self.sliderA.value)
        self.textF.text = String(self.sliderA.value)
    }


}

