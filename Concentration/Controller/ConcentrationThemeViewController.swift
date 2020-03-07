//
//  ConcentrationThemeViewController.swift
//  Concentration
//
//  Created by ESRA CELIK on 24.07.2019.
//  Copyright © 2019 ESRA CELIK. All rights reserved.
//

import UIKit

class ConcentrationThemeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let themes = [
        "Sports" : "sports",
        "Animals" : "animals emojies",
        "Faces" : "faces emojies"
        
    ]
    

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "Choose Theme" {
//            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
//                if let cvc = segue.destination as? ConcentrationViewController {
//                    cvc.theme = theme
//                }
//            }
//
//        }
//    }

}
