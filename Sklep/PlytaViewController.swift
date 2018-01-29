//
//  PlytaViewController.swift
//  Sklep
//
//  Created by Rafael Takaka on 28.01.2018.
//  Copyright © 2018 Rafael Takaka. All rights reserved.
//

import UIKit

class PlytaViewController: UIViewController, DelegateKoszyk {
    
    @IBOutlet var nazwa: UILabel!
    @IBOutlet var cena: UILabel!
    @IBOutlet var suma: UILabel!
    
    var cenaInt:Int?
    var nazwaString:String?
    var k = Koszyk()
    weak var delegate:DelegateView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nazwa.text = nazwaString
        cena.text = String(cenaInt!) + " zł"
        suma.text = String(k.getSuma()) + " zł"

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        passDataBackwards()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "showKoszyk"
        {
            let destinationController = segue.destination as! KoszykTableViewController
            destinationController.k = self.k
            destinationController.delegate = self
        }
    }
    
    @IBAction func addItem()
    {
        k.addItem(nazwa: nazwaString!, cena: cenaInt!)
        suma.text = String(k.getSuma()) + " zł"
        let alertController = UIAlertController(title: "Dodano", message: "Dodano przedmiot do koszyka", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        present(alertController, animated: true, completion: nil)
        passDataBackwards()
    }
    
    func backKoszyk(with kosz: Koszyk) {
        k = kosz
        suma.text = String(k.getSuma()) + " zł"
    }
    
    func passDataBackwards()
    {
        delegate?.backView(with: k)
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
