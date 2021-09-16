Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6631C40EA1B
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Sep 2021 20:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349064AbhIPSnd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 Sep 2021 14:43:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:44620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348817AbhIPSnX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Sep 2021 14:43:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD0D1610A6;
        Thu, 16 Sep 2021 18:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631817722;
        bh=15KiedaiGI/tJV9mvZsdFRG22825ewuodD6e49rg4sA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u6AuZ4vt5agTnwo61Uf+l27zC/1GALkEey8pT+6Pcskx3Dul4m9cofeGrXR2mAIjG
         QLNFjN1+jYqVjeJzeanWEYxD/JQDPdktS+jfeuLvmmc+DqriyRgWjor4gChl+nlUJe
         Shnv+d8tIcVdW3/2GnAVr+ij7VVyy3q6iUcO1fTB6rXwRI9vdeJOu2X5etSNQvFIo0
         Y4R0DlgVoQv6Qfz7qup1DjhQJWp3wrSfu4jCHczN/hc5VCzUjFIpVST8b44tBw+msa
         Kkgyy7vQH8mVLBto1FjmKKpi1z9G/CxPggD9xq2u/+0cOKvMLWkeC8Df3pmOYWDIEK
         5wtiQXfTQp4DA==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Borislav Petkov <bp@suse.de>
Subject: [PATCH v2 1/2] x86/build: Do not add -falign flags unconditionally for clang
Date:   Thu, 16 Sep 2021 11:40:16 -0700
Message-Id: <20210916184017.1881473-2-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916184017.1881473-1-nathan@kernel.org>
References: <20210916184017.1881473-1-nathan@kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

clang does not support -falign-jumps and only recently gained support
for -falign-loops. When one of the configuration options that adds these
flags is enabled, clang warns and all cc-{disable-warning,option} that
follow fail because -Werror gets added to test for the presence of this
warning:

clang-14: warning: optimization flag '-falign-jumps=0' is not supported
[-Wignored-optimization-argument]

To resolve this, add a couple of cc-option calls when building with
clang; gcc has supported these options since 3.2 so there is no point in
testing for their support. -falign-functions was implemented in clang-7,
-falign-loops was implemented in clang-14, and -falign-jumps has not
been implemented yet.

Link: https://lore.kernel.org/r/YSQE2f5teuvKLkON@Ryzen-9-3900X.localdomain/
Link: https://lore.kernel.org/r/20210824022640.2170859-2-nathan@kernel.org/
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Acked-by: Borislav Petkov <bp@suse.de>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/x86/Makefile_32.cpu | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/x86/Makefile_32.cpu b/arch/x86/Makefile_32.cpu
index e7355f8b51c2..94834c4b5e5e 100644
--- a/arch/x86/Makefile_32.cpu
+++ b/arch/x86/Makefile_32.cpu
@@ -4,6 +4,12 @@
 
 tune		= $(call cc-option,-mtune=$(1),$(2))
 
+ifdef CONFIG_CC_IS_CLANG
+align		:= -falign-functions=0 $(call cc-option,-falign-jumps=0) $(call cc-option,-falign-loops=0)
+else
+align		:= -falign-functions=0 -falign-jumps=0 -falign-loops=0
+endif
+
 cflags-$(CONFIG_M486SX)		+= -march=i486
 cflags-$(CONFIG_M486)		+= -march=i486
 cflags-$(CONFIG_M586)		+= -march=i586
@@ -19,11 +25,11 @@ cflags-$(CONFIG_MK6)		+= -march=k6
 # They make zero difference whatsosever to performance at this time.
 cflags-$(CONFIG_MK7)		+= -march=athlon
 cflags-$(CONFIG_MK8)		+= $(call cc-option,-march=k8,-march=athlon)
-cflags-$(CONFIG_MCRUSOE)	+= -march=i686 -falign-functions=0 -falign-jumps=0 -falign-loops=0
-cflags-$(CONFIG_MEFFICEON)	+= -march=i686 $(call tune,pentium3) -falign-functions=0 -falign-jumps=0 -falign-loops=0
+cflags-$(CONFIG_MCRUSOE)	+= -march=i686 $(align)
+cflags-$(CONFIG_MEFFICEON)	+= -march=i686 $(call tune,pentium3) $(align)
 cflags-$(CONFIG_MWINCHIPC6)	+= $(call cc-option,-march=winchip-c6,-march=i586)
 cflags-$(CONFIG_MWINCHIP3D)	+= $(call cc-option,-march=winchip2,-march=i586)
-cflags-$(CONFIG_MCYRIXIII)	+= $(call cc-option,-march=c3,-march=i486) -falign-functions=0 -falign-jumps=0 -falign-loops=0
+cflags-$(CONFIG_MCYRIXIII)	+= $(call cc-option,-march=c3,-march=i486) $(align)
 cflags-$(CONFIG_MVIAC3_2)	+= $(call cc-option,-march=c3-2,-march=i686)
 cflags-$(CONFIG_MVIAC7)		+= -march=i686
 cflags-$(CONFIG_MCORE2)		+= -march=i686 $(call tune,core2)

base-commit: a9086b878b7fd65894eb8cb1fa395dd469970566
-- 
2.33.0

