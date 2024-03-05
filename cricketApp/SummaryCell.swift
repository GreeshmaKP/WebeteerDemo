//
//  SummaryCell.swift
//  cricketApp
//
//  Created by Greeshma on 04/03/24.
//

import UIKit

class SummaryCell: UITableViewCell {

    @IBOutlet weak var teamAOversLbl: UILabel!
    @IBOutlet weak var teamARunsWicketLbl: UILabel!
    @IBOutlet weak var teamALbl: UILabel!
    @IBOutlet weak var tossLbl: UILabel!
    
    @IBOutlet weak var teamBOversLbl: UILabel!
    @IBOutlet weak var teamBRunsWicketLbl: UILabel!
    @IBOutlet weak var teamBLbl: UILabel!
    
    @IBOutlet weak var matchLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
