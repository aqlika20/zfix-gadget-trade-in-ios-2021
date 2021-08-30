//
//  WirelessChargingNFCCheck.swift
//  Device
//
//  Created by Mery Sartika on 14/08/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit

class WirelessChargingNFCCheck: UIViewController {
    
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
    
    var basePrice = ""

    @IBOutlet weak var normal: UIButton!
    @IBOutlet weak var problem: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        normal.titleLabel?.textAlignment = NSTextAlignment.center
        problem.titleLabel?.textAlignment = NSTextAlignment.center
        // Do any additional setup after loading the view.
    }
    
    @IBAction func normal(_ sender: Any) {
        statusWirelessChargingNFC = 1
        performSegue(withIdentifier: "WirelessChargingNFCCheckData", sender: self)
    }
    
    @IBAction func problem(_ sender: Any) {
        statusWirelessChargingNFC = 0
        performSegue(withIdentifier: "WirelessChargingNFCCheckData", sender: self)
    }
    
    @IBAction func nothing(_ sender: Any) {
        statusWirelessChargingNFC = 1
        performSegue(withIdentifier: "WirelessChargingNFCCheckData", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let audioCheck = segue.destination as! AudioCheck
        audioCheck.keepTag = self.keepTag
        audioCheck.keepDeviceType = self.keepDeviceType
        audioCheck.keepModelName = self.keepModelName
        audioCheck.keepHardDisk = self.keepHardDisk
        audioCheck.keepOriginal = self.keepOriginal
        audioCheck.keepGrade = self.keepGrade
        audioCheck.statusCPU = self.statusCPU
        audioCheck.statusHardDisk = self.statusHardDisk
        audioCheck.statusBattery = self.statusBattery
        audioCheck.statusJailbreak = self.statusJailbreak
        audioCheck.statusMemory = self.statusMemory
        audioCheck.statusWifiBluetooth = self.statusWifiBluetooth
        audioCheck.statusSimcard = self.statusSimcard
        audioCheck.statusSilentButton = self.statusSilentButton
        audioCheck.statusVolumeButton = self.statusVolumeButton
        audioCheck.statusPowerButton = self.statusPowerButton
        audioCheck.statusTouchScreen = self.statusTouchScreen
        audioCheck.statusBackCamera = self.statusBackCamera
        audioCheck.statusFrontCamera = self.statusFrontCamera
        audioCheck.statusSpeakerEarpiece = self.statusSpeakerEarpiece
        audioCheck.statusShake = self.statusShake
        audioCheck.statusVibration = self.statusVibration
        audioCheck.statusFlashlight = self.statusFlashlight
        audioCheck.statusDisplay = self.statusDisplay
        audioCheck.statusLocationGPS = self.statusLocationGPS
        audioCheck.statusLCD = self.statusLCD
        audioCheck.statusTouchIDFaceID = self.statusTouchIDFaceID
        audioCheck.statusMicrophoneDockCharger = self.statusMicrophoneDockCharger
        audioCheck.statusWirelessChargingNFC = self.statusWirelessChargingNFC
        audioCheck.basePrice = self.basePrice
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
