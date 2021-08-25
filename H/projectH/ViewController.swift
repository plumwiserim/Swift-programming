//
//  ViewController.swift
//  projectH
//
//  Created by SW_mac04 on 2021/08/25.
//

import UIKit
import AZSClient

class ViewController: UIViewController {

    var imgV: UIImageView!
    var btnA: UIButton!
    var btnB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imgV = UIImageView(frame: CGRect(x: 50, y: 50, width: (self.view.bounds.width)-100, height: (self.view.bounds.height)-500))
        self.imgV.image = UIImage(named: "iu")
        
        self.imgV.layer.cornerRadius = 10
        self.imgV.clipsToBounds = true
        self.imgV.layer.borderWidth = 2.0
        self.imgV.layer.borderColor = UIColor.red.cgColor
        self.view.addSubview(self.imgV)
        
        self.btnA = UIButton(frame: CGRect(x: 50, y: 500, width: (self.view.bounds.width)-100, height: 50))
        self.btnA.addTarget(self, action: #selector(self.uploadIMG), for: UIControl.Event.touchUpInside)
        self.btnA.backgroundColor = .brown
        self.btnA.setTitle("Download", for: UIControl.State.normal)
        self.view.addSubview(self.btnB)
        
        self.btnB = UIButton(frame: CGRect(x: 50, y: 600, width: (self.view.bounds.width)-100, height: 50))
        self.btnB.addTarget(self, action: #selector(self.downloadIMG), for: UIControl.Event.touchUpInside)
        self.btnB.backgroundColor = .green
        self.btnB.setTitle("Upload", for: UIControl.State.normal)
        self.view.addSubview(self.btnA)
        
    }

    @objc func uploadIMG() {
        let account: AZSCloudStorageAccount = try! AZSCloudStorageAccount(fromConnectionString: "")
        let blobClient: AZSCloudBlobClient = account.getBlobClient()
        let blobContainer: AZSCloudBlobContainer = blobClient.containerReference(fromName: "imgcon")
        let blockBlob:AZSCloudBlockBlob = blobContainer.blockBlobReference(fromName: "iu.png")
        
        let imgData = self.imgV.image!.pngData()
        
        blockBlob.upload(from: imgData!) { errorA in print("OK")
        }
    }
    
    @objc func downloadIMG() {
        let account: AZSCloudStorageAccount = try! AZSCloudStorageAccount(fromConnectionString: "")
        let blobClient: AZSCloudBlobClient = account.getBlobClient()
        let blobContainer: AZSCloudBlobContainer = blobClient.containerReference(fromName: "imgcon")
        let blockBlob:AZSCloudBlockBlob = blobContainer.blockBlobReference(fromName: "bts.jpg")
        
//        let imgData = self.imgV.image!.pngData()
        
        blockBlob.downloadToData {err,dataA in
            let imgB:UIIamge = UIImage(data:dataA!)!
            DispatchQueue.main.async() {
                self.imgV.image = imgB
            }
        }
    }

}

