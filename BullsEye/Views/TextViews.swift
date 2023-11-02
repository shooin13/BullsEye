import SwiftUI

struct InstructionText: View {
  var text: String
  var body: some View {
    Text(text.uppercased())
      .bold()
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.footnote)
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
  }
}

struct BigNumberText: View {
  var text: String
  
  var body: some View {
    Text(String (text))
      .fontWeight(.black)
      .font(.largeTitle)
      .kerning(-1.0)
      .foregroundColor(Color("TextColor"))
  }
}

struct SliderLabelText: View {
  var label: String
  var body: some View {
    Text(label)
      .bold()
      .kerning(1.5)
      .foregroundColor(Color("TextColor"))
      .frame(width: 36)
  }
}

struct LabelText: View {
  var label: String
  var body: some View {
    Text(label.uppercased())
      .font(.caption)
      .bold()
      .kerning(1.5)
      .foregroundColor(Color("TextColor"))
  }
}


struct BodyText: View {
  var text: String
  var body: some View {
    Text(text.uppercased())
      .fontWeight(.semibold)
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.caption)
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
      .lineSpacing(12.0)
  }
}

struct ButtonText: View {
  var text: String
  var body: some View {
    Text(text)
      .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
      .padding()
      .background(Color.accentColor)
      .foregroundColor(Color.white)
      .cornerRadius(12.0)
      .bold()
      .font(.body)
  }
}

struct TextViews_Preview: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionText(text: "Инструкции")
      BigNumberText(text: "999")
      SliderLabelText(label: "99")
      LabelText(label: "Очки")
      BodyText(text: "Вы набрали 200 баллов\n🎉🎉🎉")
      ButtonText(text: "Новый раунд")
    }
    .padding()
  }
}
