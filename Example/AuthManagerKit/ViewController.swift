//
//  ViewController.swift
//  AuthManagerKit
//
//  Created by li on 05/10/2023.
//  Copyright (c) 2023 li. All rights reserved.
//

import UIKit
import AuthManagerKit
import CSBaseView
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
            let button = UIButton(type: .system)
            button.setTitle("跳转到登录页面", for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(button)

            // 布局代码
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
    }

    @objc func buttonAction(sender: UIButton!) {
        let loginVC = UINavigationController(rootViewController: CSLoginViewController())
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

