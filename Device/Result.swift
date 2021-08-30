//
//  Result.swift
//  Device
//
//  Created by Mery Sartika on 27/05/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit
import Foundation

struct Device2: Decodable {
    
    let basePrice: String?
    let price: String?
    let cut: String?

    init(basePrice: String? = nil, price: String? = nil, cut: String? = nil ) {
        self.basePrice = basePrice
        self.price = price
        self.cut = cut
    }
}

struct Networking2 {
    
    static func getJson(_ type: String, _ model: String, _ hdd: String, _ original: String, _ grade: String, _ statuscpu: String, _ statusharddisk: String, _ statusbattery: String, _ statusjailbreak: String, _ statusmemory: String, _ statuswifibluetooth: String, _ statussimcard: String, _ statussilentbutton: String, _ statusvolumebutton: String, _ statuspowerbutton: String, _ statustouchscreen: String, _ statusbackcamera: String, _ statusfrontcamera: String, _ statusspeakerearpiece: String, _ statusshake: String, _ statusvibration: String, _ statusflashlight: String, _ statusdisplay: String, _ statuslocationgps: String, _ statuslcd: String, _ statustouchidfaceid: String, _ statusmicrophonedockcharger: String, _ statuswirelesschargingnfc: String, _ statusaudio: String, _ statusother: String, completionHandler: @escaping (Device2) -> ()) {
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Host": "ifixnstore.id",
            "accept-encoding": "gzip, deflate",
            "content-length": "46",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        
        let qType = "type="+type
        let qModel = "&model="+model
        let qHdd = "&hdd="+hdd+" GB"
        let qOriginal = "&original="+original
        let qGrade = "&grade="+grade
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

        let postData = NSMutableData(data: qType.data(using: String.Encoding.utf8)!)
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
        

        
        let urlRequest = NSMutableURLRequest(url: NSURL(string: "https://ifixnstore.id/TradeinApp/app-resource/ios/get-result.php")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = postData as Data
        
        URLSession.shared.dataTask(with: urlRequest as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            guard let data = data, error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            var resultForDevice = Device2()
            
            do {
                resultForDevice = try JSONDecoder().decode(Device2.self, from: data)
                print(resultForDevice.price ?? "test getting price")
                completionHandler(resultForDevice)
            } catch {
                print(error.localizedDescription)
                completionHandler(resultForDevice)
            }
            }).resume()
    }
}

class Result: UIViewController {

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
    
    
//    var priceGradeA = ""
//    var priceGradeB = ""
//    var priceGradeC = ""
//    var priceGradeD = ""
//    var priceGradeE = ""
//    var priceGradeF = ""
    
    
    
    @IBOutlet weak var deviceType: UILabel!
    @IBOutlet weak var modelName: UILabel!
    @IBOutlet weak var hardDisk: UILabel!
    
    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    @IBOutlet weak var `continue`: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        `continue`.isEnabled = false
        
        
        loadData(keepDeviceType,keepModelName, keepHardDisk, keepOriginal, keepGrade, statusCPU, statusHardDisk, statusBattery, statusJailbreak, statusMemory, statusWifiBluetooth, statusSimcard, statusSilentButton, statusVolumeButton, statusPowerButton, statusTouchScreen, statusBackCamera, statusFrontCamera, statusSpeakerEarpiece, statusShake, statusVibration, statusFlashlight, statusDisplay, statusLocationGPS, statusLCD,
                 statusTouchIDFaceID, statusMicrophoneDockCharger, statusWirelessChargingNFC, statusAudio, statusOther)

        deviceType.text = "\(keepDeviceType) \(keepOriginal)"
        modelName.text = keepModelName
        hardDisk.text = "\(keepHardDisk)GB"
        grade.text = "Grade \(keepGrade)"
//        price.text = "Rp. \(formattedPrice ?? "0")"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func `continue`(_ sender: Any) {
                performSegue(withIdentifier: "ResultData", sender: self)
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
    
    func loadData(_ type: String, _ model: String, _ hdd: String, _ original: String, _ grade: String, _ statuscpu: String, _ statusharddisk: String, _ statusbattery: String, _ statusjailbreak: String, _ statusmemory: String, _ statuswifibluetooth: String, _ statussimcard: String, _ statussilentbutton: String, _ statusvolumebutton: String, _ statuspowerbutton: String, _ statustouchscreen: String, _ statusbackcamera: String, _ statusfrontcamera: String, _ statusspeakerearpiece: String, _ statusshake: String, _ statusvibration: String, _ statusflashlight: String, _ statusdisplay: String, _ statuslocationgps: String, _ statuslcd: String, _ statustouchidfaceid: String, _ statusmicrophonedockcharger: String, _ statuswirelesschargingnfc: String, _ statusaudio: String, _ statusother: String) {

        //TODO: buat ui dinamis sesuai grading, handler kalau beberapa grade nil
        Networking2.getJson(type, model, hdd, original, grade, statuscpu, statusharddisk, statusbattery, statusjailbreak, statusmemory, statuswifibluetooth, statussimcard, statussilentbutton, statusvolumebutton, statuspowerbutton, statustouchscreen, statusbackcamera, statusfrontcamera, statusspeakerearpiece, statusshake, statusvibration, statusflashlight, statusdisplay, statuslocationgps, statuslcd, statustouchidfaceid, statusmicrophonedockcharger, statuswirelesschargingnfc, statusaudio, statusother) { ( result) in
            DispatchQueue.main.async {

                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                let formattedPrice = numberFormatter.string(from: NSNumber(value : Int(result.price!)!))
                let formattedBasePrice = numberFormatter.string(from: NSNumber(value : Int(result.basePrice!)!))

                self.cut = "\(result.cut!)"
                print("\(self.cut)")

                self.grade.text = "Grade \(grade)"
                self.price.text = "Rp. \(formattedPrice!)" ?? "Rp. 0"
                
                self.basePrice = "Rp. \(formattedBasePrice!)" ?? "Rp. 0"
                self.keepPrice = "\(Int(result.price!)!)"
                print(self.keepPrice)
                if self.grade.text != "Memuat" && self.price.text != "Memuat"  {
                    self.`continue`.isEnabled = true
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let formData = segue.destination as! FormData
        formData.keepTag = self.keepTag
        formData.keepDeviceType = self.keepDeviceType
        formData.keepModelName = self.keepModelName
        formData.keepHardDisk = self.keepHardDisk
        formData.keepOriginal = self.keepOriginal
        formData.keepGrade = self.keepGrade
        formData.statusCPU = String(self.statusCPU)
        formData.statusHardDisk = String(self.statusHardDisk)
        formData.statusBattery = String(self.statusBattery)
        formData.statusJailbreak = String(self.statusJailbreak)
        formData.statusMemory = String(self.statusMemory)
        formData.statusWifiBluetooth = String(self.statusWifiBluetooth)
        formData.statusSimcard = String(self.statusSimcard)
        formData.statusSilentButton = String(self.statusSilentButton)
        formData.statusVolumeButton = String(self.statusVolumeButton)
        formData.statusPowerButton = String(self.statusPowerButton)
        formData.statusTouchScreen = String(self.statusTouchScreen)
        formData.statusBackCamera = String(self.statusBackCamera)
        formData.statusFrontCamera = String(self.statusFrontCamera)
        formData.statusSpeakerEarpiece = String(self.statusSpeakerEarpiece)
        formData.statusShake = String(self.statusShake)
        formData.statusVibration = String(self.statusVibration)
        formData.statusFlashlight = String(self.statusFlashlight)
        formData.statusDisplay = String(self.statusDisplay)
        formData.statusLocationGPS = String(self.statusLocationGPS)
        formData.statusLCD = String(self.statusLCD)
        formData.statusTouchIDFaceID = String(self.statusTouchIDFaceID)
        formData.statusMicrophoneDockCharger = String(self.statusMicrophoneDockCharger)
        formData.statusWirelessChargingNFC = String(self.statusWirelessChargingNFC)
        formData.statusAudio = String(self.statusAudio)
        formData.statusOther = String(self.statusOther)
        formData.keepPrice = String(self.keepPrice)
        formData.basePrice = self.basePrice
        formData.cut = self.cut
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
