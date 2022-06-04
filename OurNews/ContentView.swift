//
//  ContentView.swift
//  OurNews
//
//  Created by Mukul Jangir on 03/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = NewsListViewModel()
    
    var body: some View {
        NavigationView {
            switch viewModel.newsResult {
            case .loading:
                ProgressView()

            case .success(let articles):
                List(articles,id: \.id) { article in
                    NewsView(article: article)
                }
                .navigationTitle("Our News")
                .listStyle(.plain)
            case .idle:
               ProgressView()
            case .failed(_):
                ProgressView()
            }
        }
        .onAppear(perform: viewModel.loadTopHeadlines)
    }
}

struct NewsView: View{
    let article: Article
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: article.url ?? ""))
                .frame(width: 50, height: 50, alignment: Alignment.topLeading)
            VStack(alignment: .leading) {
                Text(article.title!)
                    .foregroundColor(.blue)
                    .font(.headline)
                Text(article.description ?? "")
                    .foregroundColor(.gray)
                    .font(.body)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

