//
//  ApiService.swift
//  DNA.iOS.Core
//
//  Created by Khachatur Hakobyan on 7/23/19.
//  Copyright © 2019 Xamlab. All rights reserved.
//

import Promises
import Alamofire

internal class ApiService: IApiService {
    private let configurationProvider: IConfigurationProvider
    private let cityRespository: ICityRespository

    private enum Endpoint {
        case weatherOverview
        
        var path: String {
            switch self {
            case .weatherOverview: return "forecast?"
            }
        }
    }
    
    
    init(_ configurationProvider: IConfigurationProvider,
         _ cityRespository: ICityRespository) {
        self.configurationProvider = configurationProvider
        self.cityRespository = cityRespository
    }

    
    func fetchWeatherOverview(_ city: City) -> Promise<WeatherOverview> {
        guard let cityId = self.cityRespository.cities.first(where: { $0.name.lowercased().contains(city.name.lowercased()) })?.id else {
            return Promise<WeatherOverview>(CoreError.notFoundedCityInRepository)
        }
        enum Keys: String { case appid, id }
        
        let parameters: Parameters = [
            Keys.appid.rawValue: self.configurationProvider.apiId,
            Keys.id.rawValue: cityId
        ]
        
        return self.executeRequest(WeatherOverview.self, .weatherOverview, .get, parameters)
    }
    
    
    private func executeRequest<T: Decodable>(_ responseType: T.Type,
                                              _ endPoint: Endpoint,
                                              _ method: HTTPMethod = .get,
                                              _ parameters: Parameters? = nil,
                                              _ encoding: ParameterEncoding = URLEncoding.default,
                                              _ credentials: (username: String, password: String)? = nil) -> Promise<T> {
        
        guard Network.reachability!.isConnectedToNetwork else { return Promise<T>(CoreError.noInternetConnection) }

        let url = "\(self.configurationProvider.apiBaseUrl)/\(self.configurationProvider.apiVersion)/\(endPoint.path)"
        
        let promise = Promise<T> { fulfill, reject in
            Alamofire
                .request(url,
                         method: method,
                         parameters: parameters,
                         encoding: encoding,
                         headers: nil)
                .validate()
                .responseData{ response in
                    switch response.result {
                    case .success:
                        do {
                            debugPrint(try! JSONSerialization.jsonObject(with: response.value!, options: []))
                            
                            let responseT = try JSONDecoder().decode(T.self, from: response.value!)
                            fulfill(responseT)
                        } catch {
                            reject(error)
                        }
                    case .failure(let error):
                        reject(CoreError.httpException(message: error.localizedDescription, code: response.response?.statusCode))
                    }
            }
        }
        return promise
    }
}
