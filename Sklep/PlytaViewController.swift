//
//  PlytaViewController.swift
//  Sklep
//
//  Created by Rafael Takaka on 28.01.2018.
//  Copyright © 2018 Rafael Takaka. All rights reserved.
//

import UIKit

class PlytaViewController: UIViewController {

    @IBOutlet var nazwa: UILabel!
    @IBOutlet var cena: UILabel!
    
    var cenaInt:Int?
    var nazwaString:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nazwa.text = nazwaString
        cena.text = String(cenaInt!) + " zł"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
