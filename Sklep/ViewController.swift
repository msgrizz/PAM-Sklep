//
//  ViewController.swift
//  Sklep
//
//  Created by Rafael Takaka on 18.01.2018.
//  Copyright © 2018 Rafael Takaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DelegateTable, DelegateKoszyk {
    
    var k = Koszyk()
    @IBOutlet var suma: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        suma.text = String(k.getSuma()) + " zł"
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "showHist"
        {
            let destinationController = segue.destination as! HistoryczneTableViewController
            destinationController.kosz = k
            destinationController.delegate = self
        }
        if segue.identifier == "showFant"
        {
            let destinationController = segue.destination as! FantasyTableViewController
            destinationController.kosz = k
            destinationController.delegate = self
        }
        if segue.identifier == "showKoszyk"
        {
            let destinationController = segue.destination as! KoszykTableViewController
            destinationController.k = k
            destinationController.delegate = self
        }
        if segue.identifier == "showPlyty"
        {
            let destinationController = segue.destination as! CDTableViewController
            destinationController.kosz = k
            destinationController.delegate = self
        }
    }
    
    func backTable (with kosz:Koszyk)
    {
        k = kosz
        suma.text = String(k.getSuma()) + " zł"
    }
    
    func backKoszyk(with kosz: Koszyk)
    {
        k = kosz
        suma.text = String(k.getSuma()) + " zł"
    }

}

