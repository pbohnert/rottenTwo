//
//  MovieDetails.swift
//  RottenTomatoes
//
//  Created by Peter Bohnert on 10/2/14.
//  Copyright (c) 2014 Blue Lotus Labs. All rights reserved.
//

import UIKit

class MovieDetails {
    var title: String = ""
    var year: String = ""
    var thumbnailImageURL: String = ""
    var largeImageURL: String = ""
    var critic_score: String = ""
    var audience_score: String = ""
    var rating: String = ""
    var synopsis: String = ""
    
    init(title: String, year: String, thumbnailImageURL: String, largeImageURL: String, critic_score: String, audience_score: String, rating: String, synopsis: String) {
        self.title = title
        self.year = year
        self.thumbnailImageURL = thumbnailImageURL
        self.largeImageURL = largeImageURL
        self.rating = rating
        self.synopsis = synopsis
        self.critic_score = critic_score
        self.audience_score = audience_score
        //super.init()
    }

   // required init(coder aDecoder: NSCoder) {
   //     super.init(coder: aDecoder)
   // }
  
    class func moviesWithJSON(allResults: NSArray) -> [MovieDetails] {
        
        var movies = [MovieDetails]()
        
        // Store the results in our Movie Details Array
        if allResults.count>0 {
            for movie in allResults  {
                var largeImageURL = ""
                var thumbnailImageURL = ""
                var title = movie["title"] as? String ?? ""
                var year = movie["year"] as? String ?? "1900"
                var critic_score = movie["critic_score"] as? String ?? ""
                var audience_score = movie["audience_score"] as? String ?? ""
                var rating = movie["rating"] as? String ?? ""
                var synopsis = movie["synopsis"] as? String ?? ""
                var posters = movie["posters"] as NSDictionary
                largeImageURL = posters["original"] as String
                thumbnailImageURL = posters["thumbnail"] as String
                if largeImageURL.lowercaseString.rangeOfString("tmb.jpg") != nil {
                    largeImageURL = largeImageURL.stringByReplacingOccurrencesOfString("tmb.jpg", withString: "ori.jpg", options: NSStringCompareOptions.LiteralSearch, range: nil)
                }
        println("year is \(year)")
                var newMovie = MovieDetails(title: title, year: year, thumbnailImageURL: thumbnailImageURL, largeImageURL: largeImageURL, critic_score: critic_score, audience_score: audience_score, rating: rating, synopsis: synopsis)
                movies.append(newMovie)

            } // end for movie

        } // end for .count
        return movies
  }
}
