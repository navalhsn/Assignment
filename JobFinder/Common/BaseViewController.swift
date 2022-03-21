//
//  BaseViewController.swift
//  JobFinder
//
//  Created by Naval Hasan on 17/03/22.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {
    //#MARK: Declarations
    var activityIndicator: NVActivityIndicatorView!
    var bgView: UIView = UIView()
    
    //#MARK: VCLC
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
    }
    
    
    //#MARK: Navigation controller
    func setupHomeNavigation() {
        guard let navFrame = navigationController?.navigationBar.frame else{
                return
            }
        navigationController?.additionalSafeAreaInsets.top = 30
        let parentView = UIView(frame: CGRect(x: 0, y: -7, width: navFrame.width*3, height: navFrame.height))
        self.navigationItem.titleView = parentView
            
        let label = UILabel(frame: .init(x: 20, y: parentView.frame.minY, width: parentView.frame.width, height: parentView.frame.height))
        label.font = UIFont(name: FontValues.HelveticaNeueBold, size: 32.0)
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.text = NavigationTitles.jobSearchTitle
        parentView.addSubview(label)
        
        let menuButton = UIButton()
        menuButton.frame = CGRect(x: self.view.frame.width - 80, y: 0, width: 30, height: 30)
        let hamImage = #imageLiteral(resourceName: "menu_hamburger")
        menuButton.setImage(hamImage, for: .normal)
        menuButton.backgroundColor = UIColor(ColorValues.themeColor)
        menuButton.dropShadow(cornerRadius: 4)
        parentView.addSubview(menuButton)
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithTransparentBackground()
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    func setupDetailNavigationBar() {
        navigationItem.hidesBackButton = true
        let backButton = UIButton()
        backButton.frame = CGRect(x:0, y:0, width:40, height:40)
        backButton.backgroundColor = UIColor.white
        backButton.dropShadow(cornerRadius: 20)
        let backImage = #imageLiteral(resourceName: "back_button")
        backButton.setImage(backImage, for: .normal)
        backButton.configuration?.imagePadding = CGFloat(10.0)
        backButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        backButton.addTarget(self, action: #selector(back(sender:)), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
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
        self.bgView.isHidden = true
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
    
    // #MARK: Actions
    @objc func back(sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated:true)
    }
}
