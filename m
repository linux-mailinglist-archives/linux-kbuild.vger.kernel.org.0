Return-Path: <linux-kbuild+bounces-9082-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66476BCE935
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 23:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 229E8189E044
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 21:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B6E302741;
	Fri, 10 Oct 2025 21:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fpu42L02"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C068E2ED860
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Oct 2025 21:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760130108; cv=none; b=uhPuhDSx/Ndv7J6HVbB1hHpAm+YdB4226ADAGgXjkp0dvcprBaRUYuO7RzTgsEWhhn6mysMS/At6HgWdbxzNgfdmvIRFDfqa0kFWWCyRsu7pNybfe9zAYZwnU4LRZ5aObh8O0FMj0F1tx7PHRf/2HgQV0HC1xQBtdKiJVLDepVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760130108; c=relaxed/simple;
	bh=q2WVUyCG5tHc5o5qJP5O0XCzNOqQPweayFUQN6bek4Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XrXVQI7lECzILJmTBEsgb4yGWq/Xsea7vLfzPT5jXI7ZB8N1x2bjYajpsL0VEizS97ThP9kqKsZ65OYHkX3IerOV54VvG9jYjXZCJjwM1VQ7T6YLmThdeH4Tlr+IKSamGWVzWGjEBJ/AcW0UK+ATaK6IP8dKoDweP10WEkBqb6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fpu42L02; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2699ed6d43dso53085485ad.1
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Oct 2025 14:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760130104; x=1760734904; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q/wDnyhqkiKRqW0IjdCp0H/hnRPnE56SCwkMuf1SQlY=;
        b=fpu42L02e0bBNKn05/KX6GFnfECBFbMqR7VY84CB3lAFvDbvvGaw7O1ejiAybr7eC0
         AtH/I98/rXi4XXEcU/2eBXSfS0z2fRuaOQ7DvXzq0q+RFIFJsIozhMK3PkVmVWGuAG6A
         DlIxopGjScCm8IQNZxgAUuWkSedXRz/g3+HUVRgEd3nUW8BfCP9ZLT2HVRXa2MZLpCbS
         ftPOIu43fMhFhMhTSGVnPQ6YTVxD0mugMkzKHSTFBIWzPIyQDiY6PIoybDEgBFKcsNho
         wyXr554alWaY3m4Bboyc7KBnP1JJIgsFNPGVvBP9zayrds/Aay71OEi9lZly3QtwL0/H
         H0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760130104; x=1760734904;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/wDnyhqkiKRqW0IjdCp0H/hnRPnE56SCwkMuf1SQlY=;
        b=fkGIU78a/1TjHJcQixzCrt0EM+7+8cO0gvMQoQftHlOOtCMcMwGL/4VztRMRxGBFjU
         GiZkyY1g9esakWoAdd6tKAh6sGeHyLj5CddZGA5CMKCbzNucK9VxNbkg/NHHVSaKbgFr
         LfFUEucMdW71T23Z9KzLDHnIg49eyxMAst/r+Ua4MIS0ZVr96vmZUAOApSBu156z0Ct3
         MrXlR5WhIFA69RGvvLzT4IISUxx9MAdirJKA7gGp8rTOK2AySvOofSmXa0n20aQdl6tK
         zmp/E/mgWflz29+Mv5uCDjgxqEwDJs1ZNQ4htd61q4GG3FPO8H/jeWQILO7e8Z/l8K8o
         9Bpg==
X-Gm-Message-State: AOJu0Yy4C5VT59qUNHxqPq1MYAR5rYiSTkV0UueMUzh8zuVM3mPlJvuJ
	vFFIaUDhsnxqCrgEtk+Bdf+26YE5UkpxqARk05LAc7A5OEl8x3fH8/kzNslKIhifs3rnRg==
X-Google-Smtp-Source: AGHT+IH7+DQHEYaFa4vkW04Ba4BYGyws7ixpIQqYpHEmAr7KOX0ZVzNnotiWDd8X62vdONAhobou7zg=
X-Received: from pld16.prod.google.com ([2002:a17:903:3550:b0:290:28e2:ce62])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce87:b0:250:6d0e:1e40
 with SMTP id d9443c01a7336-29027356a6emr202791475ad.7.1760130103552; Fri, 10
 Oct 2025 14:01:43 -0700 (PDT)
Date: Fri, 10 Oct 2025 21:01:32 +0000
In-Reply-To: <20251010210134.2066321-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251010210134.2066321-1-xur@google.com>
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
Message-ID: <20251010210134.2066321-2-xur@google.com>
Subject: [PATCH 2/4] kbuild: Disable AutoFDO and Propeller flags for kernel modules
From: xur@google.com
To: Alexey Gladkov <legion@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Bill Wendling <morbo@google.com>, Han Shen <shenhan@google.com>, 
	Ingo Molnar <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Tamir Duberstein <tamird@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	"=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?=" <thomas.weissschuh@linutronix.de>, Yabin Cui <yabinc@google.com>, 
	Sriraman Tallam <tmsriram@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

AutoFDO and Propeller build currently does not support kernel modules,
but the corresponding build flags are still being set.

This change suppresses these build flags for modules. These flags can
be re-enabled once Propeller support for kernel modules is added.

Signed-off-by: Rong Xu <xur@google.com>
---
 Makefile                   |  9 +++++----
 scripts/Makefile.autofdo   |  9 ++++++---
 scripts/Makefile.lib       |  9 ++++++---
 scripts/Makefile.propeller | 12 ++++++++----
 scripts/Makefile.vmlinux_o |  2 +-
 5 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/Makefile b/Makefile
index 6f88b1d3b40d9..f40bee23d5536 100644
--- a/Makefile
+++ b/Makefile
@@ -1230,14 +1230,15 @@ PHONY += vmlinux
 # not for decompressors. LDFLAGS_vmlinux in arch/*/boot/compressed/Makefile is
 # unrelated; the decompressors just happen to have the same base name,
 # arch/*/boot/compressed/vmlinux.
-# Export LDFLAGS_vmlinux only to scripts/Makefile.vmlinux.
+# Export LDFLAGS_vmlinux only to scripts/Makefile.vmlinux, and
+# scripts/Makefile.vmlinux_o.
 #
 # _LDFLAGS_vmlinux is a workaround for the 'private export' bug:
 #   https://savannah.gnu.org/bugs/?61463
 # For Make > 4.4, the following simple code will work:
-#  vmlinux: private export LDFLAGS_vmlinux := $(LDFLAGS_vmlinux)
-vmlinux: private _LDFLAGS_vmlinux := $(LDFLAGS_vmlinux)
-vmlinux: export LDFLAGS_vmlinux = $(_LDFLAGS_vmlinux)
+#  vmlinux vmlinux_o: private export LDFLAGS_vmlinux := $(LDFLAGS_vmlinux)
+vmlinux vmlinux_o: private _LDFLAGS_vmlinux := $(LDFLAGS_vmlinux)
+vmlinux vmlinux_o: export LDFLAGS_vmlinux = $(_LDFLAGS_vmlinux)
 vmlinux: vmlinux.o $(KBUILD_LDS) modpost
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux
 
diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 1caf2457e585c..5bcfcef273745 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -14,11 +14,14 @@ ifdef CLANG_AUTOFDO_PROFILE
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
+  _ldflags_autofdo := --mllvm=-enable-fs-discriminator=true --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
+  _ldflags_autofdo += -plugin-opt=-split-machine-functions
   ifdef CLANG_AUTOFDO_PROFILE
-    KBUILD_LDFLAGS += --lto-sample-profile=$(CLANG_AUTOFDO_PROFILE)
+    _ldflags_autofdo += --lto-sample-profile=$(CLANG_AUTOFDO_PROFILE)
   endif
-  KBUILD_LDFLAGS += --mllvm=-enable-fs-discriminator=true --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
-  KBUILD_LDFLAGS += -plugin-opt=-split-machine-functions
+  # TODO: change LDFLAGS_vmlinux to KBUILD_LDFLAGS when kernel modules
+  # are supported.
+  LDFLAGS_vmlinux += $(_ldflags_autofdo)
 endif
 
 export CFLAGS_AUTOFDO_CLANG
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 53c02fc3b348a..0f6874e8d584d 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -108,20 +108,23 @@ endif
 #
 # Enable AutoFDO build flags except some files or directories we don't want to
 # enable (depends on variables AUTOFDO_PROFILE_obj.o and AUTOFDO_PROFILE).
-#
+# TODO: change '$(part-of-builtin)' to '$(is-kernel-object)' when the AutoFDO
+# build supports modules.
 ifeq ($(CONFIG_AUTOFDO_CLANG),y)
 _c_flags += $(if $(patsubst n%,, \
-	$(AUTOFDO_PROFILE_$(target-stem).o)$(AUTOFDO_PROFILE)$(is-kernel-object)), \
+	$(AUTOFDO_PROFILE_$(target-stem).o)$(AUTOFDO_PROFILE)$(part-of-builtin)), \
 	$(CFLAGS_AUTOFDO_CLANG))
 endif
 
 #
 # Enable Propeller build flags except some files or directories we don't want to
 # enable (depends on variables AUTOFDO_PROPELLER_obj.o and PROPELLER_PROFILE).
+# TODO: change '$(part-of-builtin)' to '$(is-kernel-object)' when the Propeller
+# build supports modules.
 #
 ifdef CONFIG_PROPELLER_CLANG
 _c_flags += $(if $(patsubst n%,, \
-	$(PROPELLER_PROFILE_$(target-stem).o)$(PROPELLER_PROFILE)$(is-kernel-object)), \
+	$(PROPELLER_PROFILE_$(target-stem).o)$(PROPELLER_PROFILE)$(part-of-builtin)), \
 	$(CFLAGS_PROPELLER_CLANG))
 endif
 
diff --git a/scripts/Makefile.propeller b/scripts/Makefile.propeller
index 48a660128e256..fa018098506b8 100644
--- a/scripts/Makefile.propeller
+++ b/scripts/Makefile.propeller
@@ -3,7 +3,7 @@
 # Enable available and selected Clang Propeller features.
 ifdef CLANG_PROPELLER_PROFILE_PREFIX
   CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=list=$(CLANG_PROPELLER_PROFILE_PREFIX)_cc_profile.txt -ffunction-sections
-  KBUILD_LDFLAGS += --symbol-ordering-file=$(CLANG_PROPELLER_PROFILE_PREFIX)_ld_profile.txt --no-warn-symbol-ordering
+  _ldflags_propeller := --symbol-ordering-file=$(CLANG_PROPELLER_PROFILE_PREFIX)_ld_profile.txt --no-warn-symbol-ordering
 else
   # Starting with Clang v20, the '-fbasic-block-sections=labels' option is
   # deprecated. Use the recommended '-fbasic-block-address-map' option.
@@ -26,14 +26,18 @@ endif
 
 ifdef CONFIG_LTO_CLANG_THIN
   ifdef CLANG_PROPELLER_PROFILE_PREFIX
-    KBUILD_LDFLAGS += --lto-basic-block-sections=$(CLANG_PROPELLER_PROFILE_PREFIX)_cc_profile.txt
+    _ldflags_propeller += --lto-basic-block-sections=$(CLANG_PROPELLER_PROFILE_PREFIX)_cc_profile.txt
   else
     ifeq ($(call test-ge, $(CONFIG_LLD_VERSION), 200000),y)
-       KBUILD_LDFLAGS += --lto-basic-block-address-map
+       _ldflags_propeller += --lto-basic-block-address-map
     else
-       KBUILD_LDFLAGS += --lto-basic-block-sections=labels
+       _ldflags_propeller += --lto-basic-block-sections=labels
     endif
   endif
 endif
 
+# TODO: change LDFLAGS_vmlinux to KBUILD_LDFLAGS when kernel modules
+# are supported.
+LDFLAGS_vmlinux += $(_ldflags_propeller)
+
 export CFLAGS_PROPELLER_CLANG
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 23c8751285d79..9c4f0841e5c5d 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -56,7 +56,7 @@ vmlinux-o-ld-args-$(CONFIG_BUILTIN_MODULE_RANGES)	+= -Map=$@.map
 
 quiet_cmd_ld_vmlinux.o = LD      $@
       cmd_ld_vmlinux.o = \
-	$(LD) ${KBUILD_LDFLAGS} -r -o $@ \
+	$(LD) $(KBUILD_LDFLAGS) $(LDFLAGS_vmlinux) -r -o $@ \
 	$(vmlinux-o-ld-args-y) \
 	$(addprefix -T , $(initcalls-lds)) \
 	--whole-archive vmlinux.a --no-whole-archive \
-- 
2.51.0.740.g6adb054d12-goog


