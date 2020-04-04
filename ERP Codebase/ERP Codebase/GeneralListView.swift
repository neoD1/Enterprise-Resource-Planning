//
//  GeneralListView.swift
//  ERP Codebase
//
//  Created by Frank Castle on 04/04/20.
//  Copyright © 2020 Code Bew. All rights reserved.
//

import SwiftUI


class User : Identifiable{
    
    var name :String?
    var email : String?
    
    init(name : String? ,email : String? ) {
        self.name = name
        self.email = email
    }
    
    
}

struct GeneralListView: View {

    @ObservedObject var networkManager  = NetworkManager()

    
    var body: some View {
        ListView(repos: networkManager.results)
            .onAppear {
                self.networkManager.fetchRequest()
        }
    }

}

struct GeneralListView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralListView()
    }
}


struct ListView :  View {

    var repos = [Repo]()
    var body: some View {
        List(repos) { repo in
                ListViewItem(repo: repo)
            }
    }
}

/*
NavigationView {
    List(landmarkData) { landmark in
        NavigationLink(destination: LandmarkDetail()) {
            LandmarkRow(landmark: landmark)
        }
    }
    .navigationBarTitle(Text("Landmarks"))
}*/



struct ListViewItem : View {
    var repo : Repo?
    var body: some View {
        HStack(alignment: .center) {
                VStack(alignment: .leading , spacing: 0) {
                    Text(repo?.repo ?? "").foregroundColor(.red)
                    Text(repo?.owner ?? "").foregroundColor(.blue)
                }
        }
    }
}


// https://leadapi.code-brew.com/webhookLogs?json=12 
