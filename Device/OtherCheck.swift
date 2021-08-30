//
//  OtherCheck.swift
//  Device
//
//  Created by Mery Sartika on 14/08/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit

class OtherCheck: UIViewController {
    
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
    
    @IBOutlet weak var noproblem: UIButton!
    @IBOutlet weak var aproblem: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        noproblem.titleLabel?.textAlignment = NSTextAlignment.center
        aproblem.titleLabel?.textAlignment = NSTextAlignment.center
        // Do any additional setup after loading the view.
    }
    
    @IBAction func noproblem(_ sender: Any) {
        statusOther = 1
        performSegue(withIdentifier: "OtherCheckData", sender: self)
    }
    
    @IBAction func aproblem(_ sender: Any) {
        statusOther = 0
        performSegue(withIdentifier: "OtherCheckData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let checkDone = segue.destination as! CheckDone
        checkDone.keepTag = self.keepTag
        checkDone.keepDeviceType = self.keepDeviceType
        checkDone.keepModelName = self.keepModelName
        checkDone.keepHardDisk = self.keepHardDisk
        checkDone.keepOriginal = self.keepOriginal
        checkDone.keepGrade = self.keepGrade
        checkDone.statusCPU = self.statusCPU
        checkDone.statusHardDisk = self.statusHardDisk
        checkDone.statusBattery = self.statusBattery
        checkDone.statusJailbreak = self.statusJailbreak
        checkDone.statusMemory = self.statusMemory
        checkDone.statusWifiBluetooth = self.statusWifiBluetooth
        checkDone.statusSimcard = self.statusSimcard
        checkDone.statusSilentButton = self.statusSilentButton
        checkDone.statusVolumeButton = self.statusVolumeButton
        checkDone.statusPowerButton = self.statusPowerButton
        checkDone.statusTouchScreen = self.statusTouchScreen
        checkDone.statusBackCamera = self.statusBackCamera
        checkDone.statusFrontCamera = self.statusFrontCamera
        checkDone.statusSpeakerEarpiece = self.statusSpeakerEarpiece
        checkDone.statusShake = self.statusShake
        checkDone.statusVibration = self.statusVibration
        checkDone.statusFlashlight = self.statusFlashlight
        checkDone.statusDisplay = self.statusDisplay
        checkDone.statusLocationGPS = self.statusLocationGPS
        checkDone.statusLCD = self.statusLCD
        checkDone.statusTouchIDFaceID = self.statusTouchIDFaceID
        checkDone.statusMicrophoneDockCharger = self.statusMicrophoneDockCharger
        checkDone.statusWirelessChargingNFC = self.statusWirelessChargingNFC
        checkDone.statusAudio = self.statusAudio
        checkDone.statusOther = self.statusOther
        checkDone.basePrice = self.basePrice
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
