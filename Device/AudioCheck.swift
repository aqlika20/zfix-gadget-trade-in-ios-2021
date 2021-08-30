//
//  AudioCheck.swift
//  Device
//
//  Created by Mery Sartika on 14/08/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit

class AudioCheck: UIViewController {
    
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
        statusAudio = 1
        performSegue(withIdentifier: "AudioCheckData", sender: self)
    }
    
    @IBAction func problem(_ sender: Any) {
        statusAudio = 0
        performSegue(withIdentifier: "AudioCheckData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let otherCheck = segue.destination as! OtherCheck
        otherCheck.keepTag = self.keepTag
        otherCheck.keepDeviceType = self.keepDeviceType
        otherCheck.keepModelName = self.keepModelName
        otherCheck.keepHardDisk = self.keepHardDisk
        otherCheck.keepOriginal = self.keepOriginal
        otherCheck.keepGrade = self.keepGrade
        otherCheck.statusCPU = self.statusCPU
        otherCheck.statusHardDisk = self.statusHardDisk
        otherCheck.statusBattery = self.statusBattery
        otherCheck.statusJailbreak = self.statusJailbreak
        otherCheck.statusMemory = self.statusMemory
        otherCheck.statusWifiBluetooth = self.statusWifiBluetooth
        otherCheck.statusSimcard = self.statusSimcard
        otherCheck.statusSilentButton = self.statusSilentButton
        otherCheck.statusVolumeButton = self.statusVolumeButton
        otherCheck.statusPowerButton = self.statusPowerButton
        otherCheck.statusTouchScreen = self.statusTouchScreen
        otherCheck.statusBackCamera = self.statusBackCamera
        otherCheck.statusFrontCamera = self.statusFrontCamera
        otherCheck.statusSpeakerEarpiece = self.statusSpeakerEarpiece
        otherCheck.statusShake = self.statusShake
        otherCheck.statusVibration = self.statusVibration
        otherCheck.statusFlashlight = self.statusFlashlight
        otherCheck.statusDisplay = self.statusDisplay
        otherCheck.statusLocationGPS = self.statusLocationGPS
        otherCheck.statusLCD = self.statusLCD
        otherCheck.statusTouchIDFaceID = self.statusTouchIDFaceID
        otherCheck.statusMicrophoneDockCharger = self.statusMicrophoneDockCharger
        otherCheck.statusWirelessChargingNFC = self.statusWirelessChargingNFC
        otherCheck.statusAudio = self.statusAudio
        otherCheck.basePrice = self.basePrice
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
