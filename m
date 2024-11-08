Return-Path: <linux-kbuild+bounces-4579-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D56D9C2728
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 22:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D1F728392E
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 21:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4941A9B28;
	Fri,  8 Nov 2024 21:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="31KB9MjX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F0A233D8E
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Nov 2024 21:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731102408; cv=none; b=JERc8MKtoh5Jec/FEUZ1c4tvX7qKSlqRAbhhdCh4sZZOIKEkqmXyFlN1fBXJ0CvJvjxzXfIqd8h7BOV5uLqDjs3kipF8EWD344DIUx63DPxIJ5MQ9YGkwalQXvtgcys0yi+8NI/zAK4q5XI0KS1rEAKKyB8dSyf4ruiEZgxquXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731102408; c=relaxed/simple;
	bh=AEoUzhmLxJcYmOfM0szL/LZNxLfEvuOcRuf2OVTMz3k=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dWBERQsUJgeX7joorKQozw6RsYmz5UYzsfNqnQiX8cN0/JxtAz2+8PsJkfmJASgqqKBNZ1+UUp6EFyGSQGQaNNpi9gJVMASrohC+LEbO/10m6dPWCaAVIrOHh8qfFiSoAmlcPD4lsmpH2zzj81S+TbfRk4NEtwj6TGFcbVyzRQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=31KB9MjX; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e02b5792baaso4248912276.2
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Nov 2024 13:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731102406; x=1731707206; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rXaV9HHpw5oBXk26XdBSn67dU41wttYgvf+/bW2x+x0=;
        b=31KB9MjX/02J7FCpyT+UUEhaP0Q7+f2/Xn+vxjmFMdQ9otUN4Lr4onD83acKJgiicg
         qGMP7TY4KMj46S3dLbDU8dL7OVPAVPFcfu9bqCFBQIgYygDS8Uq8Lz7B53JrKLIITbg4
         iKzKctoG5xm1fKHTEIx+7T6HSE7QvGczNWDtIdTYCBuNgvlpyHY7eFTgz+q6RyC8dXZ4
         s2dxiHsPfpG0mhF4dVJc6v4N6QCmc2S6tT2G6+NycltyMW+rzWy+74joGIzZ3Tdmnn9S
         a1nDlxrhJYPf2ZrMeYIYJiznHYVJ+h2tPwQiqRxy/LfGHAxy4gizI7apis9C6bXkWUGf
         NFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731102406; x=1731707206;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rXaV9HHpw5oBXk26XdBSn67dU41wttYgvf+/bW2x+x0=;
        b=tqJ6fjbyg4G+tVWVIWesAZ40Yp/QioAz0zUvJsyqyTT8Dot9NSbuZ3JKvwzZuYoaDm
         MwxDnE16ENAKdijO0xEUvWouUbzAk0ta/F2SCVofdrwT/CZdse/g/KvUF7Vgml5U+e7t
         wkhjxQ7LV5aJ0xu8rcu61EDaqRCoFO64YI68DFbw5AMthNWX9qrVc0PP1D54Mld9o2Pb
         RwMF4dga1vkvEfV6I5kNTRIjtFwfJ5lddDrIMQ25U7+hMeE+1AmgO1BCnkEUNZuGV3JG
         APau+d1kaDRB2VhZ0MOwcJz6lt47P4XNW4uUTMRYZ9raM0CYZrJ6Dj4BOy77dcaFVdQ9
         nfSw==
X-Gm-Message-State: AOJu0YwTt2Hin5n6wcDUtHq6oAowO2cCWpeqGwLQeVXqPvTdqYAS1mAZ
	a6NS/9ZzwoEMO2P3Q9SMy6qq8ml+Zq4GgVQbaUQ4bjqcPP6ohJSRlUm1ffPa5K8jPA==
X-Google-Smtp-Source: AGHT+IFB86PGUSKJ+j1W7yv6YKMRSZZhNrTjWnqgSnyhBOaULLB3J3ivCKnVz34+e2hMdcyuXkGnsb4=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a05:6902:4f2:b0:e30:cdd0:fc0e with SMTP id
 3f1490d57ef6-e337f8e881dmr5357276.5.1731102406545; Fri, 08 Nov 2024 13:46:46
 -0800 (PST)
Date: Fri,  8 Nov 2024 13:46:40 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108214640.1159739-1-xur@google.com>
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


