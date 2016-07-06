//
//  LCBrandTableViewController.m
//  LC
//
//  Created by tarena on 16/7/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LCBrandTableViewController.h"
#import "LCBrandModel.h"
#import "LCBrand.h"


@interface LCBrandTableViewController ()

@property (nonatomic,strong) MJRefreshGifHeader *header;
@property (nonatomic,strong) MJRefreshBackGifFooter *footer;


@property(nonatomic,strong)NSMutableArray *bang;
@end

@implementation LCBrandTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadNewfoot)];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LCBrand" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    self.tableView.backgroundColor=[UIColor blackColor];
}

-(void)loadNewfoot{

    [LCJSON requestJsonDataWithGET:@"http://mobile.iliangcang.com/brand/brandList/?page=1&count=20&app_key=iPhone&v=3.0.0&sig=F1F823FE-BEE8-4BD6-868D-1908BA87BB1A&user_token=24e7262404f89296486f67cf4c90e15a" RequestParameter:nil returnDataWih:^(id data) {
      //  NSLog(@"%@",data);
        
        self.bang = [LCBrandModel arrayOfModelsFromDictionaries:data[@"data"][@"items"] error:nil];
        [self.tableView reloadData];
    }];
    [self.tableView.mj_header endRefreshing];


}

-(void)loadNewData{
    [LCJSON requestJsonDataWithGET:@"http://mobile.iliangcang.com/brand/brandList/?page=1&count=20&app_key=iPhone&v=3.0.0&sig=F1F823FE-BEE8-4BD6-868D-1908BA87BB1A&user_token=24e7262404f89296486f67cf4c90e15a" RequestParameter:nil returnDataWih:^(id data) {
     //   NSLog(@"%@",data);
        
        self.bang = [LCBrandModel arrayOfModelsFromDictionaries:data[@"data"][@"items"] error:nil];
        [self.tableView reloadData];
    }];
        [self.tableView.mj_header endRefreshing];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.bang.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LCBrand *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor blackColor];
    cell.brand = self.bang[indexPath.row];
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 65;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
