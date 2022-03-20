//
//  BaseViewController.swift
//  JobFinder
//
//  Created by Naval Hasan on 17/03/22.
//

import UIKit
import NVActivityIndicatorView
import Kingfisher

class BaseViewController: UIViewController {
    //#MARK: Declarations
    var activityIndicator: NVActivityIndicatorView!
    var bgView: UIView = UIView()
    var setCustomHomeNavigation: UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 35))
        let logoImage = UIImageView.init(frame: view.frame)
        logoImage.image  = UIImage(named: "app_logo_navigation")
        logoImage.contentMode = .scaleAspectFit
        view.addSubview(logoImage);
        logoImage.center.x = view.frame.width/2;
        logoImage.center.y = CGFloat(view.frame.height/2);
        return view
    }
    
    //#MARK: VCLC
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigation(animated)
    }
    
    //#MARK: Navigation controller
    func setupNavigation(_ animated: Bool) {
        guard let navFrame = navigationController?.navigationBar.frame else{
                return
            }
        navigationController?.additionalSafeAreaInsets.top = 30
        let parentView = UIView(frame: CGRect(x: 0, y: -7, width: navFrame.width*3, height: navFrame.height))
        self.navigationItem.titleView = parentView
            
        let label = UILabel(frame: .init(x: 20, y: parentView.frame.minY, width: parentView.frame.width, height: parentView.frame.height))
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 32.0)
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.text = "Explore"
        parentView.addSubview(label)
        
        let menuButton = UIButton()
        menuButton.frame = CGRect(x: self.view.frame.width - 80, y: 0, width: 30, height: 30)
        menuButton.setImage(UIImage(named: "menu_hamburger"), for: .normal)
        menuButton.backgroundColor = UIColor(ColorValues.themeColor)
        menuButton.dropShadow(cornerRadius: 4)
        parentView.addSubview(menuButton)
    }
    
    func setupActivityIndicator() {
        // configure activity indicator using NVActivityIndicatorView
        let xAxis = (self.view.frame.width / 2) - 27.5
        let yAxis = self.view.center.y
        let frame = CGRect(x: xAxis , y: (yAxis - 50), width: 55, height: 55)
        activityIndicator = NVActivityIndicatorView(frame: frame)
        activityIndicator.type = . ballSpinFadeLoader
        activityIndicator.color = UIColor(ColorValues.activityIndicatorColor)
        activityIndicator.padding = 6
        activityIndicator.backgroundColor = UIColor(white: 1, alpha: 0.4)
        activityIndicator.layer.cornerRadius = activityIndicator.frame.height / 2
        
        let screenSize: CGRect = UIScreen.main.bounds
        bgView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        bgView.backgroundColor = .black
        bgView.alpha = 0.4
        self.view.addSubview(bgView)
        
        // self.view = backgroundView
        self.view.addSubview(activityIndicator)
    }
    
    func startLoader() {
        DispatchQueue.main.async {
            self.bgView.isHidden = false
            self.activityIndicator.startAnimating()
        }
    }
    
    func stopLoader() {
        DispatchQueue.main.async {
            self.bgView.isHidden = true
            self.activityIndicator.stopAnimating()
        }
    }
}
