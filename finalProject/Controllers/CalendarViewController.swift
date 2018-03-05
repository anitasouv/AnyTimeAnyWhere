//
//  CalendarViewController.swift
//  finalProject
//
//  Created by Anita Souv on 2/28/18.
//  Copyright © 2018 Anita Souv. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! EventListTableViewCell;
        return cell;
    }
    
    
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September  ", "October", "November", "December"];
    let totalNumberOfdays = [31, 28, 31, 30, 31,  30, 31, 30, 31,  30, 31, 30];
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42;
//        return totalNumberOfdays[curMonth];
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCell", for: indexPath) as! CalendarCollectionViewCell
//        cell.DayLbl.text = String(indexPath.row + 1);
        let cellNum = indexPath.row + 1;
        if (cellNum < curWeekOfDay) {
            cell.DayLbl.text = "-"
        } else if (cellNum >= curWeekOfDay && ((cellNum - curWeekOfDay) + 1) <= totalNumberOfdays[curMonth] ) {
            cell.DayLbl.text = String((cellNum - curWeekOfDay) + 1);
        } else {
            cell.DayLbl.text = "-"
        }
        
        return cell;
        
    }


    @IBOutlet weak var MonthLabel: UILabel!
    
    @IBAction func NextBtn(_ sender: Any) {
        curMonth = (curMonth + 1) % 12;
        MonthLabel.text = months[curMonth];
        CalendarView.reloadData();
        
        
    }
    @IBAction func PreviousBtn(_ sender: Any) {
        curMonth = (curMonth % 12) - 1;
        MonthLabel.text = months[curMonth];
        CalendarView.reloadData();
    }
    
    @IBOutlet weak var CalendarView: UICollectionView!
    
    let currentDate = Date();
    var curWeekOfDay = 0;
    var curMonth = -1;
    
    
    @IBOutlet weak var eventsOfSelectedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CalendarView.delegate = self;
        CalendarView.dataSource = self;

        curMonth = Calendar.current.component(.month, from: currentDate) - 1;
        curWeekOfDay = Calendar.current.component(.weekday, from: currentDate);
        MonthLabel.text = months[curMonth];
        print(curMonth)
        
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
