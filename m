Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9DE322A609
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jul 2020 05:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387522AbgGWDaG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Jul 2020 23:30:06 -0400
Received: from mga06.intel.com ([134.134.136.31]:43986 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387488AbgGWDaG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Jul 2020 23:30:06 -0400
IronPort-SDR: g+HRNMr4gUUXmqAgxYICIIs6btPQMC3Q3HTAJ8LohtelRSOwznfh2Pyes5yr5sBwRiOt6kcJGU
 tlqlKBp9tlDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="212002247"
X-IronPort-AV: E=Sophos;i="5.75,385,1589266800"; 
   d="scan'208";a="212002247"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2020 20:30:04 -0700
IronPort-SDR: Q6i3QWdSjNqrgi3TxtJf67v/tTDScR66vCfGZA1XR9LafaQFhsnJeVgnRkwkjD/QFFuNCoKcH4
 xiJyV91PkCYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,385,1589266800"; 
   d="scan'208";a="432596428"
Received: from shbuild999.sh.intel.com ([10.239.146.107])
  by orsmga004.jf.intel.com with ESMTP; 22 Jul 2020 20:30:02 -0700
From:   Feng Tang <feng.tang@intel.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        andi.kleen@intel.com, ying.huang@intel.com,
        andriy.shevchenko@intel.com, Feng Tang <feng.tang@intel.com>
Subject: [RFC PATCH] makefile: add debug option to enable function aligned on 32 bytes
Date:   Thu, 23 Jul 2020 11:30:01 +0800
Message-Id: <1595475001-90945-1-git-send-email-feng.tang@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Recently 0day reported many strange performance changes (regression
or improvement), in which there was no obvious relation between
the culprit commit and the benchmark at the first look, and it causes
people to doubt the test itself is wrong.

Upon further check, many of these cases are caused by the change
to the alignment of kernel text or data, as whole text/data of kernel
are linked together, change in one domain may affect alignments of
other domains.

gcc has an option '-falign-functions=n' to force text aligned, and with
that option enabled, some of those performance changes will be gone,
like [1][2][3].

Add this option so that developers and 0day can easily find performance
bump caused by text alignment change, as tracking these strange bump
is quite time consuming. Though it can't help in other cases like data
alignment changes like [4].

Following is some size data for v5.7 kernel built with a RHEL config
used in 0day:

    text      data      bss	 dec	   filename
  19738771  13292906  5554236  38585913	 vmlinux.noalign
  19758591  13297002  5529660  38585253	 vmlinux.align32

Raw vmlinux size in bytes:

	v5.7		v5.7+align32
	253950832	254018000	+0.02%

Some benchmark data, most of them have no big change:

  * hackbench:		[ -1.8%,  +0.5%]

  * fsmark:		[ -3.2%,  +3.4%]  # ext4/xfs/btrfs

  * kbuild:		[ -2.0%,  +0.9%]

  * will-it-scale:	[ -0.5%,  +1.8%]  # mmap1/pagefault3

  * netperf:
    - TCP_CRR		[+16.6%, +97.4%]
    - TCP_RR		[-18.5%,  -1.8%]
    - TCP_STREAM	[ -1.1%,  +1.9%]

[1] https://lore.kernel.org/lkml/20200114085637.GA29297@shao2-debian/
[2] https://lore.kernel.org/lkml/20200330011254.GA14393@feng-iot/
[3] https://lore.kernel.org/lkml/1d98d1f0-fe84-6df7-f5bd-f4cb2cdb7f45@intel.com/
[4] https://lore.kernel.org/lkml/20200205123216.GO12867@shao2-debian/

Signed-off-by: Feng Tang <feng.tang@intel.com>
---
 Makefile          |  4 ++++
 lib/Kconfig.debug | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/Makefile b/Makefile
index 249a51d25c63..a59105e6f573 100644
--- a/Makefile
+++ b/Makefile
@@ -886,6 +886,10 @@ KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
 export CC_FLAGS_SCS
 endif
 
+ifdef CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_32B
+KBUILD_CFLAGS += -falign-functions=32
+endif
+
 # arch Makefile may override CC so keep this after arch Makefile is included
 NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 9ad9210d70a1..c1d52c4f120f 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -365,6 +365,17 @@ config SECTION_MISMATCH_WARN_ONLY
 
 	  If unsure, say Y.
 
+config DEBUG_FORCE_FUNCTION_ALIGN_32B
+	bool "Force all function address 32B aligned" if EXPERT
+	help
+	  There are cases that a commit from one domain changes the function
+	  address alignment of other domains, and cause magic performance
+	  bump (regression or improvement). Enable this option will help to
+	  verify if the bump is caused by function alignment changes, while
+	  it will slightly increase the kernel size and affect icache usage.
+
+	  It is mainly for debug and performance tuning use.
+
 #
 # Select this config option from the architecture Kconfig, if it
 # is preferred to always offer frame pointers as a config
-- 
2.14.1

