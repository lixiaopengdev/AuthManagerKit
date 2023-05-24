//
//  StaticTableViewNormalCellData.swift
//  CSUtilities
//
//  Created by 于冬冬 on 2023/5/8.
//

import Foundation

public class StaticNormalCellData: StaticTableViewCellData {
        
    
    let title: String
    let subtitle: String?
    let right: StaticTableViewRightStyle
    public let identifier = UUID().uuidString
    
    public var cellClickCallback: ClickCallback?
    
    lazy public var cell: UITableViewCell = {
        let cell = StaticNormalCell(data: self)
        return cell
    }()
    
    public init(title: String, subtitle: String?, right: StaticTableViewRightStyle, callback: ClickCallback? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.right = right
        self.cellClickCallback = callback
    }
    
    public convenience init(title: String, right: StaticTableViewRightStyle, callback: ClickCallback? = nil) {
        self.init(title: title, subtitle: nil, right: right, callback: callback)
    }
    

}
