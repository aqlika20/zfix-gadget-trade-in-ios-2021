//
//  ShakeTest.swift
//  Device
//
//  Created by Mery Sartika on 20/05/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit

class ShakeTest: UIViewController {

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
    
    var basePrice = ""
    
    @IBOutlet weak var skipButton: UIButton!
    
    override func viewDidLoad() {
        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
//        let request = NSMutableURLRequest(url: NSURL(string: "https://ifixnstore.id/trade-in-app/get-vibration-price.php") as! URL)
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

    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        do {
        if event?.subtype == UIEvent.EventSubtype.motionShake {
            skipButton.isHidden = true
            let alert = UIAlertController(title: "Goncang normal.", message: nil, preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                self.statusShake = 1
                self.performSegue(withIdentifier: "TestFiveData", sender: self)
            }
            alert.addAction(okBtn)
            self.present(alert, animated: true, completion: nil)
            print("Shake is Normal")
        }
        }
        catch {
            self.statusShake = 0
            print("Shake is Problem")
//            self.keepPrice = self.keepPrice - self.minusPrice
//            print(self.minusPrice)
//            print(self.keepPrice)
            self.performSegue(withIdentifier: "TestFiveData", sender: self)
        }
    }
    
    @IBAction func skipButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Goncang bermasalah.", message: nil, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
            self.statusShake = 0
            self.performSegue(withIdentifier: "TestFiveData", sender: self)
        }
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
        print("Shake is Probleml")
//        self.keepPrice = self.keepPrice - self.minusPrice
//        print(self.minusPrice)
//        print(self.keepPrice)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vibrationTest = segue.destination as! VibrationTest
        vibrationTest.keepTag = self.keepTag
        vibrationTest.keepDeviceType = self.keepDeviceType
        vibrationTest.keepModelName = self.keepModelName
        vibrationTest.keepHardDisk = self.keepHardDisk
        vibrationTest.keepOriginal = self.keepOriginal
        vibrationTest.keepGrade = self.keepGrade
//        vibrationTest.keepPrice = self.keepPrice
//        vibrationTest.minusPrice = Int(self.reMinusPrice) ?? 0
        vibrationTest.statusCPU = self.statusCPU
        vibrationTest.statusHardDisk = self.statusHardDisk
        vibrationTest.statusBattery = self.statusBattery
        vibrationTest.statusJailbreak = self.statusJailbreak
        vibrationTest.statusMemory = self.statusMemory
        vibrationTest.statusWifiBluetooth = self.statusWifiBluetooth
        vibrationTest.statusSimcard = self.statusSimcard
        vibrationTest.statusSilentButton = self.statusSilentButton
        vibrationTest.statusVolumeButton = self.statusVolumeButton
        vibrationTest.statusPowerButton = self.statusPowerButton
        vibrationTest.statusTouchScreen = self.statusTouchScreen
        vibrationTest.statusBackCamera = self.statusBackCamera
        vibrationTest.statusFrontCamera = self.statusFrontCamera
        vibrationTest.statusSpeakerEarpiece = self.statusSpeakerEarpiece
        vibrationTest.statusShake = self.statusShake
        vibrationTest.basePrice = self.basePrice
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
