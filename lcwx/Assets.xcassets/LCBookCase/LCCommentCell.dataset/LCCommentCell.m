//
//  LCCommentCell.m
//  LuoChenReader
//
//  Created by toomlee on 16/1/21.
//  Copyright © 2016年 Reader. All rights reserved.
//

#import "LCCommentCell.h"
#import "LCCommentModel.h"
#import "LCReplayModel.h"
#import "HWStatusTextView.h"
#define LCNameFont [UIFont systemFontOfSize:14]
#define LCTitleFont [UIFont systemFontOfSize:8]
#define LCAuthorFont [UIFont systemFontOfSize:9]
#define LCContentFont [UIFont systemFontOfSize:12]

@interface LCCommentCell ()
/*  */
/** 整体 */
@property (nonatomic, weak) UIView *originalView;
/** 头像 */
@property (nonatomic, weak) UIImageView *iconView;
/** 会员图标 */
@property (nonatomic, weak) UIImageView *vipView;
/** 昵称 */
@property (nonatomic, weak) UILabel *nameLabel;
/** 称谓 */
@property (nonatomic, weak) UILabel *titleLabel;
/** 作者 */
@property (nonatomic, weak) UILabel *authorLabel;
/** 精 */
@property (nonatomic, weak) UILabel *jingLabel;
/** 顶 */
@property (nonatomic, weak) UILabel *dingLabel;
/** 时间 */
@property (nonatomic, weak) UILabel *timeLabel;
/** 正文 */
@property (nonatomic, weak) HWStatusTextView *contentText;
/** 回复icon */
@property (nonatomic, weak) UIImageView *replayIcon;
/** 回复数量 */
@property (nonatomic, weak) UIButton *replaynumBtn;
/** 横线1 */
@property (nonatomic, weak) UIView *div1;
/** 第一个回复 */
@property (nonatomic, weak) HWStatusTextView *replay1text;
/** 横线2 */
@property (nonatomic, weak) UIView *div2;
/** 第二个回复 */
@property (nonatomic, weak) HWStatusTextView *replay2text;
/** 横线3 */
@property (nonatomic, weak) UIView *div3;
/** 查看更多 */
@property (nonatomic, weak) UIButton *moreBtn;
/** 底部分割 */
//@property (nonatomic, weak) UIView *bottomView;
@property (nonatomic,weak) UIView *seperline;
@end

@implementation LCCommentCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    LCCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[LCCommentCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

/**
 *  cell的初始化方法，一个cell只会调用一次
 *  一般在这里添加所有可能显示的子控件，以及子控件的一次性设置
 */
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        // 点击cell的时候不要变色
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupOriginal];


    }
    return self;
}

/**
 * 初始化评论上半部
 */
- (void)setupOriginal
{
    /** 评论上半部整体 */
    UIView *originalView = [[UIView alloc] init];
    originalView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:originalView];
    self.originalView = originalView;
    
    /** 头像 */
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.layer.masksToBounds = YES;
    iconView.layer.cornerRadius = 17.5;
    [originalView addSubview:iconView];
    self.iconView = iconView;
    
    /** 会员图标 */
    UIImageView *vipView = [[UIImageView alloc] init];
    vipView.contentMode = UIViewContentModeCenter;
    [originalView addSubview:vipView];
    self.vipView = vipView;
    
    /** 昵称 */
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = LCNameFont;
    [originalView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    /** 称谓 */
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = LCTitleFont;
    titleLabel.layer.masksToBounds = YES;
    titleLabel.layer.cornerRadius = 2.0;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor colorWithHexString:@"#fcc030"];
    [originalView addSubview:titleLabel];
    self.titleLabel = titleLabel;

    /** 作者 */
    UILabel *authorLabel = [[UILabel alloc] init];
    authorLabel.font = LCAuthorFont;
    authorLabel.layer.masksToBounds = YES;
    authorLabel.layer.cornerRadius = 2.0;
    authorLabel.textAlignment = NSTextAlignmentCenter;
    authorLabel.textColor = [UIColor whiteColor];
    [originalView addSubview:authorLabel];
    self.authorLabel = authorLabel;

    /** 精 */
    UILabel *jingLabel = [[UILabel alloc] init];
    jingLabel.font = LCAuthorFont;
    jingLabel.layer.masksToBounds = YES;
    jingLabel.layer.cornerRadius = 2.0;
    jingLabel.textAlignment = NSTextAlignmentCenter;
    jingLabel.textColor = [UIColor whiteColor];
    [originalView addSubview:jingLabel];
    self.jingLabel = jingLabel;

    /** 顶 */
    UILabel *dingLabel = [[UILabel alloc] init];
    dingLabel.font = LCAuthorFont;
    dingLabel.layer.masksToBounds = YES;
    dingLabel.layer.cornerRadius = 2.0;
    dingLabel.textAlignment = NSTextAlignmentCenter;
    dingLabel.textColor = [UIColor whiteColor];
    [originalView addSubview:dingLabel];
    self.dingLabel = dingLabel;

    /** 时间 */
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.font = LCContentFont;
    timeLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    [originalView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    
    /** 正文 */
    HWStatusTextView *contentText = [[HWStatusTextView alloc] init];
    contentText.font = LCContentFont;
    contentText.textColor = [UIColor colorWithHexString:@"#333333"];
    contentText.backgroundColor = [UIColor whiteColor];
    [originalView addSubview:contentText];
    self.contentText = contentText;
    
    /** 回复Icon */
    UIImageView *replayIcon = [[UIImageView alloc] init];
    //replayIcon.contentMode = UIViewContentModeCenter;
    [originalView addSubview:replayIcon];
    self.replayIcon = replayIcon;
    

    /** 回复数量 */
    UIButton *replaynumBtn = [[UIButton alloc] init];
    [replaynumBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    replaynumBtn.titleLabel.font = LCAuthorFont;
    [originalView addSubview:replaynumBtn];
    [replaynumBtn addTarget:self action:@selector(replyClick) forControlEvents:UIControlEventTouchDragInside];
    self.replaynumBtn = replaynumBtn;
    
    /** 分割线1 */
//    UIView *div1 = [[UIView alloc] init];
//    div1.backgroundColor = [UIColor colorWithHexString:@"#E8E8E8"];
//    [originalView addSubview:div1];
//    self.div1 = div1;
    
    /** 回复1 */
    HWStatusTextView *reply1Text = [[HWStatusTextView alloc] init];
    reply1Text.backgroundColor = [UIColor whiteColor];
    [originalView addSubview:reply1Text];
    self.replay1text = reply1Text;

    /** 分割线2 */
    UIView *div2 = [[UIView alloc] init];
    div2.backgroundColor = [UIColor colorWithHexString:@"#E8E8E8"];
    div2.backgroundColor = [UIColor redColor];
    //[originalView addSubview:div2];
    self.div2 = div2;

    /** 回复2 */
    HWStatusTextView *reply2Text = [[HWStatusTextView alloc] init];
    reply2Text.backgroundColor = [UIColor whiteColor];
    [originalView addSubview:reply2Text];
    self.replay2text = reply2Text;
    
    /** 分割线3 */
//    UIView *div3 = [[UIView alloc] init];
//    div3.backgroundColor = [UIColor colorWithHexString:@"#E8E8E8"];
//    [originalView addSubview:div3];
//    self.div3 = div3;
    
    /** 查看更多 */
    UIButton *moreBtn = [[UIButton alloc] init];
    moreBtn.backgroundColor = [UIColor whiteColor];
    moreBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [moreBtn setTitleColor:[UIColor colorWithHexString:@"#9eccfb"] forState:UIControlStateNormal];
    [moreBtn addTarget:self action:@selector(moreClick) forControlEvents:UIControlEventTouchUpInside ];
    [originalView addSubview:moreBtn];
    self.moreBtn = moreBtn;
    
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor colorWithHexString:@"F7F7F7"];
    backView.frame = CGRectMake(14, CGRectGetMaxY(moreBtn.frame), ScreenWidth-28, 1);
    [originalView addSubview:backView];
    
    
}

- (void)replyClick
{
   
}

- (void)moreClick
{
    
}

- (void)setCommentFrame:(LCCommentFrame *)CommentFrame
{
    _CommentFrame = CommentFrame;
    

    LCCommentModel *model = CommentFrame.comments;
    /** 原创微博整体 */
    self.originalView.frame = CommentFrame.commentViewF;
    
    /** 头像 */
    self.iconView.frame = CommentFrame.iconF;
    self.iconView.image = [UIImage imageNamed:@"my123"];
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.Avatar] placeholderImage:[UIImage imageNamed:@"beforeicon"]];
    
    
    /** 会员图标 */
    if (model.IsVip) {
        self.vipView.hidden = NO;
        
        self.vipView.frame = CommentFrame.VipF;
        NSString *vipName = [NSString stringWithFormat:@"huiy"];
        self.vipView.image = [UIImage imageNamed:vipName];
        
        //self.nameLabel.textColor = [UIColor orangeColor];
    } else {
        //self.nameLabel.textColor = [UIColor blackColor];
        self.vipView.hidden = YES;
    }
    
    /** 昵称 */
    self.nameLabel.text = model.username;
    self.nameLabel.frame = CommentFrame.nameF;
    
    /** 称谓 */
    self.titleLabel.text = model.goupTitle;
    self.titleLabel.frame = CommentFrame.titleF;
    
    /** 作者 */
    if (model.IsAuthor) {
        self.authorLabel.hidden = NO;
        self.authorLabel.frame = CommentFrame.authorF;
        self.authorLabel.text = @"作者";
        self.authorLabel.backgroundColor = [UIColor colorWithHexString:@"#fcc030"];
    }else{
        self.authorLabel.hidden = YES;
    }
    
    /** 精 */
    if (model.isDigset) {
        self.jingLabel.hidden = NO;
        self.jingLabel.frame = CommentFrame.jingF;
        self.jingLabel.text = @"精";
        self.jingLabel.backgroundColor = [UIColor colorWithHexString:@"#47de8e"];
    }else{
        self.jingLabel.hidden = YES;
    }

    /** 顶 */
    if (model.isTop) {
        self.dingLabel.hidden = NO;
        self.dingLabel.frame = CommentFrame.dingF;
        self.dingLabel.text = @"顶";
        self.dingLabel.backgroundColor = [UIColor colorWithHexString:@"#45aaf9"];
    }else{
        self.dingLabel.hidden = YES;
    }

    /** 时间 */
    NSString *time = [model.postTime created_at];
    self.timeLabel.frame = CommentFrame.timeF;
    self.timeLabel.text = time;
    
    /** 正文 */
    self.contentText.attributedText = model.attributedcontents;
    self.contentText.frame = CommentFrame.contentF;

    /** 回复icon */
    self.replayIcon.image = [UIImage imageNamed:@"hufu"];
    self.replayIcon.frame = CommentFrame.replayImageF;
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(replyClickWithcommentCell:)];
//    self.replayIcon.userInteractionEnabled = YES;
//    [self.replayIcon addGestureRecognizer:tap];
    
    /** 回复数量 */
    [self.replaynumBtn setTitle:[NSString stringWithFormat:@"回复 %d",model.replyCount] forState:UIControlStateNormal];
    [self.replaynumBtn addTarget:self action:@selector(replyClickWithcommentCell:) forControlEvents:UIControlEventTouchUpInside];
    self.replaynumBtn.tag = [model.account integerValue];
    
    self.replaynumBtn.frame = CommentFrame.replyLabelF;
    
    if (model.Replay.count>0) {
        LCReplayModel *replyModel1 = model.Replay[0];
        
        self.div1.frame = CommentFrame.div1F;
        
        /** 回复1 */
//        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:replyModel1.username attributes:@{
//                                NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#9eccfb"]
//                                }];
//        [attributedText appendAttributedString:replyModel1.attributedcontents];
        self.replay1text.attributedText = replyModel1.attributedcontents;
        self.replay1text.frame = CommentFrame.reply1F;
        [self.replay1text addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(reply1TextClick:)]];
        self.div2.frame = CommentFrame.div2F;
        
        if (model.Replay.count>1) {
            LCReplayModel *replyModel2 = model.Replay[1];
            /** 回复2 */
//            NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:replyModel2.username attributes:@{
//                                                                                                                                            NSForegroundColorAttributeName : [UIColor colorWithHexString:@"#9eccfb"]
//                                                                                                                                            }];
//            [attributedText appendAttributedString:replyModel1.attributedcontents];
            self.replay2text.attributedText = replyModel2.attributedcontents;
            [self.replay2text addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(reply2TextClick:)]];
            self.replay2text.frame = CommentFrame.reply2F;
            
            self.div3.frame = CommentFrame.div3F;
        }else{
            self.replay2text.attributedText = [[NSAttributedString alloc] initWithString:@""];
            self.replay2text.frame = CGRectZero;
        }
    }else{
        self.replay1text.attributedText = [[NSAttributedString alloc] initWithString:@""];
        self.replay2text.attributedText = [[NSAttributedString alloc] initWithString:@""];
        self.replay1text.frame = CGRectZero;
        self.replay2text.frame = CGRectZero;
    }
    [self.moreBtn setTitle:@"查看更多" forState:UIControlStateNormal];
    [self.moreBtn addTarget:self action:@selector(moreClickWithcommentCell:) forControlEvents:UIControlEventTouchUpInside];
    self.moreBtn.frame = CommentFrame.MoreF;
    
    
    self.seperline.frame = CommentFrame.seperLine;
}

- (void)moreClickWithcommentCell:(LCCommentCell *)cell
{
    if ([self.delegate respondsToSelector:@selector(moreClickWithcommentCell:)]) {
        [self.delegate moreClickWithcommentCell:self];
    }
}
- (void)replyClickWithcommentCell:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(replyClickWithcommentCell:)]) {
        [self.delegate replyClickWithcommentCell:btn];
    }
}

- (void)reply1ClickWithName1:(NSString *)name1;
{
    LCReplayModel *model = self.CommentFrame.comments.Replay[0];
    if ([self.delegate respondsToSelector:@selector(reply1ClickWithName1:)]) {
        [self.delegate reply1ClickWithName1:model.username];
    }
}

- (void)reply2ClickWithName2:(NSString *)name2;
{
    LCReplayModel *model = self.CommentFrame.comments.Replay[1];
    if ([self.delegate respondsToSelector:@selector(reply1ClickWithName1:)]) {
        [self.delegate reply1ClickWithName1:model.username];
    }
}

#pragma mark 人名点击事件
- (void)reply1TextClick:(UIGestureRecognizer *)gnizer
{
    CGPoint point = [gnizer locationInView:gnizer.view];
    CGRect rect = CGRectMake(0, 0, 50, 20);
    if(CGRectContainsPoint(rect, point))
    {
        NSLog(@"----###");
        // 发送通知或代理
        LCReplayModel *model = self.CommentFrame.comments.Replay[0];
        if ([self.delegate respondsToSelector:@selector(reply1ClickWithName1:)]) {
            [self.delegate reply1ClickWithName1:model.username];
        }

    }
}

- (void)reply2TextClick:(UIGestureRecognizer *)gnizer
{
    CGPoint point = [gnizer locationInView:gnizer.view];
    CGRect rect = CGRectMake(0, 0, 50, 20);
    if(CGRectContainsPoint(rect, point))
    {
        // 发送通知或代理
        NSLog(@"----###");
        LCReplayModel *model = self.CommentFrame.comments.Replay[1];
        if ([self.delegate respondsToSelector:@selector(reply1ClickWithName1:)]) {
            [self.delegate reply1ClickWithName1:model.username];
        }
    }
}

- (void)awakeFromNib {
    // Initialization code
}

//-(void)webViewDidFinishLoad:(UIWebView *)webView
//{
//    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '70%'"];//修改百分比即可
//    NSString * clientheight_str = [webView stringByEvaluatingJavaScriptFromString: @"document.body.offsetHeight"];
//    float clientheight = [clientheight_str floatValue];
//    CGRect frame = webView.frame;
//    frame.size.height = clientheight+10;
//    webView.frame = frame;
//    self.replayIcon.frame = CGRectMake(ScreenWidth-62, CGRectGetMaxY(webView.frame)+10, 16, 16);
//    self.replaynumBtn.frame = CGRectMake(ScreenWidth-43, self.replayIcon.y, 30, 15);
//}

//- (NSString *)ShowEmFace:(NSString *)string
//{
//    NSLog(@"\"");
//    NSString *regex = @"[color=";
//    NSRange range = [string rangeOfString:regex];
//    if (range.location != NSNotFound) {
//        
//        NSLog(@"found at location = %lu, length = %lu",(unsigned long)range.location,(unsigned long)range.length);
//        
//    }else{
//        
//        NSLog(@"Not Found");
//        
//    }
//    string = [string stringByReplacingOccurrencesOfString:regex withString:@"<font color=\""];
//    string = [string stringByReplacingOccurrencesOfString:@"[/color]" withString:@"</font>"];
//    string = [string stringByReplacingOccurrencesOfString:@"]" withString:@"\">"];
////    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
////    [self addSubview:web];
////    [web loadHTMLString:string baseURL:nil];
//    return string;
//}

//- (NSMutableArray *)matchWebLink:(NSString *)pattern{
//    
//    // NSLog(@"go here? go here? go here ?");
//    
//    NSMutableArray *linkArr = [NSMutableArray arrayWithCapacity:0];
//    NSRegularExpression *reg = [[NSRegularExpression alloc] initWithPattern:@"\[color=(?<x>[^\]]*)\](?<y>[^\]]*)\[/color\]" options:NSRegularExpressionDotMatchesLineSeparators error:nil];
//    
//    NSArray* array=[reg matchesInString:pattern options:0 range:NSMakeRange(0, [pattern length])];
//    
//    for( NSTextCheckingResult * result in array){
//        
//        NSString * string=[pattern substringWithRange:result.range];
//        
//        NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:string,NSStringFromRange(result.range), nil];
//        
//        [linkArr addObject:dic];
//    }
//    // NSLog(@"linkArr == %@",linkArr);
//    return linkArr;
//    
//}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
