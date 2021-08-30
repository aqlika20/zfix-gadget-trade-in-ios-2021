//
//  DeviceGrade.swift
//  Device
//
//  Created by Mery Sartika on 13/08/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit

class DeviceGrade: UIViewController {

    @IBOutlet weak var gradeA: UIButton!
    @IBOutlet weak var gradeB: UIButton!
    @IBOutlet weak var gradeC: UIButton!
    
    var keepTag = ""
    var keepDeviceType = ""
    var keepModelName = ""
    var keepHardDisk = ""
    var keepOriginal = ""
    var keepGrade = ""
    
    var basePrice = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradeA.titleLabel?.textAlignment = NSTextAlignment.center
        gradeB.titleLabel?.textAlignment = NSTextAlignment.center
        gradeC.titleLabel?.textAlignment = NSTextAlignment.center
        // Do any additional setup after loading the view.
    }
    
    @IBAction func gradeA(_ sender: Any) {
        keepGrade = "A"
        performSegue(withIdentifier: "DeviceGradeData", sender: self)
    }
    
    @IBAction func gradeB(_ sender: Any) {
        keepGrade = "B"
        performSegue(withIdentifier: "DeviceGradeData", sender: self)
    }
    
    @IBAction func gradeC(_ sender: Any) {
        keepGrade = "C"
        performSegue(withIdentifier: "DeviceGradeData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let testStart = segue.destination as! TestStart
        testStart.keepTag = self.keepTag
        testStart.keepDeviceType = self.keepDeviceType
        testStart.keepModelName = self.keepModelName
        testStart.keepHardDisk = self.keepHardDisk
        testStart.keepOriginal = self.keepOriginal
        testStart.keepGrade = self.keepGrade
        testStart.basePrice = self.basePrice
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
