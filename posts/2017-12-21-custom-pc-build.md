---
layout: post
title: Custom PC build, new things and mistakes
subtitle: ""
date: 2017-12-21 07:59:44.000000000 +05:30
categories:
- technical
tags:
- posts
- motherboard
- PCI
- M2
- Crossfire
- SLI
- Intel 300 series
- Z370
- Overclock
status: publish
type: post
mathML: true
published: true
author: Venkateshwar
header-img: "img/home-bg.jpg"
---


I was confused whether to buy a laptop (_which comes will all goodies_) or a custom PC build (_which is, altogether, an opposite of laptop_). First, I thought to go with a laptop but then decided to make my own budget custom PC build on friend's suggestion. 

> Disclaimer: This article is my experience / journey I went through to create my own custom PC build. This isn't a Nutshell like article which explains everything instead it just covers things I came to know from my own requirement.

Here is the preface of what I learned. I might have missed many things but at least, I hope I covered the fundamentals:

- DDR4
- M.2
- SLI motherboards
- Z series motherboards
- Processor with suffix "K"
- Gsync and Free sync monitors
- SSD, HDD and SSHD
- Crossfire and SLI
- Overclocking

First or all, we just can't take any motherboard, processor, GPU, cooler, SMPS etc and assemble to form a PC. That would be completely unethical or opposite of wise (stupid?).

Being myself a toddler in this technical field of PC components, I started reading articles where authors used to form budget and premium PCs with components which are compatible with each other. I wondered how they are selecting those components. The names of those components are also like `ZLPXBULLSHT`, `7600uk` etc.. There might be some common pattern in that stupid names and yes there is.. read on.

I needed a fast processor which could work for at least more 3 years easily. So, in my case, I decided not to compromise and go with the latest (_as of this writing_) Intel processor i7 8th generation (_There is also i9 category processors which are just unnecessarily premium with just more cores, makes no sense_). Then I realized there are some model numbers even in 8th generation. I just chose the latest one which is `i7 8700` but there is also a variant in it i.e `i7 8700k`. On my research, I realized that the suffix `k` stands for overclocking feature i.e we can increase the performance speed of the processor with help of motherboard. Not with any motherboard but a `Z` series one. Also, the 8th generation processors need a motherboard which is above `300` series. So while buying a motherboard, I need to look out for model number something like `Z3XX` for compatibility. 

Then being a gamer, I decided to go with `GTX 1050ti` GPU (_since it is affordable and runs my games like CS GO, Witcher 3, GTA 5 and Skyrim smooth enough for better experience_). Keeping the future scope in mind where I could possibly attach more GPUs to my motherboard, I researched on this topic, where I found that pairing/bridging of two or more GPUs is known as `SLI` (_in case of Nvidia_) and `Crossfire` (_in case of AMD GPUs_). Not all motherboards support these type of pairing, only the motherboards which have `SLI` or `Crossfire` mentioned in their model number does that i.e a model number like `Z3XX SLI` or `Z3XX Crossfire` (_few motherboards have option for both `SLI` and `Crossfire` labels_). 

So, the motherboard to go with is `Z3XX SLI` (_as I opt for Nvidia_). Also, I chose `DDR4` because it consumes lesser power than `DDR3`. 

> Note: No matter how much you consider the future scope, these brands know how to cut it down. Take the case of introducing new 300 series motherboards which are only compatible with the 8th generation processors not the ones below 300 series (_not even `X299` which are premium motherboards_)

Since here I am considering a processor which could be overclocked and also a beast like GPU (_Rat when compared to [Titan](https://www.nvidia.com/en-us/titan/titan-v/)_). So, it is better not to compromise on Cooling system. 

Now, coming to `M.2`, it is actually the latest way where the data transfer rate is faster compare to older methods like `SATA`. Usually, this can be helpful to reduce boot time (~10 sec) of the system. Since, I was fine with higher boot time (i.e around 1 min), I opted not to have `SSD` for now but definitely considered that the Motherboard is `M.2` compatible. There is also Hybrid version of both `SSD` and `HDD` known as `SSHD` where I didn't look much out.

**Edit**: I purchased `Samsung Evo 970 M.2 NVMe 2280` SSD. I opted for this as the benchmarks are really astonishing. The boot time definitely got under 10 secs. Not only just boot time but also starting of apps got faster. You could never go back to exclude SSD once you have it in your life. FYI, the `2280` is series which states something like your Motherboard should be compatible with M.2 NVMe (_check motherboard manual_) and must have a 22 mm width X 80 mm of height slot on motherboard, to keep the SSD. There are other lesser length variants as well. Also, I bought a 4TB HDD (_I listed below_).

And when I was browsing through monitors, I came to know that there are two types of gaming monitors i.e G-Sync (Nvidia) and FreeSync (AMD). These methods are used to reduce the screen tearing because of higher FPS. I would suggest to read articles to know more about it. At last, one thing I concluded is that G-Sync monitors are too expensive compare to budget monitors which are usually FreeSync. So, decided to go with Freesync monitor.

And here is my custom build's configuration:

| Type | Brand/Model name | Price |
| ------ | ----- | --------: |
| 650W SMPS  (= switched-mode power supply) | CORSAIR SMPS VS650 - 650 WATT PSU WITH ACTIVE PFC	CP-9020098-UK |	Rs.4,300 |
| Cooling system | COOLER MASTER CPU AIR COOLER HYPER 212X	RR-212X-20PM-R1	|	Rs.2,850 |
| 16GB RAM | CORSAIR DESKTOP RAM VENGEANCE LPX SERIES - 16GB (16GBx1) DDR4 DRAM 3000MHz BLACK (CMK16GX4M1B3000C15)	CMK16GX4M1B3000C15	|	Rs.13,000 |
| GTX 1050ti GPU | ZOTAC GRAPHICS CARD PASCAL SERIES - GTX 1050 TI 4GB GDDR5 (ZT-P10510A-10L)	ZT-P10510A-10L |	Rs.11,500 |
| i7-8700k CPU | INTEL PROCESSOR CORE i7-8700K (INTEL 8TH GEN, LGA1151 SOCKET, 12M CACHE, UP TO 4.70 GHz)	i7-8700K	|	Rs.29,600 |
| Motherboard | GIGABYTE MOTHERBOARD Z370M-D3H (INTEL SOCKET 1151/8TH GENERATION CORE SERIES CPU/MAX 64GB DDR4-4000MHZ MEMORY)	Z370M-D3H	| Rs.11,300 |
| 1TB HDD | I had a spare | - |
| 4TB HDD | Seagate 4TB Barracuda SATA 6Gb/s 256MB Cache Desktop 3.5 Inch Internal Hard Drive | Rs. 8,899 |
| Computer case | Zebronics | Rs. 1,500 |
| UPS | Intex | Rs. 1,500 |
| 29" ultra-wide monitor | LG 21:9 Ultrawide 29UM59 29-inch Monitor (Black) | Rs. 20,995 |
| SSD | Samsung 970 Evo 500GB NVMe PCIeM.2 2280 SSD | Rs. 11,799 |

I bought most of the above components from mdcomputers.com where the prices were lower compared to Flipkart and Amazon. Also, the delivery was fast (got in two days!!).

Things I messed in above configuration are:
- I didn't go with SLI compatible Motherboard. I came to know about SLI after assembling the components (_I could have still returned the component but opted not to_). Anyway, the motherboard is still compatible with Crossfire. (Edit: SLI is actually supported only with few selected GPUs, here is the [list](https://www.geforce.com/hardware/technology/sli/supported-gpus))
- I should have selected a better cooling system i.e probably a liquid cooling system because the configuration which I bought has a CPU and Motherboard which can be overclocked which means more heat. Although, the existing cooling system is fine if I don't overclock.
