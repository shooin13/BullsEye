import SwiftUI


struct Shapes: View {
  
  @State private var wideShapes = true
  
  var body: some View {
    
    VStack {
      
      if !wideShapes {
        Circle()
          .strokeBorder(Color.blue, lineWidth: 20)
          .frame(width: 200, height: 100)
      }
      
      
      RoundedRectangle(cornerRadius: 20)
        .fill(Color(.blue))
        .frame(width: wideShapes ? 200 : 100, height: 100)
      Capsule()
        .fill(Color(.blue))
        .frame(width: wideShapes ? 200 : 100, height: 100)
      Ellipse()
        .fill(Color(.blue))
        .frame(width: wideShapes ? 200 : 100, height: 100)
      Button(action: {
        withAnimation {
          wideShapes.toggle()
        }
      },
             label: {
        Text("Animate!")
      })

    }
    .background(.green)
  }
}

#Preview {
  Shapes()
}
