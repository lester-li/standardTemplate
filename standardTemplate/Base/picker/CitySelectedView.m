//
//  ViewController.m
//  03.省市联动
//
//  Created by Apple on 14/12/26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CitySelectedView.h"

@interface CitySelectedView ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *CityPickerView;
@property (weak, nonatomic) IBOutlet UIView *CorverView;

@property (nonatomic,assign)NSInteger indexOfProvice;//当前默认选中的省份
@property (nonatomic,strong) NSArray *PriviceDic;
@property (nonatomic,strong) NSString *selecProvice; // 选中的省份
@property (nonatomic,strong) NSString *selectCity; // 选中的城市区
@property(nonatomic,copy)NSString *AddressStr;
@end



@implementation CitySelectedView

-(void)awakeFromNib
{
    [super awakeFromNib];
    _CityPickerView.delegate = self;
    _CityPickerView.dataSource = self;
    _PriviceDic = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"city" ofType:@"json"]] options:0 error:nil];
    self.indexOfProvice = 0;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(RemoveSelf)];
    [self.CorverView addGestureRecognizer:tap];
    
}
-(void)RemoveSelf
{
    [self removeFromSuperview];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (component == 0) {//省分
        return self.PriviceDic.count;
    }

    NSDictionary *dict = _PriviceDic[self.indexOfProvice];
    NSArray *cities = dict[@"sub"];
    return cities.count;

}

#pragma mark 显示数据
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 0){//显示省份的名字
        NSDictionary *dict = _PriviceDic[row];
        return dict[@"name"];
    }
    
    NSDictionary *dict = _PriviceDic[self.indexOfProvice];
    NSArray *cities = dict[@"sub"];
    NSDictionary *city = cities[row];
    return city[@"name"];
    
}


#pragma mark 选中行

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (component == 0) {//第一列省的选中改变后，就要更新第二列数据
        //更新选中省份的索引
        self.indexOfProvice = row;
        //部份刷新
        [pickerView reloadComponent:1];
        //不管之前第二列选中第几行，重新刷新数据后，都显示每二列的第一行
        [pickerView selectRow:0 inComponent:1 animated:YES];
        self.selecProvice = _PriviceDic[row][@"name"];
        self.selectCity = _PriviceDic[row][@"sub"][0][@"name"];
    }else {
        NSDictionary *dict = _PriviceDic[self.indexOfProvice];
        if (!self.selecProvice) {
            self.selecProvice = _PriviceDic[0][@"name"];
        }
        NSArray *cities = dict[@"sub"];
        NSDictionary *city = cities[row];
        self.selectCity = city[@"name"];
    }
    
}
- (IBAction)FinishBtnClick:(id)sender {
    [self removeFromSuperview];
    if (!self.selecProvice) {
        self.selecProvice = _PriviceDic[0][@"name"];
    }
    if (!self.selectCity) {
         self.selectCity = _PriviceDic[0][@"sub"][0][@"name"];
    }
    self.AddressStr = [NSString stringWithFormat:@"%@%@",self.selecProvice,self.selectCity];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"AddressStrSelected" object:self userInfo:@{@"address":self.AddressStr}];
}

- (IBAction)CancleBtnclick:(id)sender {
    
    [self removeFromSuperview];
}
@end
