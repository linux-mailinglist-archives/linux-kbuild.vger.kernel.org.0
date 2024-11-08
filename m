Return-Path: <linux-kbuild+bounces-4568-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A00DD9C15E9
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 06:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29841B240C1
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 05:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331361C7B69;
	Fri,  8 Nov 2024 05:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uNwzCuRS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9140158DD9
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Nov 2024 05:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731042646; cv=none; b=mg6RGtpULL0Y82NaTlPr0jYfX/dGXtgmCwYGernvekLNWmRBly5KFPTjULJ+XDs7i62pKq+gH57RtRJcAh4zn+6rkt0+vaFDh2FE964lqD9Ca7U4CUKvtiqiIydfm13QUsA7OopkevuEEbCBw5k4tk5epgKCMCe23Y/I9Hl5GXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731042646; c=relaxed/simple;
	bh=Yq1YwQgYCpmlssJrskTFSgD3vH6McUCJKDtujoaa7YM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=J4gVVrcxvTPykJt8g9YHBUeOhwIVt/H7GJ3hrQTC/oJEiskLN4DgEIjEL7iVOcKP4GhOvryuRhpLueUDuf/TyCgxfMvcWIYaMo+YUk0sXdZomOOS1Ix2lhtOoRxGg7LobqsbpEDDE2WCxDrSwjlUExQ6xfF/6Bjh+g6v1G+S9us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uNwzCuRS; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ea258fe4b6so34737847b3.1
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Nov 2024 21:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731042643; x=1731647443; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7tQ1L3QpbUskwFQP7JuUlt5UgFJLV/ai+rpO7iRmQ00=;
        b=uNwzCuRStaR+5Szet0B/KXfT0qks/Wuoo/31FEEVl7Y9yZd0cNlpp+T19mCXSx6C9R
         IxmzjA2ZRujGLhoo6ueMYqAHGALlirrYKbl2ApogSwLwUc5IDrWozdaTtIaJsGdjvsL8
         69rwLqgXgy2XhyccTKQ9M7DydKamGj9whGR9caYdeFqg50nRgSTYc8GS6liyXrk+w4Cx
         +q91QtJKGMCjG9YtPdGbeDpavEH3V94K7CefUDIr0dN6hgXuelL1bGhfLbNSt7vAE7Qf
         VqIfheLiJs5A3nxJnqfWjKM5KYZSK5yunzrBP5sEQzkFJRNQ1aoq/gxXcbwE87xWTpNE
         FWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731042643; x=1731647443;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7tQ1L3QpbUskwFQP7JuUlt5UgFJLV/ai+rpO7iRmQ00=;
        b=h4nujev3VBWQBCHSV7G0nE0ArZEDOTC7MWVl1Hwh9eRxiKaGtgXGF0aNF/LhuZB5tL
         ONZh/4WWAzH89UDIYaJ0d3d1gN/TYVIMGnMbXVGHo3KBFgYLjNNYuyfch0zf53hv/7G7
         MEf5IHg9spCz5GjxiSKOjCsm1lxHZej5PplF+V0vwYvbxU1dNQ8pMYcxIW340V8k/SP4
         +KnIlL64eYbMjDQmlySJC1YjwG7UNPLjhlFnwgyGyIbDeU2SE+sU0rkmawm8Q6zig1pZ
         EdHU5OtqjgxktJVBSx1UcqlvK7Rw4EWDlbOfavOeEIvFdFsYPURzZTo2dgYaxZcOjw+O
         IVyA==
X-Gm-Message-State: AOJu0YzEqnqIgTkJiQyzjFHaBFhaPxezPWuN2ypBqZMhop9Ym4e0WQ+q
	KFjDiAF8AggTjJkqPQTujEpUoBRLK3WxO9ar4mcQDOVrUiYTWT7NG2Pbj4MDZQ2mOA==
X-Google-Smtp-Source: AGHT+IHaHqfWXbqtq7zwFlKahwo2sjCXng6SVwY/38LfDsmjxFvxkfhDNrVTdIO2OlZ20Ep93DJFQow=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a05:690c:3505:b0:69b:c01:82a5 with SMTP id
 00721157ae682-6eaddff0e00mr262967b3.7.1731042642840; Thu, 07 Nov 2024
 21:10:42 -0800 (PST)
Date: Thu,  7 Nov 2024 21:10:30 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108051030.2918950-1-xur@google.com>
Subject: [PATCH] kbuild: Fix Propeller build option
From: Rong Xu <xur@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The '-fbasic-block-sections=labels' option has been deprecated with
the following llvm patch:
https://github.com/llvm/llvm-project/pull/110039

The old option still works, but with a warning like
  clang: warning: argument '-fbasic-block-sections=labels' \
  is deprecated, use '-fbasic-block-address-map' instead [-Wdeprecated]

Currently, the option change is only in the ToT clang (v20) and not yet
released in v19.

This patch adds a check to the Makefile to set the proper option.

If the option change is later integrated in v19.x, we need to update the
check accordingly.

Signed-off-by: Rong Xu <xur@google.com>
Reported-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Makefile.propeller | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.propeller b/scripts/Makefile.propeller
index 344190717e47..1a68ea0d1fe4 100644
--- a/scripts/Makefile.propeller
+++ b/scripts/Makefile.propeller
@@ -5,7 +5,13 @@ ifdef CLANG_PROPELLER_PROFILE_PREFIX
   CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=list=$(CLANG_PROPELLER_PROFILE_PREFIX)_cc_profile.txt -ffunction-sections
   KBUILD_LDFLAGS += --symbol-ordering-file=$(CLANG_PROPELLER_PROFILE_PREFIX)_ld_profile.txt --no-warn-symbol-ordering
 else
-  CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=labels
+  # Staring with clang v20, the '-fbasic-block-sections=labels' option is
+  # deprecated. Use the recommended '-fbasic-block-address-map' option.
+  ifeq ($(call clang-min-version, 200000),y)
+    CFLAGS_PROPELLER_CLANG := -fbasic-block-address-map
+  else
+    CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=labels
+  endif
 endif
 
 # Propeller requires debug information to embed module names in the profiles.
@@ -21,7 +27,11 @@ ifdef CONFIG_LTO_CLANG_THIN
   ifdef CLANG_PROPELLER_PROFILE_PREFIX
     KBUILD_LDFLAGS += --lto-basic-block-sections=$(CLANG_PROPELLER_PROFILE_PREFIX)_cc_profile.txt
   else
-    KBUILD_LDFLAGS += --lto-basic-block-sections=labels
+    ifeq ($(call clang-min-version, 200000),y)
+       KBUILD_LDFLAGS += --lto-basic-block-address-map
+    else
+       KBUILD_LDFLAGS += --lto-basic-block-sections=labels
+    endif
   endif
 endif
 

base-commit: 0dcc2d1066150787017a71f035145c566597dec7
-- 
2.47.0.277.g8800431eea-goog


