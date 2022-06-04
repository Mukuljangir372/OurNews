//
//  NewsService.swift
//  OurNews
//
//  Created by Mukul Jangir on 03/06/22.
//

import Foundation

/**
 * Closures -
 * Closures are the self contained blocks of code execution.
 * Closures concept are similar to kotlin lamdabas.
 *
 * @escaping - If you want to trigger closure once with function, then we use it.
 * In technical terms, we use @escaping for perserving closure in memeory.
 *
 * URLSession -
 * This class is used for making communication between your app and service.
 * ex: sending or receiving data, uploading files, downloading files etc.
 *
 * You can do three tasks with it :
 * 1. dataTask - sending or receiving data like simple api calls
 * 2. downloadTask - for downloading files
 * 3. uploadTask - for uploding files
 *
 *
 */
class NewsService {
    
    let session = URLSession.shared
    let topHeadlinesUrl: String = "https://newsapi.org/v2/top-headlines?country=us&apiKey=YOUR_API_KEY"
    
    func getNews(completion: @escaping (NetworkResource<[Article]>) -> ()) {
        guard let url = URL(string: topHeadlinesUrl) else {
            completion(.failed(.invalidUrl))
            return
        }
        
        let dataTask = session.dataTask(with: url){ data,_ ,_ in
            guard let jsonData = data else {
                completion(.failed(.noDataAvailable))
                return
            }
            
            let decorder = JSONDecoder()
            
            let response = try? decorder.decode(NewsResponse.self, from: jsonData)
    
            if let res = response {
                DispatchQueue.main.sync {
                    completion(.success(res.articles))
                }
            }else{
                completion(.failed(.cannotProcessData))
            }
        }
        dataTask.resume()
    }
}
