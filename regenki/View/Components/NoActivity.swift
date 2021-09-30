//
//  NoActivity.swift
//  regenki
//
//  Created by Chondro Satrio Wibowo on 23/09/21.
//

import SwiftUI

struct NoActivity: View {
    var body: some View {
        VStack{
            Image("NoActivity")
            Text("No Activity \nGanbatte yooo").fontWeight(.semibold).multilineTextAlignment(.center)
        }
    }
}

struct NoActivity_Previews: PreviewProvider {
    static var previews: some View {
        NoActivity()
    }
}
