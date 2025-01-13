Return-Path: <linux-kbuild+bounces-5469-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC80A0BCA7
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B7C01885903
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32DB1FBBCC;
	Mon, 13 Jan 2025 15:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="op+s+NNB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C8D240225
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Jan 2025 15:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736783601; cv=none; b=W5o4f4KnN8mNLxtY0Dlb32vS4fFpSlxLWU0eHnUeUibwm5Iz51n/IrPJazUerHa5SQWAvk+7ISqkvBFdmQbkpJ5zJtwU66J0VUQcIcsammcn5RRUY+JuFxcfdFho5pOVPvxZUEhm7IPRdNwJMjOqyr/Mh+viyxuRUdNHuyuPu7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736783601; c=relaxed/simple;
	bh=7+aQuI/za1zmIkn/UHCnXgtSF+ivUYg266I22Jva0Go=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=afmJ9rcAC3wWQhyzkydsuDCrA7j4slfTtqh8fg++3w1gavV3Uw7yaVKKASD1BixAPlTgreSwt8YCWQ6Ho7qhj3zu5EJxF3vwi20vghkIoSID/YjKUIrMbbdrjRKc88VY/aFrEk+sncDzEddmt9JB9g8LWASrQbXz2bWZNDxzVUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=op+s+NNB; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43625ceae52so25092145e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Jan 2025 07:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736783596; x=1737388396; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G6GC1+XOYFciKr0QO2K3EfTIEu2fRgTNywEW62ZU6LU=;
        b=op+s+NNB4YytSKU/lfINY8nX4XGZNEij4TZQuypLCuLWWBI9cerXY3KC0cV8Vpa2dc
         R//lZgzNPFFope0dhLloNYJTV9JnxXbmeeEcDwb7UHLH0HYhfRF6wmVbhJ6vp0yMCOFl
         ObtNvsKfcaFBNVfcNmHCYCd4Xd3bjfAEoKVbFBY4BKuoMWOET+MFmSQmHNxZau58ty1R
         219Q5A/A7qwhRGQu35TO84lIjqgHcHsRS84Isf+nSpEaZTD5IIXzzFeD7+KLfyTw8S6u
         0hWp+q3SKY0wKjDC0NZtMfHi4jiJjA82N8kM18UaQf91G2p/KwkFgP1zngmLmeVGBT9N
         KYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736783596; x=1737388396;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G6GC1+XOYFciKr0QO2K3EfTIEu2fRgTNywEW62ZU6LU=;
        b=NaPLJzHKA2XbK0hQKkl/8KmWmT7RK0mq9J+gjK/Ltpw3q41v0iBo7HUy+iXFEDXsiw
         GEgsPHXZa6KY5Axj6wA1Fjz/XSGRqcn764NGeiFK3a/fCqxPot8nfBF8KkXnJZ6RRk+W
         QWFqtwC/3uJr7/uBHaYGInIcuiPdxDtcOSHqGjk7ZKbjmTKZyyKmSfwdToTy7gC/dkw4
         VlNXoDoXbGJvfjyqi5bCA6gVGhcoRwVRduHmufWXnupoWP4dc75oeC0l9cefbQ7l0sxi
         Uv/aUXck7jS/+B4IBczFfk0cyXwxMFyndIvRWUocFE2gnCvpLOYE7fbqLm9AENhdKugC
         bUYg==
X-Gm-Message-State: AOJu0YwJ05DGSiGB1dX8c8TjKaRZ0irIeB4HYKSudYRsuQVDRlN5BCEq
	5jc2FNuCW1uvKOXsyEV0PkZQaqI40oPqLgIyaB68mQO+9mAOHs+ZmEdBHHe4RROiU4Fr+MzxHbc
	m3XLsQNutnchaDHRqQg6LRPWb2grpHJneNDMgWQHp5nS/HoCFULQJjQNFUPZOWQXz+5Xt5l6GXV
	R88FN0t3xVvaKfF6iwvyKAKuq/m9hdPw==
X-Google-Smtp-Source: AGHT+IH5dEPphrI2+hqKkm7nO8Qbid4pBpO1yTJyk8F4n5RDCgoHc9WThlBG2WEW1eUpQcKcce5iGx6w
X-Received: from wmgg20.prod.google.com ([2002:a05:600d:14:b0:436:3ea:c491])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d01:b0:434:fec5:4ef5
 with SMTP id 5b1f17b1804b1-436e26b6f51mr217012995e9.14.1736783596145; Mon, 13
 Jan 2025 07:53:16 -0800 (PST)
Date: Mon, 13 Jan 2025 16:53:07 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5339; i=ardb@kernel.org;
 h=from:subject; bh=s4MbVtYFuNllJHwyINAWQC4eh4cmwVLd+OMXzyVaU8I=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIb3V7LH6jISPUvYLO+s+zL58qDPvUuyVJ3PK+858XGPgc
 tyuLU6po5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzEQZnhf4piYPWaVCmvf2ps
 SwW6XzS8sDjfce3ulErNM5nnbhziOMfw33me3BH9j5aTNdIvVVxjmZjIcMbvovG+pUsM56YnFvV vYAUA
X-Mailer: git-send-email 2.47.1.688.g23fc6f90ad-goog
Message-ID: <20250113155306.1922992-2-ardb+git@google.com>
Subject: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Ron Economos <re@w6rz.net>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Due to the fact that runtime const ELF sections are named without a
leading period or double underscore, the RSTRIP logic that removes the
static RELA sections from vmlinux fails to identify them. This results
in a situation like below, where some sections that were supposed to get
removed are left behind.

  [Nr] Name                              Type            Address          Off     Size   ES Flg Lk Inf Al

  [58] runtime_shift_d_hash_shift        PROGBITS        ffffffff83500f50 2900f50 000014 00   A  0   0  1
  [59] .relaruntime_shift_d_hash_shift   RELA            0000000000000000 55b6f00 000078 18   I 70  58  8
  [60] runtime_ptr_dentry_hashtable      PROGBITS        ffffffff83500f68 2900f68 000014 00   A  0   0  1
  [61] .relaruntime_ptr_dentry_hashtable RELA            0000000000000000 55b6f78 000078 18   I 70  60  8
  [62] runtime_ptr_USER_PTR_MAX          PROGBITS        ffffffff83500f80 2900f80 000238 00   A  0   0  1
  [63] .relaruntime_ptr_USER_PTR_MAX     RELA            0000000000000000 55b6ff0 000d50 18   I 70  62  8

So tweak the match expression to strip all sections starting with .rel.
While at it, consolidate the logic used by RISC-V, s390 and x86 into a
single shared Makefile library command.

Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: Ron Economos <re@w6rz.net>
Link: https://lore.kernel.org/all/CAHk-=wjk3ynjomNvFN8jf9A1k=qSc=JFF591W00uXj-qqNUxPQ@mail.gmail.com/
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
v3: put back missing 'endif' to fix the RISC-V build
v2: add missing include of scripts/Makefile.lib

 arch/riscv/Makefile.postlink |  8 ++------
 arch/s390/Makefile.postlink  |  6 +-----
 arch/x86/Makefile.postlink   |  6 +-----
 scripts/Makefile.lib         |  3 +++
 4 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
index 829b9abc91f6..750d2784f69e 100644
--- a/arch/riscv/Makefile.postlink
+++ b/arch/riscv/Makefile.postlink
@@ -10,6 +10,7 @@ __archpost:
 
 -include include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
+include $(srctree)/scripts/Makefile.lib
 
 quiet_cmd_relocs_check = CHKREL  $@
 cmd_relocs_check = 							\
@@ -19,11 +20,6 @@ ifdef CONFIG_RELOCATABLE
 quiet_cmd_cp_vmlinux_relocs = CPREL   vmlinux.relocs
 cmd_cp_vmlinux_relocs = cp vmlinux vmlinux.relocs
 
-quiet_cmd_relocs_strip = STRIPREL $@
-cmd_relocs_strip = $(OBJCOPY)   --remove-section='.rel.*'       \
-                                --remove-section='.rel__*'      \
-                                --remove-section='.rela.*'      \
-                                --remove-section='.rela__*' $@
 endif
 
 # `@true` prevents complaint when there is nothing to be done
@@ -33,7 +27,7 @@ vmlinux: FORCE
 ifdef CONFIG_RELOCATABLE
 	$(call if_changed,relocs_check)
 	$(call if_changed,cp_vmlinux_relocs)
-	$(call if_changed,relocs_strip)
+	$(call if_changed,strip_relocs)
 endif
 
 clean:
diff --git a/arch/s390/Makefile.postlink b/arch/s390/Makefile.postlink
index df82f5410769..1ae5478cd6ac 100644
--- a/arch/s390/Makefile.postlink
+++ b/arch/s390/Makefile.postlink
@@ -11,6 +11,7 @@ __archpost:
 
 -include include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
+include $(srctree)/scripts/Makefile.lib
 
 CMD_RELOCS=arch/s390/tools/relocs
 OUT_RELOCS = arch/s390/boot
@@ -19,11 +20,6 @@ quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/relocs.S
 	mkdir -p $(OUT_RELOCS); \
 	$(CMD_RELOCS) $@ > $(OUT_RELOCS)/relocs.S
 
-quiet_cmd_strip_relocs = RSTRIP  $@
-      cmd_strip_relocs = \
-	$(OBJCOPY) --remove-section='.rel.*' --remove-section='.rel__*' \
-		   --remove-section='.rela.*' --remove-section='.rela__*' $@
-
 vmlinux: FORCE
 	$(call cmd,relocs)
 	$(call cmd,strip_relocs)
diff --git a/arch/x86/Makefile.postlink b/arch/x86/Makefile.postlink
index fef2e977cc7d..8b8a68162c94 100644
--- a/arch/x86/Makefile.postlink
+++ b/arch/x86/Makefile.postlink
@@ -11,6 +11,7 @@ __archpost:
 
 -include include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
+include $(srctree)/scripts/Makefile.lib
 
 CMD_RELOCS = arch/x86/tools/relocs
 OUT_RELOCS = arch/x86/boot/compressed
@@ -20,11 +21,6 @@ quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/$@.relocs
 	$(CMD_RELOCS) $@ > $(OUT_RELOCS)/$@.relocs; \
 	$(CMD_RELOCS) --abs-relocs $@
 
-quiet_cmd_strip_relocs = RSTRIP  $@
-      cmd_strip_relocs = \
-	$(OBJCOPY) --remove-section='.rel.*' --remove-section='.rel__*' \
-		   --remove-section='.rela.*' --remove-section='.rela__*' $@
-
 # `@true` prevents complaint when there is nothing to be done
 
 vmlinux: FORCE
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 7395200538da..f604f51d23ca 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -374,6 +374,9 @@ quiet_cmd_ar = AR      $@
 quiet_cmd_objcopy = OBJCOPY $@
 cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
 
+quiet_cmd_strip_relocs = RSTRIP  $@
+cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
+
 # Gzip
 # ---------------------------------------------------------------------------
 
-- 
2.47.1.688.g23fc6f90ad-goog


