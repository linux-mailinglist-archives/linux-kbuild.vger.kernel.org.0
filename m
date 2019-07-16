Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54EAB6A8DE
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2019 14:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbfGPMnA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 08:43:00 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50837 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbfGPMnA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 08:43:00 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <seth.forshee@canonical.com>)
        id 1hnMnF-0007OA-68
        for linux-kbuild@vger.kernel.org; Tue, 16 Jul 2019 12:42:53 +0000
Received: by mail-io1-f69.google.com with SMTP id c5so23111237iom.18
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jul 2019 05:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vrh6MjttKRJ273Aca+STVEacAIW6FjOkDgvA83mPLDI=;
        b=XFu2bceT1Sq2JP8pUDVEq+5mVeIjenij2K2s9jGQIvFRRwINFEd0LCh/ZllQNmCmig
         UFQgU5MlslCPS6KKgCJ5m0fTZkIHFbGD0fTmhQ1S9JGfCuIS6AinBFYCBqLCYB4o4/2B
         Z8j/U4uwrV1Sxxm6anhb9xMjL9lgGDSbDOShG9aeEBaMkXb7zOtBwo4ntyTwv2Xg5D21
         Lmv1ZA4yw2uDqTwucp0QLgsHNhQdOnyM+TDM1siBSG8nl/syOyi3XgwLR4v5iFnys3/u
         TIZnBg+wlETf2pTJV/8uuNOJiGcTt55jM/0nGAICTn5ycTj31afGOkt0OpQwUtKFDQMQ
         /htA==
X-Gm-Message-State: APjAAAVBmBqesrQEiSN8BWe8acAcRUUyAPE82QoyRqX6sLUN9AR3OVP4
        B87ylxLXCJmoNtP5Nty0qxAHF0aL4gm72uh1EyXvOu8qG9bFRgn7BBVgxOFkKRrLmmGGRc6l9QJ
        2qIjQlIVgjG0urbcSZPYg+7oaB8PhNXuJhJop+6oz+A==
X-Received: by 2002:a5e:820a:: with SMTP id l10mr6558629iom.283.1563280972047;
        Tue, 16 Jul 2019 05:42:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzM3bNUygmuFtcf+pQmFSSJh7gIG/IszUgyLD3ehTxgtY7gdey5PiLfllf7MPxx8rOSQPE8oA==
X-Received: by 2002:a5e:820a:: with SMTP id l10mr6558604iom.283.1563280971621;
        Tue, 16 Jul 2019 05:42:51 -0700 (PDT)
Received: from localhost ([2605:a601:ac2:fb20:31dd:dc66:96d:f1eb])
        by smtp.gmail.com with ESMTPSA id k26sm15605399ios.38.2019.07.16.05.42.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 05:42:50 -0700 (PDT)
Date:   Tue, 16 Jul 2019 07:42:49 -0500
From:   Seth Forshee <seth.forshee@canonical.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>, kbuild-all@01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Subject: Re: [kbuild:kbuild 5/19] drivers/atm/eni.o: warning: objtool:
 eni_init_one()+0xe42: indirect call found in RETPOLINE build
Message-ID: <20190716124249.GP5418@ubuntu-xps13>
References: <201907160706.9xUSQ36X%lkp@intel.com>
 <CAK7LNATqxQnen2Tzcici8GnJuc-qNeCYcCYisKM2OkNow1FDnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATqxQnen2Tzcici8GnJuc-qNeCYcCYisKM2OkNow1FDnQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 16, 2019 at 03:57:24PM +0900, Masahiro Yamada wrote:
> (+ Josh Poimboeuf)
> 
> On Tue, Jul 16, 2019 at 8:44 AM kbuild test robot <lkp@intel.com> wrote:
> >
> > tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> > head:   0ff0c3753e06c0420c80dac1b0187a442b372acb
> > commit: 2eaf4e87ba258cc3f27e486cdf32d5ba76303c6f [5/19] kbuild: add -fcf-protection=none to retpoline flags
> > config: x86_64-randconfig-s2-07160214 (attached as .config)
> > compiler: gcc-4.9 (Debian 4.9.4-2) 4.9.4
> > reproduce:
> >         git checkout 2eaf4e87ba258cc3f27e486cdf32d5ba76303c6f
> >         # save the attached .config to linux build tree
> >         make ARCH=x86_64
> 
> 0-day bot reports objtool warnings with the following applied:
> https://patchwork.kernel.org/patch/11037379/
> 
> I have no idea about objtool.
> 
> Is it better to drop this patch for now?

I'm surprised that the change would have any impact on a build with
gcc-4.9, since -fcf-protection seems to have been introduced in gcc-8. I
guess there's no full build log that would let us see the actual flags
passed to the compiler.

I'll try to reproduce this result. If you think the patch should be
dropped in the meantime, that's fine.

Thanks,
Seth

> 
> Thanks.
> 
> 
> 
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> >    drivers/atm/eni.o: warning: objtool: eni_do_release()+0x1a: indirect call found in RETPOLINE build
> >    drivers/atm/eni.o: warning: objtool: do_tx()+0x1be: indirect call found in RETPOLINE build
> >    drivers/atm/eni.o: warning: objtool: eni_send()+0x15b: indirect call found in RETPOLINE build
> >    drivers/atm/eni.o: warning: objtool: eni_send()+0x1b4: indirect call found in RETPOLINE build
> >    drivers/atm/eni.o: warning: objtool: eni_send()+0x24d: indirect call found in RETPOLINE build
> >    drivers/atm/eni.o: warning: objtool: eni_int()+0xd1: indirect call found in RETPOLINE build
> >    drivers/atm/eni.o: warning: objtool: poll_rx.isra.16()+0x99: indirect call found in RETPOLINE build
> >    drivers/atm/eni.o: warning: objtool: poll_rx.isra.16()+0xf7: indirect call found in RETPOLINE build
> >    drivers/atm/eni.o: warning: objtool: poll_rx.isra.16()+0x20c: indirect call found in RETPOLINE build
> >    drivers/atm/eni.o: warning: objtool: poll_rx.isra.16()+0x266: indirect call found in RETPOLINE build
> >    drivers/atm/eni.o: warning: objtool: eni_ioctl()+0x54: indirect call found in RETPOLINE build
> >    drivers/atm/eni.o: warning: objtool: eni_tasklet()+0x3f7: indirect call found in RETPOLINE build
> >    drivers/atm/eni.o: warning: objtool: eni_tasklet()+0x420: indirect call found in RETPOLINE build
> >    drivers/atm/eni.o: warning: objtool: eni_tasklet()+0x62f: indirect call found in RETPOLINE build
> >    drivers/atm/eni.o: warning: objtool: eni_tasklet()+0x673: indirect call found in RETPOLINE build
> > >> drivers/atm/eni.o: warning: objtool: eni_init_one()+0xe42: indirect call found in RETPOLINE build
> >    drivers/atm/eni.o: warning: objtool: do_rx_dma.constprop.28()+0xaf: indirect call found in RETPOLINE build
> >    drivers/atm/eni.o: warning: objtool: do_rx_dma.constprop.28()+0x49c: indirect call found in RETPOLINE build
> > --
> >    net//batman-adv/sysfs.o: warning: objtool: batadv_show_gw_sel_class()+0x6c: indirect call found in RETPOLINE build
> > >> net//batman-adv/sysfs.o: warning: objtool: __batadv_store_uint_attr.isra.9.constprop.10()+0xb7: indirect call found in RETPOLINE build
> >    net//batman-adv/sysfs.o: warning: objtool: batadv_store_gw_sel_class()+0x8b: indirect call found in RETPOLINE build
> > --
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpower()+0xd7: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpower()+0x257: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpower()+0x2f4: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwretry()+0xfb: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwretry()+0x219: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwretry()+0x2b1: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwfrag()+0xce: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwfrag()+0x1f6: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwfrag()+0x2c8: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwrts()+0xc8: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwrts()+0x1f0: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwrts()+0x2c2: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpmksa()+0x177: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpmksa()+0x288: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpmksa()+0x3ce: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpmksa()+0x4a5: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpmksa()+0x53d: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpmksa()+0x5d5: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpmksa()+0x748: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpmksa()+0x7b5: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwpmksa()+0x824: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwrate()+0x1e4: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwrate()+0x2eb: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwrate()+0x413: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wireless_stats()+0x12d: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wireless_stats()+0x2bb: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wireless_stats()+0x36f: indirect call found in RETPOLINE build
> > >> net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0x254: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0x4a4: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0x5cb: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0x67e: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0x82f: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0x9f8: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0xac3: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0xc2c: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0xe93: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0xfea: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0x106e: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_set_encryption()+0x119a: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwencode()+0x237: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwencode()+0x398: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwencode()+0x43c: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwtxpower()+0xcd: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwtxpower()+0x1f2: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwtxpower()+0x309: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwtxpower()+0x113: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwtxpower()+0x268: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwtxpower()+0x34a: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwrate()+0x145: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwrate()+0x262: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwrate()+0x341: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwfreq()+0xd2: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwfreq()+0x242: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwfreq()+0x343: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwap()+0x134: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwap()+0x258: indirect call found in RETPOLINE build
> >    net//wireless/wext-compat.o: warning: objtool: cfg80211_wext_siwap()+0x2f1: indirect call found in RETPOLINE build
> > --
> >     ^
> >    include/linux/mm.h:2098:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init pagecache_init(void);
> >     ^
> >    include/linux/mm.h:2101:3: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >       unsigned long zone_start_pfn, unsigned long *zholes_size);
> >       ^
> >    include/linux/mm.h:2240:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init mmap_init(void);
> >     ^
> >    In file included from include/linux/scatterlist.h:8:0,
> >                     from include/linux/dma-mapping.h:11,
> >                     from include/linux/skbuff.h:30,
> >                     from include/linux/if_ether.h:19,
> >                     from include/linux/etherdevice.h:20,
> >                     from drivers/net/usb/ax88179_178a.c:9:
> >    include/linux/mm.h:2892:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     void __init setup_nr_node_ids(void);
> >     ^
> >    In file included from arch/x86/include/asm/swiotlb.h:5:0,
> >                     from arch/x86/include/asm/dma-mapping.h:13,
> >                     from include/linux/dma-mapping.h:266,
> >                     from include/linux/skbuff.h:30,
> >                     from include/linux/if_ether.h:19,
> >                     from include/linux/etherdevice.h:20,
> >                     from drivers/net/usb/ax88179_178a.c:9:
> >    include/linux/swiotlb.h:37:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init swiotlb_update_mem_attributes(void);
> >     ^
> >    include/linux/swiotlb.h:74:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     void __init swiotlb_exit(void);
> >     ^
> >    In file included from arch/x86/include/asm/dma-mapping.h:13:0,
> >                     from include/linux/dma-mapping.h:266,
> >                     from include/linux/skbuff.h:30,
> >                     from include/linux/if_ether.h:19,
> >                     from include/linux/etherdevice.h:20,
> >                     from drivers/net/usb/ax88179_178a.c:9:
> >    arch/x86/include/asm/swiotlb.h:9:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern int __init pci_swiotlb_detect_override(void);
> >     ^
> >    arch/x86/include/asm/swiotlb.h:10:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern int __init pci_swiotlb_detect_4gb(void);
> >     ^
> >    arch/x86/include/asm/swiotlb.h:11:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init pci_swiotlb_init(void);
> >     ^
> >    arch/x86/include/asm/swiotlb.h:12:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init pci_swiotlb_late_init(void);
> >     ^
> >    In file included from arch/x86/include/asm/dma-mapping.h:14:0,
> >                     from include/linux/dma-mapping.h:266,
> >                     from include/linux/skbuff.h:30,
> >                     from include/linux/if_ether.h:19,
> >                     from include/linux/etherdevice.h:20,
> >                     from drivers/net/usb/ax88179_178a.c:9:
> >    include/linux/dma-contiguous.h:84:12: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >                bool fixed);
> >                ^
> >    In file included from include/linux/skbuff.h:30:0,
> >                     from include/linux/if_ether.h:19,
> >                     from include/linux/etherdevice.h:20,
> >                     from drivers/net/usb/ax88179_178a.c:9:
> >    include/linux/dma-mapping.h:627:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     int __init dma_atomic_pool_init(gfp_t gfp, pgprot_t prot);
> >     ^
> >    In file included from include/linux/seq_file.h:12:0,
> >                     from include/linux/seq_file_net.h:5,
> >                     from include/net/net_namespace.h:178,
> >                     from include/linux/netdevice.h:38,
> >                     from include/linux/etherdevice.h:21,
> >                     from drivers/net/usb/ax88179_178a.c:9:
> >    include/linux/cred.h:168:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init cred_init(void);
> >     ^
> >    In file included from include/net/net_namespace.h:192:0,
> >                     from include/linux/netdevice.h:38,
> >                     from include/linux/etherdevice.h:21,
> >                     from drivers/net/usb/ax88179_178a.c:9:
> >    include/linux/nsproxy.h:74:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     int __init nsproxy_cache_init(void);
> >     ^
> >    In file included from include/linux/interrupt.h:19:0,
> >                     from include/linux/kernel_stat.h:9,
> >                     from include/linux/cgroup.h:26,
> >                     from include/net/netprio_cgroup.h:11,
> >                     from include/linux/netdevice.h:42,
> >                     from include/linux/etherdevice.h:21,
> >                     from drivers/net/usb/ax88179_178a.c:9:
> >    arch/x86/include/asm/irq.h:43:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init init_IRQ(void);
> >     ^
> >    In file included from include/linux/etherdevice.h:21:0,
> >                     from drivers/net/usb/ax88179_178a.c:9:
> >    include/linux/netdevice.h:300:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     int __init netdev_boot_setup(char *str);
> >     ^
> >    include/linux/netdevice.h:4396:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     int __init dev_proc_init(void);
> >     ^
> > >> drivers/net/usb/ax88179_178a.c:1780:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     module_usb_driver(ax88179_178a_driver);
> >     ^
> > --
> >       ^
> >    include/linux/mm.h:2240:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init mmap_init(void);
> >     ^
> >    In file included from include/linux/scatterlist.h:8:0,
> >                     from include/linux/dma-mapping.h:11,
> >                     from include/linux/skbuff.h:30,
> >                     from include/linux/if_ether.h:19,
> >                     from include/uapi/linux/ethtool.h:19,
> >                     from include/linux/ethtool.h:18,
> >                     from include/linux/netdevice.h:37,
> >                     from drivers/net/usb/cdc_ether.c:12:
> >    include/linux/mm.h:2892:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     void __init setup_nr_node_ids(void);
> >     ^
> >    In file included from arch/x86/include/asm/swiotlb.h:5:0,
> >                     from arch/x86/include/asm/dma-mapping.h:13,
> >                     from include/linux/dma-mapping.h:266,
> >                     from include/linux/skbuff.h:30,
> >                     from include/linux/if_ether.h:19,
> >                     from include/uapi/linux/ethtool.h:19,
> >                     from include/linux/ethtool.h:18,
> >                     from include/linux/netdevice.h:37,
> >                     from drivers/net/usb/cdc_ether.c:12:
> >    include/linux/swiotlb.h:37:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init swiotlb_update_mem_attributes(void);
> >     ^
> >    include/linux/swiotlb.h:74:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     void __init swiotlb_exit(void);
> >     ^
> >    In file included from arch/x86/include/asm/dma-mapping.h:13:0,
> >                     from include/linux/dma-mapping.h:266,
> >                     from include/linux/skbuff.h:30,
> >                     from include/linux/if_ether.h:19,
> >                     from include/uapi/linux/ethtool.h:19,
> >                     from include/linux/ethtool.h:18,
> >                     from include/linux/netdevice.h:37,
> >                     from drivers/net/usb/cdc_ether.c:12:
> >    arch/x86/include/asm/swiotlb.h:9:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern int __init pci_swiotlb_detect_override(void);
> >     ^
> >    arch/x86/include/asm/swiotlb.h:10:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern int __init pci_swiotlb_detect_4gb(void);
> >     ^
> >    arch/x86/include/asm/swiotlb.h:11:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init pci_swiotlb_init(void);
> >     ^
> >    arch/x86/include/asm/swiotlb.h:12:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init pci_swiotlb_late_init(void);
> >     ^
> >    In file included from arch/x86/include/asm/dma-mapping.h:14:0,
> >                     from include/linux/dma-mapping.h:266,
> >                     from include/linux/skbuff.h:30,
> >                     from include/linux/if_ether.h:19,
> >                     from include/uapi/linux/ethtool.h:19,
> >                     from include/linux/ethtool.h:18,
> >                     from include/linux/netdevice.h:37,
> >                     from drivers/net/usb/cdc_ether.c:12:
> >    include/linux/dma-contiguous.h:84:12: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >                bool fixed);
> >                ^
> >    In file included from include/linux/skbuff.h:30:0,
> >                     from include/linux/if_ether.h:19,
> >                     from include/uapi/linux/ethtool.h:19,
> >                     from include/linux/ethtool.h:18,
> >                     from include/linux/netdevice.h:37,
> >                     from drivers/net/usb/cdc_ether.c:12:
> >    include/linux/dma-mapping.h:627:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     int __init dma_atomic_pool_init(gfp_t gfp, pgprot_t prot);
> >     ^
> >    In file included from include/linux/seq_file.h:12:0,
> >                     from include/linux/seq_file_net.h:5,
> >                     from include/net/net_namespace.h:178,
> >                     from include/linux/netdevice.h:38,
> >                     from drivers/net/usb/cdc_ether.c:12:
> >    include/linux/cred.h:168:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init cred_init(void);
> >     ^
> >    In file included from include/net/net_namespace.h:192:0,
> >                     from include/linux/netdevice.h:38,
> >                     from drivers/net/usb/cdc_ether.c:12:
> >    include/linux/nsproxy.h:74:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     int __init nsproxy_cache_init(void);
> >     ^
> >    In file included from include/linux/interrupt.h:19:0,
> >                     from include/linux/kernel_stat.h:9,
> >                     from include/linux/cgroup.h:26,
> >                     from include/net/netprio_cgroup.h:11,
> >                     from include/linux/netdevice.h:42,
> >                     from drivers/net/usb/cdc_ether.c:12:
> >    arch/x86/include/asm/irq.h:43:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init init_IRQ(void);
> >     ^
> >    In file included from drivers/net/usb/cdc_ether.c:12:0:
> >    include/linux/netdevice.h:300:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     int __init netdev_boot_setup(char *str);
> >     ^
> >    include/linux/netdevice.h:4396:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     int __init dev_proc_init(void);
> >     ^
> > >> drivers/net/usb/cdc_ether.c:967:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     module_usb_driver(cdc_driver);
> >     ^
> > --
> >       ^
> >    include/linux/mm.h:2240:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init mmap_init(void);
> >     ^
> >    In file included from include/linux/scatterlist.h:8:0,
> >                     from include/linux/dma-mapping.h:11,
> >                     from include/linux/skbuff.h:30,
> >                     from include/linux/if_ether.h:19,
> >                     from include/uapi/linux/ethtool.h:19,
> >                     from include/linux/ethtool.h:18,
> >                     from include/linux/netdevice.h:37,
> >                     from drivers/net/usb/smsc75xx.c:10:
> >    include/linux/mm.h:2892:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     void __init setup_nr_node_ids(void);
> >     ^
> >    In file included from arch/x86/include/asm/swiotlb.h:5:0,
> >                     from arch/x86/include/asm/dma-mapping.h:13,
> >                     from include/linux/dma-mapping.h:266,
> >                     from include/linux/skbuff.h:30,
> >                     from include/linux/if_ether.h:19,
> >                     from include/uapi/linux/ethtool.h:19,
> >                     from include/linux/ethtool.h:18,
> >                     from include/linux/netdevice.h:37,
> >                     from drivers/net/usb/smsc75xx.c:10:
> >    include/linux/swiotlb.h:37:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init swiotlb_update_mem_attributes(void);
> >     ^
> >    include/linux/swiotlb.h:74:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     void __init swiotlb_exit(void);
> >     ^
> >    In file included from arch/x86/include/asm/dma-mapping.h:13:0,
> >                     from include/linux/dma-mapping.h:266,
> >                     from include/linux/skbuff.h:30,
> >                     from include/linux/if_ether.h:19,
> >                     from include/uapi/linux/ethtool.h:19,
> >                     from include/linux/ethtool.h:18,
> >                     from include/linux/netdevice.h:37,
> >                     from drivers/net/usb/smsc75xx.c:10:
> >    arch/x86/include/asm/swiotlb.h:9:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern int __init pci_swiotlb_detect_override(void);
> >     ^
> >    arch/x86/include/asm/swiotlb.h:10:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern int __init pci_swiotlb_detect_4gb(void);
> >     ^
> >    arch/x86/include/asm/swiotlb.h:11:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init pci_swiotlb_init(void);
> >     ^
> >    arch/x86/include/asm/swiotlb.h:12:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init pci_swiotlb_late_init(void);
> >     ^
> >    In file included from arch/x86/include/asm/dma-mapping.h:14:0,
> >                     from include/linux/dma-mapping.h:266,
> >                     from include/linux/skbuff.h:30,
> >                     from include/linux/if_ether.h:19,
> >                     from include/uapi/linux/ethtool.h:19,
> >                     from include/linux/ethtool.h:18,
> >                     from include/linux/netdevice.h:37,
> >                     from drivers/net/usb/smsc75xx.c:10:
> >    include/linux/dma-contiguous.h:84:12: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >                bool fixed);
> >                ^
> >    In file included from include/linux/skbuff.h:30:0,
> >                     from include/linux/if_ether.h:19,
> >                     from include/uapi/linux/ethtool.h:19,
> >                     from include/linux/ethtool.h:18,
> >                     from include/linux/netdevice.h:37,
> >                     from drivers/net/usb/smsc75xx.c:10:
> >    include/linux/dma-mapping.h:627:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     int __init dma_atomic_pool_init(gfp_t gfp, pgprot_t prot);
> >     ^
> >    In file included from include/linux/seq_file.h:12:0,
> >                     from include/linux/seq_file_net.h:5,
> >                     from include/net/net_namespace.h:178,
> >                     from include/linux/netdevice.h:38,
> >                     from drivers/net/usb/smsc75xx.c:10:
> >    include/linux/cred.h:168:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init cred_init(void);
> >     ^
> >    In file included from include/net/net_namespace.h:192:0,
> >                     from include/linux/netdevice.h:38,
> >                     from drivers/net/usb/smsc75xx.c:10:
> >    include/linux/nsproxy.h:74:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     int __init nsproxy_cache_init(void);
> >     ^
> >    In file included from include/linux/interrupt.h:19:0,
> >                     from include/linux/kernel_stat.h:9,
> >                     from include/linux/cgroup.h:26,
> >                     from include/net/netprio_cgroup.h:11,
> >                     from include/linux/netdevice.h:42,
> >                     from drivers/net/usb/smsc75xx.c:10:
> >    arch/x86/include/asm/irq.h:43:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     extern void __init init_IRQ(void);
> >     ^
> >    In file included from drivers/net/usb/smsc75xx.c:10:0:
> >    include/linux/netdevice.h:300:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     int __init netdev_boot_setup(char *str);
> >     ^
> >    include/linux/netdevice.h:4396:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     int __init dev_proc_init(void);
> >     ^
> > >> drivers/net/usb/smsc75xx.c:2338:1: warning: '__indirect_branch__' attribute directive ignored [-Wattributes]
> >     module_usb_driver(smsc75xx_driver);
> >     ^
> > ..
> >
> > ---
> > 0-DAY kernel test infrastructure                Open Source Technology Center
> > https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 
> 
> 
> --
> Best Regards
> 
> Masahiro Yamada
