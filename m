Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A29767B608A
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Oct 2023 07:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjJCFxv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Oct 2023 01:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjJCFxv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Oct 2023 01:53:51 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4531FB3
        for <linux-kbuild@vger.kernel.org>; Mon,  2 Oct 2023 22:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696312428; x=1727848428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4zdrk7J2w1LgYAVJBlEmo1IB0YmGvC2AJqDkd4Nyzq4=;
  b=k3Yb7KfJchLDpPGuJRl4gUE+rXD9dlK6Aphp5K6RxYF3cxD2oYEZTbh6
   W7uHKGmRCN88ezFBV4xnFpddO9HfG7ayCPxD82Z9GiRWcrUWJxiaYSYJR
   JICtBXxn8itVjIrNEwGm1/Hw5H4VzTvNcNKhjJZfyj2ZMS7/FuZWKCG7n
   6t7cHA5wt4SnsJer3qzyUGZc2rZ67c5WSsBBtkakxUyi+ydasIAPF0VJv
   VSu5lPLbiCkPBtbZ4EvF5I5fQ1ONwJq8tQBBXCZ7t3C8naB4Rr4eGVogh
   PJ+2Chv8ZKuuxcTT+lG/N/wZCgqe24eahNHd82J8JSShXiF3OdWXCg0rN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="469072271"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="469072271"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 22:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="744371160"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="744371160"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 02 Oct 2023 22:53:43 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qnYLk-0006on-2S;
        Tue, 03 Oct 2023 05:53:40 +0000
Date:   Tue, 3 Oct 2023 13:53:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Nathan Chancellor <nathan@kernel.org>, masahiroy@kernel.org
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        ndesaulniers@google.com, keescook@chromium.org,
        samitolvanen@google.com, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, patches@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] kbuild: Enable
 -Wincompatible-function-pointer-types-strict in W=1
Message-ID: <202310031340.v1vPh207-lkp@intel.com>
References: <20231002-enable-wincompatible-function-pointer-types-strict-w-1-v1-1-808ab955d42d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002-enable-wincompatible-function-pointer-types-strict-w-1-v1-1-808ab955d42d@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Nathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ce9ecca0238b140b88f43859b211c9fdfd8e5b70]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Chancellor/kbuild-Enable-Wincompatible-function-pointer-types-strict-in-W-1/20231003-062107
base:   ce9ecca0238b140b88f43859b211c9fdfd8e5b70
patch link:    https://lore.kernel.org/r/20231002-enable-wincompatible-function-pointer-types-strict-w-1-v1-1-808ab955d42d%40kernel.org
patch subject: [PATCH] kbuild: Enable -Wincompatible-function-pointer-types-strict in W=1
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231003/202310031340.v1vPh207-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310031340.v1vPh207-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310031340.v1vPh207-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/um/drivers/net_kern.c:9:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from arch/um/drivers/net_kern.c:9:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from arch/um/drivers/net_kern.c:9:
   In file included from include/linux/memblock.h:13:
   In file included from arch/um/include/asm/dma.h:5:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> arch/um/drivers/net_kern.c:353:21: warning: incompatible function pointer types initializing 'netdev_tx_t (*)(struct sk_buff *, struct net_device *)' (aka 'enum netdev_tx (*)(struct sk_buff *, struct net_device *)') with an expression of type 'int (struct sk_buff *, struct net_device *)' [-Wincompatible-function-pointer-types-strict]
     353 |         .ndo_start_xmit         = uml_net_start_xmit,
         |                                   ^~~~~~~~~~~~~~~~~~
   13 warnings generated.


vim +353 arch/um/drivers/net_kern.c

2e3f5251ac7168 Jeff Dike          2007-05-06  349  
8bb95b39a16ed5 Stephen Hemminger  2009-03-26  350  static const struct net_device_ops uml_netdev_ops = {
8bb95b39a16ed5 Stephen Hemminger  2009-03-26  351  	.ndo_open 		= uml_net_open,
8bb95b39a16ed5 Stephen Hemminger  2009-03-26  352  	.ndo_stop 		= uml_net_close,
8bb95b39a16ed5 Stephen Hemminger  2009-03-26 @353  	.ndo_start_xmit 	= uml_net_start_xmit,
afc4b13df14312 Jiri Pirko         2011-08-16  354  	.ndo_set_rx_mode	= uml_net_set_multicast_list,
8bb95b39a16ed5 Stephen Hemminger  2009-03-26  355  	.ndo_tx_timeout 	= uml_net_tx_timeout,
9337057d433505 Boaz Harrosh       2010-09-29  356  	.ndo_set_mac_address	= eth_mac_addr,
8bb95b39a16ed5 Stephen Hemminger  2009-03-26  357  	.ndo_validate_addr	= eth_validate_addr,
dd71dc4c335a89 Richard Weinberger 2011-07-25  358  #ifdef CONFIG_NET_POLL_CONTROLLER
dd71dc4c335a89 Richard Weinberger 2011-07-25  359  	.ndo_poll_controller = uml_net_poll_controller,
dd71dc4c335a89 Richard Weinberger 2011-07-25  360  #endif
8bb95b39a16ed5 Stephen Hemminger  2009-03-26  361  };
8bb95b39a16ed5 Stephen Hemminger  2009-03-26  362  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
