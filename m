Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 896E559ADF6
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Aug 2022 14:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231551AbiHTMlJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 20 Aug 2022 08:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiHTMlI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 Aug 2022 08:41:08 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77A8272EC2
        for <linux-kbuild@vger.kernel.org>; Sat, 20 Aug 2022 05:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660999267; x=1692535267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ntfKm+ihwx3yBC1J1dSXr022qGvCR+TzZB/u4oTfNrE=;
  b=SfYFSWnB4Ld92x/IscpcIdbZY9tNLPuJx7xUBwvTeAzkFl/SsttNdiNv
   F8nWjT0Be2MnKO2LlZsJmxycOdH6EaKUQWsSGlxGaC4qo5q2jtkA0ZeY5
   siSDjWVdV783BM8WjuEERC/r7ILJaGPvAXXHyyiXzDtiyfwxZY6xsR3fa
   QeZ4oXpomMYwh2LtQyrMkLHDTyiT5CHDPJExV3LkH+qOLbxPsedrlsIrY
   N0dXxPlegf8SDUCo9nUcybrtxXZKdaej2zQ40IhjqisT09zdx8N6GAbBN
   BTMqrflOJaFtraoRl08S2vxUnAxClIIg3qDFS1pdqjzgoZlU1sxLBkRoC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="291918433"
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="291918433"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2022 05:41:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="936506016"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Aug 2022 05:41:06 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oPNmj-0002et-23;
        Sat, 20 Aug 2022 12:41:05 +0000
Date:   Sat, 20 Aug 2022 20:40:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-kbuild@vger.kernel.org
Subject: [masahiroy-kbuild:testing6 12/14] Makefile:1752: target
 '.modules.order' doesn't match the target pattern
Message-ID: <202208202011.0dgztOno-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git testing6
head:   dc5c5eef5cd01d75a54d67584db862a04dc6814f
commit: 6aa9a73f01177ef067f2a11336c7477b147ae78a [12/14] kbuild: move core-y in top Makefile to ./Kbuild
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20220820/202208202011.0dgztOno-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?id=6aa9a73f01177ef067f2a11336c7477b147ae78a
        git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
        git fetch --no-tags masahiroy-kbuild testing6
        git checkout 6aa9a73f01177ef067f2a11336c7477b147ae78a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Makefile:1752: target '.modules.order' doesn't match the target pattern
   make[1]: *** [Makefile:1165: vmlinux] Error 2
   make[1]: Target '__all' not remade because of errors.
--
>> Makefile:1752: target '.modules.order' doesn't match the target pattern
--
>> Makefile:1752: target '.modules.order' doesn't match the target pattern
>> Makefile:1752: target '.modules.order' doesn't match the target pattern


vim +1752 Makefile

1ebd234d0ef32c Masahiro Yamada 2022-08-15  1751  
1ebd234d0ef32c Masahiro Yamada 2022-08-15 @1752  $(sort $(subdir-modorder)): %/.modules.order: %
1ebd234d0ef32c Masahiro Yamada 2022-08-15  1753  	@:
1ebd234d0ef32c Masahiro Yamada 2022-08-15  1754  

:::::: The code at line 1752 was first introduced by commit
:::::: 1ebd234d0ef32c5a6fb8e94267b1ddbee84cf9e1 kbuild: rename modules.order in sub-directories to .modules.order

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
