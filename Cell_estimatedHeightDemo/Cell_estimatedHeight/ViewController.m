//
//  ViewController.m
//  Cell_estimatedHeight
//
//  Created by iOS-aFei on 16/10/12.
//  Copyright © 2016年 iOS-aFei. All rights reserved.
//

#import "ViewController.h"
#import "WFTableViewCell.h"
#import "WFTableViewCellModel.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView         *tabelView;
@property (nonatomic, strong) NSMutableArray      *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tabelView];
}

#pragma mark - lazyLoad
- (UITableView *)tabelView
{
    if (!_tabelView) {
        UITableView *tabelView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        tabelView.delegate = self;
        tabelView.dataSource = self;
        
        [tabelView registerClass:[WFTableViewCell class]
          forCellReuseIdentifier:@"MyTableViewCell"];
        
        _tabelView = tabelView;
    }
    return _tabelView;
}
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        NSString *string = [[NSString alloc] initWithFormat:@"%@",@"不知不觉在这个城市生活了两年。缘分使然，被这所大学录取，又莫名其妙被调剂到这个专业－计算机科学与技术。也开始了我长达两年、后续不知多少载的码农之路。悄然过完整整一个学期，我都不知道自己将来会去哪里、从事什么工作，也没有去想过。直到大一下学期，偶然去听了一场宣讲会、加入了3g实验室iOS组，我便与代码结下了这不解之缘。码农之路，甚是艰辛。习惯了放荡不羁爱自由的生活，在篮球场可以呆整整一下午，实验室于我来说是一种煎熬。不知什么原因促使自己坚持下来了，或许是自己内心强烈的不想虚度大学，不想在他年毕业之时一无所获；或许是因为一句广告：月薪上万、出任CEO、赢取白富美，长按二维码关注可学习iOS开发；也或许因为听了乔丹叔叔的话：JUST DO IT。这是一个过渡的学期，也是一个适应的过程。大二上学期，我似乎还没能完全适应长时间坐在电脑前的生活，编程带来的快乐也是昙花一现。时而奋进、长期低迷，一个学期又是转瞬即逝。而这个寒假，和几个码农一起起早贪黑的日子，孤独而又奋进，也让我安静下来想了很多很多。寂静的夜晚最让人迷失、正如古装电视剧青云志中噬血珠总在夜深人静时影响张小凡。每当熬夜敲代码时，我总告诉自己：如果我敲击键盘足够快，我的孤独就追不上我；如果我敲的足够仔细，便能找回丢失的自己。忙碌的过完了这个寒假，每天都很疲惫，或许自己需要这种忙碌。当走进期末考场的时候，我知道又一个学期过完了，许多事情历历在目、更多过往随风而逝。代码从我眼前掠过的瞬间，我仿佛看到了未来熬夜敲代码的自己。这个暑假，依然是坐在电脑前，在代码的路上渐行渐远。一路坎坎坷坷，我也偶尔怀疑自己，代码不精、封装无力，却从未想过回头。正如平凡之路的那句歌词：冥冥中，这是我唯一要走的路。经历了浮华与喧嚣的流年，也才发现最惬意的事、莫过于安静的坐在电脑前、敲上几行代码。"];
        _dataArray = [NSMutableArray array];
        NSUInteger flag = 0;
        for (int i = 0; i < 25; i++) {
            WFTableViewCellModel *model = [[WFTableViewCellModel alloc] init];
            model.textString = [string substringWithRange:NSMakeRange(flag, i*2)];
            flag += i*2;
            model.imageName = @"auther";
            [_dataArray addObject:model];
        }
        WFTableViewCellModel *model = [[WFTableViewCellModel alloc] init];
        model.textString = [string substringFromIndex:flag];
        model.imageName = @"auther";
        [_dataArray addObject:model];
        
    }
    return _dataArray;
}

#pragma mark - UITableViewDelegate&datasourse
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WFTableViewCell *cell =\
    [tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell"
                                    forIndexPath:indexPath];
    cell.cellModel = self.dataArray[indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
