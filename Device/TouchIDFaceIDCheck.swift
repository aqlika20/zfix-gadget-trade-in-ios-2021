//
//  TouchIDFaceIDCheck.swift
//  Device
//
//  Created by Mery Sartika on 10/07/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit

class TouchIDFaceIDCheck: UIViewController {

    var keepTag = ""
    var keepDeviceType = ""
    var keepModelName = ""
    var keepHardDisk = ""
    var keepOriginal = ""
    var keepGrade = ""
    
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
    var statusLocationGPS = 0
    
    var statusLCD = 0
    var statusTouchIDFaceID = 0
    
    var basePrice = ""
    
    @IBOutlet weak var normal: UIButton!
    @IBOutlet weak var problem: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        normal.titleLabel?.textAlignment = NSTextAlignment.center
        problem.titleLabel?.textAlignment = NSTextAlignment.center
        
         
        if statusFrontCamera == 0 && (keepModelName == "iPhone X" || keepModelName == "iPhone XS" || keepModelName == "iPhone XS Max" || keepModelName == "iPhone XR" || keepModelName == "iPhone 11" || keepModelName == "iPhone 11 Pro" || keepModelName == "iPhone 11 Pro Max") {
            normal.isEnabled = false
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func normal(_ sender: Any) {
        statusTouchIDFaceID = 1
        performSegue(withIdentifier: "TouchIDFaceIDCheckData", sender: self)
    }
    
    @IBAction func problem(_ sender: Any) {
        statusTouchIDFaceID = 0
        performSegue(withIdentifier: "TouchIDFaceIDCheckData", sender: self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let microphoneCheck = segue.destination as! MicrophoneCheck
        microphoneCheck.keepTag = self.keepTag
        microphoneCheck.keepDeviceType = self.keepDeviceType
        microphoneCheck.keepModelName = self.keepModelName
        microphoneCheck.keepHardDisk = self.keepHardDisk
        microphoneCheck.keepOriginal = self.keepOriginal
        microphoneCheck.keepGrade = self.keepGrade
        microphoneCheck.statusCPU = self.statusCPU
        microphoneCheck.statusHardDisk = self.statusHardDisk
        microphoneCheck.statusBattery = self.statusBattery
        microphoneCheck.statusJailbreak = self.statusJailbreak
        microphoneCheck.statusMemory = self.statusMemory
        microphoneCheck.statusWifiBluetooth = self.statusWifiBluetooth
        microphoneCheck.statusSimcard = self.statusSimcard
        microphoneCheck.statusSilentButton = self.statusSilentButton
        microphoneCheck.statusVolumeButton = self.statusVolumeButton
        microphoneCheck.statusPowerButton = self.statusPowerButton
        microphoneCheck.statusTouchScreen = self.statusTouchScreen
        microphoneCheck.statusBackCamera = self.statusBackCamera
        microphoneCheck.statusFrontCamera = self.statusFrontCamera
        microphoneCheck.statusSpeakerEarpiece = self.statusSpeakerEarpiece
        microphoneCheck.statusShake = self.statusShake
        microphoneCheck.statusVibration = self.statusVibration
        microphoneCheck.statusFlashlight = self.statusFlashlight
        microphoneCheck.statusDisplay = self.statusDisplay
        microphoneCheck.statusLocationGPS = self.statusLocationGPS
        microphoneCheck.statusLCD = self.statusLCD
        microphoneCheck.statusTouchIDFaceID = self.statusTouchIDFaceID
        microphoneCheck.basePrice = self.basePrice
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
