Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 443502FE231
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 07:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbhAUGAq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 01:00:46 -0500
Received: from mga02.intel.com ([134.134.136.20]:50716 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728816AbhAUDFH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 22:05:07 -0500
IronPort-SDR: ZV7uFLbO9MaOj80qPYUqJ+3iSGKgkVZsJf7Qmzg3dn4JQyUx6le7GyfM+9cMGuRcPUvdBuNrdb
 sZCeAMGOdJrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="166307493"
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; 
   d="gz'50?scan'50,208,50";a="166307493"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2021 19:03:20 -0800
IronPort-SDR: qqwqpyj5Rbih42kax/cDixjOJ/PeuaQUPqMD+Y5nylmegm4fpDaUiTmEI9Lejz4yFWGVjBBuWl
 wrEdizgMVt8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; 
   d="gz'50?scan'50,208,50";a="391774093"
Received: from lkp-server01.sh.intel.com (HELO 260eafd5ecd0) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Jan 2021 19:03:19 -0800
Received: from kbuild by 260eafd5ecd0 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l2QFi-0006Bn-Lj; Thu, 21 Jan 2021 03:03:18 +0000
Date:   Thu, 21 Jan 2021 11:02:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-kbuild@vger.kernel.org
Subject: [kbuild:testing3 3/3] scripts/Makefile.clean:14:
 arch/sh/boards/Makefile: No such file or directory
Message-ID: <202101211136.c0eatyxc-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git testing3
head:   e04a6f917656dc5aab2a15a6bc3a8debb158e3d2
commit: e04a6f917656dc5aab2a15a6bc3a8debb158e3d2 [3/3] kbuild: prefix $(srctree)/ to included Makefiles in the source tree
config: sh-rts7751r2d1_defconfig (attached as .config)
compiler: sh4-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?id=e04a6f917656dc5aab2a15a6bc3a8debb158e3d2
        git remote add kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
        git fetch --no-tags kbuild testing3
        git checkout e04a6f917656dc5aab2a15a6bc3a8debb158e3d2
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=sh 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   scripts/Makefile.clean:14: Documentation/Makefile: No such file or directory
   make[2]: *** No rule to make target 'Documentation/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'Documentation/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_Documentation] Error 2
>> scripts/Makefile.clean:14: arch/sh/boards/Makefile: No such file or directory
>> make[2]: *** No rule to make target 'arch/sh/boards/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'arch/sh/boards/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_arch/sh/boards] Error 2
>> scripts/Makefile.clean:14: arch/sh/boot/dts/Makefile: No such file or directory
>> make[2]: *** No rule to make target 'arch/sh/boot/dts/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'arch/sh/boot/dts/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_arch/sh/boot/dts] Error 2
>> scripts/Makefile.clean:14: arch/sh/cchips/hd6446x/Makefile: No such file or directory
>> make[2]: *** No rule to make target 'arch/sh/cchips/hd6446x/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'arch/sh/cchips/hd6446x/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_arch/sh/cchips/hd6446x] Error 2
>> scripts/Makefile.clean:14: arch/sh/drivers/Makefile: No such file or directory
>> make[2]: *** No rule to make target 'arch/sh/drivers/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'arch/sh/drivers/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_arch/sh/drivers] Error 2
>> scripts/Makefile.clean:14: arch/sh/kernel/Makefile: No such file or directory
>> make[2]: *** No rule to make target 'arch/sh/kernel/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'arch/sh/kernel/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_arch/sh/kernel] Error 2
>> scripts/Makefile.clean:14: arch/sh/lib/Makefile: No such file or directory
>> make[2]: *** No rule to make target 'arch/sh/lib/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'arch/sh/lib/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_arch/sh/lib] Error 2
>> scripts/Makefile.clean:14: arch/sh/math-emu/Makefile: No such file or directory
>> make[2]: *** No rule to make target 'arch/sh/math-emu/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'arch/sh/math-emu/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_arch/sh/math-emu] Error 2
>> scripts/Makefile.clean:14: arch/sh/mm/Makefile: No such file or directory
>> make[2]: *** No rule to make target 'arch/sh/mm/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'arch/sh/mm/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_arch/sh/mm] Error 2
>> scripts/Makefile.clean:14: arch/sh/oprofile/Makefile: No such file or directory
>> make[2]: *** No rule to make target 'arch/sh/oprofile/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'arch/sh/oprofile/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_arch/sh/oprofile] Error 2
   scripts/Makefile.clean:14: block/Makefile: No such file or directory
   make[2]: *** No rule to make target 'block/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'block/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_block] Error 2
   scripts/Makefile.clean:14: certs/Makefile: No such file or directory
   make[2]: *** No rule to make target 'certs/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'certs/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_certs] Error 2
   scripts/Makefile.clean:14: crypto/Makefile: No such file or directory
   make[2]: *** No rule to make target 'crypto/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'crypto/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_crypto] Error 2
   scripts/Makefile.clean:14: drivers/Makefile: No such file or directory
   make[2]: *** No rule to make target 'drivers/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'drivers/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_drivers] Error 2
   scripts/Makefile.clean:14: fs/Makefile: No such file or directory
   make[2]: *** No rule to make target 'fs/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'fs/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_fs] Error 2
   scripts/Makefile.clean:14: init/Makefile: No such file or directory
   make[2]: *** No rule to make target 'init/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'init/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_init] Error 2
   scripts/Makefile.clean:14: ipc/Makefile: No such file or directory
   make[2]: *** No rule to make target 'ipc/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'ipc/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_ipc] Error 2
   scripts/Makefile.clean:14: kernel/Makefile: No such file or directory
   make[2]: *** No rule to make target 'kernel/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'kernel/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_kernel] Error 2
   scripts/Makefile.clean:14: lib/Makefile: No such file or directory
   make[2]: *** No rule to make target 'lib/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'lib/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_lib] Error 2
   scripts/Makefile.clean:14: mm/Makefile: No such file or directory
   make[2]: *** No rule to make target 'mm/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'mm/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_mm] Error 2
   scripts/Makefile.clean:14: net/Makefile: No such file or directory
   make[2]: *** No rule to make target 'net/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'net/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_net] Error 2
   scripts/Makefile.clean:14: samples/Makefile: No such file or directory
   make[2]: *** No rule to make target 'samples/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'samples/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_samples] Error 2
   scripts/Makefile.clean:14: security/Makefile: No such file or directory
   make[2]: *** No rule to make target 'security/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'security/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_security] Error 2
   scripts/Makefile.clean:14: sound/Makefile: No such file or directory
   make[2]: *** No rule to make target 'sound/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'sound/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_sound] Error 2
   scripts/Makefile.clean:14: usr/Makefile: No such file or directory
   make[2]: *** No rule to make target 'usr/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'usr/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_usr] Error 2
   scripts/Makefile.clean:14: virt/Makefile: No such file or directory
   make[2]: *** No rule to make target 'virt/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'virt/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1803: _clean_virt] Error 2
>> scripts/Makefile.clean:14: arch/sh/boot/Makefile: No such file or directory
>> make[2]: *** No rule to make target 'arch/sh/boot/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'arch/sh/boot/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [arch/sh/Makefile:208: archclean] Error 2
   scripts/Makefile.clean:14: scripts/Makefile: No such file or directory
   make[2]: *** No rule to make target 'scripts/Makefile'.
   scripts/Makefile.clean:11: scripts/Kbuild.include: No such file or directory
   make[2]: *** No rule to make target 'scripts/Kbuild.include'.
   make[2]: Failed to remake makefile 'scripts/Makefile'.
   make[2]: Failed to remake makefile 'scripts/Kbuild.include'.
   make[1]: *** [Makefile:1498: _mrproper_scripts] Error 2
   make[1]: Target 'distclean' not remade because of errors.
   make: *** [Makefile:176: __sub-make] Error 2
   make: Target 'distclean' not remade because of errors.


vim +14 scripts/Makefile.clean

2315c6e4227815 Sam Ravnborg    2005-07-25  12  
2a691470345a00 Sam Ravnborg    2005-07-25  13  # The filename Kbuild has precedence over Makefile
90b7ccac106945 Masahiro Yamada 2021-01-21 @14  include $(if $(wildcard $(src)/Kbuild),$(src)/Kbuild,$(src)/Makefile)
^1da177e4c3f41 Linus Torvalds  2005-04-16  15  

:::::: The code at line 14 was first introduced by commit
:::::: 90b7ccac106945e95f3d6c0d74333ca8f5ee9a12 [build test] kbuild: $(srctree)/$(src) -> $(src)

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--GvXjxJ+pjyke8COw
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
0fbnaFbtNtXT6HG5+lVvHv74H+fMYdkm/wAA

--GvXjxJ+pjyke8COw--
