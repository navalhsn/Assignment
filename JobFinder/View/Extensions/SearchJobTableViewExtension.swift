//
//  SearchJobTableViewExtension.swift
//  JobFinder
//
//  Created by Naval Hasan on 19/03/22.
//

import Foundation
import UIKit
import Kingfisher

extension SearchjobViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.jobsTableCellIdentifier) as! JobsTableViewCell
        let dataAtIndex = jobsArray[indexPath.row]
        cell.bgView.dropShadow(cornerRadius: 8)
        cell.jobTitleLabel.text = dataAtIndex.title
        cell.companyNameLabel.text = dataAtIndex.company?.name
        cell.locationLabel.text = dataAtIndex.locationNames
        cell.logoImageView.layer.cornerRadius = cell.logoImageView.frame.width / 2
        if let imageUrl = URL(string: dataAtIndex.company?.logoUrl ?? "") {
            cell.logoImageView.kf.setImage(with: imageUrl, placeholder: UIImage(named: "job_finder_logo"), options: nil, completionHandler: nil)
        } else {
            cell.logoImageView.setImageTintColor(.lightGray)
            cell.logoImageView.image = UIImage(named: "job_finder_logo")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataAtIndex = jobsArray[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: ViewControllerIdentifiers.jobsDescriptionIdentifier) as! JobDescriptionViewController
        vc.jobsData = dataAtIndex
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
