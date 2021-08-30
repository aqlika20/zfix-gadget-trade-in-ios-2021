//
//  DisplayTest.swift
//  Device
//
//  Created by Mery Sartika on 20/05/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit
import Foundation


class DisplayTest: UIViewController {
    
    var colorCheck:String = ""
    
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
    var statusDisplay = 0
    
    var basePrice = ""
    
    @IBOutlet weak var color: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var viewCheck: UIView!
    override func viewDidLoad() {
        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
//        let request = NSMutableURLRequest(url: NSURL(string: "https://ifixnstore.id/trade-in-app/get-location-gps-price.php") as! URL)
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
        viewCheck.isHidden = true
        color.titleLabel?.textAlignment = NSTextAlignment.center
       
        
        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
        
        // Do any additional setup after loading the view.
    }
//    public func isDisplayOk(status: Bool)-> Bool{
//
//       return status
//    }
    
    @IBAction func color(_ sender: UIButton) {
        viewCheck.isHidden = false
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        let alert = UIAlertController(title: "Tidak ada Whitespot di Layar.", message: nil, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
            self.statusDisplay = 1
            self.performSegue(withIdentifier: "TestEightData", sender: self)
        }
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
        print("There is no Whitespot in Display")
//        self.keepPrice = self.keepPrice - self.minusPrice
//        print(self.minusPrice)
//        print(self.keepPrice)
        
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        let alert = UIAlertController(title: "Terdapat 1 atau 2 Whitespot di Layar.", message: nil, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
            self.statusDisplay = 0
            self.performSegue(withIdentifier: "TestEightData", sender: self)
        }
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
        print("There is a or 2 Whitespot/s in Display")
        
    }
    
    @IBAction func btn3(_ sender: UIButton) {
        let alert = UIAlertController(title: "Terdapat lebih dari 2 Whitespot di Layar.", message: nil, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
            self.statusDisplay = 0
            self.performSegue(withIdentifier: "TestEightData", sender: self)
        }
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
        print("There are more than 2 Whitespots")
//        self.keepPrice = self.keepPrice - self.minusPrice
//        print(self.minusPrice)
//        print(self.keepPrice)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let locationGPSTest = segue.destination as! LocationGPSTest
        locationGPSTest.keepTag = self.keepTag
        locationGPSTest.keepDeviceType = self.keepDeviceType
        locationGPSTest.keepModelName = self.keepModelName
        locationGPSTest.keepHardDisk = self.keepHardDisk
        locationGPSTest.keepOriginal = self.keepOriginal
        locationGPSTest.keepGrade = self.keepGrade
//        locationGPSTest.keepPrice = self.keepPrice
//        locationGPSTest.minusPrice = Int(self.reMinusPrice) ?? 0
        locationGPSTest.statusCPU = self.statusCPU
        locationGPSTest.statusHardDisk = self.statusHardDisk
        locationGPSTest.statusBattery = self.statusBattery
        locationGPSTest.statusJailbreak = self.statusJailbreak
        locationGPSTest.statusMemory = self.statusMemory
        locationGPSTest.statusWifiBluetooth = self.statusWifiBluetooth
        locationGPSTest.statusSimcard = self.statusSimcard
        locationGPSTest.statusSilentButton = self.statusSilentButton
        locationGPSTest.statusVolumeButton = self.statusVolumeButton
        locationGPSTest.statusPowerButton = self.statusPowerButton
        locationGPSTest.statusTouchScreen = self.statusTouchScreen
        locationGPSTest.statusBackCamera = self.statusBackCamera
        locationGPSTest.statusFrontCamera = self.statusFrontCamera
        locationGPSTest.statusSpeakerEarpiece = self.statusSpeakerEarpiece
        locationGPSTest.statusShake = self.statusShake
        locationGPSTest.statusVibration = self.statusVibration
        locationGPSTest.statusFlashlight = self.statusFlashlight
        locationGPSTest.statusDisplay = self.statusDisplay
        locationGPSTest.basePrice = self.basePrice
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
    //    @IBAction func gradient(_ sender: UIButton) {
//        self.view.removeFromSuperview()
//        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.normal
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
