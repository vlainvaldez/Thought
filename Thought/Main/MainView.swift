//
//  MainView.swift
//  Thought
//
//  Created by Novare Account on 04/04/2019.
//  Copyright © 2019 Alvin Joseph Valdez. All rights reserved.
//

import UIKit
import SnapKit

public class MainView: UIView {
    
    // MARK: Subviews
    public let toolTip: ThoughtView = {
        let view: ThoughtView = ThoughtView()
        return view
    }()
    
    // MARK: Stored Properties
    
    // MARK: Computed Properties
    
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        self.subviews(forAutoLayout: [
            self.toolTip
        ])
        
        self.toolTip.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(60.0)
            make.width.equalTo(300.0)
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.toolTip.fadeOut(duration: 3)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Target Action Methods
extension MainView {
    
}

// MARK: - Helper Methods
extension MainView {
    
}
