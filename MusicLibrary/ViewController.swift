//
//  ViewController.swift
//  MusicLibrary
//
//  Created by Pawan Selokar on 8/10/15.
//  Copyright © 2015 Pawan Selokar. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    private var allAlbums  = [Album]()
    private var currentAlbumData: (titles:[String] , values:[String])?
    private var currentAlbumIndex = 0

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableview.delegate = self
        self.tableview.dataSource = self
        allAlbums = LibraryAPI.SharedInstance.getAlbum()
        self.showAlbumdata(currentAlbumIndex)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    func showAlbumdata(index: Int) {
    
        if index < allAlbums.count && index > -1 {
            let album = allAlbums[index]
            currentAlbumData = album.ae_tableRepresetation()
        }else {
            currentAlbumData = nil
        }
        
        if let albumData  = currentAlbumData {
            let title = albumData.titles
            //  print("the title is \(title) and \(title[1])")
        }
    }
}

extension ViewController: UITableViewDelegate {

}

extension ViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return  1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let albumData  = currentAlbumData {
            return albumData.titles.count
        }else{
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        if let albumData = currentAlbumData {
            print("the ttle: \(albumData.titles[indexPath.row]) value : \(albumData.values[indexPath.row])")
            // cell.textLabel!.text = albumData.titles[indexPath.row]
            cell.detailTextLabel!.text = "Hellps wprl"//albumData.values[indexPath.row]
        }
        return cell
    }

}
