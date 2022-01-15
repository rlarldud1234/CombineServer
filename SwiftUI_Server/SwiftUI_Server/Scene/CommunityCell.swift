import SwiftUI

struct CommunityCell: View {
    @State var name: String = "김기영 :"
    @State var title: String = "안녕하세요"
    var body: some View {
        HStack {
            Text(name)
            Text(title)
        }.padding()
    }
}

struct CommunityCell_Previews: PreviewProvider {
    static var previews: some View {
        CommunityCell()
    }
}
