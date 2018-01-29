//
//  CDTableViewController.swift
//  Sklep
//
//  Created by Rafael Takaka on 18.01.2018.
//  Copyright © 2018 Rafael Takaka. All rights reserved.
//

import UIKit

class CDTableViewController: UITableViewController, DelegateKoszyk, DelegateView {
    
    var plytaNazwa = ["p1", "k2", "k3", "k4", "k5", "k6", "k7", "k8"]
    var plytaCena = [15, 20, 25, 10, 54, 12, 34, 60]
    var kosz = Koszyk()
    weak var delegate: DelegateTable?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        passDataBackwards()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return plytaNazwa.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.nazwa.text = plytaNazwa[indexPath.row]
        cell.cena.text = String(plytaCena[indexPath.row]) + " zł"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCD"
        {
            if let indexPath = tableView.indexPathForSelectedRow
            {
                let destinationController = segue.destination as! PlytaViewController
                destinationController.nazwaString = plytaNazwa[indexPath.row]
                destinationController.cenaInt = plytaCena[indexPath.row]
            }
        }
        if segue.identifier == "showKoszyk"
        {
            let destinationController = segue.destination as! KoszykTableViewController
            destinationController.k = kosz
            destinationController.delegate = self
        }
    }
    
    func passDataBackwards ()
    {
        delegate?.backTable(with: kosz)
    }
    
    func backView(with kosz: Koszyk) {
        self.kosz = kosz
    }
    
    func backKoszyk(with kosz: Koszyk) {
        self.kosz = kosz
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
