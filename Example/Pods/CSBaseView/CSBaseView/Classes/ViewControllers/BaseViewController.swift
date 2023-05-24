//
//  BaseViewController.swift
//  ComeSocial
//
//  Created by 于冬冬 on 2023/1/9.
//


import UIKit
import SnapKit
import CSUtilities

public enum BackgroundType {
    case none
    case light
    case dark
}

open class BaseViewController: UIViewController {

    open var backgroundType: BackgroundType {
        return .light
    }
    
    private lazy var backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage.bundleImage(named: "background")
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(Device.UI.screenWidth / 390 * 230 )
        }
        return backgroundImageView
    }()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        
        switch backgroundType {
        case .none:
            break
        case .light:
            configureWithLightBackground()
        case .dark:
            configureWithDarkBackground()
        }
  
    }
    
    public func showVoiceBar() {
        let voiceBar = UIImageView(image: UIImage.bundleImage(named: "voice_bar"))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: voiceBar)
    }
    
    private func configureWithLightBackground() {
        view.backgroundColor = UIColor(hex: 0x10101e)
        backgroundImageView.image = UIImage.bundleImage(named: "background_light")
    }

    private func configureWithDarkBackground() {
        view.backgroundColor = UIColor(hex: 0x181627)
        backgroundImageView.image = UIImage.bundleImage(named: "background_dark")
    }

    
    open override var shouldAutorotate: Bool {
        return false
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

