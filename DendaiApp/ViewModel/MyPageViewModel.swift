import SwiftUI

class MyPageViewModel: ObservableObject {
    @Published var pageItem: MyPageItem
    
    init() {

        self.pageItem = MyPageItem(
            // お問い合わせURL
            contactURL: "https://forms.gle/GjBLRFu3xrFy1rq56",
            // プライバシーポリシーURL
            privacyPolicyURL: "https://docs.google.com/document/d/e/2PACX-1vSU7JrgmGIqc0YmqpyD2lXylIps2oDOGW55MqOWX-HlZ_zcbfVzDLoBLw_MikXFpTFI6XWg3L_20iF_/pub",
            //利用規約
            termsOfServiceURL: "https://docs.google.com/document/d/e/2PACX-1vSFlItgcCX92pdjn1H0K_Gl8zQfnnJVtDLjcLkI1NbLTW1nk_1B7thTL-K5aC5Wf6ZOARNDmN1_f5dw/pub"
        )
    }
}
