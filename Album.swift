//
//  Album.swift
//  MusicLibrary
//
//  Created by Pawan Selokar on 8/10/15.
//  Copyright © 2015 Pawan Selokar. All rights reserved.
//

import Foundation

// Create modal with title, artist name, genre, coverurl, year, description

class Album: NSObject {
    
    var title: String!
    var artist: String!
    var genre: String!
    var coverUrl: String!
    var year: String!
    
    init(title: String, artist: String, genre: String, coverUrl: String, year: String) {
        super.init()
        self.title = title
        self.artist = artist
        self.genre = genre
        self.coverUrl = coverUrl
        self.year = year
    }
    
  override  var description: String {
        return "title: \(title)" +
            "artist: \(artist)" +
            "genre: \(genre)" +
            "coverUrl: \(coverUrl)" +
            "year: \(year)"
    }
}

extension Album {
    func ae_tableRepresetation() -> (titles:[String] , values:[String]) {
        return (["Artists", "Album" ,"Gener", "Year"] , [artist, title, genre, year])
    }
}
