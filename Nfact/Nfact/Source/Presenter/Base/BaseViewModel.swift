//
//  BaseViewModel.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/24.
//

import Combine

protocol BaseViewModel: ObservableObject {
    associatedtype Input
    associatedtype Output

    var input: Input { get }
    var output: Output { get }
}
