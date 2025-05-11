//
//  ContentView.swift
//  Photo Viewer
//
//  Created by Jörg Klausewitz on 01.05.25.
//

import SwiftUI

struct ContentView: View {
    
    // Dragging
    @GestureState private var dragAmount = CGSize.zero
    @State private var offset = CGSize.zero
    
    @GestureState private var rotateAmount: Angle = .zero
    @State private var finalRotation: Angle = .zero
    
    var body: some View {
        VStack {
            
            Text("dragAmount width: \(dragAmount.width)")
            Text("dragAmount height: \(dragAmount.height)").padding(.bottom)
            Text("offset width: \(offset.width)")
            Text("offset height: \(offset.height)")
            
           
        }
        .background(.red)
        .padding()
        .simultaneousGesture(dragGesture)
    }
    
    
    
    var dragGesture: some Gesture {
            DragGesture()
                .updating($dragAmount) { value, state, _ in
                    state = value.translation
                }
                .onEnded { value in
                    offset = CGSize(
                        width: offset.width + value.translation.width,
                        height: offset.height + value.translation.height
                    )
                }
    }
    
    var rotationGesture: some Gesture {
        RotationGesture()
            .updating($rotateAmount) { value, state, _ in
                state = value
            }
            .onEnded { value in
                finalRotation += value
            }
    }
    
    
    
    
}








#Preview {
    ContentView()
}
