//
//  ContentView.swift
//  testMarmalade
//
//  Created by david florczak on 25/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var author = "{auteur}"
    @State var citation = "{citation}"
    @State var smiley = ["🤧","😕","🤩"]
    @State var progression: Int = 0
    @State private var showingModal = false
    
    @State var showEnd = false
    
    var body: some View {
        
        if showEnd {
            VStack {
                Text("finis!")
                Button("Recommencer") {
                    progression = 0
                    showEnd = false
                }
            }
            
        }
        else {
            VStack {
                Spacer()
                Text(author)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                Text(citation)
                    .foregroundColor(.white)
                    .font(.headline)
                Text(smiley[progression/40]) // passe de 0 à 1 puis 2 quand la progression atteind 40 et 80
                    .font(.system(size: 120))
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding(.bottom, -20)
                    VStack {
                        Text("\(progression) % des citations")
                            .font(.largeTitle)
                        HStack {
                            ProgressView(value: Float(progression)/100)
                                .progressViewStyle(.linear)
                                .tint(.orange)
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.blue)
                        }
                        Text("10 citations")
                        Button {
                            progression += 10
                            if progression == 50 {
                                showingModal = true
                            }
                            if progression == 110 {
                                showEnd = true
                            }
                            fetchCitations()
                        } label: {
                            Text("Citation suivante")
                        }.buttonStyle(.borderedProminent)
                            .tint(Color("buttonColor"))
                    }
                }
            }
            .onAppear() { fetchCitations() }
            .background(Color.orange)
            .sheet(isPresented: $showingModal) {
                _0percentModal(showEnd: $showEnd)
            }
        }
    }
    
    func fetchCitations() {
        let query = TestQuery()
        Network.shared.apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                if let citation = graphQLResult.data?.quotes {
                    let n = Int.random(in: 0..<citation.count)
                    
                    self.author = citation[n].author
                    self.citation = citation[n].quote
                }
                
            case .failure(let error):
                print("Error loading data \(error)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
