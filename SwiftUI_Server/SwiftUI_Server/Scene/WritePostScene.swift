//
//  WritePostScene.swift
//  SwiftUI_Server
//
//  Created by 김기영 on 2022/01/15.
//

import SwiftUI

struct WritePostScene: View {
    @StateObject private var viewModel = WritePostViewModel()
    @Binding var move: Bool
    var body: some View {
        VStack {
            TextField("제목을 입력하세요", text: $viewModel.title)
            TextField("내용을 입력하세요", text: $viewModel.content)
            Button(action: {
                viewModel.write()
                move = viewModel.isSuccess
            }, label: {
                Text("완료")
            })
        }
    }
}

struct WritePostScene_Previews: PreviewProvider {
    static var previews: some View {
        WritePostScene(move: .constant(true))
    }
}
