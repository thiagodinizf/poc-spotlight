//
//  DetailViewController.swift
//  Spotlight
//
//  Created by Thiago Diniz on 06/08/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!

    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = self.movie {
            titleLabel.text = movie.title
            addToSpotlight(movie: movie)
        }
    }
    
    func addToSpotlight(movie: Movie) {
        let attributSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
        attributSet.title = movie.title
        attributSet.contentDescription = "\(movie.id)"
        
        let searchItem = CSSearchableItem(uniqueIdentifier: "\(movie.id)",
            domainIdentifier: "br.com.thiagodiniz.Spotlight",
            attributeSet: attributSet)
        
        CSSearchableIndex.default().indexSearchableItems([searchItem]) { (error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
