//
//  NewsListViewModel.swift
//  OurNews
//
//  Created by Mukul Jangir on 04/06/22.
//

import Foundation

class NewsListViewModel: ObservableObject {
    
    private var newsService: NewsService?
    
    @Published var newsResult : NetworkResource<[Article]>

    init() {
        newsService = NewsService()
        newsResult = .idle
    }
    
    func loadTopHeadlines() {
        newsService?.getNews(completion: { result in
            DispatchQueue.main.async {
                self.newsResult = result
            }
        })
    }
}
