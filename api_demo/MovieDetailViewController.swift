//
//  MovieDetailViewController.swift
//  api_demo
//
//  Created by John on 4/13/19.
//  Copyright © 2019 JAMorales. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movieData: Movie?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dirLabel: UILabel!
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

}

// MARK: - UI Settings
extension MovieDetailViewController {
    func setUI() {
        guard let movieData = movieData else { return }
        
        titleLabel.text = movieData.title
        dirLabel.text = movieData.director
    }
}
