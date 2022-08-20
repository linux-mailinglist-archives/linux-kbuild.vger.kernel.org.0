Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A116159AEAA
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Aug 2022 16:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346276AbiHTOX6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 20 Aug 2022 10:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346294AbiHTOXx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 Aug 2022 10:23:53 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB34F1DA4A
        for <linux-kbuild@vger.kernel.org>; Sat, 20 Aug 2022 07:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661005432; x=1692541432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K73WMfABeKBnKTyD6nnyLVlUvQPv7I44blIXXYEkA10=;
  b=D/NbHwMVDTlG4H8xP6Gmxom5NpIY/gxl4Joc5kkzAaNiprshykAFvuIe
   6vQtvY09smRusFwiSh4oeJY7QaKBKpeZ/e6EI7EaUnuaG1VqnyJvBgyUi
   hlj1Gp3Zrd98fY5VMgNDeRsUNJTj6tQrWOxbnOZAxI335TSoVIpkr2P9i
   dEgHppvIpi0j/79UtUsdo5jEssx10R3iYv46bWXiC4xPootCKmjTYv1I7
   9YxDjYuNOEHm7NhqfCs0SC9exqNOrrDrln9/1v8ZcIVV2JucDD7gzVWZh
   zpoHBcWBA+EmhL0Xvf+9QO4UnzgTpClchVTp2ZmVdoj7RHsYzYveTQyto
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10445"; a="273571002"
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="273571002"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2022 07:23:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="676737604"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Aug 2022 07:23:51 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oPPOA-0002mQ-33;
        Sat, 20 Aug 2022 14:23:50 +0000
Date:   Sat, 20 Aug 2022 22:23:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-kbuild@vger.kernel.org
Subject: [masahiroy-kbuild:testing6 12/14] alpha-linux-ar: ./usr/built-in.a:
 No such file or directory
Message-ID: <202208202255.ZDq3IcBV-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220820/202208202255.ZDq3IcBV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?id=6aa9a73f01177ef067f2a11336c7477b147ae78a
        git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
        git fetch --no-tags masahiroy-kbuild testing6
        git checkout 6aa9a73f01177ef067f2a11336c7477b147ae78a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> alpha-linux-ar: ./usr/built-in.a: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
