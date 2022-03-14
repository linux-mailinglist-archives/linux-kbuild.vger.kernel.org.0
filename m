Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2422E4D7D41
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Mar 2022 09:07:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbiCNIIj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Mar 2022 04:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238250AbiCNII1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Mar 2022 04:08:27 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D13062C13B
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Mar 2022 01:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647245237; x=1678781237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wmq+2nELDndHx1nLQlRnhDVX6fwDtkaGap2lECgmvbA=;
  b=jWh9ToHk4cT7tDTvJdIBkWxwvPV4jPk9V2TNCQjFznyCXmzZ8iGvkpU3
   NZsjha1y+xPHk+7tpoMz8tg/eooqyVfDnqKeCqnke3PleUFYERy9WDxA0
   CJBwrJyOcenA3DXHcqQeDE6pJN+qukkmci3uggkfKFfPXBGoMX71Usby9
   JleysMWACX9YK6YeTNENBZyGfqpE6qKycPsc/16qBy+OjJtNMaYcpkEMs
   c0HQccb6zGqr5v5AIjap88CMR+DRLs6Ef7Acpr1Ae3EING4wWzEomUdhq
   1bYEayLLXpXzHNtYsWUZwKHWmQPppSn5XKJ0UIOcPMNT4M1+BW/OA6ZSd
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="253524803"
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; 
   d="scan'208";a="253524803"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 01:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,180,1643702400"; 
   d="scan'208";a="497517748"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Mar 2022 01:07:14 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nTfjW-0009hz-6k; Mon, 14 Mar 2022 08:07:14 +0000
Date:   Mon, 14 Mar 2022 16:06:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Alex Shi <alexs@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Subject: [masahiroy-kbuild:for-next 3/5] arch/arm/mm/copypage-v4mc.c:70:3:
 error: implicit declaration of function '__flush_dcache_page' is invalid in
 C99
Message-ID: <202203141621.9GAoyWx1-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
head:   6c4457c324cd9855352e3eb1f965105901e47a6d
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 [3/5] Kbuild: move to -std=gnu11
config: arm-randconfig-r011-20220313 (https://download.01.org/0day-ci/archive/20220314/202203141621.9GAoyWx1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3e4950d7fa78ac83f33bbf1658e2f49a73719236)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?id=e8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
        git fetch --no-tags masahiroy-kbuild for-next
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm/mm/copypage-v4mc.c:70:3: error: implicit declaration of function '__flush_dcache_page' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   __flush_dcache_page(page_mapping_file(from), from);
                   ^
   arch/arm/mm/copypage-v4mc.c:70:3: note: did you mean 'flush_dcache_page'?
   arch/arm/include/asm/cacheflush.h:292:13: note: 'flush_dcache_page' declared here
   extern void flush_dcache_page(struct page *);
               ^
>> arch/arm/mm/copypage-v4mc.c:74:2: error: implicit declaration of function 'set_top_pte' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           set_top_pte(COPYPAGE_MINICACHE, mk_pte(from, minicache_pgprot));
           ^
>> arch/arm/mm/copypage-v4mc.c:74:34: error: implicit declaration of function 'mk_pte' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           set_top_pte(COPYPAGE_MINICACHE, mk_pte(from, minicache_pgprot));
                                           ^
   arch/arm/mm/copypage-v4mc.c:74:47: error: use of undeclared identifier 'L_PTE_PRESENT'
           set_top_pte(COPYPAGE_MINICACHE, mk_pte(from, minicache_pgprot));
                                                        ^
   arch/arm/mm/copypage-v4mc.c:23:35: note: expanded from macro 'minicache_pgprot'
   #define minicache_pgprot __pgprot(L_PTE_PRESENT | L_PTE_YOUNG | \
                                     ^
   arch/arm/mm/copypage-v4mc.c:74:47: error: use of undeclared identifier 'L_PTE_YOUNG'
   arch/arm/mm/copypage-v4mc.c:23:51: note: expanded from macro 'minicache_pgprot'
   #define minicache_pgprot __pgprot(L_PTE_PRESENT | L_PTE_YOUNG | \
                                                     ^
   arch/arm/mm/copypage-v4mc.c:74:47: error: use of undeclared identifier 'L_PTE_MT_MINICACHE'
   arch/arm/mm/copypage-v4mc.c:24:7: note: expanded from macro 'minicache_pgprot'
                                     L_PTE_MT_MINICACHE)
                                     ^
   arch/arm/mm/copypage-v4mc.c:74:14: error: use of undeclared identifier 'COPYPAGE_MINICACHE'
           set_top_pte(COPYPAGE_MINICACHE, mk_pte(from, minicache_pgprot));
                       ^
   arch/arm/mm/copypage-v4mc.c:76:28: error: use of undeclared identifier 'COPYPAGE_MINICACHE'
           mc_copy_user_page((void *)COPYPAGE_MINICACHE, kto);
                                     ^
   arch/arm/mm/copypage-v4mc.c:64:6: warning: no previous prototype for function 'v4_mc_copy_user_highpage' [-Wmissing-prototypes]
   void v4_mc_copy_user_highpage(struct page *to, struct page *from,
        ^
   arch/arm/mm/copypage-v4mc.c:64:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void v4_mc_copy_user_highpage(struct page *to, struct page *from,
   ^
   static 
   arch/arm/mm/copypage-v4mc.c:86:6: warning: no previous prototype for function 'v4_mc_clear_user_highpage' [-Wmissing-prototypes]
   void v4_mc_clear_user_highpage(struct page *page, unsigned long vaddr)
        ^
   arch/arm/mm/copypage-v4mc.c:86:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void v4_mc_clear_user_highpage(struct page *page, unsigned long vaddr)
   ^
   static 
   arch/arm/mm/copypage-v4mc.c:109:21: error: variable has incomplete type 'struct cpu_user_fns'
   struct cpu_user_fns v4_mc_user_fns __initdata = {
                       ^
   arch/arm/mm/copypage-v4mc.c:109:8: note: forward declaration of 'struct cpu_user_fns'
   struct cpu_user_fns v4_mc_user_fns __initdata = {
          ^
   2 warnings and 9 errors generated.


vim +/__flush_dcache_page +70 arch/arm/mm/copypage-v4mc.c

d2bab05ac1f9a2 Russell King    2005-05-10  63  
7dd8c4f3526b16 Russell King    2009-01-18  64  void v4_mc_copy_user_highpage(struct page *to, struct page *from,
f00a75c094c340 Russell King    2009-10-05  65  	unsigned long vaddr, struct vm_area_struct *vma)
d2bab05ac1f9a2 Russell King    2005-05-10  66  {
5472e862de2bc4 Cong Wang       2011-11-25  67  	void *kto = kmap_atomic(to);
1c9d3df5e88ad7 Richard Purdie  2006-12-30  68  
c01778001a4f5a Catalin Marinas 2010-09-13  69  	if (!test_and_set_bit(PG_dcache_clean, &from->flags))
cb9f753a3731f7 Huang Ying      2018-04-05 @70  		__flush_dcache_page(page_mapping_file(from), from);
1c9d3df5e88ad7 Richard Purdie  2006-12-30  71  
bd31b85960a7fc Thomas Gleixner 2009-07-03  72  	raw_spin_lock(&minicache_lock);
d2bab05ac1f9a2 Russell King    2005-05-10  73  
67ece1443174d8 Russell King    2011-07-02 @74  	set_top_pte(COPYPAGE_MINICACHE, mk_pte(from, minicache_pgprot));
d2bab05ac1f9a2 Russell King    2005-05-10  75  
de27c308223dc9 Russell King    2011-07-02  76  	mc_copy_user_page((void *)COPYPAGE_MINICACHE, kto);
d2bab05ac1f9a2 Russell King    2005-05-10  77  
bd31b85960a7fc Thomas Gleixner 2009-07-03  78  	raw_spin_unlock(&minicache_lock);
063b0a4207e43a Russell King    2008-10-31  79  
5472e862de2bc4 Cong Wang       2011-11-25  80  	kunmap_atomic(kto);
d2bab05ac1f9a2 Russell King    2005-05-10  81  }
d2bab05ac1f9a2 Russell King    2005-05-10  82  

:::::: The code at line 70 was first introduced by commit
:::::: cb9f753a3731f7fe16447bea45cb6f8e8bb432fb mm: fix races between swapoff and flush dcache

:::::: TO: Huang Ying <ying.huang@intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
