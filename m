Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86C271B26AA
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2020 14:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbgDUMsn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Apr 2020 08:48:43 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:38131 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbgDUMsn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 08:48:43 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 03LCm57P000731;
        Tue, 21 Apr 2020 21:48:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 03LCm57P000731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587473286;
        bh=1IcXOpB7EL64zMUDfKuq89Vedl6UcsiB89tozBdp8Wo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m2zkbZNWVlP6oZJsZlUhUZlUJtMKgCSCy8EOu46sKHiI7cPpEai8RRlWvqYGEQoSP
         kO2R2WhyiwZTFo7es0hGWqsNrRurB6XreuO5sRlCHFzMF8qd/3RSCxfqYGE1m2l1RX
         iHaPyO/9iSz4okm5ZDY/qBKWTzboo8gWJnW993FgZPWY9pJIVDwsvKWrU9v9kSwXCG
         iMSAFgCS4g0g8xlk3jimEpZ+hFCFRCsb1BoGCzsJ3X3yYFJOEyRlSinNDbYX5iYtyX
         MEDk6JmIwdrQcAH2QWytlNuXAKGeY4ld9zoVIaXlji2QtZ0I0sUmwlXfDgd41sLUQ4
         dfIc6+e23Epzg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kbuild: use -MMD instead of -MD to exclude system headers from dependency
Date:   Tue, 21 Apr 2020 21:48:04 +0900
Message-Id: <20200421124804.1272909-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200421124804.1272909-1-masahiroy@kernel.org>
References: <20200421124804.1272909-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This omits system header files from the generated header dependency.

System headers are not updated unless you upgrade the compiler. Nor do
they contain CONFIG options, so fixdep does not need to parse them.

Having said that, the effect of this optimization will be small because
the kernel code generally does not include system headers except
<stdarg.h>.

Host programs include a lot of system headers, but there are not so
many host programs.

Theoretically, fixdep does not need to parse *.d files for host programs
because host programs should not contain CONFIG options in the first
place. Kbuild re-uses if_changed_dep for host programs, though I do not
think it is a big deal.

At first, keeping system headers in .*.cmd files might be useful to
detect the compiler update, but there is no guarantee that <stdarg.h>
is included from every file. So, I implemented a more reliable way in
the previous commit.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Kbuild.include | 2 +-
 scripts/Makefile.host  | 4 ++--
 scripts/Makefile.lib   | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 6cabf20ce66a..0c3dc983439b 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -16,7 +16,7 @@ pound := \#
 dot-target = $(dir $@).$(notdir $@)
 
 ###
-# The temporary file to save gcc -MD generated dependencies must not
+# The temporary file to save gcc -MMD generated dependencies must not
 # contain a comma
 depfile = $(subst $(comma),_,$(dot-target).d)
 
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 2045855d0b75..c8a4a033dc3e 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -88,8 +88,8 @@ _hostcxx_flags += -I $(objtree)/$(obj)
 endif
 endif
 
-hostc_flags    = -Wp,-MD,$(depfile) $(_hostc_flags)
-hostcxx_flags  = -Wp,-MD,$(depfile) $(_hostcxx_flags)
+hostc_flags    = -Wp,-MMD,$(depfile) $(_hostc_flags)
+hostcxx_flags  = -Wp,-MMD,$(depfile) $(_hostcxx_flags)
 
 #####
 # Compile programs on the host
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 97547108ee7f..a94c1e741df9 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -171,22 +171,22 @@ modkern_aflags = $(if $(part-of-module),				\
 			$(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),	\
 			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
 
-c_flags        = -Wp,-MD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
+c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 -include $(srctree)/include/linux/compiler_types.h       \
 		 $(_c_flags) $(modkern_cflags)                           \
 		 $(basename_flags) $(modname_flags)
 
-a_flags        = -Wp,-MD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
+a_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 $(_a_flags) $(modkern_aflags)
 
-cpp_flags      = -Wp,-MD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
+cpp_flags      = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 $(_cpp_flags)
 
 ld_flags       = $(KBUILD_LDFLAGS) $(ldflags-y) $(LDFLAGS_$(@F))
 
 DTC_INCLUDE    := $(srctree)/scripts/dtc/include-prefixes
 
-dtc_cpp_flags  = -Wp,-MD,$(depfile).pre.tmp -nostdinc                    \
+dtc_cpp_flags  = -Wp,-MMD,$(depfile).pre.tmp -nostdinc                    \
 		 $(addprefix -I,$(DTC_INCLUDE))                          \
 		 -undef -D__DTS__
 
-- 
2.25.1

