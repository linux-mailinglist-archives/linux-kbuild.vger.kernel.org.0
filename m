Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7699E47210E
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Dec 2021 07:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbhLMG1l (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Dec 2021 01:27:41 -0500
Received: from mga04.intel.com ([192.55.52.120]:36861 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232176AbhLMG1k (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Dec 2021 01:27:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639376860; x=1670912860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NzkKDaPqL+cLbXZfMMA1Kk+T1h3ZKqkozdhUr5mEcTk=;
  b=ddTyDGhvXEZ8L8gGirvW0u3JQubps8mLHY+ehmV2inO6zdk5xBXktW+l
   EKhmyh4U7FjHXnKgtKF/gj6tcW41qAx3t4ZX4pIEuKV+beDaQIZqLhzZE
   wpAQlBr/C2FiV7XbfEhJy+JNv05lH5ShmzgVvH8aASXhhDBcxqq5bOG51
   mmyaxYL79TkWOqGXyaVCvPEtDWynOWHJkNg0o/iCfyxOzl3BIWBcHHQPU
   LHdSIMJruj5m4RTFqQlIz0+sD2viVNUDPHVbJPhVeK/tqBqsEP9Zidz5Y
   C4agkdM3wdJzLQ565jgnMOMmD+dMhhMxwnFE9kzkQJclfDAKa5T3o5o5K
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="237406372"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600"; 
   d="scan'208";a="237406372"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2021 22:27:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600"; 
   d="scan'208";a="464506951"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Dec 2021 22:27:39 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mweoE-0006Nf-Aj; Mon, 13 Dec 2021 06:27:38 +0000
Date:   Mon, 13 Dec 2021 14:27:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-kbuild@vger.kernel.org
Subject: [masahiroy-kbuild:testing-kconfig 24/25] scripts/gen_autoksyms.sh:
 1138: include/config/auto.conf: Syntax error: "(" unexpected
Message-ID: <202112131409.xtFaq5U1-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git testing-kconfig
head:   e0b2802c637b32a68e0a9f99fc4bb1102518bf79
commit: 24b17f5f009bd77f46c48645dfd03d430439bd43 [24/25] kbuild: do not quote string values in include/config/auto.conf
config: x86_64-randconfig-a001-20211212 (https://download.01.org/0day-ci/archive/20211213/202112131409.xtFaq5U1-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?id=24b17f5f009bd77f46c48645dfd03d430439bd43
        git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
        git fetch --no-tags masahiroy-kbuild testing-kconfig
        git checkout 24b17f5f009bd77f46c48645dfd03d430439bd43
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> scripts/gen_autoksyms.sh: 1138: include/config/auto.conf: Syntax error: "(" unexpected
   make[1]: *** [Makefile:1151: include/generated/autoksyms.h] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
