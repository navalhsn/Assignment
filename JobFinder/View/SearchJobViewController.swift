//
//  ViewController.swift
//  JobFinder
//
//  Created by Naval Hasan on 17/03/22.
//

import UIKit

class SearchjobViewController: BaseViewController {
    // #MARK: Outlets
    @IBOutlet weak var jobsTableView: UITableView!
    @IBOutlet weak var tabBar: UITabBar!
    
    // #MARK: Declarations
    var jobsArray = [JobListQuery.Data.Job]()
    var searchJobViewModel = SearchHomeViewModel()
    
    // #MARK: VCLC
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIElementsWithApi()
        setupTabBar() 
    }
    
    // #MARK: UI Setup
    func setupTabBar() {
        tabBar.selectedItem = tabBar.items?.first
    }
    
    func configureUIElementsWithApi() {
        startLoader()
        searchJobViewModel.callGetJobsApi(handler: { response in
            self.jobsArray = response
            DispatchQueue.main.async {
                self.jobsTableView.reloadData()
                self.stopLoader()
            }
        })
    }

    
}

