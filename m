Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A29C265DD38
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jan 2023 20:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235156AbjADTzI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Jan 2023 14:55:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240204AbjADTy6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jan 2023 14:54:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07AF1C923
        for <linux-kbuild@vger.kernel.org>; Wed,  4 Jan 2023 11:54:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5CA3261742
        for <linux-kbuild@vger.kernel.org>; Wed,  4 Jan 2023 19:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF9EC43392;
        Wed,  4 Jan 2023 19:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672862096;
        bh=iDpwete7KRRtx7xm+tCbXm0Lyr2zptLdbj1MM4EGk8w=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=XSh3WiMpkuAAm+nhA52aK5YzKtG/6pHbHKysJHN/Fwb5kNBADC5pG5jArcZ707Zue
         L60ej1YWTgRf5Dkkmkic1rVRnfwDQfMDwMNydTsig/htlfZAyQJRcmggkQ8YSQgwX1
         WtYDgadLHy+WquLOn0OVc6MNsuDkjGHLk/U1IANYvJ8/TH4QD7xbSYE/DQLL04mOtF
         AuLfz49pkcTJ0PPSqESG0y8HLydXQANKq3b9Bm+nXIP4YeRlH5jcsfFs4G07q9EglK
         JXCrk1VjE6ckOun8yHZMNDC9t+jCmZ+NxQVExYT/pZ6lr7GhuKSAOKL6zDZMjezI2n
         U1Q1VzfmF1haQ==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 04 Jan 2023 12:54:21 -0700
Subject: [PATCH 04/14] kbuild: Update assembler calls to use proper flags and
 language target
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-Id: <20221228-drop-qunused-arguments-v1-4-658cbc8fc592@kernel.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
To:     masahiroy@kernel.org, ndesaulniers@google.com
Cc:     nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5349; i=nathan@kernel.org;
 h=from:subject:message-id; bh=ygBZ1B4cc2ZDEctLp77RGqvNTcRd7amEhdM91D44bsY=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMlbb3YZP5I8WLrD4BPDbf0Zt+aeTGyX2b/Dqow/9tXiKG2F
 ScYbOkpZGMQ4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEnhcx/C94OOGfe7ePfeXt1+a7tD
 VYOCTafq18EF/eM9/VV9BoZiEjQ8ffOyatmsap6a56dhF6jsqX7yz5Kbz634TV5uIndTTq2AA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Desaulniers <ndesaulniers@google.com>

as-instr uses KBUILD_AFLAGS, but as-option uses KBUILD_CFLAGS. This can
cause as-option to fail unexpectedly when CONFIG_WERROR is set, because
clang will emit -Werror,-Wunused-command-line-argument for various -m
and -f flags in KBUILD_CFLAGS for assembler sources.

Callers of as-option and as-instr should be adding flags to
KBUILD_AFLAGS / aflags-y, not KBUILD_CFLAGS / cflags-y. Use
KBUILD_AFLAGS in all macros to clear up the initial problem.

Unfortunately, -Wunused-command-line-argument can still be triggered
with clang by the presence of warning flags or macro definitions because
'-x assembler' is used, instead of '-x assembler-with-cpp', which will
consume these flags. Switch to '-x assembler-with-cpp' in places where
'-x assembler' is used, as the compiler is always used as the driver for
out of line assembler sources in the kernel.

Finally, add -Werror to these macros so that they behave consistently
whether or not CONFIG_WERROR is set.

Link: https://github.com/ClangBuiltLinux/linux/issues/1699
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
[nathan: Reworded and expanded on problems in commit message
         Use '-x assembler-with-cpp' in a couple more places]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Benchmarking '-x assembler' vs. '-x assembler-with-cpp' does show that
invoking the preprocessor incurs some overhead but my kernel builds do
not show any noticeable slowdowns due to how infrequently these macros
are used.

$ hyperfine -L lang assembler,assembler-with-cpp -N -w 5 "/usr/bin/gcc -x {lang} -c -o /dev/null /dev/null"
Benchmark 1: /usr/bin/gcc -x assembler -c -o /dev/null /dev/null
  Time (mean ± σ):       5.5 ms ±   0.5 ms    [User: 4.1 ms, System: 1.3 ms]
  Range (min … max):     4.3 ms …   6.3 ms    472 runs

Benchmark 2: /usr/bin/gcc -x assembler-with-cpp -c -o /dev/null /dev/null
  Time (mean ± σ):      12.7 ms ±   1.0 ms    [User: 9.1 ms, System: 3.6 ms]
  Range (min … max):     9.6 ms …  14.2 ms    225 runs

Summary
  '/usr/bin/gcc -x assembler -c -o /dev/null /dev/null' ran
    2.29 ± 0.28 times faster than '/usr/bin/gcc -x assembler-with-cpp -c -o /dev/null /dev/null'

$ hyperfine -L lang assembler,assembler-with-cpp -N -w 5 "/usr/bin/clang -x {lang} -c -o /dev/null /dev/null"
Benchmark 1: /usr/bin/clang -x assembler -c -o /dev/null /dev/null
  Time (mean ± σ):      21.0 ms ±   1.1 ms    [User: 9.6 ms, System: 11.1 ms]
  Range (min … max):    13.9 ms …  22.0 ms    138 runs

Benchmark 2: /usr/bin/clang -x assembler-with-cpp -c -o /dev/null /dev/null
  Time (mean ± σ):      56.9 ms ±   3.2 ms    [User: 27.2 ms, System: 29.5 ms]
  Range (min … max):    53.9 ms …  62.1 ms    48 runs

Summary
  '/usr/bin/clang -x assembler -c -o /dev/null /dev/null' ran
    2.71 ± 0.20 times faster than '/usr/bin/clang -x assembler-with-cpp -c -o /dev/null /dev/null'
---
 scripts/Kconfig.include   | 2 +-
 scripts/Makefile.compiler | 8 ++++----
 scripts/as-version.sh     | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 274125307ebd..5a84b6443875 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -33,7 +33,7 @@ ld-option = $(success,$(LD) -v $(1))
 
 # $(as-instr,<instr>)
 # Return y if the assembler supports <instr>, n otherwise
-as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
+as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler-with-cpp -o /dev/null -)
 
 # check if $(CC) and $(LD) exist
 $(error-if,$(failure,command -v $(CC)),C compiler '$(CC)' not found)
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 3d8adfd34af1..7aa1fbc4aafe 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -29,16 +29,16 @@ try-run = $(shell set -e;		\
 	fi)
 
 # as-option
-# Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
+# Usage: aflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
 
 as-option = $(call try-run,\
-	$(CC) $(KBUILD_CFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
+	$(CC) -Werror $(KBUILD_AFLAGS) $(1) -c -x assembler-with-cpp /dev/null -o "$$TMP",$(1),$(2))
 
 # as-instr
-# Usage: cflags-y += $(call as-instr,instr,option1,option2)
+# Usage: aflags-y += $(call as-instr,instr,option1,option2)
 
 as-instr = $(call try-run,\
-	printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
+	printf "%b\n" "$(1)" | $(CC) -Werror $(KBUILD_AFLAGS) -c -x assembler-with-cpp -o "$$TMP" -,$(2),$(3))
 
 # __cc-option
 # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
diff --git a/scripts/as-version.sh b/scripts/as-version.sh
index 1a21495e9ff0..af717476152d 100755
--- a/scripts/as-version.sh
+++ b/scripts/as-version.sh
@@ -45,7 +45,7 @@ orig_args="$@"
 # Get the first line of the --version output.
 IFS='
 '
-set -- $(LC_ALL=C "$@" -Wa,--version -c -x assembler /dev/null -o /dev/null 2>/dev/null)
+set -- $(LC_ALL=C "$@" -Wa,--version -c -x assembler-with-cpp /dev/null -o /dev/null 2>/dev/null)
 
 # Split the line on spaces.
 IFS=' '

-- 
2.39.0
