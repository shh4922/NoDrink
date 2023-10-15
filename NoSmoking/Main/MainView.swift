import SwiftUI

struct MainView: View {
    @StateObject var viewmodel = MainVM()
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(alignment: .leading, spacing: 20){
                    
                    liveDataView
                    
                    totalConsumView

                    VStack{
                        Text("금연의 효능이란?")
                        ScrollView(.horizontal){
                            HStack{
                                Text("1")
                                Text("1")
                                Text("1")
                                Text("1")
                                Text("1")
                            }
                        }
                    }
                    
                }
            }
            .background(Color(uiColor: .systemGray6))
            
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("onClick Calindar")
                    } label: {
                        Image(systemName: "calendar")
                            .foregroundColor(.black)
                    }

                }
            }
        }
        .onAppear{
            print("Stack onApear!!")
            viewmodel.getDifferanceTime()
        }
        
    }
}

extension MainView {
    var liveDataView : some View{
        VStack(alignment:.leading, spacing: 5){
            HStack{
                Text("Live")
                    .font(.system(size: 15,weight: .semibold))
            }
            Divider()
            HStack{
                Image(systemName: "clock.arrow.circlepath")
                    .font(.system(size: 30))
                    .padding(.horizontal,5)
                VStack(alignment: .leading,spacing: 5){
                    Text("금주한지..")
                        .font(.system(size: 13,weight: .regular))
                    Text(viewmodel.stringTime)
                        .font(.system(size: 20,weight: .semibold))
                }
                Spacer()
            }
            .padding(.vertical,20)
            .padding(.horizontal, 10)
            .padding(.bottom,10)
            .padding(.horizontal,10)
            Divider()
            HStack{
                Image(systemName: "wonsign")
                    .font(.system(size: 30))
                    .padding(.horizontal,5)
                VStack(alignment: .leading,spacing: 5){
                    Text("벌써 이만큼이나?!")
                        .font(.system(size: 13,weight: .regular))
                    Text("0일 21시간 48분 55초")
                        .font(.system(size: 20,weight: .semibold))
                }
                Spacer()
            }
            .padding(.vertical,20)
            .padding(.horizontal, 10)
            .padding(.bottom,10)
            .padding(.horizontal,10)
//            ForEach(liveData.allCases,id:\.rawValue){ data in
//                
////                LiveDataCell(data: data)
////                    .padding(.bottom,10)
////                    .padding(.horizontal,10)
//                
//            }
        }
        .padding(.horizontal,10)
        .padding(10)
        .background(.white)
        .cornerRadius(20)
        .padding(.horizontal,20)
        .shadow(radius: 10)
        
        
    }
    
    var totalConsumView : some View {
        VStack(alignment:.leading, spacing: 5){
            HStack{
                Text("누적 지출 금액")
                    .font(.system(size: 13,weight: .semibold))
            }
            HStack{
                Image(systemName: "wonsign")
                    .font(.system(size: 30))
                    .padding(.horizontal,5)
                VStack(alignment: .leading,spacing: 5){
                    if let used = viewmodel.userData?.userdMoney {
                        Text("\(used) 원 ")
                            .font(.system(size: 13,weight: .regular))
                    }
                    Text("이돈이면 자동차 를 하나 뽑습니다")
                        .font(.system(size: 20,weight: .semibold))
                        .lineLimit(2)

                }
                Spacer()
            }
            .padding(.vertical,20)
            .padding(.horizontal, 10)
            .cornerRadius(20)
            .padding(.bottom,10)
            .padding(.horizontal,10)
        }
        .padding(.horizontal,10)
        .padding(10)
        .background(.white)
        .cornerRadius(20)
        .padding(.horizontal,20)
        
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
