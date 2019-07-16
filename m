Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A502C6A27F
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2019 08:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfGPG62 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 02:58:28 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:16696 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbfGPG62 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 02:58:28 -0400
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x6G6w1ge025203;
        Tue, 16 Jul 2019 15:58:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x6G6w1ge025203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563260282;
        bh=VpuCIQ6TiidZdCR31tdcZ8m7j5UvW4ZcpfBpEKHddtw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=b1n/9A72X5+NMXsLXW9BgPJKDdtE/Tp8K8HYJLLh+36rx7nMSGF2R/X9Fr/j+r9QN
         IE71XaCHLwmz7M4eIT301v1y00wDqBCNMIlD3eCj+NauF/HLjatzpgQb3afgPBc5uC
         VVY+7E+OOVH9TPuBYPMin+qdWutXEu7ZKzFSIjEC4EOaNjunZ3sK0uUaDNSdNpA+Fx
         bqERO6H12wWSS3CTRXvmDL51YQj6A7aFj1/EZTO+PO/A4QA2q3cGDdKhTri6quEKBF
         eFedkgCkJTN7URRaDn2RuC7OcAz/0N5iTdKAKfqYQQMyBfYd02limgsy+/o+bv9C8G
         JXFU+86ysQjUg==
X-Nifty-SrcIP: [209.85.222.44]
Received: by mail-ua1-f44.google.com with SMTP id v20so7766140uao.3;
        Mon, 15 Jul 2019 23:58:01 -0700 (PDT)
X-Gm-Message-State: APjAAAWptirU4EA3wsnIO1V+zv+ugOURZzAXOU56Y+7c0AHjgJ3lADiB
        rCFi3UCj7hsixFAa2Vc2URcqsEMxSIAD6GtGMMQ=
X-Google-Smtp-Source: APXvYqwvBt8PTQw5JzKhyOJ2vfsAhZlxoppedpimu4WYMnp3hl6WEcNKI35UuHj3A+dDTpKRYq26qynKqsJ7z4sAtmI=
X-Received: by 2002:ab0:70d9:: with SMTP id r25mr2998280ual.109.1563260280476;
 Mon, 15 Jul 2019 23:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <201907160706.9xUSQ36X%lkp@intel.com>
In-Reply-To: <201907160706.9xUSQ36X%lkp@intel.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 16 Jul 2019 15:57:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNATqxQnen2Tzcici8GnJuc-qNeCYcCYisKM2OkNow1FDnQ@mail.gmail.com>
Message-ID: <CAK7LNATqxQnen2Tzcici8GnJuc-qNeCYcCYisKM2OkNow1FDnQ@mail.gmail.com>
Subject: Re: [kbuild:kbuild 5/19] drivers/atm/eni.o: warning: objtool:
 eni_init_one()+0xe42: indirect call found in RETPOLINE build
To:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Seth Forshee <seth.forshee@canonical.com>
Cc:     kbuild-all@01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

(+ Josh Poimboeuf)

On Tue, Jul 16, 2019 at 8:44 AM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   0ff0c3753e06c0420c80dac1b0187a442b372acb
> commit: 2eaf4e87ba258cc3f27e486cdf32d5ba76303c6f [5/19] kbuild: add -fcf-protection=none to retpoline flags
> config: x86_64-randconfig-s2-07160214 (attached as .config)
> compiler: gcc-4.9 (Debian 4.9.4-2) 4.9.4
> reproduce:
>         git checkout 2eaf4e87ba258cc3f27e486cdf32d5ba76303c6f
>         # save the attached .config to linux build tree
>         make ARCH=x86_64

0-day bot reports objtool warnings with the following applied:
https://patchwork.kernel.org/patch/11037379/

I have no idea about objtool.

Is it better to drop this patch for now?

Thanks.



> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    drivers/atm/eni.o: warning: objtool: eni_do_release()+0x1a: indirect call found in RETPOLINE build
>    drivers/atm/eni.o: warning: objtool: do_tx()+0x1be: indirect call found in RETPOLINE build
>    drivers/atm/eni.o: warning: objtool: eni_send()+0x15b: indirect call found in RETPOLINE build
>    drivers/atm/eni.o: warning: objtool: eni_send()+0x1b4: indirect call found in RETPOLINE build
>    drivers/atm/eni.o: warning: objtool: eni_send()+0x24d: indirect call found in RETPOLINE build
>    drivers/atm/eni.o: warning: objtool: eni_int()+0xd1: indirect call found in RETPOLINE build
>    drivers/atm/eni.o: warning: objtool: poll_rx.isra.16()+0x99: indirect call found in RETPOLINE build
>    drivers/atm/eni.o: warning: objtool: poll_rx.isra.16()+0xf7: indirect call found in RETPOLINE build
>    drivers/atm/eni.o: warning: objtool: poll_rx.isra.16()+0x20c: indirect call found in RETPOLINE build
>    drivers/atm/eni.o: warning: objtool: poll_rx.isra.16()+0x266: indirect call found in RETPOLINE build
>    drivers/atm/eni.o: warning: objtool: eni_ioctl()+0x54: indirect call found in RETPOLINE build
>    drivers/atm/eni.o: warning: objtool: eni_tasklet()+0x3f7: indirect call found in RETPOLINE build
>    drivers/atm/eni.o: warning: objtool: eni_tasklet()+0x420: indirect call found in RETPOLINE build
>    drivers/atm/eni.o: warning: objtool: eni_tasklet()+0x62f: indirect call found in RETPOLINE build
>    drivers/atm/eni.o: warning: objtool: eni_tasklet()+0x673: indirect call found in RETPOLINE build
> >> drivers/atm/eni.o: warning: objtool: eni_init_one()+0xe42: indirect call found in RETPOLINE build
>    drivers/atm/eni.o: warning: objtool: do_rx_dma.constprop.28()+0xaf: indirect call found in RETPOLINE build
>    drivers/atm/eni.o: warning: objtool: do_rx_dma.constprop.28()+0x49c: indirect call found in RETPOLINE build
> --
>    net//batman-adv/sysfs.o: warning: objtool: batadv_show_gw_sel_class()+0x6c: indirect call found in RETPOLINE build
> >> net//batman-adv/sysfs.o: warning: objtool: __batadv_store_uint_attr.isra.9.constprop.10()+0xb7: indirect call found in RETPOLINE build
>    net//batman-adv/sysfs.o: warning: objtool: batadv_store_gw_sel_class()+0x8b: indirect call found in RETPOLINE build
> --
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpower()+0xd7: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpower()+0x257: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpower()+0x2f4: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwretry()+0xfb: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwretry()+0x219: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwretry()+0x2b1: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwfrag()+0xce: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwfrag()+0x1f6: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwfrag()+0x2c8: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwrts()+0xc8: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwrts()+0x1f0: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwrts()+0x2c2: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpmksa()+0x177: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpmksa()+0x288: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpmksa()+0x3ce: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpmksa()+0x4a5: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpmksa()+0x53d: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpmksa()+0x5d5: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpmksa()+0x748: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpmksa()+0x7b5: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpmksa()+0x824: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwrate()+0x1e4: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwrate()+0x2eb: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwrate()+0x413: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wireless_stats()+0x12d: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wireless_stats()+0x2bb: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wireless_stats()+0x36f: indirect call found in RETPOLINE build
> >> net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0x254: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0x4a4: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0x5cb: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0x67e: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0x82f: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0x9f8: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0xac3: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0xc2c: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0xe93: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0xfea: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0x106e: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0x119a: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwencode()+0x237: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwencode()+0x398: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwencode()+0x43c: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwtxpower()+0xcd: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwtxpower()+0x1f2: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwtxpower()+0x309: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwtxpower()+0x113: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwtxpower()+0x268: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwtxpower()+0x34a: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwrate()+0x145: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwrate()+0x262: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwrate()+0x341: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwfreq()+0xd2: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwfreq()+0x242: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwfreq()+0x343: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwap()+0x134: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwap()+0x258: indirect call found in RETPOLINE build
>    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwap()+0x2f1: indirect call found in RETPOLINE build
> --
>     ^
>    include/linux/mm.h:2098:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init pagecache_init(void);
>     ^
>    include/linux/mm.h:2101:3: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>       unsigned long zone_start_pfn, unsigned long *zholes_size);
>       ^
>    include/linux/mm.h:2240:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init mmap_init(void);
>     ^
>    In file included from include/linux/scatterlist.h:8:0,
>                     from include/linux/dma-mapping.h:11,
>                     from include/linux/skbuff.h:30,
>                     from include/linux/if_ether.h:19,
>                     from include/linux/etherdevice.h:20,
>                     from drivers/net/usb/ax88179_178a.c:9:
>    include/linux/mm.h:2892:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     void __init setup_nr_node_ids(void);
>     ^
>    In file included from arch/x86/include/asm/swiotlb.h:5:0,
>                     from arch/x86/include/asm/dma-mapping.h:13,
>                     from include/linux/dma-mapping.h:266,
>                     from include/linux/skbuff.h:30,
>                     from include/linux/if_ether.h:19,
>                     from include/linux/etherdevice.h:20,
>                     from drivers/net/usb/ax88179_178a.c:9:
>    include/linux/swiotlb.h:37:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init swiotlb_update_mem_attributes(void);
>     ^
>    include/linux/swiotlb.h:74:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     void __init swiotlb_exit(void);
>     ^
>    In file included from arch/x86/include/asm/dma-mapping.h:13:0,
>                     from include/linux/dma-mapping.h:266,
>                     from include/linux/skbuff.h:30,
>                     from include/linux/if_ether.h:19,
>                     from include/linux/etherdevice.h:20,
>                     from drivers/net/usb/ax88179_178a.c:9:
>    arch/x86/include/asm/swiotlb.h:9:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern int __init pci_swiotlb_detect_override(void);
>     ^
>    arch/x86/include/asm/swiotlb.h:10:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern int __init pci_swiotlb_detect_4gb(void);
>     ^
>    arch/x86/include/asm/swiotlb.h:11:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init pci_swiotlb_init(void);
>     ^
>    arch/x86/include/asm/swiotlb.h:12:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init pci_swiotlb_late_init(void);
>     ^
>    In file included from arch/x86/include/asm/dma-mapping.h:14:0,
>                     from include/linux/dma-mapping.h:266,
>                     from include/linux/skbuff.h:30,
>                     from include/linux/if_ether.h:19,
>                     from include/linux/etherdevice.h:20,
>                     from drivers/net/usb/ax88179_178a.c:9:
>    include/linux/dma-contiguous.h:84:12: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>                bool fixed);
>                ^
>    In file included from include/linux/skbuff.h:30:0,
>                     from include/linux/if_ether.h:19,
>                     from include/linux/etherdevice.h:20,
>                     from drivers/net/usb/ax88179_178a.c:9:
>    include/linux/dma-mapping.h:627:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     int __init dma_atomic_pool_init(gfp_t gfp, pgprot_t prot);
>     ^
>    In file included from include/linux/seq_file.h:12:0,
>                     from include/linux/seq_file_net.h:5,
>                     from include/net/net_namespace.h:178,
>                     from include/linux/netdevice.h:38,
>                     from include/linux/etherdevice.h:21,
>                     from drivers/net/usb/ax88179_178a.c:9:
>    include/linux/cred.h:168:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init cred_init(void);
>     ^
>    In file included from include/net/net_namespace.h:192:0,
>                     from include/linux/netdevice.h:38,
>                     from include/linux/etherdevice.h:21,
>                     from drivers/net/usb/ax88179_178a.c:9:
>    include/linux/nsproxy.h:74:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     int __init nsproxy_cache_init(void);
>     ^
>    In file included from include/linux/interrupt.h:19:0,
>                     from include/linux/kernel_stat.h:9,
>                     from include/linux/cgroup.h:26,
>                     from include/net/netprio_cgroup.h:11,
>                     from include/linux/netdevice.h:42,
>                     from include/linux/etherdevice.h:21,
>                     from drivers/net/usb/ax88179_178a.c:9:
>    arch/x86/include/asm/irq.h:43:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init init_IRQ(void);
>     ^
>    In file included from include/linux/etherdevice.h:21:0,
>                     from drivers/net/usb/ax88179_178a.c:9:
>    include/linux/netdevice.h:300:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     int __init netdev_boot_setup(char *str);
>     ^
>    include/linux/netdevice.h:4396:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     int __init dev_proc_init(void);
>     ^
> >> drivers/net/usb/ax88179_178a.c:1780:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     module_usb_driver(ax88179_178a_driver);
>     ^
> --
>       ^
>    include/linux/mm.h:2240:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init mmap_init(void);
>     ^
>    In file included from include/linux/scatterlist.h:8:0,
>                     from include/linux/dma-mapping.h:11,
>                     from include/linux/skbuff.h:30,
>                     from include/linux/if_ether.h:19,
>                     from include/uapi/linux/ethtool.h:19,
>                     from include/linux/ethtool.h:18,
>                     from include/linux/netdevice.h:37,
>                     from drivers/net/usb/cdc_ether.c:12:
>    include/linux/mm.h:2892:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     void __init setup_nr_node_ids(void);
>     ^
>    In file included from arch/x86/include/asm/swiotlb.h:5:0,
>                     from arch/x86/include/asm/dma-mapping.h:13,
>                     from include/linux/dma-mapping.h:266,
>                     from include/linux/skbuff.h:30,
>                     from include/linux/if_ether.h:19,
>                     from include/uapi/linux/ethtool.h:19,
>                     from include/linux/ethtool.h:18,
>                     from include/linux/netdevice.h:37,
>                     from drivers/net/usb/cdc_ether.c:12:
>    include/linux/swiotlb.h:37:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init swiotlb_update_mem_attributes(void);
>     ^
>    include/linux/swiotlb.h:74:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     void __init swiotlb_exit(void);
>     ^
>    In file included from arch/x86/include/asm/dma-mapping.h:13:0,
>                     from include/linux/dma-mapping.h:266,
>                     from include/linux/skbuff.h:30,
>                     from include/linux/if_ether.h:19,
>                     from include/uapi/linux/ethtool.h:19,
>                     from include/linux/ethtool.h:18,
>                     from include/linux/netdevice.h:37,
>                     from drivers/net/usb/cdc_ether.c:12:
>    arch/x86/include/asm/swiotlb.h:9:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern int __init pci_swiotlb_detect_override(void);
>     ^
>    arch/x86/include/asm/swiotlb.h:10:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern int __init pci_swiotlb_detect_4gb(void);
>     ^
>    arch/x86/include/asm/swiotlb.h:11:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init pci_swiotlb_init(void);
>     ^
>    arch/x86/include/asm/swiotlb.h:12:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init pci_swiotlb_late_init(void);
>     ^
>    In file included from arch/x86/include/asm/dma-mapping.h:14:0,
>                     from include/linux/dma-mapping.h:266,
>                     from include/linux/skbuff.h:30,
>                     from include/linux/if_ether.h:19,
>                     from include/uapi/linux/ethtool.h:19,
>                     from include/linux/ethtool.h:18,
>                     from include/linux/netdevice.h:37,
>                     from drivers/net/usb/cdc_ether.c:12:
>    include/linux/dma-contiguous.h:84:12: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>                bool fixed);
>                ^
>    In file included from include/linux/skbuff.h:30:0,
>                     from include/linux/if_ether.h:19,
>                     from include/uapi/linux/ethtool.h:19,
>                     from include/linux/ethtool.h:18,
>                     from include/linux/netdevice.h:37,
>                     from drivers/net/usb/cdc_ether.c:12:
>    include/linux/dma-mapping.h:627:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     int __init dma_atomic_pool_init(gfp_t gfp, pgprot_t prot);
>     ^
>    In file included from include/linux/seq_file.h:12:0,
>                     from include/linux/seq_file_net.h:5,
>                     from include/net/net_namespace.h:178,
>                     from include/linux/netdevice.h:38,
>                     from drivers/net/usb/cdc_ether.c:12:
>    include/linux/cred.h:168:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init cred_init(void);
>     ^
>    In file included from include/net/net_namespace.h:192:0,
>                     from include/linux/netdevice.h:38,
>                     from drivers/net/usb/cdc_ether.c:12:
>    include/linux/nsproxy.h:74:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     int __init nsproxy_cache_init(void);
>     ^
>    In file included from include/linux/interrupt.h:19:0,
>                     from include/linux/kernel_stat.h:9,
>                     from include/linux/cgroup.h:26,
>                     from include/net/netprio_cgroup.h:11,
>                     from include/linux/netdevice.h:42,
>                     from drivers/net/usb/cdc_ether.c:12:
>    arch/x86/include/asm/irq.h:43:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init init_IRQ(void);
>     ^
>    In file included from drivers/net/usb/cdc_ether.c:12:0:
>    include/linux/netdevice.h:300:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     int __init netdev_boot_setup(char *str);
>     ^
>    include/linux/netdevice.h:4396:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     int __init dev_proc_init(void);
>     ^
> >> drivers/net/usb/cdc_ether.c:967:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     module_usb_driver(cdc_driver);
>     ^
> --
>       ^
>    include/linux/mm.h:2240:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init mmap_init(void);
>     ^
>    In file included from include/linux/scatterlist.h:8:0,
>                     from include/linux/dma-mapping.h:11,
>                     from include/linux/skbuff.h:30,
>                     from include/linux/if_ether.h:19,
>                     from include/uapi/linux/ethtool.h:19,
>                     from include/linux/ethtool.h:18,
>                     from include/linux/netdevice.h:37,
>                     from drivers/net/usb/smsc75xx.c:10:
>    include/linux/mm.h:2892:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     void __init setup_nr_node_ids(void);
>     ^
>    In file included from arch/x86/include/asm/swiotlb.h:5:0,
>                     from arch/x86/include/asm/dma-mapping.h:13,
>                     from include/linux/dma-mapping.h:266,
>                     from include/linux/skbuff.h:30,
>                     from include/linux/if_ether.h:19,
>                     from include/uapi/linux/ethtool.h:19,
>                     from include/linux/ethtool.h:18,
>                     from include/linux/netdevice.h:37,
>                     from drivers/net/usb/smsc75xx.c:10:
>    include/linux/swiotlb.h:37:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init swiotlb_update_mem_attributes(void);
>     ^
>    include/linux/swiotlb.h:74:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     void __init swiotlb_exit(void);
>     ^
>    In file included from arch/x86/include/asm/dma-mapping.h:13:0,
>                     from include/linux/dma-mapping.h:266,
>                     from include/linux/skbuff.h:30,
>                     from include/linux/if_ether.h:19,
>                     from include/uapi/linux/ethtool.h:19,
>                     from include/linux/ethtool.h:18,
>                     from include/linux/netdevice.h:37,
>                     from drivers/net/usb/smsc75xx.c:10:
>    arch/x86/include/asm/swiotlb.h:9:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern int __init pci_swiotlb_detect_override(void);
>     ^
>    arch/x86/include/asm/swiotlb.h:10:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern int __init pci_swiotlb_detect_4gb(void);
>     ^
>    arch/x86/include/asm/swiotlb.h:11:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init pci_swiotlb_init(void);
>     ^
>    arch/x86/include/asm/swiotlb.h:12:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init pci_swiotlb_late_init(void);
>     ^
>    In file included from arch/x86/include/asm/dma-mapping.h:14:0,
>                     from include/linux/dma-mapping.h:266,
>                     from include/linux/skbuff.h:30,
>                     from include/linux/if_ether.h:19,
>                     from include/uapi/linux/ethtool.h:19,
>                     from include/linux/ethtool.h:18,
>                     from include/linux/netdevice.h:37,
>                     from drivers/net/usb/smsc75xx.c:10:
>    include/linux/dma-contiguous.h:84:12: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>                bool fixed);
>                ^
>    In file included from include/linux/skbuff.h:30:0,
>                     from include/linux/if_ether.h:19,
>                     from include/uapi/linux/ethtool.h:19,
>                     from include/linux/ethtool.h:18,
>                     from include/linux/netdevice.h:37,
>                     from drivers/net/usb/smsc75xx.c:10:
>    include/linux/dma-mapping.h:627:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     int __init dma_atomic_pool_init(gfp_t gfp, pgprot_t prot);
>     ^
>    In file included from include/linux/seq_file.h:12:0,
>                     from include/linux/seq_file_net.h:5,
>                     from include/net/net_namespace.h:178,
>                     from include/linux/netdevice.h:38,
>                     from drivers/net/usb/smsc75xx.c:10:
>    include/linux/cred.h:168:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init cred_init(void);
>     ^
>    In file included from include/net/net_namespace.h:192:0,
>                     from include/linux/netdevice.h:38,
>                     from drivers/net/usb/smsc75xx.c:10:
>    include/linux/nsproxy.h:74:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     int __init nsproxy_cache_init(void);
>     ^
>    In file included from include/linux/interrupt.h:19:0,
>                     from include/linux/kernel_stat.h:9,
>                     from include/linux/cgroup.h:26,
>                     from include/net/netprio_cgroup.h:11,
>                     from include/linux/netdevice.h:42,
>                     from drivers/net/usb/smsc75xx.c:10:
>    arch/x86/include/asm/irq.h:43:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     extern void __init init_IRQ(void);
>     ^
>    In file included from drivers/net/usb/smsc75xx.c:10:0:
>    include/linux/netdevice.h:300:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     int __init netdev_boot_setup(char *str);
>     ^
>    include/linux/netdevice.h:4396:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     int __init dev_proc_init(void);
>     ^
> >> drivers/net/usb/smsc75xx.c:2338:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
>     module_usb_driver(smsc75xx_driver);
>     ^
> ..
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation



--
Best Regards

Masahiro Yamada
