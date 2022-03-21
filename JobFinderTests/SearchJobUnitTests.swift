//
//  SearchJobUnitTests.swift
//  JobFinderTests
//
//  Created by Naval Hasan on 20/03/22.
//

import XCTest
@testable import JobFinder

class SearchJobUnitTests: XCTestCase {
    var sut: SearchHomeViewModel?
    var jobsArray = [JobListQuery.Data.Job]()
    
    func test_get_jobs_api_shouldReturn_valid_output() throws {
        sut?.callGetJobsApi(handler: { response in
            XCTAssertNotNil(response)
            self.jobsArray = response
            XCTAssertNotNil(self.jobsArray)
            for i in self.jobsArray {
                XCTAssertNotNil(i.title)
                XCTAssertNotNil(i.company)
            }
        })
    }

}
