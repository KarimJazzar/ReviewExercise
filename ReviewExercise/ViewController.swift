//
//  ViewController.swift
//  ReviewExercise
//
//  Created by Karim El Jazzar on 17/01/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return counters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = counters[indexPath.row]
        let cell = lapsTable.dequeueReusableCell(withIdentifier: "laps") as! LapTableViewCell
        cell.updateLaps(time: counters[indexPath.row], numb: "Lap \(indexPath.row + 1)")
        return cell
    }
    

    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var start: UIButton!
    
    @IBOutlet weak var lap: UIButton!
    
    @IBOutlet weak var lapsTable: UITableView!
    
    var timer = Timer()
    var counter = 0.0
    var counters = [String]()
    var check = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lapsTable.delegate = self
        lapsTable.dataSource = self
        lapsTable.tableFooterView = UIView()
        lapsTable.backgroundColor = UIColor.systemTeal
        // Do any additional setup after loading the view.
    }

    
    @IBAction func startButton(_ sender: UIButton) {
        if(check == false){
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            start.setTitle("Stop", for: .normal)
            lap.setTitle("Lap", for: .normal)
            check = true
        }else{
            timer.invalidate()
            start.setTitle("Start", for: .normal)
            lap.setTitle("Reset", for: .normal)
            check = false
        }
        
    }
    
    @objc func updateTimer(){
        counter = counter + 0.1
        time.text = String(format: "%.1f", counter)
    }
    
    @IBAction func lapButton(_ sender: UIButton) {
        if(lap.title(for: .normal) == "Lap"){
            counters.append(String(format: "%.1f", counter))
            lapsTable.reloadData()
        }else{
            counter = 0.0
            time.text = String(counter)
            counters.removeAll()
            lapsTable.reloadData()
        }
    }
}

