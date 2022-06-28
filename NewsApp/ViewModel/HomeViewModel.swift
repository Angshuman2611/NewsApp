//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Angshuman Das on 07/04/1401 AP.
//

import Foundation
import Alamofire

class HomeViewModel {
    
    var newsData: Bindable<[Article]?> = Bindable(nil)
    var error: Bindable<String> = Bindable("")
    
    func fetchNews() {
        let url = Constants.Service.baseURL + Constants.EndPoints.headlines
        let param: Parameters = [
            "sources": "techcrunch",
            "apiKey": Constants.apiKey
        ]
        AlamoWebServices.shared.getApiWithQueryParams(url: URL(string: url)!, params: param, type: NewsModel.self) { response in
            guard let response = response as? NewsModel else {
                return
            }
            self.newsData.value = response.articles
        } onFailure: { error in
            self.error.value = "\(error)"
        }

    }
}
