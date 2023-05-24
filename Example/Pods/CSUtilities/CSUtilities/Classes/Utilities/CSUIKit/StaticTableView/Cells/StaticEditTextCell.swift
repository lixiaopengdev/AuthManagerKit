//
//  StaticEditTextCell.swift
//  CSUtilities
//
//  Created by 于冬冬 on 2023/5/9.
//

import UIKit

class StaticEditTextCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .cs_softWhite
        label.font = .regularBody
        return label
    }()
    
    let textView: TextView = {
        let textV = TextView()
        textV.textColor = .cs_pureWhite
        textV.font = .regularSubheadline
        textV.placeholder = "Bio is empty."
        textV.backgroundColor = .cs_cardColorA_40
        textV.layerCornerRadius = 10
        return textV
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .cs_cardColorA_40
        view.layerCornerRadius = 14
        return view
    }()

    init(data: StaticEditTextCellData) {
        super.init(style: .default, reuseIdentifier: data.identifier)
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
        }
        
        textView.text = data.content
        containerView.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.bottom.equalTo(-15)
            make.height.equalTo(120)
        }
        
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
