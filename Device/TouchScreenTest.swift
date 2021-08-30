//
//  ViewController.swift
//  tes
//
//  Created by Mery Sartika on 16/05/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit
import MediaPlayer
import SystemConfiguration
import Foundation
import AVFoundation
import AVKit


class TouchScreenTest: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var keepDeviceType = ""
    var keepModelName = ""
    var keepHardDisk = ""
    var keepOriginal = ""
    var keepGrade = ""
//    var keepPrice = 0
//    var minusPrice = 0
//    var reMinusPrice = ""
    
    var keepTag = ""
    var statusCPU = 0
    var statusHardDisk = 0
    var statusBattery = 0
    var statusJailbreak = 0
    var statusMemory = 0
    var statusWifiBluetooth = 0
    var statusSimcard = 0
    var statusSilentButton = 0
    var statusVolumeButton = 0
    var statusPowerButton = 0
    var statusTouchScreen = 0
    
    var basePrice = ""
    
    var arr = [Int]()
    var deletedArr = [Int]()
    
    var isTouching = ""
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
        collectionView.contentInset.top = -UIApplication.shared.statusBarFrame.height
        collectionView.delegate = self
        collectionView.dataSource = self
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let itemSpacing: CGFloat = 2
            let itemsInOneRow: CGFloat = 8
            layout.sectionInset = UIEdgeInsets(top: 8, left: itemSpacing, bottom: 8, right: itemSpacing)
            layout.minimumInteritemSpacing = itemSpacing
            layout.minimumLineSpacing = itemSpacing
            let cellWidth = (UIScreen.main.bounds.width - (itemSpacing * 2) - ((itemsInOneRow - 1) * itemSpacing)) / itemsInOneRow
            let rowCount = UIScreen.main.bounds.height / cellWidth
            let newRowCount = Int((UIScreen.main.bounds.height - (itemSpacing * 2) - ((rowCount - 1) * itemSpacing)) / cellWidth)
            layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
            self.arr = Array(0..<newRowCount*Int(itemsInOneRow))
            collectionView.reloadData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath)
        cell.backgroundColor = .orange
        cell.isUserInteractionEnabled = true
        return cell
    }
    func updateCells(_ touches: Set<UITouch>) {
        guard let location = touches.first?.location(in: collectionView),
            let indexPath = collectionView.indexPathForItem(at: location),
            let cell = collectionView.cellForItem(at: indexPath) else {
                return
        }
        cell.backgroundColor = .clear
        if !deletedArr.contains(indexPath.item) {
            deletedArr.append(indexPath.item)
        }
        if deletedArr.count == arr.count {
            let alert = UIAlertController(title: "Layar Sentuh normal.", message: nil, preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                self.statusTouchScreen = 1
                //                self.deletedArr.removeAll()
                //                self.collectionView.reloadData()
                self.performSegue(withIdentifier: "TestTwoData", sender: self)
            }
            alert.addAction(okBtn)
            self.present(alert, animated: true, completion: nil)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        updateCells(touches)
        isTouching = "yes"
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        updateCells(touches)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        updateCells(touches)
        isTouching = "no"
        if isTouching == "no" {
            let alert1 = UIAlertController(title: "Dimohon untuk menyelesaikan tes Layar Sentuh!", message: nil, preferredStyle: .alert)
            let okBtn1 = UIAlertAction(title: "Lanjut", style: .default) { action in

            }
            let cancelBtn1 = UIAlertAction(title: "Lewati", style: .default) { action in
                                self.statusTouchScreen = 0
                self.end()
                //                self.deletedArr.removeAll()
                //                self.collectionView.reloadData()
            }
            alert1.addAction(okBtn1)
            alert1.addAction(cancelBtn1)
            self.present(alert1, animated: true, completion: nil)
        }
    }
    
    func end() {
        
        let alert2 = UIAlertController(title: "Layar Sentuh bermasalah.", message: nil, preferredStyle: .alert)
        let okBtn2 = UIAlertAction(title: "Ok", style: .default) { action in
           
            self.performSegue(withIdentifier: "TestTwoData", sender: self)
        }
        alert2.addAction(okBtn2)
        self.present(alert2, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cameraTest = segue.destination as! CameraTest
        cameraTest.keepTag = self.keepTag
        cameraTest.keepDeviceType = self.keepDeviceType
        cameraTest.keepModelName = self.keepModelName
        cameraTest.keepHardDisk = self.keepHardDisk
        cameraTest.keepOriginal = self.keepOriginal
        cameraTest.keepGrade = self.keepGrade
//        cameraTest.keepPrice = self.keepPrice
//        cameraTest.minusPrice = Int(self.reMinusPrice) ?? 0
        cameraTest.statusCPU = self.statusCPU
        cameraTest.statusHardDisk = self.statusHardDisk
        cameraTest.statusBattery = self.statusBattery
        cameraTest.statusJailbreak = self.statusJailbreak
        cameraTest.statusMemory = self.statusMemory
        cameraTest.statusWifiBluetooth = self.statusWifiBluetooth
        cameraTest.statusSimcard = self.statusSimcard
        cameraTest.statusSilentButton = self.statusSilentButton
        cameraTest.statusVolumeButton = self.statusVolumeButton
        cameraTest.statusPowerButton = self.statusPowerButton
        cameraTest.statusTouchScreen = self.statusTouchScreen
        cameraTest.basePrice = self.basePrice
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (!InternetConnection.Connection()) {
            let alert = UIAlertController(title: "Dimohon untuk menghidupkan koneksi Internet!", message: nil, preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    exit(0)
                }
            }
            alert.addAction(okBtn)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

class CustomCell: UICollectionViewCell {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        return nil
    }
}
class CustomCollectionView: UICollectionView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        return nil
    }
    
    
}
