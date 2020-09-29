Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE14327DAC9
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Sep 2020 23:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbgI2Vri (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Sep 2020 17:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728704AbgI2VrA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Sep 2020 17:47:00 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC40C0613D0
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Sep 2020 14:47:00 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id p187so6463274ybg.14
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Sep 2020 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=tVbCdCSbxCxD3KjIFwFCcvevxc6usIE71x0z99le3Xc=;
        b=eZ/5sVKnBr6ETXLdCzUKVHkXliivlbESd/B9g8CtynbriyH6DBY5y1NzO83VqIy/h9
         zdzoSBE8K0Xh2RtwY2s+GlJSREAPnnlAvBttPZFcHJKTEY+pQfm+ztsZFnHbNpzlJ8BL
         XEzDaaVJtTF8dQUFmwODKgysmdJ8ssOXw44bbqX2MP6dDtzJMAa9dVLrJihF9AqXb18t
         tbp6uCl4/7+dA3LQr5BvE5stOIcw7t4ZqclUBGYeg6f0GFzBhBSJNrBSHua55Ij65JHZ
         IC0O1orcqdobvdY/c53mGX0TFLCmnqLQZtWQFtSZnOCIbqQXW8NoOZYZCz8RNjOx5S2c
         dy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=tVbCdCSbxCxD3KjIFwFCcvevxc6usIE71x0z99le3Xc=;
        b=C/1HW9WcMcUiicPs2IQOpmuXAchdP4pLMT1o+nhJNF7sJa3nk948zn2lq4DdXggk3N
         JEUbNHCD25dir/ZfMTJjx6q18/NUdcRa08pFvNMkO6BvrK0ZJCmZGwGNKS0VQlDqAm9F
         QRscCiJnfErmGBmwXQWFGZBCRFVugCTP8NC1h1+lDtsuFB0xVBHGqihonrInuzmnoEmM
         i+ekxY7dWerzT3dhoG+gs0CDJlSMmUKMq+bgc+UJVomt15AakPARzAi2yftP6Td1Y42H
         0FkDV3wRs5oo6tv8mS9dKuGwZxkrbUQJBY17M//T/BCfprGJ7br4oiDiEZAXygTq4kKi
         jvyQ==
X-Gm-Message-State: AOAM530SsSdtfqqZLuOZmZ5gFGvFtaIXf91sVzEaCq5LazTtXZa8onHy
        Cc0bo1o00ep8bVFzWGWB5S3wUGRgAiPvfJfta3M=
X-Google-Smtp-Source: ABdhPJy8enqFolbXs8qwfYSILQQkb9ujrLEmxZKfggE9XNXDO7JqswMCtpTbc1qAwa0mZOxpoGgL66PRFsY0rIba6wo=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a25:ae4e:: with SMTP id
 g14mr9182749ybe.156.1601416019420; Tue, 29 Sep 2020 14:46:59 -0700 (PDT)
Date:   Tue, 29 Sep 2020 14:46:14 -0700
In-Reply-To: <20200929214631.3516445-1-samitolvanen@google.com>
Message-Id: <20200929214631.3516445-13-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200929214631.3516445-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v4 12/29] kbuild: lto: fix module versioning
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With CONFIG_MODVERSIONS, version information is linked into each
compilation unit that exports symbols. With LTO, we cannot use this
method as all C code is compiled into LLVM bitcode instead. This
change collects symbol versions into .symversions files and merges
them in link-vmlinux.sh where they are all linked into vmlinux.o at
the same time.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 .gitignore               |  1 +
 Makefile                 |  3 ++-
 arch/Kconfig             |  1 -
 scripts/Makefile.build   | 33 +++++++++++++++++++++++++++++++--
 scripts/Makefile.modpost |  6 +++++-
 scripts/link-vmlinux.sh  | 25 ++++++++++++++++++++++++-
 6 files changed, 63 insertions(+), 6 deletions(-)

diff --git a/.gitignore b/.gitignore
index 162bd2b67bdf..06e76dc39ffe 100644
--- a/.gitignore
+++ b/.gitignore
@@ -41,6 +41,7 @@
 *.so.dbg
 *.su
 *.symtypes
+*.symversions
 *.tab.[ch]
 *.tar
 *.xz
diff --git a/Makefile b/Makefile
index 8e2eaf6452ba..23cdb475c445 100644
--- a/Makefile
+++ b/Makefile
@@ -1827,7 +1827,8 @@ clean: $(clean-dirs)
 		-o -name '.tmp_*.o.*' \
 		-o -name '*.c.[012]*.*' \
 		-o -name '*.ll' \
-		-o -name '*.gcno' \) -type f -print | xargs rm -f
+		-o -name '*.gcno' \
+		-o -name '*.*.symversions' \) -type f -print | xargs rm -f
 
 # Generate tags for editors
 # ---------------------------------------------------------------------------
diff --git a/arch/Kconfig b/arch/Kconfig
index 0742ec643d79..520e900efc75 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -603,7 +603,6 @@ config LTO_CLANG
 	depends on !FTRACE_MCOUNT_RECORD
 	depends on !KASAN
 	depends on !GCOV_KERNEL
-	depends on !MODVERSIONS
 	select LTO
 	help
           This option enables Clang's Link Time Optimization (LTO), which
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ed74b2f986f7..eae2f5386a03 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -166,6 +166,15 @@ ifdef CONFIG_MODVERSIONS
 #   the actual value of the checksum generated by genksyms
 # o remove .tmp_<file>.o to <file>.o
 
+ifdef CONFIG_LTO_CLANG
+# Generate .o.symversions files for each .o with exported symbols, and link these
+# to the kernel and/or modules at the end.
+cmd_modversions_c =								\
+	if $(NM) $@ 2>/dev/null | grep -q __ksymtab; then			\
+		$(call cmd_gensymtypes_c,$(KBUILD_SYMTYPES),$(@:.o=.symtypes))	\
+		    > $@.symversions;						\
+	fi;
+else
 cmd_modversions_c =								\
 	if $(OBJDUMP) -h $@ | grep -q __ksymtab; then				\
 		$(call cmd_gensymtypes_c,$(KBUILD_SYMTYPES),$(@:.o=.symtypes))	\
@@ -177,6 +186,7 @@ cmd_modversions_c =								\
 		rm -f $(@D)/.tmp_$(@F:.o=.ver);					\
 	fi
 endif
+endif
 
 ifdef CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
 # compiler will not generate __mcount_loc use recordmcount or recordmcount.pl
@@ -390,6 +400,18 @@ $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
 $(subdir-builtin): $(obj)/%/built-in.a: $(obj)/% ;
 $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
 
+# combine symversions for later processing
+quiet_cmd_update_lto_symversions = SYMVER  $@
+ifeq ($(CONFIG_LTO_CLANG) $(CONFIG_MODVERSIONS),y y)
+      cmd_update_lto_symversions =					\
+	rm -f $@.symversions						\
+	$(foreach n, $(filter-out FORCE,$^),				\
+		$(if $(wildcard $(n).symversions),			\
+			; cat $(n).symversions >> $@.symversions))
+else
+      cmd_update_lto_symversions = echo >/dev/null
+endif
+
 #
 # Rule to compile a set of .o files into one .a file (without symbol table)
 #
@@ -397,8 +419,11 @@ $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
 quiet_cmd_ar_builtin = AR      $@
       cmd_ar_builtin = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
 
+quiet_cmd_ar_and_symver = AR      $@
+      cmd_ar_and_symver = $(cmd_update_lto_symversions); $(cmd_ar_builtin)
+
 $(obj)/built-in.a: $(real-obj-y) FORCE
-	$(call if_changed,ar_builtin)
+	$(call if_changed,ar_and_symver)
 
 #
 # Rule to create modules.order file
@@ -418,8 +443,11 @@ $(obj)/modules.order: $(obj-m) FORCE
 #
 # Rule to compile a set of .o files into one .a file (with symbol table)
 #
+quiet_cmd_ar_lib = AR      $@
+      cmd_ar_lib = $(cmd_update_lto_symversions); $(cmd_ar)
+
 $(obj)/lib.a: $(lib-y) FORCE
-	$(call if_changed,ar)
+	$(call if_changed,ar_lib)
 
 # NOTE:
 # Do not replace $(filter %.o,^) with $(real-prereqs). When a single object
@@ -428,6 +456,7 @@ $(obj)/lib.a: $(lib-y) FORCE
 ifdef CONFIG_LTO_CLANG
 quiet_cmd_link_multi-m = AR [M]  $@
 cmd_link_multi-m =						\
+	$(cmd_update_lto_symversions);				\
 	rm -f $@; 						\
 	$(AR) cDPrsT $@ $(filter %.o,$^)
 else
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 66e0c256403c..753725b88683 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -108,7 +108,11 @@ ifdef CONFIG_LTO_CLANG
 prelink-ext = .lto
 
 quiet_cmd_cc_lto_link_modules = LTO [M] $@
-cmd_cc_lto_link_modules = $(LD) $(ld_flags) -r -o $@ --whole-archive $^
+cmd_cc_lto_link_modules =						\
+	$(LD) $(ld_flags) -r -o $@					\
+		$(shell [ -s $(@:.lto.o=.o.symversions) ] &&		\
+			echo -T $(@:.lto.o=.o.symversions))		\
+		--whole-archive $^
 
 %.lto.o: %.o
 	$(call if_changed,cc_lto_link_modules)
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index ebb9f912aab6..3e99a19b9195 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -43,11 +43,28 @@ info()
 	fi
 }
 
+# If CONFIG_LTO_CLANG is selected, collect generated symbol versions into
+# .tmp_symversions.lds
+gen_symversions()
+{
+	info GEN .tmp_symversions.lds
+	rm -f .tmp_symversions.lds
+
+	for a in ${KBUILD_VMLINUX_OBJS} ${KBUILD_VMLINUX_LIBS}; do
+		for o in $(${AR} t $a 2>/dev/null); do
+			if [ -f ${o}.symversions ]; then
+				cat ${o}.symversions >> .tmp_symversions.lds
+			fi
+		done
+	done
+}
+
 # Link of vmlinux.o used for section mismatch analysis
 # ${1} output file
 modpost_link()
 {
 	local objects
+	local lds=""
 
 	objects="--whole-archive				\
 		${KBUILD_VMLINUX_OBJS}				\
@@ -57,6 +74,11 @@ modpost_link()
 		--end-group"
 
 	if [ -n "${CONFIG_LTO_CLANG}" ]; then
+		if [ -n "${CONFIG_MODVERSIONS}" ]; then
+			gen_symversions
+			lds="${lds} -T .tmp_symversions.lds"
+		fi
+
 		# This might take a while, so indicate that we're doing
 		# an LTO link
 		info LTO ${1}
@@ -64,7 +86,7 @@ modpost_link()
 		info LD ${1}
 	fi
 
-	${LD} ${KBUILD_LDFLAGS} -r -o ${1} ${objects}
+	${LD} ${KBUILD_LDFLAGS} -r -o ${1} ${lds} ${objects}
 }
 
 objtool_link()
@@ -242,6 +264,7 @@ cleanup()
 {
 	rm -f .btf.*
 	rm -f .tmp_System.map
+	rm -f .tmp_symversions.lds
 	rm -f .tmp_vmlinux*
 	rm -f System.map
 	rm -f vmlinux
-- 
2.28.0.709.gb0816b6eb0-goog

