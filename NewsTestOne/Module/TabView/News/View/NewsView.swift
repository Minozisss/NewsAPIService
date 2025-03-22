import SwiftUI
import SDWebImageSwiftUI

struct NewsView: View {
    // MARK: - Properties
    @State var vm = NewsViewModel()
    @Binding var path: NavigationPath
    
    // MARK: - Body
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 15) {
                Text("Top News")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(vm.topNews, id: \.url) { article in
                            TopNews(article: article)
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .shadow(color: .black.opacity(0.4), radius: 10, x: 5, y: 5)
                
                Text("Bottom News")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(vm.bottomNews, id: \.url) { article in
                            NavigationLink(value: NavigationEnum.news(article)) {
                                BottomNews(article: article)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .shadow(color: .black.opacity(0.8), radius: 10, x: 5, y: 5)
            }
            .padding(.top, 20)
            .padding(.bottom, 100)
        }
        .buttonStyle(.plain)
        .background(.secondary.opacity(0.2))
        .refreshable {
            vm.fetchTopNews()
            vm.fetchBottomNews()
        }
        .alert("Ошибка", isPresented: $vm.isError) {
            Button {
                vm.error = nil
                vm.isError = false
            } label: {
                Text("Ok")
            }

        } message: {
            if let error = vm.error as? NetworkErrors {
                switch error {
                case .NoInterner:
                    Text("Проверьте ваше подключение к сети")
                case .DecodingFailed:
                    Text("Ошибка приёма данных, напишите в службу поддержки")
                case .InvalidRequest:
                    Text("Ошибка отправки запроса, напишите в службу поддержки")
                }
            }
        }
        
        
    }
}

