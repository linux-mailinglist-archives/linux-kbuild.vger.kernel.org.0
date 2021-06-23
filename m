Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59D893B1658
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Jun 2021 10:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhFWJA3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Jun 2021 05:00:29 -0400
Received: from mga17.intel.com ([192.55.52.151]:61247 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229958AbhFWJA3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Jun 2021 05:00:29 -0400
IronPort-SDR: TUw5gg+vKhSsUu93FUXa2x07MPAfT8An3+7REa/iUSVCSfh/o+sh5jxw/z8YzjK9SNvOZMW0yK
 qggpvgSjWS7Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="187605834"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; 
   d="scan'208";a="187605834"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2021 01:58:11 -0700
IronPort-SDR: 2BtrjNexbLJCm1nGtZeSrvtIzHlD0evFHVjAxblzKJ8kkjXcR/Ygb/5yoeIkl2bYJu5aneayFR
 d3TNXZSUIt+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; 
   d="scan'208";a="423628260"
Received: from shbuild999.sh.intel.com (HELO localhost) ([10.239.147.94])
  by orsmga002.jf.intel.com with ESMTP; 23 Jun 2021 01:58:07 -0700
Date:   Wed, 23 Jun 2021 16:58:06 +0800
From:   Feng Tang <feng.tang@intel.com>
To:     lkp <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc:     "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        linux-csky@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andi Kleen <ak@linux.intel.com>
Subject: Re: [linux-next:master 3665/11714] {standard input}:2644: Error:
 pcrel offset for branch to .LS0015 too far (0x3e)
Message-ID: <20210623085806.GA77080@shbuild999.sh.intel.com>
References: <202106220959.QA9KOJ3Q-lkp@intel.com>
 <20210622094818.GA67867@shbuild999.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622094818.GA67867@shbuild999.sh.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add linux-csky list and originally cced people and replace the linux-mm
with linux-kbuild list, which match the discussion better and avoid
email noise for mm people.

On Tue, Jun 22, 2021 at 05:48:18PM +0800, Tang, Feng wrote:
> On Tue, Jun 22, 2021 at 09:49:05AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   889bab4c367a0ef58208fd80fafa74bb6e2dca26
> > commit: cf536e185869d4815d506e777bcca6edd9966a6e [3665/11714] Makefile: extend 32B aligned debug option to 64B aligned
> > config: csky-randconfig-c024-20210622 (attached as .config)
> > compiler: csky-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=cf536e185869d4815d506e777bcca6edd9966a6e
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout cf536e185869d4815d506e777bcca6edd9966a6e
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=csky 

> Thanks for the report. 
> 
> I just reproduced the issue locally, with similar log:
> 
>   CC      drivers/target/target_core_sbc.o
> {standard input}: Assembler messages:
> {standard input}:2644: Error: pcrel offset for branch to .LS0015 too far (0x3e)
> {standard input}:2653: Error: pcrel offset for branch to .LS0015 too far (0x34)
> {standard input}:2659: Error: pcrel offset for branch to .LS0015 too far (0x2c)
> make[2]: *** [scripts/Makefile.build:272: drivers/target/target_core_sbc.o] Error 1
> m
> 
> And when I changed the function align option from 64 to 32, the
> compilation did pass, so this looks to be related with the alignment
> option.
> 
> I'm not very familiar with compiler, and will try to check more.

I did some check and found the error info comes from the assembler
for 'csky' in binutils' gas/config/tc-csky.c, and I could hardly
dive deeper into the code as limited by my knowledge.


> I know it works on x86_64, but don't know how about other
> architectures, and if 'csky' is the only not working one, one
> workaround I can think of is to add kconfig dependency for !csky 

I reused the 0day's reproduce process, and tried on arm64, powerpc64,
and arc, the kernel compilation all succeeded. So maybe we can
add some dependency for this debug option like:

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 3cf48998a374..eb035b31657f 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -415,7 +415,8 @@ config SECTION_MISMATCH_WARN_ONLY
 	  If unsure, say Y.
 
 config DEBUG_FORCE_FUNCTION_ALIGN_64B
-	bool "Force all function address 64B aligned" if EXPERT
+	bool "Force all function address 64B aligned"
+	depends on EXPERT && (X86_64 || ARM64 || PPC32 || PPC64 || ARC)
 	help
 	  There are cases that a commit from one domain changes the function
 	  address alignment of other domains, and cause magic performance

Any comments? thanks!

- Feng

> Thanks,
> Feng
> 
> 
