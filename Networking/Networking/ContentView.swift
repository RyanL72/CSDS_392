//
//  ContentView.swift
//  Networking
//
//  Created by Ryan Lin on 2/6/25.
//
// https://caslab.case.edu/392/test.php/uuid

import SwiftUI



struct UUIDResponse : Codable {
    var host:String
    var uuid:String
    var timestamp:Int
}




struct ContentView: View {
    
    func getUUID(){
        //Make Session with Operating System
        let session = URLSession(configuration: .default)
        
        //Create URL Object
        if let url = URL(string:
            "https://caslab.case.edu/392/test.php/uuid"){
            let request = URLRequest(url: url)
            
            session.dataTask(with: request){
                data, response, error in
                if let data = data{
                    let decoder = JSONDecoder()
                    do{
                        let uuidresponse = try decoder.decode(UUIDResponse.self, from:data)
                        uuid = uuidresponse.uuid
                        print("UUID: \(uuidresponse.uuid)")
                    } catch{
                        print("Error decoding: \(error)")
                    }
                }
            }.resume()
        }
    }
    
    @State var uuid:String=""
    var body: some View {
        VStack {
            Text(uuid)
            Button("Get UUID for Free!"){
                getUUID()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
