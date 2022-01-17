//
//  LapTableViewCell.swift
//  ReviewExercise
//
//  Created by Karim El Jazzar on 17/01/2022.
//

import UIKit

class LapTableViewCell: UITableViewCell {

    @IBOutlet weak var lapTime: UILabel!
    
    @IBOutlet weak var lapNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateLaps(time:String, numb:String){
        lapTime.text = time
        lapNumber.text = numb
    }

}
