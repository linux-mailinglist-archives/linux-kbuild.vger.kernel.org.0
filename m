Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE423DE130
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Aug 2021 23:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbhHBVFU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Aug 2021 17:05:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:35998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231194AbhHBVFT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Aug 2021 17:05:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DCC360F11;
        Mon,  2 Aug 2021 21:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627938310;
        bh=1CC6Xn8O5VfdL27ctk5p97kfsc4n9bixRSyPS7rPUAM=;
        h=From:To:Cc:Subject:Date:From;
        b=VyF3R1c8Gmz23NgeJ0vyufxaFMjNfiQhrTo2aEMtosyT3vRvkXigYjX5Yo2fc5HTs
         x+2C2iv4JcZ9R1cLc6kz3t44/XFoJIFq5fihMdX9eTW4q0huu5b+JGAZvrMf7MYUpO
         Ufi1JghQnvQVLR2IjFgeZFGVDXC328Bp4ANQKuLYttb3X3bB0vOv+fMQSENMxoT5P3
         r5oW3QsRf71XMcfM9yy4Rpjy0r1Ll9BBSFHdROLLJgWM7OHV/TNiQy62Lkds+AE+5s
         GlsNysvoZWDk3vb/4pei5LiHRezJKM09zO7NS7kNzw+9ts5GM2Um7fzCpOMKniFYbV
         5jKlU9IN6mIxQ==
From:   Nathan Chancellor <nathan@kernel.org>
To:     "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] scripts/recordmcount.pl: Remove check_objcopy() and $can_use_local
Date:   Mon,  2 Aug 2021 14:03:07 -0700
Message-Id: <20210802210307.3202472-1-nathan@kernel.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When building ARCH=riscv allmodconfig with llvm-objcopy, the objcopy
version warning from this script appears:

WARNING: could not find objcopy version or version is less than 2.17.
        Local function references are disabled.

The check_objcopy() function in scripts/recordmcount.pl is set up to
parse GNU objcopy's version string, not llvm-objcopy's, which triggers
the warning.

Commit 799c43415442 ("kbuild: thin archives make default for all archs")
made binutils 2.20 mandatory and commit ba64beb17493 ("kbuild: check the
minimum assembler version in Kconfig") enforces this at configuration
time so just remove check_objcopy() and $can_use_local instead, assuming
--globalize-symbol is always available.

llvm-objcopy has supported --globalize-symbol since LLVM 7.0.0 in 2018
and the minimum version for building the kernel with LLVM is 10.0.1 so
there is no issue introduced:

https://github.com/llvm/llvm-project/commit/ee5be798dae30d5f9414b01f76ff807edbc881aa

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile                |  1 -
 scripts/recordmcount.pl | 40 ----------------------------------------
 2 files changed, 41 deletions(-)

diff --git a/Makefile b/Makefile
index 27a072cffcb9..b6ee64dd435e 100644
--- a/Makefile
+++ b/Makefile
@@ -546,7 +546,6 @@ export RCS_TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn \
 PHONY += scripts_basic
 scripts_basic:
 	$(Q)$(MAKE) $(build)=scripts/basic
-	$(Q)rm -f .tmp_quiet_recordmcount
 
 PHONY += outputmakefile
 ifdef building_out_of_srctree
diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
index c17e48020ec3..8f6b13ae46bf 100755
--- a/scripts/recordmcount.pl
+++ b/scripts/recordmcount.pl
@@ -173,39 +173,6 @@ my $mcount_regex;	# Find the call site to mcount (return offset)
 my $mcount_adjust;	# Address adjustment to mcount offset
 my $alignment;		# The .align value to use for $mcount_section
 my $section_type;	# Section header plus possible alignment command
-my $can_use_local = 0; 	# If we can use local function references
-
-# Shut up recordmcount if user has older objcopy
-my $quiet_recordmcount = ".tmp_quiet_recordmcount";
-my $print_warning = 1;
-$print_warning = 0 if ( -f $quiet_recordmcount);
-
-##
-# check_objcopy - whether objcopy supports --globalize-symbols
-#
-#  --globalize-symbols came out in 2.17, we must test the version
-#  of objcopy, and if it is less than 2.17, then we can not
-#  record local functions.
-sub check_objcopy
-{
-    open (IN, "$objcopy --version |") or die "error running $objcopy";
-    while (<IN>) {
-	if (/objcopy.*\s(\d+)\.(\d+)/) {
-	    $can_use_local = 1 if ($1 > 2 || ($1 == 2 && $2 >= 17));
-	    last;
-	}
-    }
-    close (IN);
-
-    if (!$can_use_local && $print_warning) {
-	print STDERR "WARNING: could not find objcopy version or version " .
-	    "is less than 2.17.\n" .
-	    "\tLocal function references are disabled.\n";
-	open (QUIET, ">$quiet_recordmcount");
-	printf QUIET "Disables the warning from recordmcount.pl\n";
-	close QUIET;
-    }
-}
 
 if ($arch =~ /(x86(_64)?)|(i386)/) {
     if ($bits == 64) {
@@ -434,8 +401,6 @@ if ($filename =~ m,^(.*)(\.\S),) {
 my $mcount_s = $dirname . "/.tmp_mc_" . $prefix . ".s";
 my $mcount_o = $dirname . "/.tmp_mc_" . $prefix . ".o";
 
-check_objcopy();
-
 #
 # Step 1: find all the local (static functions) and weak symbols.
 #         't' is local, 'w/W' is weak
@@ -473,11 +438,6 @@ sub update_funcs
 
     # is this function static? If so, note this fact.
     if (defined $locals{$ref_func}) {
-
-	# only use locals if objcopy supports globalize-symbols
-	if (!$can_use_local) {
-	    return;
-	}
 	$convert{$ref_func} = 1;
     }
 

base-commit: c500bee1c5b2f1d59b1081ac879d73268ab0ff17
-- 
2.32.0.264.g75ae10bc75

