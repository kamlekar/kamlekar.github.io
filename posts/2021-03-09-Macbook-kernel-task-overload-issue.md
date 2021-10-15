---
layout: post
title: Macbook kernel_task overloading issue
subtitle: ""
date: 2021-03-09 11:59:44.000000000 +05:30
categories:
- technical
tags:
- posts
- macbook
- kernel
- task
- overloading
- 100%
- Bottleneck
status: published
type: post
published: true
author: Venkateshwar
header-img: "img/home-bg.jpg"
---

> Disclaimer: This article is more as a quick check for me to go through if such situation happened again. Hopefully, this will be helpful to others as well.

From the last five days, I was noticing my macbook pro was sluggish. It was very hard to work with. When I checked the activity monitor, I saw `kernel_task` cpu process was around 1000%. This is too much and clearly the obvious reason for sluggishness of the system.

When I googled, I found that `kernel_task` overloads when the CPU overheats or by some software app where if kernel assumes that CPU might get overheat and take necessary precautions. 

Though I fixed this issue the hard way(_by downgrading the OS_), the following could have been the possible culprits which I realised later:
- VS Code - Running VS code in Workspace (_showing two or more projects in same space_)
- Again VS Code - Many extensions. Though having more extensions was not my intention, looks like this automatically happened when I decided to sync my settings by signing in (_It synced with my Home PC VS code settings, including extensions - somehow I had many extensions which I never bothered cleaning as it is not an issue on Windows_)
- Really the CPU is overheating - This I checked and it wasn't that hot to declare as overheating in any sense. But maybe only by touch we can't know this.
- Maybe because of recent Big sur update? 
- I observed, it was only happening while the system is charging (_tested on all ports_).

I connected with online apple tech support. We did the following:
- [Reset the SMC](https://support.apple.com/en-in/HT201295)
- [Reset the NVRAM](https://support.apple.com/en-in/HT204063)
- Remove any login items in usergroups
- Check once in [safe mode](https://support.apple.com/en-in/guide/mac-help/mh21245/mac)

When all this didn't work, we decided to re-install OS and if that too doesn't work, we were in plan of hard resetting the whole system (_wiping the whole data_)

> To re-install OS, press <kbd>Command</kbd> + <kbd>Option</kbd> + <kbd>R</kbd> while rebooting the system, till a globe is seen.

But unfortunately, the re-install of OS didn't work. It was failing continuously with network connectivity issue. So, next day I visited nearest authorised service centre.

When I tested at the centre, strangely, the `kernel_task` was overloading only on 2nd port of left side of the laptop. This wasn't the case before. And also, the system got way faster than before (_when charging on other ports_). Maybe this got a bit fixed by above reset steps which I will never know. But anyway, the tech support person recommended better to downgrade the OS version and reset the data. We did the same which actually fixed the issue. I wish there was better solution than downgrading the OS but the tech support person stated that they are seeing many similar issues when users upgraded the OS to Big sur. 

I feel this might not be the only possible solution as I could have followed this [stackoverflow link](https://apple.stackexchange.com/a/363933) when I realised that the issue is only when charging and on the left side's 2nd port of the laptop. Or just clean the dust by opening the laptop as suggested in this [article](https://discussions.apple.com/thread/3693588?answerId=17841142022#17841142022). But anyway I was in no state of experimenting at that point. Now as a precaution, I bought a [coolingpad](https://www.amazon.in/dp/B08NYR6GMM/ref=cm_sw_em_r_mt_dp_JFZ6HNJSQKKS1F1DX3PX?_encoding=UTF8&psc=1) to keep the CPU cool. 

