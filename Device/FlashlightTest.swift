//
//  FlashlightTest.swift
//  Device
//
//  Created by Mery Sartika on 17/05/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit
import AVFoundation

extension AVCaptureDevice {
    var Locked: Bool {
        do {
            try lockForConfiguration()
            return true
        } catch {
            print(error)
            return false
        }
    }
    func Torch(intensity: Float) {
        guard hasTorch && Locked else { return }
        defer { unlockForConfiguration() }
        if intensity > 0 {
            if torchMode == .off {
                torchMode = .on
            }
            do {
                try setTorchModeOn(level: intensity)
            } catch {
                print(error)
            }
        } else {
            torchMode = .off
        }
    }
}

class FlashlightTest: UIViewController {

    var keepTag = ""
    var keepDeviceType = ""
    var keepModelName = ""
    var keepHardDisk = ""
    var keepOriginal = ""
    var keepGrade = ""
//    var keepPrice = 0
//    var minusPrice = 0
//    var reMinusPrice = ""
    
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
    var statusBackCamera = 0
    var statusFrontCamera = 0
    var statusSpeakerEarpiece = 0
    var statusShake = 0
    var statusVibration = 0
    var statusFlashlight = 0
    
    var basePrice = ""
    
    var device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .unspecified)
    override func viewDidLoad() {
//        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
//
//        let request = NSMutableURLRequest(url: NSURL(string: "https://ifixnstore.id/trade-in-app/get-display-price.php") as! URL)
//        request.httpMethod = "POST"
//        let postString = "modelName="+keepModelName
//        print(postString)
//        request.httpBody = postString.data(using: .utf8)
//        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
//            guard let data = data, error == nil else {
//                print("error=\(error)")
//                return
//            }
//            let responseString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
//            let priceBase =  responseString!
//            self.reMinusPrice = priceBase.replacingOccurrences(of: "\"", with: "")
//            
//        }
//        task.resume()
        
        super.viewDidLoad()
//        device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .unspecified)
    }
    
    @IBAction func flashlighfunc(_ sender: UISlider) {
        do {
            device?.Torch(intensity: sender.value)
        if sender.value > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                let alert1 = UIAlertController(title: "Apakah Senter normal?", message: nil, preferredStyle: .alert)
                let yes = UIAlertAction(title: "Ya", style: .default) { action in
                    let alert = UIAlertController(title: "Senter normal.", message: nil, preferredStyle: .alert)
                    let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                        self.device?.Torch(intensity: 0)
                        //                self.deletedArr.removeAll()
                        //                self.collectionView.reloadData()
                        self.statusFlashlight = 1
                        self.performSegue(withIdentifier: "TestSevenData", sender: self)
                    }
                    alert.addAction(okBtn)
                    self.present(alert, animated: true, completion: nil)
                    print("Flashlight is Normal")
                }
                let no = UIAlertAction(title: "Tidak", style: .default) { action in
                    
                    let alert = UIAlertController(title: "Senter bermasalah.", message: nil, preferredStyle: .alert)
                    let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                        self.device?.Torch(intensity: 0)
                        //                self.deletedArr.removeAll()
                        //                self.collectionView.reloadData()
                        self.statusFlashlight = 0
                        self.performSegue(withIdentifier: "TestSevenData", sender: self)
                    }
                    alert.addAction(okBtn)
                    self.present(alert, animated: true, completion: nil)
                    print("Flashlight is Problem")
                    //                self.deletedArr.removeAll()
                    //                self.collectionView.reloadData()
                }
                alert1.addAction(yes)
                alert1.addAction(no)
                self.present(alert1, animated: true, completion: nil)
           
        }
            }
        }
            catch {
                print("Flashlight is Problem")
//                self.keepPrice = self.keepPrice - self.minusPrice
//                print(self.minusPrice)
//                print(self.keepPrice)
                self.performSegue(withIdentifier: "TestSevenData", sender: self)
            }
    }
    
    
    @IBAction func skipButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Senter bermasalah.", message: nil, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
            self.device?.Torch(intensity: 0)
            //                self.deletedArr.removeAll()
            //                self.collectionView.reloadData()
            self.statusFlashlight = 0
            self.performSegue(withIdentifier: "TestSevenData", sender: self)
        }
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
        print("Flashlight is Problem")
//        self.keepPrice = self.keepPrice - self.minusPrice
//        print(self.minusPrice)
//        print(self.keepPrice)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let displayTest = segue.destination as! DisplayTest
        displayTest.keepTag = self.keepTag
        displayTest.keepDeviceType = self.keepDeviceType
        displayTest.keepModelName = self.keepModelName
        displayTest.keepHardDisk = self.keepHardDisk
        displayTest.keepOriginal = self.keepOriginal
        displayTest.keepGrade = self.keepGrade
//        displayTest.keepPrice = self.keepPrice
//        displayTest.minusPrice = Int(self.reMinusPrice) ?? 0
        displayTest.statusCPU = self.statusCPU
        displayTest.statusHardDisk = self.statusHardDisk
        displayTest.statusBattery = self.statusBattery
        displayTest.statusJailbreak = self.statusJailbreak
        displayTest.statusMemory = self.statusMemory
        displayTest.statusWifiBluetooth = self.statusWifiBluetooth
        displayTest.statusSimcard = self.statusSimcard
        displayTest.statusSilentButton = self.statusSilentButton
        displayTest.statusVolumeButton = self.statusVolumeButton
        displayTest.statusPowerButton = self.statusPowerButton
        displayTest.statusTouchScreen = self.statusTouchScreen
        displayTest.statusBackCamera = self.statusBackCamera
        displayTest.statusFrontCamera = self.statusFrontCamera
        displayTest.statusSpeakerEarpiece = self.statusSpeakerEarpiece
        displayTest.statusShake = self.statusShake
        displayTest.statusVibration = self.statusVibration
        displayTest.statusFlashlight = self.statusFlashlight
        displayTest.basePrice = self.basePrice
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        guard device == AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .unspecified) else {
            print("Flashlight is Problem")
            return
        }
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
