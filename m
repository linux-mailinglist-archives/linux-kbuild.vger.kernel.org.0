Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61E6228BECA
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Oct 2020 19:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404102AbgJLRIw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Oct 2020 13:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403963AbgJLRIv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Oct 2020 13:08:51 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FE4C0613D1;
        Mon, 12 Oct 2020 10:08:51 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id u24so14942780pgi.1;
        Mon, 12 Oct 2020 10:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fT6XJEOZVDbLTBZovNOeO+UYee7jv5dnBvuNn+sMKxw=;
        b=JqS8AOqeq96ycoVp+btPdJVjNPd+Xty9KS2yqWyBw+0Q9nis4hopLL8VETSTP5zqXN
         tI5s5EhyHAJsRdsA9EqPUKxzvnVqRRm5Tlc+/9rfqSmYzkfFQdhtwT22mx2X0c2WEej5
         S4ZLet4V+EFdZKpcP+K/ymb+Gffrjb9r/Am7BvJJA7N+6DeX83ogj1Pa0zmVEs+DE0Td
         kcjR12Ua6Ov3GlNNOihXbnrQW0LgyhPPPzHJs1ySy1oW/e2grUmCqEODbtL5r29eUQ1W
         a52EIdxAqKlV996fU5KpwheiaMHf2MLBN8rZ71kxxplZToSDaGTCUA0TKu4awwt1cp82
         qk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fT6XJEOZVDbLTBZovNOeO+UYee7jv5dnBvuNn+sMKxw=;
        b=LF9MzbnZIMRcgdU6BRqvB3RSBmJCeujxlJquYmgF4l6dgMpO+aqJzC4dmLwdazRtqB
         DZfUpjv7dWOeDhcJAuYdBb5gzU1jCQbNojZ2FsImHKCI/FayXlf/MtYOZ2JdlF6bK0Wx
         YThL8N7TWCfI81UdeRDT+WlpbascWjMSOrzFbAZ87apQZF5YQiyx5Jy1pumFUgfNASM6
         wrE5w4h1vSjSO4gkP3Y5itXuH0+W2eTWyfqgIqCbXXKYxoKWy2n561Txt7d9zfy5e/JU
         /benwMw/o9haUlRLUFe6/T45pYC8is5AYLfFmhGMT3AhrpMY9ye1UsDMYTFQVVC99WIG
         6FIA==
X-Gm-Message-State: AOAM5319zoErsGxnCrewvNMh9IAFngnBesbnKwVmpmqqHw8okSXP4G33
        pu0I5wo60i8P6OlRWcA4vpo=
X-Google-Smtp-Source: ABdhPJwDovtBRijfKeWfs9oXpvTMkWXRYOnu2JubAC+W5Qj4o/BWtIEYLei/veQhbKFFaahLowAQfg==
X-Received: by 2002:a62:6dc2:0:b029:152:637c:4cf5 with SMTP id i185-20020a626dc20000b0290152637c4cf5mr24218135pfc.15.1602522529135;
        Mon, 12 Oct 2020 10:08:49 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
        by smtp.gmail.com with ESMTPSA id x16sm20494337pff.14.2020.10.12.10.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 10:08:48 -0700 (PDT)
From:   Ujjwal Kumar <ujjwalkumar0501@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2 2/2] kbuild: use interpreters to invoke scripts
Date:   Mon, 12 Oct 2020 22:36:31 +0530
Message-Id: <20201012170631.1241502-3-ujjwalkumar0501@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012170631.1241502-1-ujjwalkumar0501@gmail.com>
References: <20201012170631.1241502-1-ujjwalkumar0501@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We cannot rely on execute bits to be set on files in the repository.
The build script should use the explicit interpreter when invoking any
script from the repository.

Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Suggested-by: Kees Cook <keescook@chromium.org>
Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
---
 Makefile                          | 4 ++--
 arch/arm64/kernel/vdso/Makefile   | 2 +-
 arch/arm64/kernel/vdso32/Makefile | 2 +-
 arch/ia64/Makefile                | 4 ++--
 arch/nds32/kernel/vdso/Makefile   | 2 +-
 scripts/Makefile.build            | 2 +-
 scripts/Makefile.package          | 4 ++--
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 0af7945caa61..df20e71dd7c8 100644
--- a/Makefile
+++ b/Makefile
@@ -1256,7 +1256,7 @@ include/generated/utsrelease.h: include/config/kernel.release FORCE
 PHONY += headerdep
 headerdep:
 	$(Q)find $(srctree)/include/ -name '*.h' | xargs --max-args 1 \
-	$(srctree)/scripts/headerdep.pl -I$(srctree)/include
+	$(PERL) $(srctree)/scripts/headerdep.pl -I$(srctree)/include

 # ---------------------------------------------------------------------------
 # Kernel headers
@@ -1312,7 +1312,7 @@ PHONY += kselftest-merge
 kselftest-merge:
 	$(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
 	$(Q)find $(srctree)/tools/testing/selftests -name config | \
-		xargs $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
+		xargs $(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
 	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig

 # ---------------------------------------------------------------------------
diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index edccdb77c53e..fb07804b7fc1 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -65,7 +65,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
 # Generate VDSO offsets using helper script
 gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
 quiet_cmd_vdsosym = VDSOSYM $@
-      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
+      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@

 include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
 	$(call if_changed,vdsosym)
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 7f96a1a9f68c..617c9ac58156 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -205,7 +205,7 @@ quiet_cmd_vdsomunge = MUNGE   $@
 gen-vdsosym := $(srctree)/$(src)/../vdso/gen_vdso_offsets.sh
 quiet_cmd_vdsosym = VDSOSYM $@
 # The AArch64 nm should be able to read an AArch32 binary
-      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
+      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@

 # Install commands for the unstripped file
 quiet_cmd_vdso_install = INSTALL32 $@
diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
index 703b1c4f6d12..86d42a2d09cb 100644
--- a/arch/ia64/Makefile
+++ b/arch/ia64/Makefile
@@ -27,8 +27,8 @@ cflags-y	:= -pipe $(EXTRA) -ffixed-r13 -mfixed-range=f12-f15,f32-f127 \
 		   -falign-functions=32 -frename-registers -fno-optimize-sibling-calls
 KBUILD_CFLAGS_KERNEL := -mconstant-gp

-GAS_STATUS	= $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
-KBUILD_CPPFLAGS += $(shell $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
+GAS_STATUS	= $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
+KBUILD_CPPFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")

 ifeq ($(GAS_STATUS),buggy)
 $(error Sorry, you need a newer version of the assember, one that is built from	\
diff --git a/arch/nds32/kernel/vdso/Makefile b/arch/nds32/kernel/vdso/Makefile
index 55df25ef0057..e77d4bcfa7c1 100644
--- a/arch/nds32/kernel/vdso/Makefile
+++ b/arch/nds32/kernel/vdso/Makefile
@@ -39,7 +39,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
 # Generate VDSO offsets using helper script
 gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
 quiet_cmd_vdsosym = VDSOSYM $@
-      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
+      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@

 include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
 	$(call if_changed,vdsosym)
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a467b9323442..893217ee4a17 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -104,7 +104,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
 endif

 ifneq ($(KBUILD_EXTRA_WARN),)
-  cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $<
+  cmd_checkdoc = $(PERL) $(srctree)/scripts/kernel-doc -none $<
 endif

 # Compile C sources (.c)
diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index f952fb64789d..4fc16c4776cc 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -44,7 +44,7 @@ if test "$(objtree)" != "$(srctree)"; then \
 	echo >&2; \
 	false; \
 fi ; \
-$(srctree)/scripts/setlocalversion --save-scmversion; \
+$(CONFIG_SHELL) $(srctree)/scripts/setlocalversion --save-scmversion; \
 tar -I $(KGZIP) -c $(RCS_TAR_IGNORE) -f $(2).tar.gz \
 	--transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
 rm -f $(objtree)/.scmversion
@@ -123,7 +123,7 @@ git --git-dir=$(srctree)/.git archive --prefix=$(perf-tar)/         \
 mkdir -p $(perf-tar);                                               \
 git --git-dir=$(srctree)/.git rev-parse HEAD > $(perf-tar)/HEAD;    \
 (cd $(srctree)/tools/perf;                                          \
-util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);              \
+$(CONFIG_SHELL) util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);              \
 tar rf $(perf-tar).tar $(perf-tar)/HEAD $(perf-tar)/PERF-VERSION-FILE; \
 rm -r $(perf-tar);                                                  \
 $(if $(findstring tar-src,$@),,                                     \
--
2.25.1

