//
//  HomeViewModel.swift
//  Nfact
//
//  Created by 송영모 on 2022/08/24.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    private var repository: RepositoryProvider = RepositoryProvider.shared
    private var cancellables: [AnyCancellable] = []
    
    enum Input {
        case didTap(index: Int)
    }
    
    func apply(from input: Input) {
        switch input {
        case .didTap(let index):
            didTapIndexSubject.send(index)
        }
    }
    
    private let didTapIndexSubject = PassthroughSubject<Int, Never>()

    struct Output {
        var myNft: NftData?
        var isPresentHomeDetailView: Bool = false
    }
    
    init() {
        print("[D] hello")
        bindOutputs()
        
        repository.nftRepository.getNftData(request: .init(addr: "0xCB76200a088672E18E57A4381264aa82eAE14875", symbol: .eth)).sink { (completion) in
            switch completion {
            case .failure(let error):
                print("oops got an error \(error.localizedDescription)")
            case .finished:
                print("nothing much to do here")
            }
        } receiveValue: { (response) in
            print("got my response here \(response)")
        }
        .store(in: &cancellables)
//        .store(in: &subscriptions)
    }
    
    private func bindOutputs() {
//        let isError = didTapIndexSubject
//            .map { $0 == 4 }// map을 사용하여 기존 Int형을 Bool형으로 변환해줍니다..
//                .share() // share을 사용해서 해당 Publisher를 공유해줍니다.
//        
//        let showError = isError.assign(to: \.output.isErrorShown, on: self) //isError Pulisher를 output.isErrorShown에 assign 해줍니다.
//
//        let showSucessedMessage = isError.filter { !$0 } // isError의 이벤트 값이 true일 경우 무시하기 위해서 filter를 걸어줍니다.
//            .zip(didTapIndexSubject.eraseToAnyPublisher()) // didTapIndexSubject를 Publisher로 변환 한뒤 zip을 사용하여 isError와 합쳐줍니다.
//            .map { "Sucessed \($1)" } // map을 사용하여 기존 값을 String형의 값으로 변환해줍니다.
//            .assign(to: \.output.labelText, on: self) // 변환 된 값을 output.labelText에 assign 해줍니다.

        // 해당 AnyCancellable 형의 프로퍼티들을 cancellables에 추가해줍니다.
//        cancellables += [
//            showSucessedMessage,
//            showError
//        ]
    }
}
