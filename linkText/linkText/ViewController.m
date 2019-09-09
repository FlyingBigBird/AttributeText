//
//  ViewController.m
//  linkText
//
//  Created by BaoBaoDaRen on 2019/9/6.
//  Copyright © 2019 Boris. All rights reserved.
//

#import "ViewController.h"
#import "BasicTextView.h"

@interface ViewController ()

@property (nonatomic, strong) NSString * range1;
@property (nonatomic, strong) NSString * range2;
@property (nonatomic, strong) NSString * range3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    BasicTextView *textV = [[BasicTextView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/2)];
    [self.view addSubview:textV];
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(15, SCREEN_HEIGHT / 2, SCREEN_WIDTH - 15, SCREEN_HEIGHT / 2)];
    [self.view addSubview:lab];
    lab.font = [UIFont systemFontOfSize:12];
    lab.textColor = [UIColor blackColor];
    lab.numberOfLines = 0;
    
    self.range1 = @"《游戏协议》";
    self.range2 = @"《游戏隐私守则》";
    self.range3 = @"《中华人民共和国宪法》";
    
    NSMutableAttributedString *attS = [self attributeString:[NSString stringWithFormat:@"我同意%@并严格遵守%@在不违背%@的基础上绿色游戏",self.range1, self.range2, self.range3]];
    lab.attributedText = attS;
    
    
}
- (NSMutableAttributedString *)attributeString:(NSString *)originString
{
    NSMutableAttributedString * attributeS = [[NSMutableAttributedString alloc] initWithString:originString];
    
    // 设置行间距...
    NSMutableParagraphStyle *lineStype = [[NSMutableParagraphStyle alloc] init];
    lineStype.lineSpacing = 15.0;
    NSDictionary *lineDic = @{NSParagraphStyleAttributeName:lineStype};
    [attributeS addAttributes:lineDic range:[originString rangeOfString:originString]];

    // 添加属性...
    NSDictionary * attributes = @{NSForegroundColorAttributeName:[UIColor redColor], NSFontAttributeName:[UIFont systemFontOfSize:16]};
    [attributeS addAttributes:attributes range:[originString rangeOfString:self.range1]];
    
    [attributeS addAttributes:attributes range:[originString rangeOfString:self.range2]];

    [attributeS addAttributes:attributes range:[originString rangeOfString:self.range3]];

    [attributeS addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:[originString rangeOfString:self.range1]];
    
    return attributeS;

}

@end
