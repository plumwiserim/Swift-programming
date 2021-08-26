//
//  ViewController.swift
//  projectI
//
//  Created by SW_mac04 on 2021/08/25.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var scrollV: UIScrollView!
    let imgN:[String] = ["t1_nayeon","t2_dahyeon","t3_jeongyeon","t4_sana","t5_momo","t6_chaeyoung","t7_mina","t8_jihyo","t9_zuwi"]
    var imgVArr = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.scrollV = UIScrollView(frame: CGRect(x: 100, y: 100, width: 200, height: 400))
        self.scrollV.showsHorizontalScrollIndicator = true
        self.scrollV.showsVerticalScrollIndicator = true
        self.scrollV.isScrollEnabled = true
        self.scrollV.isPagingEnabled = true //false
        self.scrollV.bounces = true
        self.scrollV.contentSize = CGSize(width: 1800, height: 400)
        self.scrollV.delegate = self
        self.view.addSubview(self.scrollV)
        
        for i in 0...8 {
            let imgV = UIImageView(frame: CGRect(x: i*200, y: 0, width: 200, height: 400))
            self.imgVArr.append(imgV)
            imgV.image = UIImage(named: imgN[i])
            self.scrollV.addSubview(imgV)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
    }
}

