# kdTree  
V0  
在做毕业设计时需要用到最近邻搜索，于是利用matlab实现了，kd树的建立以及kd树的最近邻搜索  
算法思路来着[这里](https://www.joinquant.com/post/2843)  
测试已经通过，运行test.m文件，利用kd树搜索得到的最近邻与暴力搜索结果一致。  
V1  
由于matlab中没有指针，导致对树节点属性值的修改没有保留下来，产生了bug。  
利用index代替指针，Cell来模拟内存来存放整棵树，修复bug。  
运行test.m 仿真1000个随机case，错误频次e为0，通过测试