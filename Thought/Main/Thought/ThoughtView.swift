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
    
    public weak var delegate: ThouthViewDelegate?
    
    // MARK: SubViews
    public let textLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Sample text"
        view.font = UIFont.systemFont(ofSize: 14.0, weight: UIFont.Weight.semibold)
        view.numberOfLines = 0
        return view
    }()
    
    private let closeButton: UIButton = {
        let view: UIButton = UIButton()
        view.setTitle("Close", for: UIControl.State.normal)
        view.setTitleColor(
            UIColor.black.withAlphaComponent(0.7),
            for: UIControl.State.normal
        )
        return view
    }()
    
    private let closeImageButton: UIButton = {
        let view: UIButton = UIButton()
        view.setImage(#imageLiteral(resourceName: "close-icon"), for: UIControl.State.normal)
        view.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor
        view.layer.borderWidth = 1.0
        view.backgroundColor = UIColor.white
        return view
    }()
    
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.lightGray
        
        self.subviews(forAutoLayout: [
            self.textLabel, self.closeImageButton
        ])
        
        self.textLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.leading.equalToSuperview().offset(20.0)
            make.trailing.equalToSuperview().inset(20.0)
            make.centerY.equalToSuperview()
        }

    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.closeImageButton.layer.cornerRadius = self.closeImageButton.frame.width / 2
    }
}

// MARK: - Public APIs
extension ThoughtView {    
    public func fadeOut(duration: Int) {
        self.animate([
            .fadeOut(duration: TimeInterval(duration))
        ])
    }
    
    public func hide(after: Int) {
        self.animate([
            .hideAfter(duration: TimeInterval(after))            
        ])
    }
    
    public func setMessage(_ text: String, color: UIColor = UIColor.gray) {
        self.textLabel.text = text
        self.textLabel.textColor = color
    }
    
    public func setRadius(radius: CGFloat? = nil) {
        self.layer.cornerRadius = radius ?? self.frame.width / 2
    }
    
    public func withShadow() {        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 4.0
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
    }
    
    public func withClose() {
        self.subview(forAutoLayout: self.closeButton)
        self.closeButton.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(-15.0)
            make.trailing.equalToSuperview().inset(10.0)
        }
        
        self.closeButton.addTarget(
            self,
            action: #selector(ThoughtView.closeButtonTapped),
            for: UIControl.Event.touchUpInside
        )
    }
    
    public func withClose(accesory: UIImage, size: CGFloat) {
        
        self.subview(forAutoLayout: self.closeImageButton)
        
        self.closeImageButton.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.height.equalTo(size)
            make.width.equalTo(size)
            make.top.equalToSuperview().offset(-10.0)
            make.trailing.equalToSuperview().inset(10.0)
        }
        
        self.closeImageButton.setImage(accesory, for: UIControl.State.normal)
        self.closeImageButton.addTarget(
            self,
            action: #selector(ThoughtView.closeButtonTapped),
            for: UIControl.Event.touchUpInside
        )
    }
}

// MARK: - Target Action Methods
extension ThoughtView {
    @objc func closeButtonTapped(_ sender: UIButton) {
        self.isHidden = true
        guard let delegate = self.delegate else { return }
        delegate.thoughtDidClose(view: self)
    }
}

// MARK: - Helper Methods
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
