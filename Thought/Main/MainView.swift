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
        view.setRadius(radius: 9)
        view.backgroundColor = UIColor.white
        view.withClose(accesory: #imageLiteral(resourceName: "close-icon"), size: 20.0)
        return view
    }()
    
    // MARK: Stored Properties
    private var toolTipHeight: Constraint!
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
            self.toolTipHeight = make.height.equalTo(60.0).constraint
            make.width.equalTo(300.0)
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.toolTip.withShadow()
        
        let message: String = "Au Revoir, Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne  Chienne "
        
        self.toolTip.setMessage(message, color: UIColor.black)
        
        let height: CGFloat = message.height(
            withConstrainedWidth: 300.0,
            font: UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.semibold)
        )
        
        self.toolTipHeight.update(offset: height + 20)
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
