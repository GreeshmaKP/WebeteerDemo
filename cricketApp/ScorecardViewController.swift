//
//  ScorecardViewController.swift
//  cricketApp
//
//  Created by Greeshma on 01/03/24.
//

import UIKit

class ScorecardViewController: UIViewController {
    
    @IBOutlet weak var matchStatusLbl: UILabel!
    @IBOutlet weak var battingTableView: UITableView!
    var matchDetails: Cricket?
    var teamNames = [String]()
    var teamRuns = [String: Int]()
    var teamWickets = [String: Int]()
    var matchStatus = ""
    var teamOvers = [String: Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
        // Do any additional setup after loading the view.
    }
    
    func initialSetup(){
        matchStatusLbl.text = matchStatus
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ScorecardViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = battingTableView.dequeueReusableCell(withIdentifier: "BattingCell", for: indexPath) as! BattingCell
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return matchDetails?.matchDetails.teams.count ?? 0 // Only one section in this example
      }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          return 50 // Height of the section view
      }
      
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
          let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 50))
          headerView.backgroundColor = UIColor.lightGray
          
          // Create stack view
          let stackView = UIStackView(frame: headerView.bounds)
          stackView.axis = .horizontal
          stackView.alignment = .fill
          stackView.distribution = .fillEqually
          
          // Create left label
          let leftLabel = UILabel()
        leftLabel.text = teamNames[section]
          leftLabel.textAlignment = .center
          stackView.addArrangedSubview(leftLabel)
          
          // Create right label
          let rightLabel = UILabel()
          rightLabel.text = "\(teamRuns[teamNames[section]]!)"  + " | " + "\(teamWickets[teamNames[section]]!)" + "   ( \(teamOvers[teamNames[section]] ?? 0)" + " Ov)"
          rightLabel.textAlignment = .center
          stackView.addArrangedSubview(rightLabel)
          
          headerView.addSubview(stackView)
          
          return headerView
      }
    
}
