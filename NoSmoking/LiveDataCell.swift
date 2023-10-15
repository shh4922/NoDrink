import SwiftUI

enum liveData : Int,CaseIterable{
    case noSmoke
    case saveMoney
    case noSmokeCount
    
    var titleText : String {
        switch self{
        case .noSmoke: return "금주한지.."
        case .saveMoney: return "벌써 이만큼이나?!"
        case .noSmokeCount: return "참은 술의 양"
        
        }
    }
    
    var titleImage : String {
        switch self{
        case .noSmoke: return "clock.arrow.circlepath"
        case .saveMoney: return "wonsign"
        case .noSmokeCount: return "trash"
        }
    }
}
struct LiveDataCell: View {
    let data : liveData
    init(data: liveData) {
        self.data = data
    }
    var body: some View {
        
        HStack{
            Image(systemName: data.titleImage)
                .font(.system(size: 30))
                .padding(.horizontal,5)
            VStack(alignment: .leading,spacing: 5){
                Text(data.titleText)
                    .font(.system(size: 13,weight: .regular))
                Text("0일 21시간 48분 55초")
                    .font(.system(size: 20,weight: .semibold))
            }
            Spacer()
        }
        .padding(.vertical,20)
        .padding(.horizontal, 10)
//        .background(Color(uiColor: .systemGray5))
//        .cornerRadius(20)
    }
}

struct LiveDataCell_Previews: PreviewProvider {
    
    static var previews: some View {
        let data = liveData.noSmoke
        LiveDataCell(data: data)
    }
}
