//
//  StaticNormalCell.swift
//  CSMeModule
//
//  Created by 于冬冬 on 2023/5/8.
//

import UIKit
import SnapKit

class StaticNormalCell: UITableViewCell {

    weak var data: StaticNormalCellData?
    
    lazy var rightIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.bundleImage(named: "arrow_right")
        return imageView
    }()
    
    lazy var rightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .cs_pureWhite
        label.font = .boldBody
        label.text = "Ola Nyman"
        return label
    }()
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .cs_softWhite
        label.font = .regularBody
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .cs_lightGrey
        label.font = .regularFootnote
        label.numberOfLines = 0
        return label
    }()
    
    lazy var switchBtn: CSSwitch = CSSwitch()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .cs_cardColorA_40
        view.layerCornerRadius = 14
        return view
    }()

    init(data: StaticNormalCellData) {
        super.init(style: .default, reuseIdentifier: data.identifier)
        self.data = data
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 5, left: 14, bottom: 5, right: 14))
        }
        
        titleLabel.text = data.title
        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.top.equalTo(15)
            make.bottom.equalTo(-15)
        }
        
        switch data.right {
        case .text(let rightString):
            rightLabel.text = rightString
            containerView.addSubview(rightLabel)
            rightLabel.snp.makeConstraints { make in
                make.right.equalTo(-16)
                make.centerY.equalToSuperview()
            }
        case .detail:
            containerView.addSubview(rightIcon)
            rightIcon.snp.makeConstraints { make in
                make.right.equalTo(-16)
                make.centerY.equalToSuperview()
                make.size.equalTo(16)
            }
        case .switchBtn(let isOn, let action):
            containerView.addSubview(switchBtn)
            switchBtn.snp.makeConstraints { make in
                make.right.equalTo(-16)
                make.centerY.equalToSuperview()
            }
            switchBtn.isOn = isOn
            switchBtn.addTarget(self, action: #selector(switchValueChange), for: .valueChanged)
        }
        

        
        if let subTitle = data.subtitle,
           !subTitle.isEmpty {
            containerView.addSubview(subTitleLabel)
            subTitleLabel.text = subTitle
            titleLabel.snp.remakeConstraints { make in
                make.left.equalTo(16)
                make.top.equalTo(12)
            }
            subTitleLabel.snp.makeConstraints { make in
                make.left.equalTo(16)
                make.right.equalTo(-80)
                make.top.equalTo(titleLabel.snp.bottom).offset(4)
                make.bottom.equalTo(-12)
            }
        }
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func switchValueChange() {
        if case .switchBtn(let _, let action) = self.data?.right {
            action?(switchBtn.isOn)
        }
    }
    
}
