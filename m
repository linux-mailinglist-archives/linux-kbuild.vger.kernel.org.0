Return-Path: <linux-kbuild+bounces-6053-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD5DA5BE83
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 12:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 090347A6624
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 11:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D6A252907;
	Tue, 11 Mar 2025 11:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PlR7J/WN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D74A2528E4
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 11:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741691200; cv=none; b=EkxKB/M8gz/GHMGll3V/X3+qaTxh/yChkZnp3ExsWbfUN0ckm1U3XIOQLt/vReJHpFTrUloCZBFkANxXuWlAbPQ8rrH4UCbddi6UWMaPxmJGyDNnZJmQ70zlvN5s3pTg1oC7/WvxZm24IxUSyu12SJSomuH6+TCrcsASkCekgw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741691200; c=relaxed/simple;
	bh=nuTXGI8ywBR/3DStlzvfiJ6kl4aJQpuqoliwSosW38g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K+kQg/vie4pWQjPPPkrSwwI7Jf2t/+qqdjNrEUWLZH68B4fXPKA8vrvFsC2kVlEogkUsTNBBFbxinkMe4BAwl3yG3AemX0SiiwSfTum0//+teZSGlEFy19BloWS1DnCp3MJDzkO/XTJRBvxKs1zEZSzeKIYCaF3zKSe06oSBI+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PlR7J/WN; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43bd8fd03a2so25801845e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 04:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741691197; x=1742295997; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r0pOY4tofDembaukX9fn2OhaJHg8GDHRxWXDT4vsSWs=;
        b=PlR7J/WN5umb6RUjOSDAQBSprkPwCkxSHUbyzerHOAZf9BYZ6rbFBNcXsNLgQtRZO+
         H9dE46trPmfF9JDAET+tJHJT452mwUmtneHWtqdD/v1G8PwXR8Aev8uRGp92om1FQ1hT
         DprL3Fy4Eb5eSG1BVhPuWRXtmHqzVGrumjhgtZx7lBh0TQlVNWYlH5LWO3R9KMSkf6di
         JKWp6KHiGpPp4yJasU6jGXs9ogGs8nhmqyLJLYy4H1iIOT5evbwERxqaLCxOvfZLp/ju
         Xw9iajkJpVoAAFsduPSEL50ZXLV5NwGy4dxjEL/hF3a1wkF83CK7PLHz0jrCSqIO33K2
         by7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741691197; x=1742295997;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r0pOY4tofDembaukX9fn2OhaJHg8GDHRxWXDT4vsSWs=;
        b=PjVyUaCb3Ea1BjnyWc4yy5AYQVuUfpvOi9a8AdjuCXcsI55Ew+Bmjq0kfpVvhNQIu3
         i5lewM9HkWA9MW/2W0BoAvBP60j285dC9Oor5az5izzK5hE1r2Epv2f0VikfsfNbqrBu
         lgmFAsKDUYw8YTDRFSB87fDgxbIsSPmaNB/HlcRo7qG2xYAt4LNu2PkUfhSmHXT95RKv
         SUaUhfGcfeQC8xEQyvQY+byfyZYcHUHZxXP3eU6MI/35mnF1sFhufcmD4/jFl98eaoyE
         DIHjh0QUHREqxt3QSgsmW75M2to+5fOAbeLs78KqnVnD9eSKlgNO1Z6vAURkUzxbHD/j
         dUig==
X-Gm-Message-State: AOJu0Yyzcazf98Ny5ntWLw2QfN2BkvrGmLrW2gRluL26FHzKWjk49ipq
	2I5KwHiNJLNfV5NnJkx72P5j+G/5lxdKnIu+1IwGn/rrnQGa/bKbDSas+dBwgaMtfs+0RQ==
X-Google-Smtp-Source: AGHT+IGEhku/zIe1iRiual1cfIyrMt8hV8x/OqVBxxNoC4DFleOTRI8T74xBPdjh6IEwp0cNKkLMbwLi
X-Received: from wmbg5.prod.google.com ([2002:a05:600c:a405:b0:43b:c967:2f53])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3545:b0:43b:c5a3:2e1a
 with SMTP id 5b1f17b1804b1-43c601cdb15mr136995565e9.2.1741691196808; Tue, 11
 Mar 2025 04:06:36 -0700 (PDT)
Date: Tue, 11 Mar 2025 12:06:21 +0100
In-Reply-To: <20250311110616.148682-6-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250311110616.148682-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2841; i=ardb@kernel.org;
 h=from:subject; bh=B0+BjVhEqATZYwCtJhS5i7zD5aan/y8prf8aoEmbcyI=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf2CpM7pthSzu4aPvXpSPgev23Vu3YksQS/fCZVHG0VTQ
 szexq3qKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABP5Mofhn9JbttvH7X56cdzR
 mlCd7Xz88h23T2t33rvEMftuUoHRwq+MDMtWZDhuZt9YeMCW/Ubg7aPLrrmv0HwcyH4/qOzM7dq pB3kA
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250311110616.148682-10-ardb+git@google.com>
Subject: [PATCH v2 4/4] x86: Get rid of Makefile.postlink
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Instead of generating the vmlinux.relocs file (needed by the
decompressor build to construct the KASLR relocation tables) as a
vmlinux postlink step, which is dubious because it depends on data that
is stripped from vmlinux before the build completes, generate it from
vmlinux.unstripped, which has been introduced specifically for this
purpose.

This ensures that each artifact is rebuilt as needed, rather than as a
side effect of another build rule.

This effectively reverts commit

  9d9173e9ceb6 ("x86/build: Avoid relocation information in final vmlinux")

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/Makefile.postlink        | 38 --------------------
 arch/x86/boot/compressed/Makefile |  9 +++--
 2 files changed, 6 insertions(+), 41 deletions(-)

diff --git a/arch/x86/Makefile.postlink b/arch/x86/Makefile.postlink
deleted file mode 100644
index 445fce66630f..000000000000
--- a/arch/x86/Makefile.postlink
+++ /dev/null
@@ -1,38 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-# ===========================================================================
-# Post-link x86 pass
-# ===========================================================================
-#
-# 1. Separate relocations from vmlinux into vmlinux.relocs.
-# 2. Strip relocations from vmlinux.
-
-PHONY := __archpost
-__archpost:
-
--include include/config/auto.conf
-include $(srctree)/scripts/Kbuild.include
-
-CMD_RELOCS = arch/x86/tools/relocs
-OUT_RELOCS = arch/x86/boot/compressed
-quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/vmlinux.relocs
-      cmd_relocs = \
-	mkdir -p $(OUT_RELOCS); \
-	$(CMD_RELOCS) $@ > $(OUT_RELOCS)/vmlinux.relocs; \
-	$(CMD_RELOCS) --abs-relocs $@
-
-# `@true` prevents complaint when there is nothing to be done
-
-vmlinux vmlinux.unstripped: FORCE
-	@true
-ifeq ($(CONFIG_X86_NEED_RELOCS),y)
-	$(call cmd,relocs)
-endif
-
-clean:
-	@rm -f $(OUT_RELOCS)/vmlinux.relocs
-
-PHONY += FORCE clean
-
-FORCE:
-
-.PHONY: $(PHONY)
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 606c74f27459..5edee7a9786c 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -117,9 +117,12 @@ $(obj)/vmlinux.bin: vmlinux FORCE
 
 targets += $(patsubst $(obj)/%,%,$(vmlinux-objs-y)) vmlinux.bin.all vmlinux.relocs
 
-# vmlinux.relocs is created by the vmlinux postlink step.
-$(obj)/vmlinux.relocs: vmlinux
-	@true
+CMD_RELOCS = arch/x86/tools/relocs
+quiet_cmd_relocs = RELOCS  $@
+      cmd_relocs = $(CMD_RELOCS) $< > $@;$(CMD_RELOCS) --abs-relocs $<
+
+$(obj)/vmlinux.relocs: vmlinux.unstripped FORCE
+	$(call if_changed,relocs)
 
 vmlinux.bin.all-y := $(obj)/vmlinux.bin
 vmlinux.bin.all-$(CONFIG_X86_NEED_RELOCS) += $(obj)/vmlinux.relocs
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


