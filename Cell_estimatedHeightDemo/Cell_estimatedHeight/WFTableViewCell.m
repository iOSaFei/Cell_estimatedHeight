//
//  WFTableViewCell.m
//  Cell_estimatedHeight
//
//  Created by iOS-aFei on 16/10/12.
//  Copyright © 2016年 iOS-aFei. All rights reserved.
//

#import "WFTableViewCell.h"
#import "WFTableViewCellModel.h"
#import "Masonry.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@interface WFTableViewCell ()

{
    UIImageView *_iconImage;
    UILabel     *_textLabel;
    UIImageView *_labelBackView;
}

@end

@implementation WFTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addBaseView];
        [self makeConstraints];
    }
    return self;
}
- (void)addBaseView {
    _iconImage = [[UIImageView alloc] init];
    _iconImage.layer.cornerRadius  = 40;
    _iconImage.layer.masksToBounds = YES;
    [self.contentView addSubview:_iconImage];
    
    _labelBackView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_cellModel.backImageName]];
    _labelBackView.backgroundColor = [UIColor colorWithRed:0.90
                                                     green:0.90
                                                      blue:0.90
                                                     alpha:1.0];
    _labelBackView.layer.cornerRadius  = 20;
    _labelBackView.layer.masksToBounds = YES;
    [self.contentView addSubview:_labelBackView];
    
    _textLabel = [[UILabel alloc] init];
    _textLabel.numberOfLines = 0;
    _textLabel.font = [UIFont fontWithName:@"Courier-Oblique" size:18];
    [_labelBackView addSubview:_textLabel];
}
- (void)setCellModel:(WFTableViewCellModel *)cellModel {
    _cellModel = cellModel;
    _iconImage.image = [UIImage imageNamed:_cellModel.imageName];
    _textLabel.text = _cellModel.textString;
}
- (void)makeConstraints {
    WS(ws);
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.contentView.mas_top).with.offset(20);
        make.left.equalTo(ws.contentView.mas_left).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    [_labelBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImage.mas_right).with.offset(20);
        make.top.equalTo(_iconImage.mas_centerY);
        make.right.equalTo(ws.contentView.mas_right).with.offset(-120);
        make.bottom.equalTo(ws.contentView.mas_bottom).with.offset(-20);
    }];
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.equalTo(_labelBackView).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
