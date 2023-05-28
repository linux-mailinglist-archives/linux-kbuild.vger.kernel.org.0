Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22927713757
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 May 2023 02:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbjE1Akg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 May 2023 20:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjE1Akg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 May 2023 20:40:36 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FBADC3
        for <linux-kbuild@vger.kernel.org>; Sat, 27 May 2023 17:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685234434; x=1716770434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I9q0WUfKjPcMQy1cubInPDco145/ZI3ZBQlDR23KigM=;
  b=ZDE0jpMaVv8vXKSaukIYZTju6qYKAGmcfWU9Rv3vNZZWtJl9jLjkxTBW
   PkOhjbUBfzdQ0R3I8upa1rR5u+BVU8rmJpBCgBEV91WwEQ53lQfeB4Lo/
   aR6cfRlG1TopFzjDQtj82NpAfe5n7smWR5IRIhBmq9rVE0TAg25c5HSCB
   l5bxOCfNez3G2uhxfoPO4asQZvOr/ql4YoSTkE6Aw9YEMDH0LbqDScEtM
   Ry7jNan29YhgEu2rGw57D4MMbftyx4lJG3WXm1efKOojflomuX8mrnDh9
   5uanXjfwX/syWX4LqPcKNkYRic+SQVyEFYBKAy7+p2gtM7LDrOucPEVvA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="343962119"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="343962119"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 17:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="683116713"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="683116713"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 May 2023 17:40:32 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q34SV-000KK2-2v;
        Sun, 28 May 2023 00:40:31 +0000
Date:   Sun, 28 May 2023 08:39:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: [masahiroy-kbuild:modpost-v5 23/23]
 arch/x86/kernel/callthunks.c:45:1: sparse: sparse: cast removes address
 space '__percpu' of expression
Message-ID: <202305280830.Rj5ltc9M-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git modpost-v5
head:   952d644bb57db01d034e1faf94519473fbb1a0a1
commit: 952d644bb57db01d034e1faf94519473fbb1a0a1 [23/23] kbuild: implement CONFIG_TRIM_UNUSED_KSYMS without recursion
config: x86_64-randconfig-s053-20230528 (https://download.01.org/0day-ci/archive/20230528/202305280830.Rj5ltc9M-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?id=952d644bb57db01d034e1faf94519473fbb1a0a1
        git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
        git fetch --no-tags masahiroy-kbuild modpost-v5
        git checkout 952d644bb57db01d034e1faf94519473fbb1a0a1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/ kernel/trace/ lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305280830.Rj5ltc9M-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/callthunks.c:45:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/callthunks.c:46:1: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +45 arch/x86/kernel/callthunks.c

e81dc127ef6988 Thomas Gleixner 2022-09-15  39  
f5c1bb2afe9339 Thomas Gleixner 2022-09-15  40  #ifdef CONFIG_CALL_THUNKS_DEBUG
f5c1bb2afe9339 Thomas Gleixner 2022-09-15  41  DEFINE_PER_CPU(u64, __x86_call_count);
f5c1bb2afe9339 Thomas Gleixner 2022-09-15  42  DEFINE_PER_CPU(u64, __x86_ret_count);
f5c1bb2afe9339 Thomas Gleixner 2022-09-15  43  DEFINE_PER_CPU(u64, __x86_stuffs_count);
f5c1bb2afe9339 Thomas Gleixner 2022-09-15  44  DEFINE_PER_CPU(u64, __x86_ctxsw_count);
f5c1bb2afe9339 Thomas Gleixner 2022-09-15 @45  EXPORT_SYMBOL_GPL(__x86_ctxsw_count);
f5c1bb2afe9339 Thomas Gleixner 2022-09-15  46  EXPORT_SYMBOL_GPL(__x86_call_count);
f5c1bb2afe9339 Thomas Gleixner 2022-09-15  47  #endif
f5c1bb2afe9339 Thomas Gleixner 2022-09-15  48  

:::::: The code at line 45 was first introduced by commit
:::::: f5c1bb2afe93396d41c5cbdcb909b08a75b8dde4 x86/calldepth: Add ret/call counting for debug

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
