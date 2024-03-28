//
//  PublicConnectionView.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import SwiftUI

struct PublicConnectionView: View {
    @StateObject var viewModel = PublicConnectionViewViewModel()
    let item: PublicConnection
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                let pronouns = item.filter!["pronounSelection"]
                let schools = item.filter!["schoolSelection"]
                let careers = item.filter!["careerSelection"]
                let interests = item.filter!["interestSelection"]
                
                Text("Pronouns").bold()
                ForEach(pronouns!.sorted{$0.id! < $1.id!}) { item in
                    Text(item.name!)
                        .font(.footnote)
                }
                
                Text("Schools").bold()
                ForEach(schools!.sorted{$0.id! < $1.id!}) { item in
                    Text(item.name!)
                        .font(.footnote)
                }
                
                Text("Career Paths").bold()
                ForEach(careers!.sorted{$0.id! < $1.id!}) { item in
                    Text(item.name!)
                        .font(.footnote)
                }
                
                Text("Interests").bold()
                ForEach(interests!.sorted{$0.id! < $1.id!}) { item in
                    Text(item.name!)
                        .font(.footnote)
                }
                
                
            }
            Spacer()
            Button {
                viewModel.toggleChat(connection: item)
            } label: {
                Image(systemName: item.isConnected! ? 
                    "message.circle" : "circle")
                .foregroundColor(.mint)
            }
        }
    }
}

#Preview {
    PublicConnectionView(item: .init(
        id: "0000",
        user: "someID",
        filter: ["pronounSelection": [Option(name: "they/them")],
                 "schoolSelection": [Option(name: "nerd school")],
                 "careerSelection": [Option(name: "girlboss")],
                 "interestSelection": [Option(name: "gaslighting"), Option(name:"gatekeeping")]]
    ))
}
