//
//  SignatureData.swift
//  Device
//
//  Created by Mery Sartika on 12/06/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit
import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

func MD5(string: String) -> Data {
    let length = Int(CC_MD5_DIGEST_LENGTH)
    let messageData = string.data(using:.utf8)!
    var digestData = Data(count: length)
    
    _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
        messageData.withUnsafeBytes { messageBytes -> UInt8 in
            if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                let messageLength = CC_LONG(messageData.count)
                CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
            }
            return 0
        }
    }
    return digestData
}

struct Networking3 {
    
    
    static func getJson(_ tag: String, _ type: String, _ model: String, _ hdd: String, _ original: String, _ grade: String, _ statuscpu: String, _ statusharddisk: String, _ statusbattery: String, _ statusjailbreak: String, _ statusmemory: String, _ statuswifibluetooth: String, _ statussimcard: String, _ statussilentbutton: String, _ statusvolumebutton: String, _ statuspowerbutton: String, _ statustouchscreen: String, _ statusbackcamera: String, _ statusfrontcamera: String, _ statusspeakerearpiece: String, _ statusshake: String, _ statusvibration: String, _ statusflashlight: String, _ statusdisplay: String, _ statuslocationgps: String, _ statuslcd: String, _ statustouchidfaceid: String, _ statusmicrophonedockcharger: String, _ statuswirelesschargingnfc: String, _ statusaudio: String, _ statusother: String, _ dimei: String, _ dappleid: String, _ dfullname: String, _ didentity: String, _ dphone: String, _ dnotes: String, _ dprice: String, _ ddate: String, _ dduedate: String, _ dtime: String, _ dcode: String, _ dsignature: String) {
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Host": "ifixnstore.id",
            "accept-encoding": "gzip, deflate",
            "content-length": "100",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        
        let qTag = "tag="+tag
        let qType = "&type="+type
        let qModel = "&model="+model
        let qHdd = "&storage="+hdd+" GB"
        let qOriginal = "&original="+original
        let qGrade = "&grade="+grade
        
        let qImei = "&imei="+dimei
        let qAppleID = "&appleid="+dappleid
        let qFullName = "&fullname="+dfullname
        let qIdentity = "&identity="+didentity
        let qPhone = "&phonenumber="+dphone
        let qNotes = "&notes="+dnotes
        
        let qPrice = "&price="+dprice
        let qDate = "&date="+ddate
        let qDueDate = "&duedate="+dduedate
        let qTime = "&time="+dtime
        let qCode = "&code="+dcode
        let qSignature = "&signature="+dsignature
        
        let qStatusCPU = "&statuscpu="+statuscpu
        let qStatusHardDisk = "&statusharddisk="+statusharddisk
        let qStatusBattery = "&statusbattery="+statusbattery
        let qStatusJailbreak = "&statusjailbreak="+statusjailbreak
        let qStatusMemory = "&statusmemory="+statusmemory
        let qStatusWifiBluetooth = "&statuswifibluetooth="+statuswifibluetooth
        let qStatusSimcard = "&statussimcard="+statussimcard
        let qStatusSilentButton = "&statussilentbutton="+statussilentbutton
        let qStatusVolumeButton = "&statusvolumebutton="+statusvolumebutton
        let qStatusPowerButton = "&statuspowerbutton="+statuspowerbutton
        let qStatusTouchScreen = "&statustouchscreen="+statustouchscreen
        let qStatusBackCamera = "&statusbackcamera="+statusbackcamera
        let qStatusFrontCamera = "&statusfrontcamera="+statusfrontcamera
        let qStatusSpeakerEarpiece = "&statusspeakerearpiece="+statusspeakerearpiece
        let qStatusShake = "&statusshake="+statusshake
        let qStatusVibration = "&statusvibration="+statusvibration
        let qStatusFlashlight = "&statusflashlight="+statusflashlight
        let qStatusDisplay = "&statusdisplay="+statusdisplay
        let qStatusLocationGPS = "&statuslocationgps="+statuslocationgps
        let qStatusLCD = "&statuslcd="+statuslcd
        let qStatusTouchIDFaceID = "&statustouchidfaceid="+statustouchidfaceid
        let qStatusMicrophoneDockCharger = "&statusmicrophonedockcharger="+statusmicrophonedockcharger
        let qStatusWirelessChargingNFC = "&statuswirelesschargingnfc="+statuswirelesschargingnfc
        let qStatusAudio = "&statusaudio="+statusaudio
        let qStatusOther = "&statusother="+statusother
        
        let postData = NSMutableData(data: qTag.data(using: String.Encoding.utf8)!)
        postData.append(qType.data(using: String.Encoding.utf8)!)
        postData.append(qModel.data(using: String.Encoding.utf8)!)
        postData.append(qHdd.data(using: String.Encoding.utf8)!)
        postData.append(qOriginal.data(using: String.Encoding.utf8)!)
        postData.append(qGrade.data(using: String.Encoding.utf8)!)
        postData.append(qStatusCPU.data(using: String.Encoding.utf8)!)
        postData.append(qStatusHardDisk.data(using: String.Encoding.utf8)!)
        postData.append(qStatusBattery.data(using: String.Encoding.utf8)!)
        postData.append(qStatusJailbreak.data(using: String.Encoding.utf8)!)
        postData.append(qStatusMemory.data(using: String.Encoding.utf8)!)
        postData.append(qStatusWifiBluetooth.data(using: String.Encoding.utf8)!)
        postData.append(qStatusSimcard.data(using: String.Encoding.utf8)!)
        postData.append(qStatusSilentButton.data(using: String.Encoding.utf8)!)
        postData.append(qStatusVolumeButton.data(using: String.Encoding.utf8)!)
        postData.append(qStatusPowerButton.data(using: String.Encoding.utf8)!)
        postData.append(qStatusTouchScreen.data(using: String.Encoding.utf8)!)
        postData.append(qStatusBackCamera.data(using: String.Encoding.utf8)!)
        postData.append(qStatusFrontCamera.data(using: String.Encoding.utf8)!)
        postData.append(qStatusSpeakerEarpiece.data(using: String.Encoding.utf8)!)
        postData.append(qStatusShake.data(using: String.Encoding.utf8)!)
        postData.append(qStatusVibration.data(using: String.Encoding.utf8)!)
        postData.append(qStatusFlashlight.data(using: String.Encoding.utf8)!)
        postData.append(qStatusDisplay.data(using: String.Encoding.utf8)!)
        postData.append(qStatusLocationGPS.data(using: String.Encoding.utf8)!)
        postData.append(qStatusLCD.data(using: String.Encoding.utf8)!)
        postData.append(qStatusTouchIDFaceID.data(using: String.Encoding.utf8)!)
        postData.append(qStatusMicrophoneDockCharger.data(using: String.Encoding.utf8)!)
        postData.append(qStatusWirelessChargingNFC.data(using: String.Encoding.utf8)!)
        postData.append(qStatusAudio.data(using: String.Encoding.utf8)!)
        postData.append(qStatusOther.data(using: String.Encoding.utf8)!)
        postData.append(qImei.data(using: String.Encoding.utf8)!)
        postData.append(qAppleID.data(using: String.Encoding.utf8)!)
        postData.append(qFullName.data(using: String.Encoding.utf8)!)
        postData.append(qIdentity.data(using: String.Encoding.utf8)!)
        postData.append(qPhone.data(using: String.Encoding.utf8)!)
        postData.append(qNotes.data(using: String.Encoding.utf8)!)
        postData.append(qPrice.data(using: String.Encoding.utf8)!)
        postData.append(qDate.data(using: String.Encoding.utf8)!)
        postData.append(qDueDate.data(using: String.Encoding.utf8)!)
        postData.append(qTime.data(using: String.Encoding.utf8)!)
        postData.append(qCode.data(using: String.Encoding.utf8)!)
        postData.append(qSignature.data(using: String.Encoding.utf8)!)
        
        let urlRequest = NSMutableURLRequest(url: NSURL(string: "https://ifixnstore.id/TradeinApp/app-resource/ios/set-form.php")! as URL,
                                             cachePolicy: .useProtocolCachePolicy,
                                             timeoutInterval: 10.0)
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = postData as Data
        
        print(postData)
        URLSession.shared.dataTask(with: urlRequest as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            guard let data = data, error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            
        }).resume()
    }
}

class SignatureData: UIViewController {

    @IBOutlet weak var scrollTermsConditions: UITextView!
    @IBOutlet weak var signatureCanvas: SignatureCanvas!
    
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
    
    var code = ""
    
    var imeiData = ""
    var appleIDData = ""
    var fullNameData = ""
    var ktpPassportData = ""
    var phoneNumberData = ""
    var notesData = ""
    
    var dateData = ""
    var dueDateData = ""
    var timeData = ""
    
    var dateTimeData = ""
    
    var statusCanvas = true
    
    var image64 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
        let date = Date()
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
        let duedate = Calendar.current.date(byAdding: .day, value: +30, to: date)
        dateFormatter.dateFormat = "dd MMMM, yyyy"
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        dateData = dateFormatter.string(from: date)
        
        
        dueDateData = dateFormatter.string(from: duedate!)
        timeData = "\(hour):\(minute)"
        
        print(dateData)
        print(timeData)
        
        dateTimeData = "\(dateData) | \(timeData)"
        
        let md5CodeData = MD5(string: "\(dateTimeData) \(appleIDData)")
        
        code = md5CodeData.map { String(format: "%02hhx", $0 )}.joined()
        code = String(code.prefix(5))
        print(code)
        
        
        self.scrollTermsConditions.layoutManager.allowsNonContiguousLayout = false
        let stringLength:Int = self.scrollTermsConditions.text.count
        self.scrollTermsConditions.scrollRangeToVisible(NSMakeRange(stringLength-1, 0))
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clear(_ sender: Any) {
        signatureCanvas.clearCanvas()
    }
    
    @IBAction func confirm(_ sender: Any) {
        if signatureCanvas.statusCanvas == false {
            let alert = UIAlertController(title: "Please draw the signature!", message: nil, preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                
            }
            alert.addAction(okBtn)
            self.present(alert, animated: true, completion: nil)
        }
        else {
        let renderer = UIGraphicsImageRenderer(size: signatureCanvas.bounds.size)
        let image = renderer.image { ctx in
            signatureCanvas.drawHierarchy(in: signatureCanvas.bounds, afterScreenUpdates: true)
        }
            let imageData = image.pngData()!  
//            let imageData:NSData = image.pngData()! as NSData
//            image64 = imageData.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
            image64 = imageData.base64EncodedString()
            print("{ \(image64) }")
            
        setData(keepTag, keepDeviceType, keepModelName, keepHardDisk, keepOriginal, keepGrade, statusCPU, statusHardDisk, statusBattery, statusJailbreak, statusMemory, statusWifiBluetooth, statusSimcard, statusSilentButton, statusVolumeButton, statusPowerButton, statusTouchScreen, statusBackCamera, statusFrontCamera, statusSpeakerEarpiece, statusShake, statusVibration, statusFlashlight, statusDisplay, statusLocationGPS, statusLCD, statusTouchIDFaceID, statusMicrophoneDockCharger, statusWirelessChargingNFC, statusAudio, statusOther, imeiData, appleIDData, fullNameData, ktpPassportData, phoneNumberData, notesData, keepPrice, dateData, dueDateData, timeData, code, image64)
        performSegue(withIdentifier: "LandingData", sender: self)
        }
    }
    
    func setData(_ tag: String, _ type: String, _ model: String, _ hdd: String, _ original: String, _ grade: String, _ statuscpu: String, _ statusharddisk: String, _ statusbattery: String, _ statusjailbreak: String, _ statusmemory: String, _ statuswifibluetooth: String, _ statussimcard: String, _ statussilentbutton: String, _ statusvolumebutton: String, _ statuspowerbutton: String, _ statustouchscreen: String, _ statusbackcamera: String, _ statusfrontcamera: String, _ statusspeakerearpiece: String, _ statusshake: String, _ statusvibration: String, _ statusflashlight: String, _ statusdisplay: String, _ statuslocationgps: String, _ statuslcd: String, _ statustouchidfaceid: String, _ statusmicrophonedockcharger: String, _ statuswirelesschargingnfc: String, _ statusaudio: String, _ statusother: String, _ dimei: String, _ dappleid: String, _ dfullname: String, _ didentity: String, _ dphone: String, _ dnotes: String, _ dprice: String, _ ddate: String, _ dduedate: String, _ dtime: String, _ dcode: String, _ dsignature: String) {
        Networking3.getJson(tag, type, model, hdd, original, grade, statuscpu, statusharddisk, statusbattery, statusjailbreak, statusmemory, statuswifibluetooth, statussimcard, statussilentbutton, statusvolumebutton, statuspowerbutton, statustouchscreen, statusbackcamera, statusfrontcamera, statusspeakerearpiece, statusshake, statusvibration, statusflashlight, statusdisplay, statuslocationgps, statuslcd, statustouchidfaceid, statusmicrophonedockcharger, statuswirelesschargingnfc, statusaudio, statusother, dimei, dappleid, dfullname, didentity, dphone, dnotes, dprice, ddate, dduedate, dtime,  dcode, dsignature)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let landing = segue.destination as! Landing
        landing.code = self.code
        landing.keepGrade = self.keepGrade
        landing.keepPrice = self.keepPrice
        landing.signature = self.image64
        landing.basePrice = self.basePrice
        landing.cut = self.cut
        
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
