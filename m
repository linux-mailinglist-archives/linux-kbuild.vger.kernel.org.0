Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4188F59ADA1
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Aug 2022 13:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345668AbiHTLuC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 20 Aug 2022 07:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344838AbiHTLuB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 Aug 2022 07:50:01 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250C7271C
        for <linux-kbuild@vger.kernel.org>; Sat, 20 Aug 2022 04:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660996200; x=1692532200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KlvyHEtWIegRAGMST+B6izwACapHHAiWcnUEV8an97k=;
  b=mS6YmcLGWa+JUVhlVmk6goIvqRhW1ftbrQr8qEYTT+WNhtPHlbggbJfy
   1udmhVDIxloCdVBy2/SpT+jxlcxc3n7YYALyJA6ewxslZZMUCP0dQTh22
   Be/qC2PCRxrXfl68w9crQA3+GYWpiDHHiMreb/A6eauvCC8yzPqkZTq/j
   uJ44tjPvNiSptphl6DjVDU78Bh7vLQapqIxPUvqaAHS/+dFFVIhtYXKoU
   b1l2o073R63/oyb/4M2P38cWzBMeV6Tyvz6rWdCxZvRZPIPgaVDnQlbub
   6D+DDJlZsEzVXALferVXGF4mQCopUlFw5YHybIREFfcRF8V/niQoA6s4N
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="293170647"
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="293170647"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2022 04:49:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="936498803"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Aug 2022 04:49:58 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oPMzF-0002b9-2y;
        Sat, 20 Aug 2022 11:49:57 +0000
Date:   Sat, 20 Aug 2022 19:49:46 +0800
From:   kernel test robot <lkp@intel.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-kbuild@vger.kernel.org
Subject: [masahiroy-kbuild:testing6 12/14] Makefile:1752: target
 '.modules.order' doesn't match the target pattern
Message-ID: <202208201903.FQzmGPGx-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
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
config: hexagon-randconfig-r041-20220820 (https://download.01.org/0day-ci/archive/20220820/202208201903.FQzmGPGx-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c9a41fe60ab62f7a40049c100adcc8087a47669b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?id=6aa9a73f01177ef067f2a11336c7477b147ae78a
        git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
        git fetch --no-tags masahiroy-kbuild testing6
        git checkout 6aa9a73f01177ef067f2a11336c7477b147ae78a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Makefile:1752: target '.modules.order' doesn't match the target pattern
   make[1]: *** [Makefile:1848: .] Error 2
   make[1]: Target '__all' not remade because of errors.
--
>> Makefile:1752: target '.modules.order' doesn't match the target pattern
   <stdin>:1517:2: warning: syscall clone3 not implemented [-W#warnings]
   #warning syscall clone3 not implemented
    ^
   1 warning generated.
--
>> Makefile:1752: target '.modules.order' doesn't match the target pattern
   <stdin>:1517:2: warning: syscall clone3 not implemented [-W#warnings]
   #warning syscall clone3 not implemented
    ^
   1 warning generated.


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
