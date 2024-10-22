import SwiftUI

enum SelectedTab {
    case multitab
    case collection
    case history
}

struct TabPageMode {
    let id: String = UUID().uuidString
    let title: String
    let icon: String
    var isHouse: Bool = false
}

struct MultitabPageView: View {
    @State var selectedTab: SelectedTab
    @Environment(\.presentationMode) var presentation
    // gradient
    let gradient = Gradient(colors: [
        Color(red: 0.567, green: 0.765, blue: 0.978), Color(red: 0.561, green: 0.429, blue: 0.819)
    ])
    @Binding var openedTabPage: [TabPageMode]
    @State var homePpageScreenshot: UIImage?
//    @GestureState private var dragOffset = CGSize.zero
    @Binding var collectionList: [ApplicationModel]
    
    var body: some View {
        NavigationStack(root: {
            VStack(alignment: .leading, spacing: 0) {
                ScrollView {
                    switch selectedTab {
                    case .multitab:
                        multitabView
                    case .collection:
                        collectionView
                    case .history:
                        historyView
                    }
                }
                foot
            }
            .background(Color(red: 0.964, green: 0.964, blue: 0.979))
        }).toolbar(content: {
            header
        })
    }
    
    var header: some View {
        ZStack(content: {
            VStack(spacing: 0) {
                HStack(alignment: .center, spacing: 18) {
                    Spacer() // 添加 Spacer() 保证内容居中
                    Text("多标签页")
                        .foregroundColor(selectedTab == .multitab ? .black : .gray)
                        .onTapGesture {
                            selectedTab = .multitab
                        }
                    
                    Text("收藏")
                        .foregroundColor(selectedTab == .collection ? .black : .gray)
                        .onTapGesture {
                            selectedTab = .collection
                        }
                     
                    Text("浏览记录")
                        .foregroundColor(selectedTab == .history ? .black : .gray)
                        .onTapGesture {
                            selectedTab = .history
                        }
                    Spacer() // 添加 Spacer() 保证内容居中
                }
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(.blue)
                    .frame(width: selectedTab == .collection ? 30 : 65, height: 3)
                    .padding(.top, 8)
                    .offset(x: selectedTab == .collection ? 0 : selectedTab == .multitab ? -68 : 68)
                    .animation(.easeOut, value: selectedTab)
            }
        })
        .background(.clear)
    }
    
    func bodyItem(item: TabPageMode, closeAction: @escaping (String) -> Void) -> some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .center, spacing: 4) {
                Group {
                    if item.isHouse {
                        Image(systemName: "house")
                            .resizable()
                            .scaledToFit()
                    } else {
                        Image(item.icon)
                            .resizable()
                            .scaledToFit()
                    }
                }
                .frame(width: 14, height: 14)
                
                Text(item.title)
                    .font(.footnote)
                Spacer()
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12, height: 12)
                    .onTapGesture {
                        withAnimation(.spring) {
                            closeAction(item.id)
                        }
                    }
            }
            .padding(6)
            .background(.white)
            
            Spacer()
        }
        //        .background(.gray)
        .background {
            if let homePpageScreenshot {
                ZStack(alignment: .center) {
                    Image(uiImage: homePpageScreenshot)
                        .resizable()
                        .scaledToFill()
                }
            }
        }
        .cornerRadius(12)
        .padding(4)
        .background(gradient)
        .cornerRadius(12)
        .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.3)
    }
    
    var multitabView: some View {
        VStack(alignment: .center, spacing: 0) {
            //            HStack(alignment: .center, spacing: 12)  {
            //                bodyItem()
            //                bodyItem()
            //            }
            LazyVGrid(columns: .init(repeating: GridItem(), count: 2)) {
                ForEach(openedTabPage, id: \.id) { item in
                    bodyItem(item: item) { id in
                        openedTabPage = openedTabPage.filter { $0.id != id }
                    }
                }
            }
            Spacer()
        }
        .padding(12)
    }

    var collectionView: some View {
        VStack(alignment: .center, spacing: 0) {
            if collectionList.isEmpty {
                emptyCollectionView
            } else {
                VStack(alignment: .center, spacing: 12) {
                    ForEach(collectionList, id: \.link) { item in
                        collectionViewItem(item: item)
                    }
                    Spacer()
                }
            }
        }
        .padding(12)
    }
    
    var historyView: some View {
        VStack(alignment: .center, spacing: 12) {
            HStack(alignment: .center, spacing: 0) {
                Text("2024年10月16日 星期三")
                    .bold()
                    .foregroundColor(.gray)
                Spacer()
            }
            
            VStack(alignment: .center, spacing: 4) {
                ForEach(0 ... 10, id: \.self) { _ in
                    historyViewItem()
                }
            }
            
            Spacer()
        }
        .padding(12)
    }
    
    var emptyCollectionView: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer(minLength: UIScreen.main.bounds.height * 0.28)
            Image("noCollection")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            Text("还没有收藏任何页面")
                .foregroundColor(.gray)
                .bold()
            Spacer()
        }
    }
    
    func historyViewItem() -> some View {
        HStack(alignment: .center, spacing: 12) {
            Image("baidu")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            VStack(alignment: .leading, spacing: 0) {
                Text("百度一下，你就知道")
                    .bold()
                Text("https://www.baidu.com")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
            Spacer()
            VStack(alignment: .center, spacing: 0) {
                Text("10:30")
                    .font(.footnote)
                    .foregroundColor(.gray)
                Spacer()
            }
        }
        .padding(12)
        .background(.white)
        .cornerRadius(8)
    }

    func collectionViewItem(item: ApplicationModel) -> some View {
        HStack(alignment: .center, spacing: 12) {
            Image(item.icon ?? "")
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .padding(12)
                .background(.white)
                .cornerRadius(10)
                .padding(0.5)
                .background(.gray.opacity(0.5))
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 0) {
                Text(item.title ?? "")
                    .bold()
                Text(item.link ?? "")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
            Spacer()
            Image(systemName: "line.3.horizontal")
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .foregroundColor(.gray)
        }
        .padding(12)
        .background(.white)
        .cornerRadius(8)
    }
    
    var foot: some View {
        HStack(alignment: .center, spacing: 0) {
            Image("broom")
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
            Spacer()
            Image(systemName: "plus")
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
                .foregroundColor(.black)
        }
        .padding(.horizontal, 12)
        .padding(12)
        .background(.white)
    }
}

struct MultitabPageView_Previews: PreviewProvider {
    @State static var openedTabPage = [
        TabPageMode(title: "首页", icon: "house.fill", isHouse: true),
        TabPageMode(title: "新闻", icon: "newspaper"),
        TabPageMode(title: "购物", icon: "cart.fill")
    ]
    
    @State static var collectionList = [
        ApplicationModel(title: "百度", icon: "baidu", link: "https://www.baidu.com"),
        ApplicationModel(title: "谷歌", icon: "google", link: "https://www.google.com")
    ]
    
    static var previews: some View {
        NavigationStack(root: {
            MultitabPageView(
                selectedTab: .multitab,
                openedTabPage: $openedTabPage,
                collectionList: $collectionList
            )
        })
    }
}
