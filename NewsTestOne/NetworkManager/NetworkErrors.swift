//
//  NetworkErrors.swift
//  NewsTestOne
//
//  Created by Максим Кудрявцев on 18.03.2025.
//

import Foundation

enum NetworkErrors: String, Error {
    case NoInterner = "NoInternet"
    case InvalidRequest = "Invalid Request"
    //case NoData = "No Data"
    case DecodingFailed = "Decoding Failed"
}
