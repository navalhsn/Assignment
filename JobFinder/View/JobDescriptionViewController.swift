//
//  JobDescriptionViewController.swift
//  JobFinder
//
//  Created by Naval Hasan on 19/03/22.
//

import UIKit
import Kingfisher

class JobDescriptionViewController: BaseViewController {
    // #MARK: Outlets
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var companyDescriptionLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var positionDetailLabel: UILabel!
    @IBOutlet weak var qualificationLabel: UILabel!
    @IBOutlet weak var qualificationDetailLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    
    
    // #MARK: Declarations
    var jobsData: JobListQuery.Data.Job?
    
    // #MARK: VCLC
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailNavigationBar()
        configureUIElements()
        setupValuesForUIElements()
    }
    
    // #MARK: UI Setup

    func configureUIElements() {
        logoImageView.layer.cornerRadius = logoImageView.frame.width / 2
        logoImageView.layer.borderWidth = 1.0
        logoImageView.layer.borderColor = UIColor.lightGray.cgColor
        
        qualificationLabel.setMargins(20)
        companyDescriptionLabel.setMargins(20)
        positionLabel.setMargins(20)
        positionDetailLabel.setMargins(20)
        aboutLabel.setMargins(20)
        qualificationDetailLabel.setMargins(20)
    }
    
    func setupValuesForUIElements() {
        let logoImage = #imageLiteral(resourceName: "job_finder_logo")
        if let imageUrl = URL(string: jobsData?.company?.logoUrl ?? "") {
            self.logoImageView.kf.setImage(with: imageUrl, placeholder: logoImage, options: nil, completionHandler: nil)
        } else {
            self.logoImageView.image = logoImage
        }
        
        companyNameLabel.text = jobsData?.company?.name
        locationLabel.text = jobsData?.locationNames
        companyDescriptionLabel.text = jobsData?.description
        positionDetailLabel.text = jobsData?.title
    }
    
}
