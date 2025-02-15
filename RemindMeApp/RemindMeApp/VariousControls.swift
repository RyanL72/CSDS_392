//
//  VariousControls.swift
//  RemindMeApp
//
//  Created by Ryan Lin on 2/14/25.
//

import SwiftUI

struct VariousControls: View{
    @State var quantity = 0
    @State var priority:Double = 0
    @State var requireSignature:Bool = false
    var body: some View{
        VStack{
            Stepper("Quantity \(quantity)", value: $quantity, in: 0...10)
            
            Slider(value: $priority, in: 0...100).tint(Color.green)
            Text("\(Int(priority))")
            
            Toggle("Require Signature", isOn: $requireSignature)
        }
    }
}
                
#Preview{
    VariousControls()
}

