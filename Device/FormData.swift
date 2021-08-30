//
//  FormData.swift
//  Device
//
//  Created by Mery Sartika on 11/06/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit

//extension UIViewController {
//    func hideKeyboardWhenTappedAround() {
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)
//    }
//
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }
//}

class FormData: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var imei: UITextField!
    @IBOutlet weak var appleID: UITextField!
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var ktpPassport: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var notes: UITextField!
    
    var keepTag = ""
    var keepDeviceType = ""
    var keepModelName = ""
    var keepHardDisk = ""
    var keepOriginal = ""
    var keepGrade = ""
    
    var statusCPU = ""
    var statusHardDisk = ""
    var statusBattery = ""
    var statusJailbreak = ""
    var statusMemory = ""
    var statusWifiBluetooth = ""
    var statusSimcard = ""
    var statusSilentButton = ""
    var statusVolumeButton = ""
    var statusPowerButton = ""
    var statusTouchScreen = ""
    var statusBackCamera = ""
    var statusFrontCamera = ""
    var statusSpeakerEarpiece = ""
    var statusShake = ""
    var statusVibration = ""
    var statusFlashlight = ""
    var statusDisplay = ""
    var statusLocationGPS = ""
    
    var statusLCD = ""
    var statusTouchIDFaceID = ""
    var statusMicrophoneDockCharger = ""
    var statusWirelessChargingNFC = ""
    var statusAudio = ""
    var statusOther = ""
    
    var basePrice = ""
    var keepPrice = ""
    
    var cut = ""
//    var appleIDData = ""
//    var fullNameData = ""
//    var ktpPassportData = ""
//    var phoneNumberData = ""
//    var emailData = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
//        let appleIDData = (appleID.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
//        let fullNameData = (fullName.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
//        let ktpPassportData = (ktpPassport.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
//        let phoneNumberData = (phoneNumber.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
//        let emailData = (email.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
//        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
        self.appleID.delegate = self
        self.fullName.delegate = self
        self.ktpPassport.delegate = self
        self.phoneNumber.delegate = self
        self.notes.delegate = self
        
    }
    

    @IBAction func `continue`(_ sender: Any) {
        if appleID.text?.count == 0 || fullName.text?.count == 0 || ktpPassport.text?.count == 0 || phoneNumber.text?.count == 0  {
            let alert = UIAlertController(title: "Dimohon untuk mengisi Form yang telah disediakan!", message: nil, preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                
            }
            alert.addAction(okBtn)
            self.present(alert, animated: true, completion: nil)
        }
        else if isValidEmail(emailID: (appleID.text?.trimmingCharacters(in: .whitespacesAndNewlines))!) == false {
            let alert = UIAlertController(title: "Dimohon untuk memasukkan Apple ID dengan benar!", message: nil, preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                
            }
            alert.addAction(okBtn)
            self.present(alert, animated: true, completion: nil)
        }
        
        else {
            performSegue(withIdentifier: "SendFormData", sender: self)
            
        }
       
        
        
    }
    
    func isValidEmail(emailID:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let signatureData = segue.destination as! SignatureData
        signatureData.keepTag = self.keepTag
        signatureData.keepDeviceType = self.keepDeviceType
        signatureData.keepModelName = self.keepModelName
        signatureData.keepHardDisk = self.keepHardDisk
        signatureData.keepOriginal = self.keepOriginal
        signatureData.keepGrade = self.keepGrade
        signatureData.statusCPU = String(self.statusCPU)
        signatureData.statusHardDisk = String(self.statusHardDisk)
        signatureData.statusBattery = String(self.statusBattery)
        signatureData.statusJailbreak = String(self.statusJailbreak)
        signatureData.statusMemory = String(self.statusMemory)
        signatureData.statusWifiBluetooth = String(self.statusWifiBluetooth)
        signatureData.statusSimcard = String(self.statusSimcard)
        signatureData.statusSilentButton = String(self.statusSilentButton)
        signatureData.statusVolumeButton = String(self.statusVolumeButton)
        signatureData.statusPowerButton = String(self.statusPowerButton)
        signatureData.statusTouchScreen = String(self.statusTouchScreen)
        signatureData.statusBackCamera = String(self.statusBackCamera)
        signatureData.statusFrontCamera = String(self.statusFrontCamera)
        signatureData.statusSpeakerEarpiece = String(self.statusSpeakerEarpiece)
        signatureData.statusShake = String(self.statusShake)
        signatureData.statusVibration = String(self.statusVibration)
        signatureData.statusFlashlight = String(self.statusFlashlight)
        signatureData.statusDisplay = String(self.statusDisplay)
        signatureData.statusLocationGPS = String(self.statusLocationGPS)
        signatureData.statusLCD = String(self.statusLCD)
        signatureData.statusTouchIDFaceID = String(self.statusTouchIDFaceID)
        signatureData.statusMicrophoneDockCharger = String(self.statusMicrophoneDockCharger)
        signatureData.statusWirelessChargingNFC = String(self.statusWirelessChargingNFC)
        signatureData.statusAudio = String(self.statusAudio)
        signatureData.statusOther = String(self.statusOther)
        signatureData.imeiData = (imei.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        signatureData.appleIDData = (appleID.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        signatureData.fullNameData = (fullName.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        signatureData.ktpPassportData = (ktpPassport.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        signatureData.phoneNumberData = (phoneNumber.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        signatureData.notesData = (notes.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        signatureData.keepPrice = String(self.keepPrice)
        signatureData.basePrice = self.basePrice
        signatureData.cut = self.cut
        
        print(signatureData.appleIDData)
        print(signatureData.fullNameData)
        print(signatureData.ktpPassportData)
        print(signatureData.phoneNumberData)
        print(signatureData.notesData)
        
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
