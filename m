Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24B8282513
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Oct 2020 17:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbgJCPVf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 3 Oct 2020 11:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgJCPVf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 3 Oct 2020 11:21:35 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF7AC0613D0;
        Sat,  3 Oct 2020 08:21:35 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t23so2032630pji.0;
        Sat, 03 Oct 2020 08:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=l/P8bXlpdS7hKkb+vBkGufM4cQSzKzU38G16UO2xhSM=;
        b=NUELTX9MYZwZ0qmChVIpQMZOA0R9gQhtJcKJYEIyKt4hhCQmyKRQ5xWatQFdNGz8i3
         n5/4m0w01n8bu0nEqZz9+BZAJf8xV2EaJEIVzNRxqoWb15tw6QM607TuLmnma2j+U1cQ
         7AjciRCBSUIs3WL5VW5YN778QV/uLAX4V4hvfaCGkPAzcUX3kHU/0MArU35FXsIhLdC8
         o3YgTXVyfJ4/PfF8xzmFUibii6/VwBf5ozxeMGXBRr6SPD0z4l+N3g2h7wQrJQntBYy2
         c+vS/eY0buy5tZ/sBpvezeca4zdKX5joK3Vu7BVpyF/oeTNpPTlYfhvNNrRiTcFVWGfS
         TQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=l/P8bXlpdS7hKkb+vBkGufM4cQSzKzU38G16UO2xhSM=;
        b=uRyNg1N8nxk8ZRFQXhe/A7Slr8IZFRlKLjGyxWSJMi+/U0jFXEkYMsG2oOmn3s0FSw
         I7icBtHsCRcRtpTkm9m6FJkVAqDjesAFdGo7TWp3zUUN2/19S7l5aTbS5BLVVdSp+cwn
         rFe/9bskTtazIOWHpBGtKNNRajCN2j3qoSLqyAk7993jg904HEtsIAqbSF8tQpo0BCA9
         vW4f9voZZLPmoF77UN2q8H+Y2Mm9pE0l+tAx+FZk834LGBfWs2xtjawwJC4etVy/sg9c
         4Z0zjSjK6E1ATC148Ug/5Z/THwi0wXFVSbgaj0D9lBasj4cK1nXwe4ivCcTLZqsoeVYZ
         OKiA==
X-Gm-Message-State: AOAM533HFdcK3WVt4WVzRZjsnBXo28O3c9c6h0mLMBZOZxMSgZ/SDkOz
        prdsVHqY3ndISi8TxHSiaU4=
X-Google-Smtp-Source: ABdhPJyxBf1T0SKtqw6BFlG+BT+UZXKVLEtyAshw6qptV6ujOfLJmmBb4FxK5J5YBtLNAf01yiAh/w==
X-Received: by 2002:a17:90a:1189:: with SMTP id e9mr3196782pja.124.1601738494919;
        Sat, 03 Oct 2020 08:21:34 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
        by smtp.gmail.com with ESMTPSA id n125sm6026241pfn.185.2020.10.03.08.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 08:21:34 -0700 (PDT)
From:   Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Subject: [PATCH RFC 2/2] kbuild: use interpreters to invoke scripts
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
Message-ID: <979bb7b0-2cae-3cd7-2fbd-7fcece9aafd1@gmail.com>
Date:   Sat, 3 Oct 2020 20:51:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
index f93dbae71248..5f1399a576d4 100644
--- a/Makefile
+++ b/Makefile
@@ -1258,7 +1258,7 @@ include/generated/utsrelease.h: include/config/kernel.release FORCE
 PHONY += headerdep
 headerdep:
 	$(Q)find $(srctree)/include/ -name '*.h' | xargs --max-args 1 \
-	$(srctree)/scripts/headerdep.pl -I$(srctree)/include
+	$(PERL) $(srctree)/scripts/headerdep.pl -I$(srctree)/include
 
 # ---------------------------------------------------------------------------
 # Kernel headers
@@ -1314,7 +1314,7 @@ PHONY += kselftest-merge
 kselftest-merge:
 	$(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
 	$(Q)find $(srctree)/tools/testing/selftests -name config | \
-		xargs $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
+		xargs $(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
 	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 
 # ---------------------------------------------------------------------------
diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index de981f7b4546..30fe93bb5488 100644
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
index 572475b7b7ed..4f8fe34bc75a 100644
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
index 2876a7df1b0a..5f6cc3c3da50 100644
--- a/arch/ia64/Makefile
+++ b/arch/ia64/Makefile
@@ -28,8 +28,8 @@ cflags-y	:= -pipe $(EXTRA) -ffixed-r13 -mfixed-range=f12-f15,f32-f127 \
 		   -falign-functions=32 -frename-registers -fno-optimize-sibling-calls
 KBUILD_CFLAGS_KERNEL := -mconstant-gp
 
-GAS_STATUS	= $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
-KBUILD_CPPFLAGS += $(shell $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
+GAS_STATUS	= $($(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
+KBUILD_CPPFLAGS += $($(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
 
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
2.26.2

