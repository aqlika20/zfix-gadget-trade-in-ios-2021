//
//  Home.swift
//  Device
//
//  Created by Mery Sartika on 17/05/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit
import SystemConfiguration

class Home: UIViewController {

    var setDeviceType = ""
    var setHardDisk = ""
    var setModelName = ""
    var setPrice = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
        
       
        
//        let request = NSMutableURLRequest(url: NSURL(string: "https://ifixnstore.id/trade-in-app/get-device-price.php") as! URL)
//        request.httpMethod = "POST"
//        let postString = "modelName="+setModelName+"&hardDisk="+setHardDisk
//        print(postString)
//        request.httpBody = postString.data(using: .utf8)
//        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
//            guard let data = data, error == nil else {
//                print("error=\(error)")
//                return
//            }
//            let responseString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
//            let priceBase =  responseString!
//            self.setPrice = priceBase.replacingOccurrences(of: "\"", with: "")
//
//        }
//        task.resume()
//        // Do any additional setup after loading the view.
//        print(setPrice)
        
    }
    
    @IBAction func start(_ sender: UIButton) {
       
        performSegue(withIdentifier: "HomeData", sender: self)
        
        
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
