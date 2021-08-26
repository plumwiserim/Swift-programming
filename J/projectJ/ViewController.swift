//
//  ViewController.swift
//  projectJ
//
//  Created by SW_mac04 on 2021/08/26.
//

import UIKit

class ViewController: UIViewController {

    var btnA: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.btnA = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        self.btnA.addTarget(self, action: #selector(uploadJSON), for: UIControl.Event.touchUpInside)
        self.btnA.backgroundColor = .brown
        self.btnA.setTitle("Upload JSON", for: UIControl.State.normal)
        self.view.addSubview(self.btnA)
        
    }

    @objc func uploadJSON() {
        
        var jsonOBJ: [String: Any] = [
            "temp": Int.random(in: 0...100),
            "humi": Double.random(in: 0.0...100.0)
        ] as Dictionary
        
        var jasonData = try! JSONSerialization.data(withJSONObject: jsonOBJ, options: .prettyPrinted)
        
        let urlA = URL(string:"https://0826func.azurewebsites.net/api/UploadJSON?code=p4pOiI3V82Xmc1uXh0ewN0VsDrZdexobh9vcG71wkf8FHuRpaftquA==")
        
        var reqA = URLRequest(url: urlA!)
        reqA.httpMethod = "POST"
        reqA.httpBody = jasonData
        reqA.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: reqA) { (dataA, respA, errA) in
        }
        task.resume()
    }

}

