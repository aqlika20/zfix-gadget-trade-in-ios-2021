//
//  VibrationTest.swift
//  Device
//
//  Created by Mery Sartika on 20/05/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

extension UIDevice {
    static func vibrate()  {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }

        catch {}
    }
}

class VibrationTest: UIViewController {

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
    
    var basePrice = ""
    
    override func viewDidLoad() {
        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
//        let request = NSMutableURLRequest(url: NSURL(string: "https://ifixnstore.id/trade-in-app/get-flashlight-price.php") as! URL)
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
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func vibrationfunc(_ sender: UIButton) {
        do {
            UIDevice.vibrate()
            let alert1 = UIAlertController(title: "Apakah Vibrasi normal?", message: nil, preferredStyle: .alert)
            let yes = UIAlertAction(title: "Ya", style: .default) { action in
                let alert = UIAlertController(title: "Vibrasi normal.", message: nil, preferredStyle: .alert)
                let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                    //                self.deletedArr.removeAll()
                    //                self.collectionView.reloadData()
                    self.statusVibration = 1
                    self.performSegue(withIdentifier: "TestSixData", sender: self)
                }
                alert.addAction(okBtn)
                self.present(alert, animated: true, completion: nil)
                print("Vibration is Normal")
            }
            let no = UIAlertAction(title: "Tidak", style: .default) { action in
                
                let alert = UIAlertController(title: "Vibrasi bermasalah.", message: nil, preferredStyle: .alert)
                let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                    //                self.deletedArr.removeAll()
                    //                self.collectionView.reloadData()
                    self.statusVibration = 0
                    self.performSegue(withIdentifier: "TestSixData", sender: self)
                }
                alert.addAction(okBtn)
                self.present(alert, animated: true, completion: nil)
                print("Vibration is Problem")
                //                self.deletedArr.removeAll()
                //                self.collectionView.reloadData()
            }
            alert1.addAction(yes)
            alert1.addAction(no)
            self.present(alert1, animated: true, completion: nil)
        
        }
        catch {
            self.statusVibration = 0
            print("Vibration is Problem")
//            self.keepPrice = self.keepPrice - self.minusPrice
//            print(self.minusPrice)
//            print(self.keepPrice)
            self.performSegue(withIdentifier: "TestSixData", sender: self)
        }
    }
    @IBAction func skipButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Vibrasi bermasalah.", message: nil, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
            self.statusVibration = 0
            self.performSegue(withIdentifier: "TestSixData", sender: self)
        }
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
        print("Vibration is Problem")
//        self.keepPrice = self.keepPrice - self.minusPrice
//        print(self.minusPrice)
//        print(self.keepPrice)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let flashlightTest = segue.destination as! FlashlightTest
        flashlightTest.keepTag = self.keepTag
        flashlightTest.keepDeviceType = self.keepDeviceType
        flashlightTest.keepModelName = self.keepModelName
        flashlightTest.keepHardDisk = self.keepHardDisk
        flashlightTest.keepOriginal = self.keepOriginal
        flashlightTest.keepGrade = self.keepGrade
//        flashlightTest.keepPrice = self.keepPrice
//        flashlightTest.minusPrice = Int(self.reMinusPrice) ?? 0
        flashlightTest.statusCPU = self.statusCPU
        flashlightTest.statusHardDisk = self.statusHardDisk
        flashlightTest.statusBattery = self.statusBattery
        flashlightTest.statusJailbreak = self.statusJailbreak
        flashlightTest.statusMemory = self.statusMemory
        flashlightTest.statusWifiBluetooth = self.statusWifiBluetooth
        flashlightTest.statusSimcard = self.statusSimcard
        flashlightTest.statusSilentButton = self.statusSilentButton
        flashlightTest.statusVolumeButton = self.statusVolumeButton
        flashlightTest.statusPowerButton = self.statusPowerButton
        flashlightTest.statusTouchScreen = self.statusTouchScreen
        flashlightTest.statusBackCamera = self.statusBackCamera
        flashlightTest.statusFrontCamera = self.statusFrontCamera
        flashlightTest.statusSpeakerEarpiece = self.statusSpeakerEarpiece
        flashlightTest.statusShake = self.statusShake
        flashlightTest.statusVibration = self.statusVibration
        flashlightTest.basePrice = self.basePrice
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
