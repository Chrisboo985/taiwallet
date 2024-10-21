// Copyright (c). Gem Wallet. All rights reserved.

import SwiftUI

struct DiscoveryPage: View {
    @State private var selectedCategory = 0
    let categories = ["推荐", "最新", "热门", "分类4"]
    @Environment(\.navigationState) private var navigationState
    @EnvironmentObject private var lang: BaseLanguage
    private var navigationPath: Binding<NavigationPath> {
        Binding(
            get: { navigationState.discovery },
            set: { navigationState.discovery = $0 }
        )
    }

    var body: some View {
        NavigationStack(path: navigationPath, root: {
            VStack {
                // 顶部导航栏
                HStack {
                    Text(lang.discovery).font(.largeTitle).bold()
                    Spacer()
                    Button(action: {
                        // 搜索按钮的操作
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                }
                .padding()

                // 分类标签栏
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<categories.count) { index in
                            Button(action: {
                                selectedCategory = index
                            }) {
                                Text(categories[index])
                                    .padding()
                                    .background(selectedCategory == index ? Color.blue : Color.gray.opacity(0.2))
                                    .foregroundColor(selectedCategory == index ? .white : .black)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding([.leading, .trailing], 10)
                }

                // 内容列表
                ScrollView {
                    VStack(spacing: 20) {
                        CardView(title: "内容标题 ???", description: "这里是内容的简短描述")
                    }
                    .padding()
                }
            }
            .navigationBarHidden(true)
        })
    }
}

// 卡片视图带有图片轮播和PageControl
struct CardView: View {
    var title: String
    var description: String
    @State private var selectedImageIndex = 0
    let images = ["photo", "photo.fill", "camera"]

    var body: some View {
        VStack(alignment: .leading) {
            // 图片轮播
            TabView(selection: $selectedImageIndex) {
                ForEach(0..<images.count) { index in
                    Image(systemName: images[index])
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .cornerRadius(10)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic)) // Page control 样式
            .frame(height: 150)

            // 标题和描述
            Text(title)
                .font(.headline)
                .padding(.top, 5)

            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 2)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}

// 修改预览代码，添加环境对象
struct DiscoveryPage_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryPage()
            .environmentObject(BaseLanguage()) // 传递 BaseLanguage 实例
    }
}
