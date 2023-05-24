//
//  BaseTabBarController.swift
//  ComeSocial
//
//  Created by 于冬冬 on 2023/1/9.
//

import UIKit
import CSUtilities

open class BaseTabBarController: UITabBarController {

    open override func viewDidLoad() {
        super.viewDidLoad()

        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        tabBar.tintColor = .white
        
        let ovalView = UIView()
        tabBar.addSubview(ovalView)
        ovalView.backgroundColor = UIColor(hex: 0x181627)
        ovalView.layer.cornerRadius = 33
        ovalView.clipsToBounds = true
        ovalView.snp.makeConstraints { make in
            make.left.equalTo(6)
            make.right.equalTo(-6)
            make.height.equalTo(66)
            make.top.equalToSuperview()
        }
    }
    
    
    open override var shouldAutorotate: Bool {
        return selectedViewController?.shouldAutorotate ?? false
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return selectedViewController?.supportedInterfaceOrientations ?? .portrait
    }
    
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return selectedViewController?.preferredInterfaceOrientationForPresentation ?? .portrait
    }

}

