//
//  MainVC.swift
//  Thought
//
//  Created by Novare Account on 04/04/2019.
//  Copyright © 2019 Alvin Joseph Valdez. All rights reserved.
//

import UIKit

public final class MainVC: UIViewController {
    
    // MARK: Delegates Declarations
    
    // MARK: Initializer
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LifeCycle Methods    
    public override func loadView() {
        super.loadView()
        self.view = MainView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Instance Methods
    
    // MARK: Stored Properties
    
    // MARK: Computed Properties
}

// MARK: - Views
extension MainVC {
    private var rootView: MainView { return self.view as! MainView }
}

// MARK: - Target Action Methods
extension MainVC {
    
}

// MARK: - Helper Methods
extension MainVC {

}


// MARK: - SampleDelegate Methods
extension MainVC {
    
}

// MARK: - SampleDataSource Methods
extension MainVC {
    
}


