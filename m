Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2DF1666935
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jan 2023 04:05:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjALDFk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Jan 2023 22:05:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235746AbjALDFj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Jan 2023 22:05:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B37248831
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Jan 2023 19:05:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CBBF861F3F
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jan 2023 03:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE64AC433F1;
        Thu, 12 Jan 2023 03:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673492737;
        bh=iDpwete7KRRtx7xm+tCbXm0Lyr2zptLdbj1MM4EGk8w=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=GftI4P/BZ/0kxd28y1ROdVK+k29BXoH1LWNqUk3FAga+GFaMTegb4HeUwWJpU3ZmS
         XDncVLjuOWjaBbAa/cqu2RbhUmbX9NEDsCxvG41hVLFWqMoPdfJs7V2Qvj9nc6mgYl
         1upj+nGwqMkw+j5api3ljyzg11f/j554YyFegZ8EtnmzkZ6jGmKv/kEpjuA+8x4PUO
         RhKiACCirnyhfRSjmpNwUrCKN8izJfjjlBEoTqXJ8hilOy4ArK3+GsRwD924SHsn+T
         5Wc3M23glFStB9HoSOXLTYaX+VibOOlQijpmnN/GVzoRFUVooAmA0CDwTczu5LAQ2+
         cWUgwffkOIeog==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 11 Jan 2023 20:05:01 -0700
Subject: [PATCH v2 04/14] kbuild: Update assembler calls to use proper
 flags and language target
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221228-drop-qunused-arguments-v2-4-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
To:     masahiroy@kernel.org
Cc:     ndesaulniers@google.com, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.12-dev-78c63
X-Developer-Signature: v=1; a=openpgp-sha256; l=5349; i=nathan@kernel.org;
 h=from:subject:message-id; bh=ygBZ1B4cc2ZDEctLp77RGqvNTcRd7amEhdM91D44bsY=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMn7K36Xln54Jekq5+1dP/XWgRx3I7WmXbsf/9K7su9+yaYF
 /VY/O0pZGMQ4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEpjUw/DOI6/yuaDpxzi6xqbVVH5
 3+/l24IVh+zZ+t8yadWK647lgHI8PecwJztXrb/R5eOsi8cdGz/hcNB411/6yS6F5cknNLoYMZAA==
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

