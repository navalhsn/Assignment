//
//  SearchHomeViewModel.swift
//  JobFinder
//
//  Created by Naval Hasan on 19/03/22.
//

import Foundation

struct SearchHomeViewModel {
    func callGetJobsApi(handler: @escaping ([JobListQuery.Data.Job]) -> ()) {
        Network.shared.apollo.fetch(query: JobListQuery()) { result in
          switch result {
          case .success(let graphQLResult):
            print("Success! Result: \(graphQLResult)")
              handler(graphQLResult.data!.jobs)
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
}
