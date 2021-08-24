//
//  ViewController.swift
//  projectA
//
//  Created by SW_mac04 on 2021/08/23.
//

import UIKit

class ViewController: UIViewController {

    let strB = "cde"
    var strA: String!
    var numA = 10
    var myArr = [String]()
    var myDic = [String:String]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
            
        strA = "abcde"
            
        print(strA!)
        print(strB)
            
        if numA > 5 && numA < 20 {
            print(numA)
        }
            
        for i in 1...5 {
            print(i)
        }
            
        var num = -5
        while num < 5 {
            print(num)
            num+=1
        }
            
        repeat {
            print(numA)
            numA-=1
        } while numA > 3
            
        switch strB {
        case "cdefg", "cdef":
            print("wow")
        default:
            print("good")
        }
            
        myDic["a"] = "aaa"
        myDic["b"] = "bbb"
        myDic["c"] = "ccc"
            
        for (key, value) in myDic {
            print(key)
            print(value)
        }
            
        myArr.append("azaz")
        myArr.append("bzbz")
            
        print(myArr)
            
        let mi = MyObj(mimi: "asdfg")
        print(mi.strZ!)
            
        print(addNum(num: 3))
        print(addNumber(numA: 2, numB: 5))
    }
        
    func addNum(num para: Int) -> Int {
        return para + 5
    }
        
    func addNumber(numA paraA: Int, numB paraB: Int) -> Int {
        return paraA + paraB
    }
        
    class MyObj: NSObject {
            
        var strZ: String!
            
        init(mimi name: String) {
            strZ = name
        }
    }
}

