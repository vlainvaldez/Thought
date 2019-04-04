//
//  ThoughtView.swift
//  Thought
//
//  Created by Novare Account on 04/04/2019.
//  Copyright © 2019 Alvin Joseph Valdez. All rights reserved.
//

import UIKit
import SnapKit

public final class ThoughtView: UIView {
    
    // MARK: SubViews
    public let textLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Sample text"
        view.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.semibold)
        return view
    }()
    
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.lightGray
        self.subviews(forAutoLayout: [
            self.textLabel
        ])
        
        self.textLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Public APIs
extension ThoughtView {    
    public func fadeOut(duration: Int) {
        self.animate([
            .fadeOut(duration: TimeInterval(duration))
        ])
    }
}

extension ThoughtView {
    private func animate(_ animations: [ThoughtAnimation]) {
        // Exit condition: once all animations have been performed, we can return
        guard !animations.isEmpty else {
            return
        }
        
        // Remove the first animation from the queue
        var animations = animations
        let animation = animations.removeFirst()
        
        // Perform the animation by calling its closure
        UIView.animate(withDuration: animation.duration, animations: {
            animation.closure(self)
        }, completion: { _ in
            // Recursively call the method, to perform each animation in sequence
            self.animate(animations)
        })
    }
}
