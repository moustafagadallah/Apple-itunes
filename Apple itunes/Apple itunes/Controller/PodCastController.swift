//
//  PodCastController..swift
//  Apple itunes
//
//  Created by Al Wefaq on 9/21/19.
//  Copyright © 2019 Al Wefaq. All rights reserved.
//

import UIKit
import Alamofire
struct Welcome: Codable {
    let feed: Feed
}

// MARK: - Feed
struct Feed: Codable {
    let title: String
    let id: String
    let author: Author
    let links: [Link]
    let copyright, country: String
    let icon: String
    let updated: String
    let results: [Result]
}

// MARK: - Author
struct Author: Codable {
    let name: String
    let uri: String
}

// MARK: - Link
struct Link: Codable {
    let linkSelf: String?
    let alternate: String?
    
    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
        case alternate
    }
}

// MARK: - Result
struct Result: Codable {
    let artistName, id, releaseDate, name: String
    let kind: Kind
    let copyright, artistID: String
    let artistURL: String
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
    let contentAdvisoryRating: String?
    
    enum CodingKeys: String, CodingKey {
        case artistName, id, releaseDate, name, kind, copyright
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100, genres, url, contentAdvisoryRating
    }
}

// MARK: - Genre
struct Genre: Codable {
    let genreID, name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

enum Kind: String, Codable {
    case album = "album"
}

class PodCastsController : UITableViewController {
    
    var podCasts = [Result]()
    let cellId = "cellId"
    let url = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
   
    override func viewDidLoad() {
         super.viewDidLoad()
         setTitletTOnavigationController()
        setupTableView()
        getdataFromAPi()
   
    }
    
    func getdataFromAPi()  {
        Alamofire.request(url).responseData { (dataREsponse) in
            if let err = dataREsponse.error {
                print(err)
                return
            }
            guard let data =  dataREsponse.data else {return}
            let dummyString = String(data: data , encoding: .utf8)
           // print(dummyString ?? "")
            do {
               let welcome = try JSONDecoder().decode(Welcome.self, from: data)
            print(welcome.feed.results)
                welcome.feed.results.forEach({ (result) in
                    print(result.artistName,result.name)
                })
                self.podCasts = welcome.feed.results
                self.tableView.reloadData()
            }catch let decodeErr{
                print("Failde to parse", decodeErr)
            }
           
        }
    }
   
    
    //MARK:- UITABLE VIEW WORK
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return podCasts.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let podCast = podCasts[indexPath.row]
        cell.textLabel?.text = "\(podCast.name)\n\n\(podCast.artistName)"
        cell.textLabel?.numberOfLines = 0
        //cell.imageView?.image = #imageLiteral(resourceName: "Simulator Screen Shot - iPhone Xʀ - 2019-09-19 at 14.12.11")
        cell.backgroundColor = .blue
        return cell
    }
    
    
  
    //MARK:- NAVIGATION BAR WORK
    fileprivate  func setTitletTOnavigationController(){
        self.view.backgroundColor = .red
        let longTitleLabel = UILabel()
        longTitleLabel.text = "Coming Soon"
        longTitleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        longTitleLabel.sizeToFit()
        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
    }
    

}

    
    

    
