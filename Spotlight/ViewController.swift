//
//  ViewController.swift
//  Spotlight
//
//  Created by Thiago Diniz on 06/08/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var movies: [Movie] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movies = [Movie(id: 1, title: "The Shawshank Redemption"),
                  Movie(id: 2, title: "The Godfather"),
                  Movie(id: 3, title: "The Godfather: Part II"),
                  Movie(id: 4, title: "The Dark Knight"),
                  Movie(id: 5, title: "Schindler's List")]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow, segue.identifier == "detail" {
            let movie = movies[indexPath.row]
            controller.movie = movie
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = movies[indexPath.row].title
        return cell
    }
}
