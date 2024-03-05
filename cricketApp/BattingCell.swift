//
//  BattingCell.swift
//  cricketApp
//
//  Created by Greeshma on 04/03/24.
//

import UIKit

class BattingCell: UITableViewCell{
    @IBOutlet weak var tableVw: UITableView!
    
   

    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableVw.delegate = self
        tableVw.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    

}
extension BattingCell:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVw.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailCell
        cell.lbl.text = "\(indexPath.row)"
        return cell
    }
    
    
}
