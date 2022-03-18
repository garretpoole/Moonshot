//
//  Mission.swift
//  Moonshot
//
//  Created by Garret Poole on 3/18/22.
//

import Foundation

struct Mission: Codable, Identifiable {
    //nested struct to keep code organized
    struct CrewRole: Codable{
        let name: String
        let role: String
    }
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String{
        "Apollo \(id)"
    }
    
    var image: String{
        "apollo\(id)"
    }
    
    var formattedLaunchDate : String{
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
