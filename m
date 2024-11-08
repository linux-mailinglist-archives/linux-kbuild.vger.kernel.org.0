Return-Path: <linux-kbuild+bounces-4580-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 890249C272F
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 22:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35357282F78
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 21:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4D01F26D9;
	Fri,  8 Nov 2024 21:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mZpL+wK0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC91F1DFE1D
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Nov 2024 21:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731102600; cv=none; b=H5bppO1TYmpV79nTpOBw2aN6w1x7sAH3M5VxUV2pZEomkaqkC8N12S2dBKuVhr0wFNS8XOxuBXiW4TkQyNas1PzKGyRrDK/L57psplokSBbuTPPzJuJeCGPiqtzKNl2aqFvL0xnz39p0mr+T5MPYCm17wrHV5PDz+lS7IIjQX5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731102600; c=relaxed/simple;
	bh=1yrF4jnXLhnSfWIojTz1DEjyYTazYPoSLrO9bq3y4RI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=iS8jx7mKL2nS9L7dhUFrC9EMChHVzz7OT/OsV0heGd5HZXSbjY3r55e+nAIlA8fSCWCtRObBbxZRBPLVoLG8C9O51GaLT3sTWqtQNPcd/9fo/oz447fmypvQNs3e5ylXSBkjMvYUEgT5UnVmG3r85tGsCCHvwBrQanJZG85CRg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mZpL+wK0; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ea8794f354so50359817b3.2
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Nov 2024 13:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731102597; x=1731707397; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Af4hMZ20VDS1C3kB5ShD2dxZfce4JKGeXzwvkb+Jdoc=;
        b=mZpL+wK0xWwtPnjbZPg8O9RCqt0Td6ECWZ8xZmAnNt4ZWvr028G/lJ3llxIfF9/zCr
         yQ9nUWEAuxYoYcfJXRvCf/8WO1vF0NLM96LljrVO/rE4FPEXGZxSIyzX8sCwiXoH6hfb
         7LtXqCJkOlB9gxsgZkNGEPyJC9nWOMr1F+BXaIKW7v8wGtiOXQSgDta33Z4zOUZtbWUJ
         EIxB+gO8x1qeI+z+ldeU0rBymcx59kOgp61tvg0y2pxujf/Vp4z8tsz1SYP6ksl7IVow
         dexQafp2UlXQxAZD4lzAvVUEPR7WQnpzWWp6VNjP0cIiRrloJPd1311VlGRFCjnq4sYz
         j0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731102597; x=1731707397;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Af4hMZ20VDS1C3kB5ShD2dxZfce4JKGeXzwvkb+Jdoc=;
        b=e4EmLEYuDKFa5CYib5jGYN3F8nMe7x3v+uVAQRo/buYNBcn6vzZC6yCjWEy4m9upBE
         BTwOrprNsuKnAmiL/PuVRk4OSTxMSKc5epCD+20QudO3SVqOEphmB4A9Hy4xWkKV1DFS
         Ryz6yi/zgXOWOGYXsn3xNPQES5Tkoh1IiUlw0PAUUruvTgM5UrJyYCaaexPZFGtwEELK
         DCKJgDSHsBTIyppXqZrN/Q/aDH4yWScTu6XX9u05rnn1EOgeurMdeWzDwh2BKjlaqZnB
         wEQshvIJqWnfAoWi1Xs2L4xocvmbeaAeYdmX3kAAEGYKMLD7OJKbGOwrYUe3kNfEmGGG
         5y4w==
X-Gm-Message-State: AOJu0Yw10bIeQEu/AHKWIuDUUHUm61lXRV4xnc7s/D0koH5euXDpQZvL
	QVwAs49h/TLvrERlIuVv11LrCnt7skNaUQHkDAdKk/sTdfIJv9fcS7fqiPjGI7FDxw==
X-Google-Smtp-Source: AGHT+IGY5DjIqopeDmsWhcIroI1hvNOh14a/8IP8B3zDQoN6tNo8YsyS7v29bZZQV4LsFJ1jdq4Wj30=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a0d:de02:0:b0:6e3:f12:1ad3 with SMTP id
 00721157ae682-6eaddfb6818mr536407b3.6.1731102597002; Fri, 08 Nov 2024
 13:49:57 -0800 (PST)
Date: Fri,  8 Nov 2024 13:49:53 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108214953.1160765-1-xur@google.com>
Subject: [PATCH v2] kbuild: Fix Propeller build option
From: Rong Xu <xur@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The '-fbasic-block-sections=labels' option has been deprecated in tip
of tree clang (20.0.0) [1]. While the option still works, a warning is
emitted:

  clang: warning: argument '-fbasic-block-sections=labels' is deprecated, use '-fbasic-block-address-map' instead [-Wdeprecated]

Add a version check to set the proper option.

Link: https://github.com/llvm/llvm-project/pull/110039 [1]

Signed-off-by: Rong Xu <xur@google.com>
Reported-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Nathan Chancellor <nathan@kernel.org>

---
ChangeLog in V2
Integrated suggestions from Nathan Chancellor.
(1) improved commit message
(2) added links to the comments
(3) used ld.lld version in the version check for lld
---

Signed-off-by: Rong Xu <xur@google.com>
---
 scripts/Makefile.propeller | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.propeller b/scripts/Makefile.propeller
index 344190717e47..48a660128e25 100644
--- a/scripts/Makefile.propeller
+++ b/scripts/Makefile.propeller
@@ -5,7 +5,14 @@ ifdef CLANG_PROPELLER_PROFILE_PREFIX
   CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=list=$(CLANG_PROPELLER_PROFILE_PREFIX)_cc_profile.txt -ffunction-sections
   KBUILD_LDFLAGS += --symbol-ordering-file=$(CLANG_PROPELLER_PROFILE_PREFIX)_ld_profile.txt --no-warn-symbol-ordering
 else
-  CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=labels
+  # Starting with Clang v20, the '-fbasic-block-sections=labels' option is
+  # deprecated. Use the recommended '-fbasic-block-address-map' option.
+  # Link: https://github.com/llvm/llvm-project/pull/110039
+  ifeq ($(call clang-min-version, 200000),y)
+    CFLAGS_PROPELLER_CLANG := -fbasic-block-address-map
+  else
+    CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=labels
+  endif
 endif
 
 # Propeller requires debug information to embed module names in the profiles.
@@ -21,7 +28,11 @@ ifdef CONFIG_LTO_CLANG_THIN
   ifdef CLANG_PROPELLER_PROFILE_PREFIX
     KBUILD_LDFLAGS += --lto-basic-block-sections=$(CLANG_PROPELLER_PROFILE_PREFIX)_cc_profile.txt
   else
-    KBUILD_LDFLAGS += --lto-basic-block-sections=labels
+    ifeq ($(call test-ge, $(CONFIG_LLD_VERSION), 200000),y)
+       KBUILD_LDFLAGS += --lto-basic-block-address-map
+    else
+       KBUILD_LDFLAGS += --lto-basic-block-sections=labels
+    endif
   endif
 endif
 

base-commit: 0dcc2d1066150787017a71f035145c566597dec7
-- 
2.47.0.277.g8800431eea-goog


