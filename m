Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBAD547223F
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Dec 2021 09:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232809AbhLMITn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Dec 2021 03:19:43 -0500
Received: from mga17.intel.com ([192.55.52.151]:3580 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231514AbhLMITm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Dec 2021 03:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639383582; x=1670919582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CcZ6j7wZRf+2nO2/s1OWKAqqclg5MMxFBTOMiZbC45I=;
  b=DW1zPGlIITPQkfX2x521OWGxU6/2MI8tYGJrOkRV/piZQHPvmV2XTo08
   5qtb/Q3b0YY53s0wvXHJSedmOB4SOCNxJEBFo8Uqd8ansf8l3acUWnTuZ
   11TlzA+3ShWG6dsfs0LOmcouJN5NUMrrQ3rBzOZI/6RUJpz5rluaDof7P
   XIbEgDStx+lrSyd+TKwBD+gW41qBjQHE39hf928ovP77byEmxxSUACh/2
   F4BkIzNLmOg+avMTDDDJ4kzhVGVi44Xk/Xl02pjJ+D+mjQMeSt53HcJyw
   KBXKwjT1KJSINLZQxQtRYnrrJ+pisakyetLjFmtwuUBEzjSlx9AskUjhq
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="219368214"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; 
   d="scan'208";a="219368214"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 00:19:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; 
   d="scan'208";a="481436005"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Dec 2021 00:19:41 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mwgYe-0006SQ-Dp; Mon, 13 Dec 2021 08:19:40 +0000
Date:   Mon, 13 Dec 2021 16:18:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-kbuild@vger.kernel.org
Subject: [masahiroy-kbuild:testing-kconfig 24/25] scripts/gen_autoksyms.sh:
 1526: include/config/auto.conf: Syntax error: "(" unexpected
Message-ID: <202112131617.gF1CreGQ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git testing-kconfig
head:   e0b2802c637b32a68e0a9f99fc4bb1102518bf79
commit: 24b17f5f009bd77f46c48645dfd03d430439bd43 [24/25] kbuild: do not quote string values in include/config/auto.conf
config: x86_64-randconfig-a003-20211213 (https://download.01.org/0day-ci/archive/20211213/202112131617.gF1CreGQ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?id=24b17f5f009bd77f46c48645dfd03d430439bd43
        git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
        git fetch --no-tags masahiroy-kbuild testing-kconfig
        git checkout 24b17f5f009bd77f46c48645dfd03d430439bd43
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> scripts/gen_autoksyms.sh: 1526: include/config/auto.conf: Syntax error: "(" unexpected
   make[1]: *** [Makefile:1151: include/generated/autoksyms.h] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
