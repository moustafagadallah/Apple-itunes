//
//  APIservices.swift
//  Apple itunes
//
//  Created by Al Wefaq on 9/21/19.
//  Copyright © 2019 Al Wefaq. All rights reserved.
//

import Foundation
import Alamofire

struct SearchResult: Codable {
    let feed: Feed
}
class APIService {
    
    let url = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
    static let shared = APIService()  //singleton [shared instance]

    func getdataFromAPi(completionHandler:@escaping ([Result])->() ) {
       
        Alamofire.request(url, method: .get
        ,parameters:nil,
        encoding: URLEncoding.default,
        headers: nil)
        .response { (dataResponse) in
                if let err = dataResponse.error {
                    print(err)
                    return
                }
                
                guard let data =  dataResponse.data else {return}
                do {
                    let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                    print(searchResult.feed.results)
                    searchResult.feed.results.forEach({ (result) in
                    print(result.artistName,result.name)
                    })
                    completionHandler(searchResult.feed.results)

                }catch let decodeErr{
                   
                   print("Failed to parse", decodeErr)
                
            }
        }
    }
    
}
