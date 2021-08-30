//
//  Login.swift
//  Device
//
//  Created by Mery Sartika on 04/09/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit

struct Device1: Decodable {

   
    let fullname: String?
    let status: String?

    init(fullname: String? = nil, status: String? = nil) {
        self.fullname = fullname
        self.status = status
    }
}

struct Networking1 {


    static func getJson(_ username: String, _ password: String, completionHandler: @escaping (Device1) -> ()) {

        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Host": "ifixnstore.id",
            "accept-encoding": "gzip, deflate",
            "content-length": "26",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]

        let qUsername = "username="+username
        let qPassword = "&password="+password

        let postData = NSMutableData(data: qUsername.data(using: String.Encoding.utf8)!)
        postData.append(qPassword.data(using: String.Encoding.utf8)!)

        let urlRequest = NSMutableURLRequest(url: NSURL(string: "https://ifixnstore.id/TradeinApp/app-resource/ios/set-login.php")! as URL,
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

            var resultForDevice = Device1()

            do {
                resultForDevice = try JSONDecoder().decode(Device1.self, from: data)
                print(resultForDevice.status ?? "test getting status")
                completionHandler(resultForDevice)
            } catch {
                print(error.localizedDescription)
                completionHandler(resultForDevice)
            }
        }).resume()
    }
}

class Login: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loading.isHidden = true
        self.username.delegate = self
        self.password.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
        func setLogin(_ username: String, _ password: String) {
    
            Networking1.getJson(username, password) { ( result) in
                print(result.fullname!)
                DispatchQueue.main.async {
                    if result.status == "successful" {
                        self.loading.isHidden = true
                        let alert = UIAlertController(title: "Log In berhasil.", message: nil, preferredStyle: .alert)
                        let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                            self.keepTag = result.fullname!
                             self.performSegue(withIdentifier: "LoginData", sender: self)
                        }
                        alert.addAction(okBtn)
                        self.present(alert, animated: true, completion: nil)
                       
                    }
                    else if result.status == "unsuccessful" {
                        self.loading.isHidden = true
                        let alert = UIAlertController(title: "Log In gagal.", message: nil, preferredStyle: .alert)
                        let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                            self.login.isEnabled = true
                            self.username.isEnabled = true
                            self.password.isEnabled = true
                        }
                        alert.addAction(okBtn)
                        self.present(alert, animated: true, completion: nil)
                        
                    }
            
   
                }
            }
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    
    @IBAction func login(_ sender: Any) {
        login.isEnabled = false
        username.isEnabled = false
        password.isEnabled = false
        if username.text?.count == 0 || password.text?.count == 0  {
            let alert = UIAlertController(title: "Dimohon untuk mengisi username dan password dengan benar!", message: nil, preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                self.login.isEnabled = true
                self.username.isEnabled = true
                self.password.isEnabled = true
                self.loading.isHidden = true
            }
            alert.addAction(okBtn)
            self.present(alert, animated: true, completion: nil)
            
        }
       
        else {
            loading.isHidden = false
                    setLogin((username.text?.trimmingCharacters(in: .whitespacesAndNewlines))!, (password.text?.trimmingCharacters(in: .whitespacesAndNewlines))!)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let result = segue.destination as! Result
        result.keepTag = self.keepTag
        result.keepDeviceType = self.keepDeviceType
        result.keepModelName = self.keepModelName
        result.keepHardDisk = self.keepHardDisk
        result.keepOriginal = self.keepOriginal
        result.keepGrade = self.keepGrade
        result.statusCPU = String(self.statusCPU)
        result.statusHardDisk = String(self.statusHardDisk)
        result.statusBattery = String(self.statusBattery)
        result.statusJailbreak = String(self.statusJailbreak)
        result.statusMemory = String(self.statusMemory)
        result.statusWifiBluetooth = String(self.statusWifiBluetooth)
        result.statusSimcard = String(self.statusSimcard)
        result.statusSilentButton = String(self.statusSilentButton)
        result.statusVolumeButton = String(self.statusVolumeButton)
        result.statusPowerButton = String(self.statusPowerButton)
        result.statusTouchScreen = String(self.statusTouchScreen)
        result.statusBackCamera = String(self.statusBackCamera)
        result.statusFrontCamera = String(self.statusFrontCamera)
        result.statusSpeakerEarpiece = String(self.statusSpeakerEarpiece)
        result.statusShake = String(self.statusShake)
        result.statusVibration = String(self.statusVibration)
        result.statusFlashlight = String(self.statusFlashlight)
        result.statusDisplay = String(self.statusDisplay)
        result.statusLocationGPS = String(self.statusLocationGPS)
        result.statusLCD = String(self.statusLCD)
        result.statusTouchIDFaceID = String(self.statusTouchIDFaceID)
        result.statusMicrophoneDockCharger = String(self.statusMicrophoneDockCharger)
        result.statusWirelessChargingNFC = String(self.statusWirelessChargingNFC)
        result.statusAudio = String(self.statusAudio)
        result.statusOther = String(self.statusOther)
        result.basePrice = self.basePrice
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
