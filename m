Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C83858BAF3
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Aug 2022 15:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234249AbiHGNRi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 7 Aug 2022 09:17:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233212AbiHGNRf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Aug 2022 09:17:35 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB9226428
        for <linux-kbuild@vger.kernel.org>; Sun,  7 Aug 2022 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659878254; x=1691414254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5LkY7sPBU10nuctFmocWNxR2VcDfO7Fiu4f6zRwFdfY=;
  b=jyO9MJ3PYNj70v6uBfxa/d++m7B1pp4J9XXVW0TIydcsvnb7jDnrpt0m
   4cdfxi6Ymv+MnT9F5A5OLKGa1khkm5QGRdH3fSuhshrkgx70OIWOWaxwJ
   YpHUfBiSJsvpwhtthE+fmTDJd8LPSk+PDmOGtL5qqkz7D2mwbRUF4Xmjm
   fMD6s/m8MoevdFumVw72Wdyel678WqbcOECmrL3khU68ue30hfl+GmQ3K
   iWj+u3fs9ygO7bMC8KQbekJwgL/fQ21wOaS723KfeBDsFxYb6RPc7NU94
   dvbpoLiB4d5s3LSi2RscsRA4yvWafFLWkLvF9gwAp8l88h9a7TOYoR/+O
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="270823274"
X-IronPort-AV: E=Sophos;i="5.93,220,1654585200"; 
   d="scan'208";a="270823274"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2022 06:17:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,220,1654585200"; 
   d="scan'208";a="931735581"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Aug 2022 06:17:33 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oKg9s-000LJl-2P;
        Sun, 07 Aug 2022 13:17:32 +0000
Date:   Sun, 7 Aug 2022 21:16:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-kbuild@vger.kernel.org
Subject: [masahiroy-kbuild:modpost-wip 26/40] kernel/foo.c:13:6: warning: no
 previous prototype for 'foo_register'
Message-ID: <202208072106.I92R3WA8-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git modpost-wip
head:   d37b0bfa125f03dbeb16ee01480bd6d8a69e7ac0
commit: 70ec473283598a6d32c3a36014bae676a5feb39b [26/40] [please ignore] kbuild local test (please ignore 0-day bot report)
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20220807/202208072106.I92R3WA8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?id=70ec473283598a6d32c3a36014bae676a5feb39b
        git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
        git fetch --no-tags masahiroy-kbuild modpost-wip
        git checkout 70ec473283598a6d32c3a36014bae676a5feb39b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/foo.c:13:6: warning: no previous prototype for 'foo_register' [-Wmissing-prototypes]
      13 | void foo_register(void)
         |      ^~~~~~~~~~~~
>> kernel/foo.c:22:13: warning: no previous prototype for 'hoge' [-Wmissing-prototypes]
      22 | void __init hoge(void)
         |             ^~~~
--
>> kernel/bar.c:10:5: warning: no previous prototype for 'bar' [-Wmissing-prototypes]
      10 | int bar(int *x)
         |     ^~~


vim +/foo_register +13 kernel/foo.c

    12	
  > 13	void foo_register(void)
    14	{
    15		bar(&foo.y);
    16	}
    17	
    18	struct table {
    19		void (*callback)(void);
    20	};
    21	
  > 22	void __init hoge(void)
    23	{}
    24	EXPORT_SYMBOL(hoge);
    25	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
