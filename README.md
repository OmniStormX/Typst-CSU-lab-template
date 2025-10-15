# 中南大学实验报告 Typst 模版

* 支持自动生成封面
* 支持自动生成目录
* 支持简单的 Block 排列
* 支持自动生成标题编号
* 支持自动记录时间

# 使用教程

* git clone 该项目到本地，然后在 template 文件夹所在的位置编写 typst 文件。

* 导入 `#import "template/template.typ" : * `
* 写入 project 基本信息以用于生成封面和目录。
* 然后就像用 markdown 一样使用就可以了。


样例：

````rust
#import "template/template.typ" : * 

#show: project.with(
  name : "your-name",
  class:"计科xxxx班",
  number: "student number",
  header:"project-title",
  teacher:"teacher"
)


== Code 

```


// 使用 showybox 函数

// #pagebreak()

== Display 

=== 作业一


#grid(
  columns: 2,
  gutter: 1em,
  [
    #BlueBlock("原图", image("assets/test.png"))
  ],
  [
    #BlueBlock("灰度图", image("assets/gray.png"))
  ],
  [
    #BlueBlock("二值化", image("assets/binary.png"))
  ],
  [
    #BlueBlock("均值化", image("assets/average.png"))
  ]
)

=== 作业二

#BlueBlock("4邻域连通区域标记（connected component labeling, CCL 输出", 
align(center)[```txt
[0, 0, 1, 0, 0, 0, 2, 3]
[0, 0, 1, 0, 2, 0, 2, 3]
[0, 0, 0, 0, 2, 2, 2, 3]
[2, 2, 2, 2, 2, 2, 2, 3]
[4, 4, 4, 4, 2, 5, 2, 3]
[6, 6, 6, 4, 2, 5, 2, 3]
[4, 4, 4, 4, 2, 2, 2, 3]
[4, 4, 4, 4, 2, 3, 3, 3]
```]
)
````

