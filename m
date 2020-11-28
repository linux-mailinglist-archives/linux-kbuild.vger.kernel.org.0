Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 223A42C758C
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Nov 2020 23:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387997AbgK1VtR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Nov 2020 16:49:17 -0500
Received: from condef-09.nifty.com ([202.248.20.74]:22459 "EHLO
        condef-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728023AbgK1SC3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Nov 2020 13:02:29 -0500
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-09.nifty.com with ESMTP id 0ASBqO5w006693;
        Sat, 28 Nov 2020 20:52:24 +0900
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0ASBpD6D027804;
        Sat, 28 Nov 2020 20:51:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0ASBpD6D027804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606564277;
        bh=pFvI3gIoKDNuTRdVFYs3jfJJ5S/cVkbhBeHlsv1eO8U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J/zXYwCBr2HPMND2NCh79Yk+ZVY/fZiPYW+CITg3h5IRz69vHkeSCgO82CwitiMmn
         UY1/D+VJc6II+GfaKbI2dWffl2KUxUx3WOdknMWYCnRJztv8MsGgGmTSeBI0NX1Iy9
         O8TKLtLTxnTR6FWMLWDG2dI2e8RaG/9vx9+bXjMiAOtpp3nzA0wkF3uI+sS1d6fQOQ
         TtFlbRpBG4q1lInZRiTLUlWRFgkBJ8vQXebtssG1+z6YnpoV8Tzcwx+C9myHN16qSc
         N3ZVXKEv/jrTzdZi04BY42jgdtAXnxBuARAbYU3zlucGK35BAlXD3gFTyYVzq7ubMV
         ej0lFWcLPnR+g==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] kbuild: doc: merge 'Special Rules' and 'Custom kbuild commands' sections
Date:   Sat, 28 Nov 2020 20:51:05 +0900
Message-Id: <20201128115108.179256-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128115108.179256-1-masahiroy@kernel.org>
References: <20201128115108.179256-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The two sections "3.10 Special Rules" and "7.8 Custom kbuild commands"
are related because you must understand both of them when you write
custom rules.

Actually I do not understand the policy about what to go into
"3 The kbuild files" and what into "7 Architecture Makefile".

This commit reworks the custom rule explanation as follows:

 - Merged "7.8 Custom kbuild commands" into "3.10 Special Rules".

 - Reword "Special Rules" to "Custom Rules" for consistency.

 - Update the example for kecho because the blackfin Makefile
   does not exist any more.

 - Replace the example for cmd_<command> with a simpler one.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 Documentation/kbuild/makefiles.rst | 88 ++++++++++++++----------------
 1 file changed, 40 insertions(+), 48 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 283ccfec7613..29101d2a0072 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -18,7 +18,7 @@ This document describes the Linux kernel Makefiles.
 	   --- 3.7 Compilation flags
 	   --- 3.8 <deleted>
 	   --- 3.9 Dependency tracking
-	   --- 3.10 Special Rules
+	   --- 3.10 Custom Rules
 	   --- 3.11 $(CC) support functions
 	   --- 3.12 $(LD) support functions
 	   --- 3.13 Script Invocation
@@ -46,7 +46,7 @@ This document describes the Linux kernel Makefiles.
 	   --- 7.5 Architecture-specific boot images
 	   --- 7.6 Building non-kbuild targets
 	   --- 7.7 Commands useful for building a boot image
-	   --- 7.8 Custom kbuild commands
+	   --- 7.8 <deleted>
 	   --- 7.9 Preprocessing linker scripts
 	   --- 7.10 Generic header files
 	   --- 7.11 Post-link pass
@@ -422,21 +422,21 @@ more details, with real examples.
 	Thus, if you change an option to $(CC) all affected files will
 	be re-compiled.
 
-3.10 Special Rules
+3.10 Custom Rules
 ------------------
 
-	Special rules are used when the kbuild infrastructure does
+	Custom rules are used when the kbuild infrastructure does
 	not provide the required support. A typical example is
 	header files generated during the build process.
 	Another example are the architecture-specific Makefiles which
-	need special rules to prepare boot images etc.
+	need custom rules to prepare boot images etc.
 
-	Special rules are written as normal Make rules.
+	Custom rules are written as normal Make rules.
 	Kbuild is not executing in the directory where the Makefile is
-	located, so all special rules shall provide a relative
+	located, so all custom rules shall use a relative
 	path to prerequisite files and target files.
 
-	Two variables are used when defining special rules:
+	Two variables are used when defining custom rules:
 
 	$(src)
 	    $(src) is a relative path which points to the directory
@@ -454,7 +454,7 @@ more details, with real examples.
 		$(obj)/53c8xx_d.h: $(src)/53c7,8xx.scr $(src)/script_asm.pl
 			$(CPP) -DCHIP=810 - < $< | ... $(src)/script_asm.pl
 
-	    This is a special rule, following the normal syntax
+	    This is a custom rule, following the normal syntax
 	    required by make.
 
 	    The target file depends on two prerequisite files. References
@@ -471,11 +471,33 @@ more details, with real examples.
 
 	Example::
 
-		#arch/blackfin/boot/Makefile
-		$(obj)/vmImage: $(obj)/vmlinux.gz
-			$(call if_changed,uimage)
-			@$(kecho) 'Kernel: $@ is ready'
+		# arch/arm/Makefile
+		$(BOOT_TARGETS): vmlinux
+			$(Q)$(MAKE) $(build)=$(boot) MACHINE=$(MACHINE) $(boot)/$@
+			@$(kecho) '  Kernel: $(boot)/$@ is ready'
 
+	When kbuild is executing with KBUILD_VERBOSE=0, then only a shorthand
+	of a command is normally displayed.
+	To enable this behaviour for custom commands kbuild requires
+	two variables to be set::
+
+		quiet_cmd_<command>	- what shall be echoed
+		      cmd_<command>	- the command to execute
+
+	Example::
+
+		# lib/Makefile
+		quiet_cmd_crc32 = GEN     $@
+		      cmd_crc32 = $< > $@
+
+		$(obj)/crc32table.h: $(obj)/gen_crc32table
+			$(call cmd,crc32)
+
+	When updating the $(obj)/crc32table.h target, the line:
+
+		  GEN     lib/crc32table.h
+
+	will be displayed with "make KBUILD_VERBOSE=0".
 
 3.11 $(CC) support functions
 ----------------------------
@@ -744,7 +766,7 @@ Both possibilities are described in the following.
 	as a prerequisite.
 	This is possible in two ways:
 
-	(1) List the prerequisite explicitly in a special rule.
+	(1) List the prerequisite explicitly in a custom rule.
 
 	Example::
 
@@ -755,11 +777,11 @@ Both possibilities are described in the following.
 
 	The target $(obj)/devlist.h will not be built before
 	$(obj)/gen-devlist is updated. Note that references to
-	the host programs in special rules must be prefixed with $(obj).
+	the host programs in custom rules must be prefixed with $(obj).
 
 	(2) Use always-y
 
-	When there is no suitable special rule, and the host program
+	When there is no suitable custom rule, and the host program
 	shall be built when a makefile is entered, the always-y
 	variable shall be used.
 
@@ -1281,8 +1303,8 @@ When kbuild executes, the following steps are followed (roughly):
 	otherwise the command line check will fail, and the target will
 	always be built.
 	Assignments to $(targets) are without $(obj)/ prefix.
-	if_changed may be used in conjunction with custom commands as
-	defined in 7.8 "Custom kbuild commands".
+	if_changed may be used in conjunction with custom rules as
+	defined in "3.10 Custom Rules".
 
 	Note: It is a typical mistake to forget the FORCE prerequisite.
 	Another common pitfall is that whitespace is sometimes
@@ -1362,36 +1384,6 @@ When kbuild executes, the following steps are followed (roughly):
 		targets += $(dtb-y)
 		DTC_FLAGS ?= -p 1024
 
-7.8 Custom kbuild commands
---------------------------
-
-	When kbuild is executing with KBUILD_VERBOSE=0, then only a shorthand
-	of a command is normally displayed.
-	To enable this behaviour for custom commands kbuild requires
-	two variables to be set::
-
-		quiet_cmd_<command>	- what shall be echoed
-		      cmd_<command>	- the command to execute
-
-	Example::
-
-		#
-		quiet_cmd_image = BUILD   $@
-		      cmd_image = $(obj)/tools/build $(BUILDFLAGS) \
-		                                     $(obj)/vmlinux.bin > $@
-
-		targets += bzImage
-		$(obj)/bzImage: $(obj)/vmlinux.bin $(obj)/tools/build FORCE
-			$(call if_changed,image)
-			@echo 'Kernel: $@ is ready'
-
-	When updating the $(obj)/bzImage target, the line:
-
-		BUILD    arch/x86/boot/bzImage
-
-	will be displayed with "make KBUILD_VERBOSE=0".
-
-
 7.9 Preprocessing linker scripts
 --------------------------------
 
-- 
2.27.0

