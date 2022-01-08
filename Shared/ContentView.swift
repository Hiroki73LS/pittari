import SwiftUI
import GoogleMobileAds



struct BannerAdView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> GADBannerView {
        
        let banner = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        //        banner.adUnitID = "ca-app-pub-1023155372875273/2406169933"
        //↑こちら本物。
        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        //↑こちらテスト用。
        
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        return banner
    }
    
    func updateUIView(_ uiView: GADBannerView, context: Context) {
    }
}

@available(macOS 12.0, *)
struct ContentView: View {
    
    enum Field:Int,Hashable{
        case Forcus1
        case Forcus2
        case Forcus3
        case Forcus4
        case Forcus5
        case Forcus6
        case Forcus7
    }
    
    @FocusState var focus:Field?
    
    @FocusState private var Forcused: Bool   // フォーカス状態プロパティ
    @State var state: String = "Closed"
    
    @State var ka: [Int] = [0, 0, 0, 0, 0, 0, 0]
    @State var syoukei : Int = 0
    @State var goukei : String = "0"
    
    @State var kakaku : [String] = ["", "", "", "", "", "", ""]
    @State var kazu : [String] = ["", "", "", "", "", "", ""]
    @State var result : [Int] = [0, 0, 0, 0, 0, 0, 0]
    @State var hyouji : [String] = ["0", "0", "0", "0", "0", "0", "0"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .green]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .onTapGesture {
                    UIApplication.shared.closeKeyboard()
                }
            
            VStack{
                BannerAdView().frame(width: 320, height: 50)
                Text("ぎりぎり買うには？")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .frame(width: 300, height: 40)
                    .foregroundColor(Color(.white))
                    .background(Color(.orange))
                    .cornerRadius(3)
                Spacer()
                HStack{
                    VStack(spacing: 5){
                        Text("価格")
                            .font(.title)
                            .frame(height: 28)
                        TextField("", text : $kakaku[0])
                            .focused($Forcused)
                            .focused($focus, equals: Field.Forcus1)
                        TextField("", text : $kakaku[1])
                            .focused($focus, equals: Field.Forcus2)
                        TextField("", text : $kakaku[2])
                            .focused($focus, equals: Field.Forcus3)
                        TextField("", text : $kakaku[3])
                            .focused($focus, equals: Field.Forcus4)
                        TextField("", text : $kakaku[4])
                            .focused($focus, equals: Field.Forcus5)
                        TextField("", text : $kakaku[5])
                            .focused($focus, equals: Field.Forcus6)
                        TextField("", text : $kakaku[6])
                            .focused($focus, equals: Field.Forcus7)
                    }
                    .frame(width: 105)
                    .onAppear {
                        /// 0.3秒の遅延発生後TextFieldに初期フォーカスをあてる
                        DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
                            Forcused = true
                        }}
                    VStack(spacing: 5){
                        Text("数量")
                            .font(.title)
                            .frame(height: 28)
                        
                        HStack(spacing: 5){
                            Button(action: {
                                kazu[0] = String(pluscount(moji: ("\(kazu[0])")))
                                result[0] = siki(kakaku: ("\(kakaku[0])") ,suuryou: ("\(kazu[0])"))
                                hyouji[0] = String(result[0])
                                goukei = String(goukeihyouji( a : result[0], b : result[1], c : result[2], d : result[3], e : result[4], f : result[5], g : result[6]))
                            }) {
                                Image(systemName: "plus.circle")}
                            TextField("", text : $kazu[0])
                            Button(action: {
                                kazu[0] = String(minuscount(moji: ("\(kazu[0])")))
                                result[0] = siki(kakaku: ("\(kakaku[0])") ,suuryou: ("\(kazu[0])"))
                                hyouji[0] = String(result[0])
                                goukei = String(goukeihyouji( a : result[0], b : result[1], c : result[2], d : result[3], e : result[4], f : result[5], g : result[6]))
                            }) {
                                Image(systemName: "minus.circle")}
                        }
                        HStack(spacing: 5){
                            Button(action: {
                                kazu[1] = String(pluscount(moji: ("\(kazu[1])")))
                                result[1] = siki(kakaku: ("\(kakaku[1])") ,suuryou: ("\(kazu[1])"))
                                hyouji[1] = String(result[1])
                                goukei = String(goukeihyouji( a : result[0], b : result[1], c : result[2], d : result[3], e : result[4], f : result[5], g : result[6]))
                            }) {
                                Image(systemName: "plus.circle")}
                            TextField("", text : $kazu[1])
                            Button(action: {
                                kazu[1] = String(minuscount(moji: ("\(kazu[1])")))
                                result[1] = siki(kakaku: ("\(kakaku[1])") ,suuryou: ("\(kazu[1])"))
                                hyouji[1] = String(result[1])
                                goukei = String(goukeihyouji( a : result[0], b : result[1], c : result[2], d : result[3], e : result[4], f : result[5], g : result[6]))
                            }) {
                                Image(systemName: "minus.circle")}
                        }
                        HStack(spacing: 5){
                            Button(action: {
                                kazu[2] = String(pluscount(moji: ("\(kazu[2])")))
                                result[2] = siki(kakaku: ("\(kakaku[2])") ,suuryou: ("\(kazu[2])"))
                                hyouji[2] = String(result[2])
                                goukei = String(goukeihyouji( a : result[0], b : result[1], c : result[2], d : result[3], e : result[4], f : result[5], g : result[6]))
                            }) {
                                Image(systemName: "plus.circle")}
                            TextField("", text : $kazu[2])
                            Button(action: {
                                kazu[2] = String(minuscount(moji: ("\(kazu[2])")))
                                result[2] = siki(kakaku: ("\(kakaku[2])") ,suuryou: ("\(kazu[2])"))
                                hyouji[2] = String(result[2])
                                goukei = String(goukeihyouji( a : result[0], b : result[1], c : result[2], d : result[3], e : result[4], f : result[5], g : result[6]))
                            }) {
                                Image(systemName: "minus.circle")}
                        }
                        HStack(spacing: 5){
                            Button(action: {
                                kazu[3] = String(pluscount(moji: ("\(kazu[3])")))
                                result[3] = siki(kakaku: ("\(kakaku[3])") ,suuryou: ("\(kazu[3])"))
                                hyouji[3] = String(result[3])
                                goukei = String(goukeihyouji( a : result[0], b : result[1], c : result[2], d : result[3], e : result[4], f : result[5], g : result[6]))
                            }) {
                                Image(systemName: "plus.circle")}
                            TextField("", text : $kazu[3])
                            Button(action: {
                                kazu[3] = String(minuscount(moji: ("\(kazu[3])")))
                                result[3] = siki(kakaku: ("\(kakaku[3])") ,suuryou: ("\(kazu[3])"))
                                hyouji[3] = String(result[3])
                                goukei = String(goukeihyouji( a : result[0], b : result[1], c : result[2], d : result[3], e : result[4], f : result[5], g : result[6]))
                            }) {
                                Image(systemName: "minus.circle")}
                        }
                        HStack(spacing: 5){
                            Button(action: {
                                kazu[4] = String(pluscount(moji: ("\(kazu[4])")))
                                result[4] = siki(kakaku: ("\(kakaku[4])") ,suuryou: ("\(kazu[4])"))
                                hyouji[4] = String(result[4])
                                goukei = String(goukeihyouji( a : result[0], b : result[1], c : result[2], d : result[3], e : result[4], f : result[5], g : result[6]))
                            }) {
                                Image(systemName: "plus.circle")}
                            TextField("", text : $kazu[4])
                            Button(action: {
                                kazu[4] = String(minuscount(moji: ("\(kazu[4])")))
                                result[4] = siki(kakaku: ("\(kakaku[4])") ,suuryou: ("\(kazu[4])"))
                                hyouji[4] = String(result[4])
                                goukei = String(goukeihyouji( a : result[0], b : result[1], c : result[2], d : result[3], e : result[4], f : result[5], g : result[6]))
                            }) {
                                Image(systemName: "minus.circle")}
                        }
                        HStack(spacing: 5){
                            Button(action: {
                                kazu[5] = String(pluscount(moji: ("\(kazu[5])")))
                                result[5] = siki(kakaku: ("\(kakaku[5])") ,suuryou: ("\(kazu[5])"))
                                hyouji[5] = String(result[5])
                                goukei = String(goukeihyouji( a : result[0], b : result[1], c : result[2], d : result[3], e : result[4], f : result[5], g : result[6]))
                            }) {
                                Image(systemName: "plus.circle")}
                            TextField("", text : $kazu[5])
                            Button(action: {
                                kazu[5] = String(minuscount(moji: ("\(kazu[5])")))
                                result[5] = siki(kakaku: ("\(kakaku[5])") ,suuryou: ("\(kazu[5])"))
                                hyouji[5] = String(result[5])
                                goukei = String(goukeihyouji( a : result[0], b : result[1], c : result[2], d : result[3], e : result[4], f : result[5], g : result[6]))
                            }) {
                                Image(systemName: "minus.circle")}
                        }
                        HStack(spacing: 5){
                            Button(action: {
                                kazu[6] = String(pluscount(moji: ("\(kazu[6])")))
                                result[6] = siki(kakaku: ("\(kakaku[6])") ,suuryou: ("\(kazu[6])"))
                                hyouji[6] = String(result[6])
                                goukei = String(goukeihyouji( a : result[0], b : result[1], c : result[2], d : result[3], e : result[4], f : result[5], g : result[6]))
                            }) {
                                Image(systemName: "plus.circle")}
                            TextField("", text : $kazu[6])
                            Button(action: {
                                kazu[6] = String(minuscount(moji: ("\(kazu[6])")))
                                result[6] = siki(kakaku: ("\(kakaku[6])") ,suuryou: ("\(kazu[6])"))
                                hyouji[6] = String(result[6])
                                goukei = String(goukeihyouji( a : result[0], b : result[1], c : result[2], d : result[3], e : result[4], f : result[5], g : result[6]))
                            }) {
                                Image(systemName: "minus.circle")}
                        }

                    }
                    VStack(spacing: 5){
                        Text("小計")
                            .font(.title)
                            .frame(height: 28)
                        TextField("", text : $hyouji[0])
                        TextField("", text: $hyouji[1])
                        TextField("", text : $hyouji[2])
                        TextField("", text : $hyouji[3])
                        TextField("", text : $hyouji[4])
                        TextField("", text : $hyouji[5])
                        TextField("", text : $hyouji[6])
                    }
                    .disabled(true)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.trailing)
                .keyboardType(.numberPad)
                .font(.title)
                HStack{
                    Spacer()
                        .frame(width: 90)
                    Text("合計")
                    TextField("", text : $goukei)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.trailing)
                .font(.title)
                HStack{
                    Button(action: {
                        kakaku = ["", "", "", "", "", "", ""]
                        kazu = ["", "", "", "", "", "", ""]
                        hyouji = ["0", "0", "0", "0", "0", "0", "0"]
                        result = [0, 0, 0, 0, 0, 0, 0]
                        goukei = "0"
                        focus = Optional(Pittari.ContentView.Field.Forcus1)
                    }){
                        Text("リセット")
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .foregroundColor(Color(.white))
                            .background(Color(.blue))
                            .cornerRadius(18)
                            .font(.title)
                    }
                    Spacer()
                        .frame(width: 20)
                    Button(action: {
                        result[0] = siki(kakaku: ("\(kakaku[0])") ,suuryou: ("\(kazu[0])"))
                        result[1] = siki(kakaku: ("\(kakaku[1])") ,suuryou: ("\(kazu[1])"))
                        result[2] = siki(kakaku: ("\(kakaku[2])") ,suuryou: ("\(kazu[2])"))
                        result[3] = siki(kakaku: ("\(kakaku[3])") ,suuryou: ("\(kazu[3])"))
                        result[4] = siki(kakaku: ("\(kakaku[4])") ,suuryou: ("\(kazu[4])"))
                        result[5] = siki(kakaku: ("\(kakaku[5])") ,suuryou: ("\(kazu[5])"))
                        result[6] = siki(kakaku: ("\(kakaku[6])") ,suuryou: ("\(kazu[6])"))
                        hyouji[0] = String(result[0])
                        hyouji[1] = String(result[1])
                        hyouji[2] = String(result[2])
                        hyouji[3] = String(result[3])
                        hyouji[4] = String(result[4])
                        hyouji[5] = String(result[5])
                        hyouji[6] = String(result[6])

                        goukei = String(goukeihyouji( a : result[0], b : result[1], c : result[2], d : result[3], e : result[4], f : result[5], g : result[6]))
                    }){
                        Text("合計計算")
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .foregroundColor(Color(.white))
                            .background(Color(.blue))
                            .cornerRadius(18)
                            .font(.title)
                    }
                }
                Spacer()
            }
        }.toolbar{
            ToolbarItem(placement: .keyboard){
                HStack{
                    Button(action: {
                        focus = Field(rawValue: focus!.rawValue - 1)
                    }){
                        Image(systemName: "chevron.left")
                    }
                    Spacer()
                        .frame(width: 40)
                    Button(action: {
                        focus = Field(rawValue: focus!.rawValue + 1)
                    }){
                        Image(systemName: "chevron.right")
                    }}}}
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidShowNotification)) { _ in
            self.state = "Opened"
        }.onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidHideNotification)) { _ in
            self.state = "Closed"
        }
    }}

func siki(kakaku : String, suuryou : String) -> Int {
    let keisan : Int
    var a : Int = 0
    var b : Int = 0
    a = Int(kakaku) ?? 0
    b = Int(suuryou) ?? 0
    keisan = a * b
    return keisan
}

func pluscount(moji : String) -> Int {
    var momoji : Int
    momoji = Int(moji) ?? 0
    momoji += 1
    return momoji
}

func minuscount(moji : String) -> Int {
    var momoji : Int
    momoji = Int(moji) ?? 0
    if momoji > 0 {
        momoji -= 1
    } else {
    }
    return momoji
}

func goukeihyouji(a : Int, b : Int, c : Int, d : Int, e : Int, f : Int, g : Int) -> Int {
    var goukei : Int = 0
    let aa : Int = a
    let bb : Int = b
    let cc : Int = c
    let dd : Int = d
    let ee : Int = e
    let ff : Int = f
    let gg : Int = g
    goukei = aa + bb + cc + dd + ee + ff + gg
    return goukei
}

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
