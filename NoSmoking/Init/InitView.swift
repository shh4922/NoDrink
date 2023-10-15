import SwiftUI

struct InitView: View {
    
    @StateObject var viewmodel = InitVM()
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .center,spacing: 35){
                HStack{
                    VStack(alignment: .leading,spacing: 8){
                        Text("음주를 시작한 날짜는?")
                            .font(.system(size: 15,weight: .semibold))
                        
                        DatePicker("", selection: $viewmodel.startDrinkDay,
                                   displayedComponents: [.date]
                        )
                        .labelsHidden()
                    }
                    Spacer()
                }
                
                HStack{
                    VStack(alignment: .leading,spacing: 8){
                        Text("금주를 시작한 날짜는?")
                            .font(.system(size: 15,weight: .semibold))
                        
                        DatePicker("금주날짜를 선택ㅎ", selection: $viewmodel.startDay,
                                   displayedComponents: [.date]
                        )
                        .labelsHidden()
                    }
                    Spacer()
                }
                
                
                VStack(alignment: .leading,spacing: 8){
                    Text("주에 얼마나 마셔?!")
                        .font(.system(size: 15,weight: .semibold))
                    TextField("ex 3회", text: $viewmodel.count)
                        .padding()
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(8)
                }
                
                VStack(alignment: .leading,spacing: 8){
                    Text("술자리에서 소모하는 평균 금액")
                        .font(.system(size: 15,weight: .semibold))
                    TextField("ex 23000", text: $viewmodel.money)
                        .padding()
                        .background(Color(uiColor: .secondarySystemBackground))
                        .cornerRadius(8)
                }
                
                
                Button {
                    viewmodel.saveToCoreData()
                } label: {
                    HStack{
                        Text("save")
                            .font(.system(size: 24,weight: .semibold))
                            .frame(minWidth: 180,maxWidth: 210)
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                    }
                    .background(viewmodel.isDisable() ? .gray : .orange)
                    .cornerRadius(10)
                    .padding(.horizontal,20)
                    
                }
                .disabled(viewmodel.isDisable())

            }
            .padding(.horizontal, 20)
            .padding(.top,30)
            
        }
    }
}

struct InitView_Previews: PreviewProvider {
    static var previews: some View {
        InitView()
    }
}
