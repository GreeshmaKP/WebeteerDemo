//
//  MatchSummaryViewController.swift
//  cricketApp
//
//  Created by Greeshma on 01/03/24.
//

import UIKit

class MatchSummaryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var matchDetails: Cricket?
    var teamNames = [String]()
    var teamRuns = [String: Int]()
    var teamWickets = [String: Int]()
    var matchStatus = ""
    var teamOvers = [String: Double]()

    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()
        // Do any additional setup after loading the view.
    }
    
    
    func parseJSON(){
        // Get the URL for the JSON file
        guard let url = Bundle.main.url(forResource: "status", withExtension: "json") else {
            fatalError("Unable to locate match_details.json in the app bundle")
        }

        do {
            // Read the JSON data from the file
            let jsonData = try Data(contentsOf: url)
            
            // Decode the JSON data into the MatchDetails struct
            matchDetails = try JSONDecoder().decode(Cricket.self, from: jsonData)
            
            // Now you can access match details such as format, toss, teams, etc.
            print(matchDetails)
            calculation()
            // Access more properties as needed
        } catch {
            // Print out any errors that occur during the process
            print("Error decoding JSON: \(error)")
        }
        
    }
    
    
    func calculation(){

        // Calculate total runs scored by each team
         
        for teamData in matchDetails!.matchDetails.teams {
            let teamName = teamData.name
            teamNames.append(teamName)
             teamRuns[teamName] = 0
            teamWickets[teamName] = 0
            let players = teamData.players
             for player in players {
                 let runs = player.runs
                 teamRuns[teamName]! += runs
             }
            let fallOfWickets = matchDetails?.matchDetails.fallOfWickets
            for wicketData in fallOfWickets! {
                if wicketData.team == teamName {
                    let wickets = wicketData.wickets
                             teamWickets[teamName] = wickets.count
                         }
                     }
         }
         
         // Calculate total overs bowled by each team
        for teamData in matchDetails!.matchDetails.teams {
            let teamName = teamData.name
             teamOvers[teamName] = 0.0
            let bowlers = teamData.bowlers
             for bowler in bowlers {
                 let overs = bowler.overs
                 teamOvers[teamName]! += overs
             }
         }
         
         // Determine winning margin
         let teamNames = Array(teamRuns.keys)
         let winningTeam = teamRuns.max { $0.value < $1.value }!
         let winningMargin = teamRuns[winningTeam.key]! - teamRuns[teamNames.filter { $0 != winningTeam.key }[0]]!
        matchStatus = "\(winningTeam.key) wins by \(winningMargin)"
     }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

extension MatchSummaryViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryCell", for: indexPath) as! SummaryCell
        cell.teamALbl.text = teamNames[0]
        cell.teamBLbl.text = teamNames[1]
        cell.teamARunsWicketLbl.text = "\(teamRuns[teamNames[0]]!)" + "|"   + "\(teamWickets[teamNames[0]]!)"
        cell.teamBRunsWicketLbl.text = "\(teamRuns[teamNames[1]]!)"  + "|" + "\(teamWickets[teamNames[1]]!)"
        cell.tossLbl.text = matchDetails!.matchDetails.toss + " " + matchDetails!.matchDetails.tossDecision
        cell.matchLbl.text = matchStatus
        cell.teamAOversLbl.text = "\(teamOvers[teamNames[0]] ?? 0)" + " Overs"
        cell.teamBOversLbl.text = "\(teamOvers[teamNames[1]] ?? 0)" + " Overs"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ScorecardViewController") as! ScorecardViewController
        nextViewController.matchDetails = matchDetails
        nextViewController.teamNames = teamNames
        nextViewController.teamRuns = teamRuns
        nextViewController.teamWickets = teamWickets
        nextViewController.matchStatus = matchStatus
        nextViewController.teamOvers = teamOvers
        self.navigationController?.pushViewController(nextViewController, animated: true)

    }
    
    
}

