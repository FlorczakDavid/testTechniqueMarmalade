//
//  Apollo.swift
//  testMarmalade
//
//  Created by david florczak on 25/05/2022.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://demotivation-quotes-api.herokuapp.com/")!)
}
