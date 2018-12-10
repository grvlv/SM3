//
//  ViewController.m
//  SM3
//
//  Created by GRV on 2018/12/7.
//  Copyright © 2018 GRV. All rights reserved.
//

#import "ViewController.h"
#import "NSString+sm3.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) UITableView *table;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height) style:UITableViewStylePlain];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    
    _data = @[@"abc", @"abcdef", @"abc@123", @"13579", @"245810", @"ceshi", @"test", @"ceshi*123456", @"1q2w3e4r5t6y7u", @"A1s2d3f4g5h6"];
    for (NSString *text in _data) {
        NSData *data = [text sm3Data];
        NSString *sm3 = [[text sm3] uppercaseString];
        NSLog(@"\ndata:%@,\nstring:%@", data, sm3);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    NSString *text = _data[indexPath.row];
    cell.textLabel.text = text;
    cell.detailTextLabel.text = [[text sm3] uppercaseString];
    cell.detailTextLabel.numberOfLines = 0;
    return cell;
}

@end
