//
//  ListViewModel.swift
//  TestBrightskies
//
//  Created by Magdy rizk on 28/03/2021.
//  Copyright © 2021 Magdy rizk. All rights reserved.
//

import Foundation

import Foundation
import RxSwift
import RxCocoa



class ListViewModel {
    
    public enum ListError {
        case internetError(String)
        case serverMessage(String)
    }
    
    public let recipes : PublishSubject<[Recipes]> = PublishSubject()
    
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let error : PublishSubject<ListError> = PublishSubject()
    
    private let disposable = DisposeBag()
    
    
    public func requestData(){
        
        self.loading.onNext(true)
        APIManager.requestData(url: "43427003d33f1f6b51cc", method: .get, parameters: nil, completion: { (result) in
            self.loading.onNext(false)
         
            switch result {
            case .success(let returnJson) :
                
                let recipes = returnJson[].arrayValue.compactMap {return Recipes(data: try! $0.rawData())}
                self.recipes.onNext(recipes)
                
            case .failure(let failure) :
                switch failure {
                case .connectionError:
                    self.error.onNext(.internetError("Check your Internet connection."))
                case .authorizationError(let errorJson):
                    self.error.onNext(.serverMessage(errorJson["message"].stringValue))
                default:
                    self.error.onNext(.serverMessage("Unknown Error"))
                }
            }
        })
        
    }
}
