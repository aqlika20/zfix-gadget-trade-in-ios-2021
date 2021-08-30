//
//  Display.swift
//  Device
//
//  Created by Mery Sartika on 14/05/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit


class Display: UIViewController {
    @IBOutlet weak var myButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.setGradientBackground(colorOne: Colors.orange, colorTwo: Colors.yellow)
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
