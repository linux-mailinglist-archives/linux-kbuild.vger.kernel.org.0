Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94D1D73D517
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jun 2023 00:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjFYWr7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 25 Jun 2023 18:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjFYWr6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Jun 2023 18:47:58 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3B7193
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Jun 2023 15:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687733277; x=1719269277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l2Rds53clA/kX4JvW6ikULRTVhSqHxiFKC6JARQFmyA=;
  b=RQurJwGZ2PTqxsDIc9Nz0QQwUds4kH5gHM8Tg8z+Aimub+An/udSqBRN
   1+cE4p/LD03ob25ApGuBaVtmvIAN19cC/yvxJiW0lxujBmB0vkA9DqSwe
   YrksFKiyJVj3xBx9O43W3QwFhjh72I4uWRweQ9PudPPihHtY+E9BKzSb+
   Akr8d3Nkbh+Q9dMwKIPtvdw/lKRyNmwmL8gRZel32iW9usNdzHSUmtzGd
   qKpiek0jvOmYfjtXB6pvUOWDMc2L+S1m5/6mcTxlOvUaH4EpVj6D8Mth5
   RQgOoqBdTInuQoGPSjsa/Nao8WRo6on7Mi6RyITkux3pDhpq4BIqRJx8V
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="350898119"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="350898119"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 15:47:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="805808598"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="805808598"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Jun 2023 15:47:55 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qDYWQ-000AKv-12;
        Sun, 25 Jun 2023 22:47:54 +0000
Date:   Mon, 26 Jun 2023 06:47:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: [masahiroy-kbuild:kbuild 67/71] Makefile:36:
 /tools/scripts/Makefile.arch: No such file or directory
Message-ID: <202306260604.jAB4uQed-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
head:   2b3951b65a1e13aa15d30a803510be08075cae40
commit: f48e05d84f217ec1e7e379f184af119fc75a45e8 [67/71] kbuild: unexport abs_srctree and abs_objtree
config: microblaze-randconfig-r026-20230626 (https://download.01.org/0day-ci/archive/20230626/202306260604.jAB4uQed-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306260604.jAB4uQed-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306260604.jAB4uQed-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Makefile:36: /tools/scripts/Makefile.arch: No such file or directory
>> make[4]: *** No rule to make target '/tools/scripts/Makefile.arch'.  Stop.
   make[3]: *** [Makefile:63: tools/bpf/resolve_btfids//libbpf/libbpf.a] Error 2
   make[3]: *** Waiting for unfinished jobs....
   make[2]: *** [Makefile:76: bpf/resolve_btfids] Error 2 shuffle=1513993084
   make[1]: *** [Makefile:1422: tools/bpf/resolve_btfids] Error 2 shuffle=1513993084
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2 shuffle=1513993084
   make: Target 'prepare' not remade because of errors.


vim +36 Makefile

87d599fc3955e5 Masahiro Yamada 2022-12-13  17  
121c2a137767df Masahiro Yamada 2020-05-11  18  $(if $(filter __%, $(MAKECMDGOALS)), \
121c2a137767df Masahiro Yamada 2020-05-11  19  	$(error targets prefixed with '__' are only for internal use))
121c2a137767df Masahiro Yamada 2020-05-11  20  
ba634eceb535d9 Masahiro Yamada 2017-10-04  21  # That's our default target when none is given on the command line
121c2a137767df Masahiro Yamada 2020-05-11  22  PHONY := __all
121c2a137767df Masahiro Yamada 2020-05-11  23  __all:
ba634eceb535d9 Masahiro Yamada 2017-10-04  24  
^1da177e4c3f41 Linus Torvalds  2005-04-16  25  # We are using a recursive build, so we need to do a little thinking
^1da177e4c3f41 Linus Torvalds  2005-04-16  26  # to get the ordering right.
^1da177e4c3f41 Linus Torvalds  2005-04-16  27  #
^1da177e4c3f41 Linus Torvalds  2005-04-16  28  # Most importantly: sub-Makefiles should only ever modify files in
^1da177e4c3f41 Linus Torvalds  2005-04-16  29  # their own directory. If in some directory we have a dependency on
^1da177e4c3f41 Linus Torvalds  2005-04-16  30  # a file in another dir (which doesn't happen often, but it's often
f49821ee32b76b Nicholas Piggin 2018-02-11  31  # unavoidable when linking the built-in.a targets which finally
^1da177e4c3f41 Linus Torvalds  2005-04-16  32  # turn into vmlinux), we will call a sub make in that other dir, and
^1da177e4c3f41 Linus Torvalds  2005-04-16  33  # after that we are sure that everything which is in that other dir
^1da177e4c3f41 Linus Torvalds  2005-04-16  34  # is now up to date.
^1da177e4c3f41 Linus Torvalds  2005-04-16  35  #
^1da177e4c3f41 Linus Torvalds  2005-04-16 @36  # The only cases where we need to modify files which have global
^1da177e4c3f41 Linus Torvalds  2005-04-16  37  # effects are thus separated out and done before the recursive
^1da177e4c3f41 Linus Torvalds  2005-04-16  38  # descending is started. They are now explicitly listed as the
^1da177e4c3f41 Linus Torvalds  2005-04-16  39  # prepare rule.
^1da177e4c3f41 Linus Torvalds  2005-04-16  40  

:::::: The code at line 36 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
