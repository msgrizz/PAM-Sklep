//
//  FantasyTableViewController.swift
//  Sklep
//
//  Created by Rafael Takaka on 18.01.2018.
//  Copyright © 2018 Rafael Takaka. All rights reserved.
//

import UIKit

protocol DelegateTable:class
{
    func backTable (with kosz:Koszyk)
}

class FantasyTableViewController: UITableViewController, DelegateView, DelegateKoszyk {

    var ksiazkaNazwa = ["K. fantasy 1", "K. fantasy 2", "K. fantasy 3", "K. fantasy 4", "K. fantasy 5", "K. fantasy 6", "K. fantasy 7", "K. fantasy 8", "K. fantasy 9", "K. fantasy 10", "K. fantasy 11", "K. fantasy 12", "K. fantasy 13", "K. fantasy 14", "K. fantasy 15"]
    var ksiazkaCena = [15, 20, 25, 10, 54, 12, 34, 60, 20, 25, 10, 54, 12, 34, 60]
    var kosz:Koszyk!
    weak var delegate: DelegateTable?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return ksiazkaNazwa.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.nazwa.text = ksiazkaNazwa[indexPath.row]
        cell.cena.text = String(ksiazkaCena[indexPath.row]) + " zł"
        // Configure the cell...

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showKsiazka"
        {
            if let indexPath = tableView.indexPathForSelectedRow
            {
                let destinationController = segue.destination as! KsiazkaViewController
                destinationController.nazwaString = ksiazkaNazwa[indexPath.row]
                destinationController.cenaInt = ksiazkaCena[indexPath.row]
                destinationController.k = kosz
                destinationController.delegate = self
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
