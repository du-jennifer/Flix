//
//  SuperHeroDetailsViewController.swift
//  Flix
//
//  Created by Jennifer Du on 7/8/21.
//

import UIKit

class SuperHeroDetailsViewController: UIViewController {

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseURL + posterPath)
        
        posterView.af_setImage(withURL: posterUrl!)
        
        let backdropPath = (movie["backdrop_path"] as? String) ?? "0"
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        
        backdropView.af_setImage(withURL: backdropUrl!)
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
        print("Loading up trailer screen")
        
        // Pass the selected movie to the details view controller
        let trailerViewController = segue.destination as! MovieTrailerViewController
        trailerViewController.movieSelected = movie

 
    }
    

}
