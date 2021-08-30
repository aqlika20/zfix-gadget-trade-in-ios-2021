//
//  MicrophoneCheck.swift
//  Device
//
//  Created by Mery Sartika on 10/07/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit

class MicrophoneCheck: UIViewController {

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
    
    var basePrice = ""
    
    @IBOutlet weak var normal: UIButton!
    @IBOutlet weak var problem: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        normal.titleLabel?.textAlignment = NSTextAlignment.center
        problem.titleLabel?.textAlignment = NSTextAlignment.center
        // Do any additional setup after loading the view.
    }
    
    @IBAction func a(_ sender: Any) {
        statusMicrophoneDockCharger = 1
        performSegue(withIdentifier: "MicrophoneCheckData", sender: self)
    }
    
    @IBAction func b(_ sender: Any) {
        statusMicrophoneDockCharger = 0
        performSegue(withIdentifier: "MicrophoneCheckData", sender: self)
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
        let wirelessChargingNFCCheck = segue.destination as! WirelessChargingNFCCheck
        wirelessChargingNFCCheck.keepTag = self.keepTag
        wirelessChargingNFCCheck.keepDeviceType = self.keepDeviceType
        wirelessChargingNFCCheck.keepModelName = self.keepModelName
        wirelessChargingNFCCheck.keepHardDisk = self.keepHardDisk
        wirelessChargingNFCCheck.keepOriginal = self.keepOriginal
        wirelessChargingNFCCheck.keepGrade = self.keepGrade
        wirelessChargingNFCCheck.statusCPU = self.statusCPU
        wirelessChargingNFCCheck.statusHardDisk = self.statusHardDisk
        wirelessChargingNFCCheck.statusBattery = self.statusBattery
        wirelessChargingNFCCheck.statusJailbreak = self.statusJailbreak
        wirelessChargingNFCCheck.statusMemory = self.statusMemory
        wirelessChargingNFCCheck.statusWifiBluetooth = self.statusWifiBluetooth
        wirelessChargingNFCCheck.statusSimcard = self.statusSimcard
        wirelessChargingNFCCheck.statusSilentButton = self.statusSilentButton
        wirelessChargingNFCCheck.statusVolumeButton = self.statusVolumeButton
        wirelessChargingNFCCheck.statusPowerButton = self.statusPowerButton
        wirelessChargingNFCCheck.statusTouchScreen = self.statusTouchScreen
        wirelessChargingNFCCheck.statusBackCamera = self.statusBackCamera
        wirelessChargingNFCCheck.statusFrontCamera = self.statusFrontCamera
        wirelessChargingNFCCheck.statusSpeakerEarpiece = self.statusSpeakerEarpiece
        wirelessChargingNFCCheck.statusShake = self.statusShake
        wirelessChargingNFCCheck.statusVibration = self.statusVibration
        wirelessChargingNFCCheck.statusFlashlight = self.statusFlashlight
        wirelessChargingNFCCheck.statusDisplay = self.statusDisplay
        wirelessChargingNFCCheck.statusLocationGPS = self.statusLocationGPS
        wirelessChargingNFCCheck.statusLCD = self.statusLCD
        wirelessChargingNFCCheck.statusTouchIDFaceID = self.statusTouchIDFaceID
        wirelessChargingNFCCheck.statusMicrophoneDockCharger = self.statusMicrophoneDockCharger
        wirelessChargingNFCCheck.basePrice = self.basePrice
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
