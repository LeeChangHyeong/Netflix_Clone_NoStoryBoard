//
//  HomeViewController.swift
//  Netflix_Clone_NoStoryBoard
//
//  Created by 이창형 on 2022/07/08.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: 테이블 뷰 생성
    private let homeFeedTable: UITableView = {
       let table = UITableView()
        // table에 등록
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        // MARK: delegate
        // Delegate는 객체 지향 프로그래밍에서 하나의 객체가 모든 일을 처리하는 것이 아니라 처리 해야 할 일 중 일부를 다른 객체에 넘기는 것을 뜻 합니다. 쉽게 말해서 우리가 해야할 일을 대신해서 해주는 느낌입니다.
        // TableView의 시각적인 부분 수정, 행의 선택 관리, 액세서리뷰 지원 그리고 테이블뷰의 개별 행 편집을 도와줍니다.
        homeFeedTable.delegate = self
        
        // MARK: datasource
        // Datasource는 데이터 모델의 Delegate로, 테이블뷰의 시각적 모양에 대한 최소한의 정보를 제공합니다. Delegate와 비슷하게 처리 해야 할 일 중 일부를 다른 객체에 넘겨서 작업을 대신해주는 역할을 합니다.
        // TableView 객체에 섹션의 수와 행의 수를 알려주며, 행의 삽입, 삭제 및 재정렬하는 기능을 선택적으로 구현할 수 있습니다.
        homeFeedTable.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // homeFeedTable로 뷰를 다 채움
        homeFeedTable.frame = view.bounds
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: 행 갯수 지정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    // MARK: dequeueReusableCell 쓰는 이유
    // 화면에 테이블 뷰 셀 6개를 볼 수 있다고 가정하면 화면에 보이는 6개의 셀에만 메모리 할당
    // 스크롤을 하면 동일한 셀이 사용되지만 DataSource를 기반으로 셀 내용이 바뀜
    // withIdentifier <- 재사용 할 객체 지정
    // IndexPath <- "셀의 위치를 지정하는 인덱스 패스입니다. 데이터 소스는 셀에 대한 요청이있을 때이 정보를 수신하며 이를 전달해야합니다. 이 방법은 인덱스 경로를 사용하여 테이블뷰에서 셀의 위치를 기반으로 추가 구성을 수행합니다."
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello World"
        return cell
    }
}
