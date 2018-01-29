//
//  KoszykTableViewController.swift
//  Sklep
//
//  Created by Rafael Takaka on 29.01.2018.
//  Copyright © 2018 Rafael Takaka. All rights reserved.
//

import UIKit

protocol DelegateKoszyk:class {
    func backKoszyk (with kosz:Koszyk)
}

class KoszykTableViewController: UITableViewController {
    
    //var nazwyArray = [String]()
    //var cenyArray = [Int]()
    var k:Koszyk!
    weak var delegate:DelegateKoszyk?
    @IBOutlet var nazwa: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nazwa.text = String(k.getSuma()) + " zł"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return k.getIlosc()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> KoszykCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! KoszykCell
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share" , handler: { (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
            
            self.k?.deleteItem(id: indexPath.row)
            self.delegate?.backKoszyk(with: self.k)
            }
        )
        return [deleteAction]
    }
    
    func passDataBackwards ()
    {
        delegate?.backKoszyk(with: k)
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
