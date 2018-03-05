//
//  TableEventViewController.swift
//  finalProject
//
//  Created by Anita Souv on 3/4/18.
//  Copyright © 2018 Anita Souv. All rights reserved.
//

import UIKit

class TableEventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventListTableViewCell
        
        cell.dateLbl.text = String(describing: Date());
        cell.titleLbl.text = "Test Event";
        cell.startTimeLbl.text = "12:00am";
        
        return cell;
    }
    

    @IBOutlet weak var eventTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToTableEventView( segue: UIStoryboardSegue) {
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let next = sender as! DetailViewController {
//            next.previousScreen = "table";
//        }
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
