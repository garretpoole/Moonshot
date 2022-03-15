//
//  ContentView.swift
//  Moonshot
//
//  Created by Garret Poole on 3/14/22.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable{
    let street: String
    let city: String
}


struct ContentView: View {
    var body: some View {
        Button("Decode JSON"){
            let input = """
            {
            "name": "Taylor Swift",
            "address": {
                "street": "555, TSwift Dr",
                "city": "Nashville"

                }
            }
            """
            
            let data = Data(input.utf8)
            if let user = try? JSONDecoder().decode(User.self, from: data){
                print(user.address.street)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
