//
//  MovieTrailerViewController.swift
//  Flix
//
//  Created by Jennifer Du on 7/8/21.
//

import UIKit

class MovieTrailerViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var trailerView: UIWebView!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movieSelected: [String:Any]!
    var movieVideos: [[String:Any]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let trailerText = " Trailer"
        let title = movieSelected["title"] as? String
        titleLabel.text = title! + trailerText
       //titleLabel.sizeToFit()
        
        synopsisLabel.text = movieSelected["overview"] as? String
        synopsisLabel.sizeToFit()

        let movieID:Int = movieSelected["id"] as! Int
        var movieIDString = String(movieID)
        print(movieID)
      /*  let movieResults = movieSelected["results"] as! [String : Any]
        let movieKey = movieResults["key"] as! String
        */
        //let videos = "https://api.themoviedb.org/3/movie/" + movieID + "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US"
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/" + movieIDString + "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

            self.movieVideos = dataDictionary["results"] as! [[String:Any]]
            self.loadMovie()
        
           }
        }
        task.resume()
        
 
     /*   if (movieVideos[0] != nil) {
        
        let movieTrailer = movieVideos[0]
        
        let movieKey = movieTrailer["key"] as! String
        
        let trailerUrl = URL(string: "https://www.youtube.com/watch?v=" + movieKey)
        
        
        let requestObj = URLRequest(url: trailerUrl!)
        trailerView.loadRequest(requestObj)
        } */
        
    }
    
    func loadMovie(){
        if (movieVideos.count != 0) {
           
           // var number: Int = 0
            var movieTrailer = movieVideos[0]
            for number in 0 ..< (movieVideos.count) {
                var movieType = movieVideos[number]
                if (movieType["type"] as! String == "Trailer"){
                    movieTrailer = movieVideos[number]
                    break
                }
            }
            //let movieTrailer = movieVideos[0]
           
            let movieKey = movieTrailer["key"] as! String
           
            let trailerUrl = URL(string: "https://www.youtube.com/watch?v=" + movieKey)
           
            let requestObj = URLRequest(url: trailerUrl!)
            self.trailerView.loadRequest(requestObj)

        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
