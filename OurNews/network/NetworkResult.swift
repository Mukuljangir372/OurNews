//
//  NetworkResult.swift
//  OurNews
//
//  Created by Mukul Jangir on 03/06/22.
//

import Foundation

enum NetworkError: Error{
    case invalidUrl
    case cannotProcessData
    case noDataAvailable
    case serverError
}
enum NetworkResource<T> {
    case idle
    case loading
    case success(T)
    case failed(NetworkError)
}
