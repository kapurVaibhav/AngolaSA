//
//  BackendError.swift
//  
//
//  Created by Vaibhav Kapur on 18/10/2016.
//
//

import Foundation

enum BackendError: Error {
    case network(error: Error) // Capture any underlying Error from the URLSession API
    case dataSerialization(error: Error)
    case jsonSerialization(error: Error)
    case xmlSerialization(error: Error)
    case objectSerialization(reason: String)
}
