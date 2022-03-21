//
//  Network.swift
//  JobFinder
//
//  Created by Naval Hasan on 18/03/22.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    private(set) lazy var apollo = ApolloClient(url: URL(string: ApiEndpoints.getJobsApi)!)
}
