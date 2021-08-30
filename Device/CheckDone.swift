//
//  CheckDone.swift
//  Device
//
//  Created by Mery Sartika on 11/06/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit

class CheckDone: UIViewController {
    
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
    var statusMicrophoneDockCharger = 0
    var statusWirelessChargingNFC = 0
    var statusAudio = 0
    var statusOther = 0
    
    var basePrice = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
        print(keepModelName)
        print(keepHardDisk)
        print(keepOriginal)
        print(keepGrade)
        print(statusCPU)
        print(statusHardDisk)
        print(statusBattery)
        print(statusJailbreak)
        print(statusMemory)
        print(statusWifiBluetooth)
        print(statusSimcard)
        print(statusSilentButton)
        print(statusVolumeButton)
        print(statusPowerButton)
        print(statusTouchScreen)
        print(statusBackCamera)
        print(statusFrontCamera)
        print(statusSpeakerEarpiece)
        print(statusShake)
        print(statusVibration)
        print(statusFlashlight)
        print(statusDisplay)
        print(statusLocationGPS)
        print(statusLCD)
        print(statusTouchIDFaceID)
        print(statusMicrophoneDockCharger)
        print(statusWirelessChargingNFC)
        print(statusAudio)
        print(statusOther)
        
    }
    

    @IBAction func `continue`(_ sender: Any) {
       
        
        performSegue(withIdentifier: "CheckingData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        let login = segue.destination as! Login
        login.keepTag = self.keepTag
        login.keepDeviceType = self.keepDeviceType
        login.keepModelName = self.keepModelName
        login.keepHardDisk = self.keepHardDisk
        login.keepOriginal = self.keepOriginal
        login.keepGrade = self.keepGrade
        login.statusCPU = String(self.statusCPU)
        login.statusHardDisk = String(self.statusHardDisk)
        login.statusBattery = String(self.statusBattery)
        login.statusJailbreak = String(self.statusJailbreak)
        login.statusMemory = String(self.statusMemory)
        login.statusWifiBluetooth = String(self.statusWifiBluetooth)
        login.statusSimcard = String(self.statusSimcard)
        login.statusSilentButton = String(self.statusSilentButton)
        login.statusVolumeButton = String(self.statusVolumeButton)
        login.statusPowerButton = String(self.statusPowerButton)
        login.statusTouchScreen = String(self.statusTouchScreen)
        login.statusBackCamera = String(self.statusBackCamera)
        login.statusFrontCamera = String(self.statusFrontCamera)
        login.statusSpeakerEarpiece = String(self.statusSpeakerEarpiece)
        login.statusShake = String(self.statusShake)
        login.statusVibration = String(self.statusVibration)
        login.statusFlashlight = String(self.statusFlashlight)
        login.statusDisplay = String(self.statusDisplay)
        login.statusLocationGPS = String(self.statusLocationGPS)
        login.statusLCD = String(self.statusLCD)
        login.statusTouchIDFaceID = String(self.statusTouchIDFaceID)
        login.statusMicrophoneDockCharger = String(self.statusMicrophoneDockCharger)
        login.statusWirelessChargingNFC = String(self.statusWirelessChargingNFC)
        login.statusAudio = String(self.statusAudio)
        login.statusOther = String(self.statusOther)
        login.basePrice = self.basePrice

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
