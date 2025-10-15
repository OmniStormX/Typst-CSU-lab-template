#set document(title: "My Report")

#import "@preview/showybox:2.0.4": showybox
#import "@preview/codly:1.3.0" : *

#let fonts = (
    "Source Han Serif",
    "Source Han Serif CN",
    "New Computer Modern",
    "Georgia",
    "Nimbus Roman No9 L",
    "Songti SC",
    "Noto Serif CJK SC",
    "STSong",
    "AR PL New Sung",
    "AR PL SungtiL GB",
    "NSimSun",
    "SimSun",
    "TW\-Sung",
    "WenQuanYi Bitmap Song",
    "AR PL UMing CN",
    "AR PL UMing HK",
    "AR PL UMing TW",
    "AR PL UMing TW MBE",
    "PMingLiU",
    "MingLiU",
)

#let UnderLine(body) = underline(stroke: (thickness: 1pt), body)

#let Header(level, body) = {
  align(center)[
    #box(
      inset: (
        bottom: 2em,
      ),
      text(weight: 900, size: 2em)[#body]
    )
  ]
}

#let line-box(body) = box(
  inset: 0.5em, 
  width: 1fr,
  stroke: (
    bottom: (
      thickness: 1pt, // 下划线的粗细
      paint: black,   // 下划线的颜色
    ),
    top: none,
    left: none,
    right: none,
  ),
)[
  #body
]
#let noline-box(body) = box(
  inset: 0.5em, 
  width: 30%,
)[
  #align(left)[
    #body
  ]
]

#let InfoDisplay(project) = {
  set text(font: "Source Han Serif", size: 1.3em)
  align(center)[
  #box(
    width:300pt, 
    inset: (
      left:0pt
    ),
  )[
    #align(
      center
    )[
      #if (project.name != none) {
        noline-box()[姓$space.quad space.quad$名：]; line-box()[#project.name]
      }

      #if (project.college != none) {
        noline-box()[学$space.quad space.quad$院：]; line-box()[#project.college]
      }

      #if (project.class != none) {
        noline-box()[班$space.quad space.quad$级：]; line-box()[#project.class]
      }

      #if (project.number != none ) {
        noline-box()[学$space.quad space.quad$号：];
        line-box()[#project.number]
      }
      
      #if (project.teacher != none) {
        noline-box()[指导老师：]; line-box()[#project.teacher]
      }
      
      #if (project.time != none) {
        noline-box()[时$space.quad space.quad$间：]; line-box()[#project.time]
      }
    ]
  ]
]

}

#let project(
  name: none,
  class: none,
  number: none,
  header:  none,
  teacher: none,
  college: none, 
  menu: false,
  heading-number: false,
  time : none, 
  add-header: false,
  body
) = {
  show: codly-init.with()
  codly(
      zebra-fill: none,
      stroke: 1pt + gray
  )
  set text(
    font: fonts,
    size: 12pt,
  )



  // show 
  show raw: set text(font: "Fira Code")

  align(center)[
    #image("./img/校徽.jpg", width: 80%)
  ]
  align(center)[
    #image("./img/CSU.png", width: 40%)
  ]



  Header(1)[#text(weight: "bold")[#header]]
  InfoDisplay((
    name: name,
    class: class,
    number: number,
    header:  header,
    teacher: teacher,
    college: college,
    time: time
  ))
  pagebreak()

  if (menu == true) {
    outline(
      title: align(center)[#text(1.2em, "目  录")] ,
      depth: 3
    )
    pagebreak()
  }
  
  show heading: it => block(above: 1.8em, below: 1.2em, it)
  show heading.where(level: 1): it => block(
      above: 1.5em, 
      below: 1em, 
      width: 100%,
      {
        set text(size: 2em)
        align(left)[#it]
      }
  )
  counter(page).update(1)
  set page(
  footer: context { 
    set text(size: 0.8em)
    align(center)[第 #counter(page).display() 页] 
  },
  header: context {
    
    if (add-header == true) {
        v(1cm)
        align(bottom + center)[
        #stack(dir: ltr)[#image("./img/校徽.jpg", width: 8%)][#align(horizon)[#image("./img/CSU.png", width: 12%)]]
      ]
        line(length: 100%)
    }
  }
)
  if heading-number {    
    set heading(
      numbering: (..args) => {
        let nums = args.pos()
        if nums.len() == 1 {
          return none
        } else if nums.len() == 2 {
          return numbering("一、", ..nums.slice(1))
        } else {
          return numbering("1.1.", ..nums.slice(1))
        }
      },
    )
    body
  } else {
    set heading(numbering: none)
    body
  }
}


#let set-report-style() = [
  #show raw: set text(font: "Fira code", size: 14pt)
]

#set text(
  font: "GeorGia",
  size: 14pt
)


#let color = blue;
#let BlueBlock(title, ..args) = showybox(
  title: title,
  frame: (
      border-color: color,
      title-color: color.lighten(20%),
      body-color: color.lighten(95%),
      footer-color: color.lighten(80%),
  ),
  ..args
)

