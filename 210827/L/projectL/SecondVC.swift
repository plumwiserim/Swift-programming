//
//  SecondVC.swift
//  projectL
//
//  Created by SW_mac04 on 2021/08/27.
//

import UIKit

class SecondVC: UIViewController {

    var btnA: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .green
        
        self.btnA = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
        self.btnA.translatesAutoresizingMaskIntoConstraints = false
        self.btnA.backgroundColor = .blue
        self.btnA.setTitle("ShowModal", for: UIControl.State.normal)
        self.btnA.addTarget(self, action: #selector(showModal), for: UIControl.Event.touchUpInside)
        self.view.addSubview(self.btnA)
        
    }
    
    @objc func showModal() {
        let tv: ThirdVC = ThirdVC()
        self.present(tv, animated: true) {
            
        }
    }


}

