//
//  DeviceOriginal.swift
//  Device
//
//  Created by Mery Sartika on 13/08/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit

class DeviceOriginal: UIViewController {
    
    var keepTag = ""
    var keepDeviceType = ""
    var keepModelName = ""
    var keepHardDisk = ""
    var keepOriginal = ""
    
    var basePrice = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func officialresmi(_ sender: Any) {
        keepOriginal = "Official (Resmi)"
         performSegue(withIdentifier: "DeviceOriginalData", sender: self)
    }
    
    @IBAction func notofficialtidakresmi(_ sender: Any) {
        keepOriginal = "Not Official (Tidak Resmi)"
        performSegue(withIdentifier: "DeviceOriginalData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let deviceGrade = segue.destination as! DeviceGrade
        deviceGrade.keepTag = self.keepTag
        deviceGrade.keepDeviceType = self.keepDeviceType
        deviceGrade.keepModelName = self.keepModelName
        deviceGrade.keepHardDisk = self.keepHardDisk
        deviceGrade.keepOriginal = self.keepOriginal
        deviceGrade.basePrice = self.basePrice
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
