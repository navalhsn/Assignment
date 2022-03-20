//
//  JobDescriptionViewController.swift
//  JobFinder
//
//  Created by Naval Hasan on 19/03/22.
//

import UIKit
import Kingfisher

class JobDescriptionViewController: UIViewController {
    // #MARK: Outlets
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var companyDescriptionLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var qualificationLabel: UILabel!
    
    // #MARK: Declarations
    var jobsData: JobListQuery.Data.Job?
    
    // #MARK: VCLC
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        configureUIElements()
        setupValuesForUIElements()
    }
    
    // #MARK: UI Setup
    func setupNavigationBar() {
        navigationItem.hidesBackButton = true
        let backButton = UIButton()
        backButton.frame = CGRect(x:0, y:0, width:40, height:40)
        backButton.backgroundColor = UIColor.white
        backButton.dropShadow(cornerRadius: 20)
        backButton.setImage(#imageLiteral(resourceName: "back_button"), for: .normal)
        backButton.configuration?.imagePadding = CGFloat(10.0)
        backButton.addTarget(self, action: #selector(back(sender:)), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
    }

    func configureUIElements() {
        logoImageView.layer.cornerRadius = logoImageView.frame.width / 2
        logoImageView.layer.borderWidth = 1.0
        logoImageView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func setupValuesForUIElements() {
        if let imageUrl = URL(string: jobsData?.company?.logoUrl ?? "") {
            self.logoImageView.kf.setImage(with: imageUrl, placeholder: UIImage(named: "job_finder_logo"), options: nil, completionHandler: nil)
        } else {
            self.logoImageView.image = UIImage(named: "job_finder_logo")
        }
        
        companyNameLabel.text = jobsData?.company?.name
        locationLabel.text = jobsData?.locationNames
        companyDescriptionLabel.text = jobsData?.description
        positionLabel.text = jobsData?.title
    }
    
    // #MARK: Actions
    @objc func back(sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated:true)
    }
}
