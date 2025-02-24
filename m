Return-Path: <linux-kbuild+bounces-5873-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FE0A4207A
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 14:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CE323AD1C2
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 13:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D71124EF95;
	Mon, 24 Feb 2025 13:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q80JJEiF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B7D24EF92
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2025 13:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740403322; cv=none; b=chkfvV+17mUFNRWHWalA33h891zPPq5VyMEF8WqHSY7epeSUI24tOFPfFrIi6mEHO//S5tityRsT6j99kq+yZAO3p9IJV7Sh32X6348yV5RVPfiGH426VKp+Tzejfe0qVP+0kKtrMsuU/3bOtpFc8a/bJa520hgLKmFXKPIsfsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740403322; c=relaxed/simple;
	bh=FzJmDucmnQefwM4+rIcbAg9V3khuaZlVJrpghKSzANk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dp/pWrqB07nlBmMzrMzYPGfwmfs3hqJByUagbwTV3Rfjlg/MyPVxmKvzMAbsiPxkeweOOVFRoY7qFyKNsn4oY+K8ZIrLe+C0Rj377t9heSFLU2G0+mihmQpsARkR6W2Fr4zp9H5LA8aQkYYYwaArr2O3D0ApQGDpsf8K+rh8Oa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q80JJEiF; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4399c5baac3so31166085e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2025 05:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740403319; x=1741008119; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0JdvJJa3M4LYnibjLYKa/KT7qCNB3WnDnqZX3OVSW+o=;
        b=Q80JJEiFg11HKPbJESV42lgXqH6Jr9qfbDq8Yv3KTmY0DNeodBtQcPvW03VeNlTCPF
         aJDqgTVbDEZDNOLW0MGd4JDRh8uoGQQWL9fZ4zL7ycYFdErC7TMIrcyNAFjnWrILSRRo
         9H9KIrC3lib4wDa7HOWg5KeA3sla+gZmKPprB6346zdaauUTIZhh1kR/4xV2dH43Q1Fp
         en/8f9jHBvJTQkIXyj8+LFHSYhKipAhGCk5gV+6x5Uq06nouldjHmii8ie3iJmJc41/p
         QxvILN12yJhykJb48MjkUlabiojLRmDdQtt5T/qGjH3QdNeV9pRkltyY0zdTHltEoRAG
         p1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740403319; x=1741008119;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JdvJJa3M4LYnibjLYKa/KT7qCNB3WnDnqZX3OVSW+o=;
        b=eruUjcySe3xGUdOSsV5bPOoE3UiVb7X/zj/N+Z0WZWQYX/cbMrCw8IhIZdKuFFF3jk
         xnvxYh6b5I7Bzz6wFO9LtMqX3tjzAG7OEwAE2TVAUbO2eFdPB5XiTx67uwuLM6+gx0IV
         wOePzsqejXAVrELJKqUY1eXbt96/YOLTcDHeYLtzT49IIc4Je3Z1LnaOM0gLkvY9JeQK
         o9WLHaAZz4vKXt12stiDOnmWueRa3og9SNAB8oDSrbhtI5q9fqRoaBqw8aqnTML/XQSV
         7mZiIvcLbQkeaC7RUjGIQQ7mynhnPwvWprhIG2RCTWOMfFD5TnV509lkpjojGkuDtgn7
         CXVA==
X-Forwarded-Encrypted: i=1; AJvYcCUONydHbNepvwJAvi1k2u3cw1F15PxCKxG4AAuxFYmHemb21Pe1QdRHECJ8WUb8d8p7wqBSURdUrzYlY0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLpvFdks3w+hDFaO3pN0hP4KOI7VbIMPrZcitwazFXJtyyDklo
	Zg+69oKI71sks5Q3V3a8S9Jb8T2czrrG0517spEOhCi3qjgzarUsjBKsEtxDMuBplpDQBw==
X-Google-Smtp-Source: AGHT+IH8EsSz7YpGtLB5T+cKqeQzM1bWhm0j04NiPLFE1u6JFMsI+orP8qOpxbzS3asdhrsksTiCSV/J
X-Received: from wmqa19.prod.google.com ([2002:a05:600c:3493:b0:439:894e:1bf])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4e8d:b0:439:643a:c8d5
 with SMTP id 5b1f17b1804b1-439ae189b90mr121285395e9.0.1740403319046; Mon, 24
 Feb 2025 05:21:59 -0800 (PST)
Date: Mon, 24 Feb 2025 14:21:37 +0100
In-Reply-To: <20250224132132.1765115-6-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250224132132.1765115-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2834; i=ardb@kernel.org;
 h=from:subject; bh=jhCwY9ZD49KKgO6u3ta5BOC2uEjg61kStk0V3/YyhQk=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIX1PUVLDoxt7Frb6fLsixrbszUm9+9nHSl04tL6ynn+Sk
 ta+qq2ho5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzkMC8jw+sohh2ebQ+TRdgr
 Y3qOrDUPUTHrXuLA59DSKGR34M0bIUaGPfn3ZtyYrX3/Qu5e/obZj1xKCx4fDVnqILXBVSjb+8o UJgA=
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250224132132.1765115-10-ardb+git@google.com>
Subject: [RFC PATCH 4/4] x86: Get rid of Makefile.postlink
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, 
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
 arch/x86/boot/compressed/Makefile |  8 +++--
 2 files changed, 5 insertions(+), 41 deletions(-)

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
index 606c74f27459..8b7da3fc3f03 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -117,9 +117,11 @@ $(obj)/vmlinux.bin: vmlinux FORCE
 
 targets += $(patsubst $(obj)/%,%,$(vmlinux-objs-y)) vmlinux.bin.all vmlinux.relocs
 
-# vmlinux.relocs is created by the vmlinux postlink step.
-$(obj)/vmlinux.relocs: vmlinux
-	@true
+CMD_RELOCS = arch/x86/tools/relocs
+quiet_cmd_relocs = RELOCS  $@
+      cmd_relocs = $(CMD_RELOCS) $< > $@;$(CMD_RELOCS) --abs-relocs $<
+$(obj)/vmlinux.relocs: vmlinux.unstripped FORCE
+	$(call if_changed,relocs)
 
 vmlinux.bin.all-y := $(obj)/vmlinux.bin
 vmlinux.bin.all-$(CONFIG_X86_NEED_RELOCS) += $(obj)/vmlinux.relocs
-- 
2.48.1.601.g30ceb7b040-goog


