//
//  ViewController.swift
//  projectD
//
//  Created by SW_mac04 on 2021/08/24.
//

import UIKit

class ViewController: UIViewController {
    var labelA: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.labelA = UILabel(frame: CGRect(x: 100, y: 100, width: (self.view.bounds.width)-200, height: 50))
        self.labelA.backgroundColor = .blue
        self.labelA.textAlignment = .center
        self.view.addSubview(self.labelA)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(runTapG(sender:)))
        self.view.addGestureRecognizer(tapG)
        
        let longG = UILongPressGestureRecognizer(target: self, action: #selector(runLongG(sender:)))
        self.view.addGestureRecognizer(longG)
        
        let pangG = UIPanGestureRecognizer(target: self, action: #selector(runPanG(sender:)))
        self.view.addGestureRecognizer(pangG)
        
        let swipeG = UISwipeGestureRecognizer(target: self, action: #selector(runSwipeG(sender:)))
        self.view.addGestureRecognizer(swipeG)
        
        let pinchG = UIPinchGestureRecognizer(target: self, action: #selector(runPinchG(sender:)))
        self.view.addGestureRecognizer(pinchG)
        
        let rotateG = UIRotationGestureRecognizer(target: self, action: #selector(runRotate(sender:)))
        self.view.addGestureRecognizer(rotateG)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesCancelled")
    }
    
    @objc func runRotate(sender: UIRotationGestureRecognizer) {
//        print("rotate")
        self.labelA.backgroundColor = .gray
        self.labelA.text = "Rotate"
    }
    
    @objc func runPinchG(sender: UIPinchGestureRecognizer) {
//        print("pinch")
    }
    
    @objc func runSwipeG(sender: UISwipeGestureRecognizer) {
//        print("swipe")
    }

    @objc func runTapG(sender: UITapGestureRecognizer) {
//        print("tap")
        self.labelA.backgroundColor = .red
        self.labelA.text = "Tap"
    }
    
    @objc func runLongG(sender: UILongPressGestureRecognizer) {
//        print("long")
        self.labelA.backgroundColor = .green
        self.labelA.text = "Long"
    }
    
    @objc func runPanG(sender: UIPanGestureRecognizer) {
//        print("pan")
//        print(sender.location(in: self.view))
    }

}

