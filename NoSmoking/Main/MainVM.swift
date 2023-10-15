import Foundation

class MainVM: ObservableObject {
    
    @Published var userData : DataModel? = nil

    @Published var stringTime = ""
    
    init(){
        userData = CoreDataManager.shared.getDataModel()
    }
    
    func getDifferanceTime() {

        guard let end = userData?.startDay else { return }
        
        // 현재와 end의 차이
        var dif = Int(Date().timeIntervalSince(end))
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { time in
            dif += 1
            /// 3600초 (1시간)
            /// 86,400 초 ( 하루)
            /// 년 일 시 분 초
            let y = dif / (86400 * 365)
            let d = (dif - y*(86400 * 365)) / (86400)
            let h = (dif - y*(86400 * 365) - d*(86400)) / (3600)
            let m = (dif - y*(86400 * 365) - d*(86400) - h*(3600)) / (60)
            let s = (dif - y*(86400 * 365) - d*(86400) - h*(3600) - m*(60)) % 60

            self.stringTime = "\(y)년 \(d)일 \(h)시간 \(m)분 \(s)초 째 금주중..!"
        }
    }
    
    
    

    /// 타이머로 금주 시작일부터 지금까지의 날짜를 구하고
    /// 그 날짜를 Int형으로 변환해야할듯
    /// 그후에 변경한 Int를 + 1 하고
    /// 그걸 다시 DateString으로 포멧후 View에 보여줘야할듯...
    ///
    
    
}
