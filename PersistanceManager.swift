//
//  PersistanceManager.swift
//  MusicLibrary
//
//  Created by Pawan Selokar on 8/10/15.
//  Copyright © 2015 Pawan Selokar. All rights reserved.
//

import Foundation

//We are creating the hard coded data init
class PersistanceManager: NSObject {
    
    var albums = [Album]()
    
    override init() {
        let album1 = Album(title: "Saadho re",
            artist: "Agnee",
            genre: "Soft Metal",
            coverUrl: "http://www.coversproject.com/static/thumbs/album/album_david%20bowie_best%20of%20bowie.png",
            year: "2012")
        
        let album2 = Album(title: "It's My Life",
            artist: "No Doubt",
            genre: "Pop",
            coverUrl: "http://www.coversproject.com/static/thumbs/album/album_no%20doubt_its%20my%20life%20%20bathwater.png",
            year: "2003")
        
        let album3 = Album(title: "Nothing Like The Sun",
            artist: "Sting",
            genre: "Pop",
            coverUrl: "http://www.coversproject.com/static/thumbs/album/album_sting_nothing%20like%20the%20sun.png",
            year: "1999")
        
        let album4 = Album(title: "Staring at the Sun",
            artist: "U2",
            genre: "Pop",
            coverUrl: "http://www.coversproject.com/static/thumbs/album/album_u2_staring%20at%20the%20sun.png",
            year: "2000")
        
        let album5 = Album(title: "American Pie",
            artist: "Madonna",
            genre: "Pop",
            coverUrl: "http://www.coversproject.com/static/thumbs/album/album_madonna_american%20pie.png",
            year: "2000")
        
        albums = [album1, album2, album3, album4, album5]
    }
    
    func getAlbum() -> [Album] {
        return albums
    }
    
    func addAlbums(album: Album, atIndex index: Int) {
    
        if albums.count >= index {
            albums.insert(album, atIndex: index)
        } else {
            albums.append(album)
        }
    }
    
    func deleteAlbum(album: Album, atIndex index: Int){
        albums.removeAtIndex(index)
    }
}
