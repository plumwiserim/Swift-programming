//
//  ViewController.swift
//  projectF
//
//  Created by SW_mac04 on 2021/08/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableV: UITableView!
//    let myArr = ["aaa","bbb","ccc","ddd","eee"]
    let myDic = ["aaa":["a000","a111","a222","a333","a444"], "bbb":["b000","b111"], "ccc":["c000","c111","c222"]]
    var keys: Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.keys = myDic.keys.sorted()
        //print(self.keys)
        
        self.tableV = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height:self.view.bounds.height))
        self.tableV.register(UITableViewCell.self, forCellReuseIdentifier: "cellA")
        self.tableV.dataSource = self
        self.tableV.delegate = self
        self.view.addSubview(self.tableV)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.keys.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.keys[section]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sec = self.keys[section]
        return myDic[sec]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cellA")
        
        let sec = self.keys[indexPath.section]
        cell.textLabel?.text = myDic[sec]![indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(myArr[indexPath.row])
    }

}

