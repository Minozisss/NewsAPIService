import SwiftUI
import SDWebImageSwiftUI

struct SearchView: View {
    //MARK: - Properties
    @State var vm = SearchViewModel()
    @Binding var path: NavigationPath
    @State var textForSearch: String = ""
    @State var whoActive: String = "relevancy"
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .leading) {
                SearchField(textForSearch: $textForSearch)
                    .onSubmit {
                        vm.setPromt(textForSearch)
                        vm.setSort(whoActive)
                        vm.fetchNews()
                        self.textForSearch = ""
                    }
                
                HStack(alignment: .center, spacing: 5) {
                    FilterButton(whoActive: $whoActive, title: "relevancy")
                    FilterButton(whoActive: $whoActive, title: "popularity")
                    FilterButton(whoActive: $whoActive, title: "publishedAt")
                    
                }
                
                ForEach(vm.news, id: \.url) { article in
                    NavigationLink(value: NavigationEnum.news(article)) {
                        OneArticle(article: article)
                    }

                }
            }
            .padding(20)
            .padding(.bottom, 60)
        }
        .buttonStyle(.plain)
        .background(.secondary.opacity(0.2))
        .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)
        .refreshable {
            vm.fetchNews()
        }
        .alert("Ошибка", isPresented: $vm.showAlert) {
            Button {
                vm.error = nil
                vm.showAlert = false
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



