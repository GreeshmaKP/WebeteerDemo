//
//  CricketModal.swift
//  cricketApp
//
//  Created by Greeshma on 01/03/24.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cricket = try? JSONDecoder().decode(Cricket.self, from: jsonData)

import Foundation

// MARK: - Cricket
struct Cricket: Codable {
    let matchDetails: MatchDetails
}

// MARK: - MatchDetails
struct MatchDetails: Codable {
    let format, toss, tossDecision: String
    let teams: [Team]
    let fallOfWickets: [FallOfWicket]

    enum CodingKeys: String, CodingKey {
        case format, toss
        case tossDecision = "toss_decision"
        case teams, fallOfWickets
    }
}

// MARK: - FallOfWicket
struct FallOfWicket: Codable {
    let team: String
    let wickets: [Wicket]
}

// MARK: - Wicket
struct Wicket: Codable {
    let player: String
    let score: Int
    let overs: Double
    let dismissal: Dismissal
}

// MARK: - Dismissal
struct Dismissal: Codable {
    let type: String
    let fielder: String?
    let bowler: String
}

// MARK: - Team
struct Team: Codable {
    let name: String
    let players: [Player]
    let bowlers: [Bowler]
}

// MARK: - Bowler
struct Bowler: Codable {
    let name: String
    let runsConceded, wickets: Int
    let overs:Double
}

// MARK: - Player
struct Player: Codable {
    let name: String
    let runs, balls, fours, sixes: Int
    let dismissal: Dismissal
}
