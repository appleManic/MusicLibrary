//
//  LibraryAPI.swift
//  MusicLibrary
//
//  Created by Pawan Selokar on 8/10/15.
//  Copyright © 2015 Pawan Selokar. All rights reserved.
//

/*Facade design pattern is used to use the HTTPClient and the persistance Manager class
--------------LibraryAPI--------------
Remote Server           Database        FileSystem      Memory

Define everyhting in those files and lateron call them form LibraryAPI
*/


import Foundation

class LibraryAPI: NSObject {
   
    private let persistanceManager: PersistanceManager
    private let httpClient: HTTPClient
    private let isOnline: Bool // It will define if the server should be updated
    
    override init() {
        persistanceManager = PersistanceManager()
        httpClient = HTTPClient()
        isOnline = false
        
        super.init()
    }
    
    class var SharedInstance: LibraryAPI {
        struct Singleton {
            // Static makes it lazy
            static let instance = LibraryAPI()
            
        }
        return Singleton.instance
    }
    //We are repeating these functions from Persistance Manager but here we are combining persistance manager and http client
    func getAlbum() -> [Album]{
        return persistanceManager.getAlbum()
    }
    
    func addAlbums(album: Album, atIndex index: Int) {
        
        persistanceManager.addAlbums(album, atIndex: index)
        if isOnline {
            httpClient.postRequest("/api.addAlbum", body: album.description)
        }
    }
    
    func deleteAlbums(album: Album, atIndex index: Int) {
        persistanceManager.deleteAlbum(album, atIndex: index)
        if isOnline {
            httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
        }
    }
}