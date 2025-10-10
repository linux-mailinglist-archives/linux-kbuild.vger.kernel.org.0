Return-Path: <linux-kbuild+bounces-9081-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEDFBCE92B
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 23:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C0AA44E4263
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 21:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0118925A350;
	Fri, 10 Oct 2025 21:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oVLBRLqO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852BB2147E6
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Oct 2025 21:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760130103; cv=none; b=RNSzZx8J5R8RcYpziUjGqVnOa7EamrhICSWeCgRHhQNDSC7I3jO34RMm/snV3NJ7dxiFD8VgCGOP6z7ex3QJGlJ9fX/YXwlnjC7QyuXZk4SLA36rmhikhL/MPGzJ5+I2caBbTAKv3k/YlZhp6YqW4keMcDqRiE1wrAjmNzohJ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760130103; c=relaxed/simple;
	bh=pNzMSoChkEhBW+/X5G6uJEBZN8r8OfLg2tfWvU2mwmc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MruqDQioR79iioDC1UPoe6WUL8Jt2jf2fn+qb0qW9SBVhJDEQNEHzMG+YXA8YncpdokSRaf+HtjciKp81w1vzMi+KvzScQ7yYhyTips22oTihbtr33Dh6o1k9021udHvrDMpAhldPBIFwAo0VhfvJl9gigUohgfUOWTAxiWwMnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oVLBRLqO; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7810912fc31so4512667b3a.3
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Oct 2025 14:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760130102; x=1760734902; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PsuLBV0OmF371x/EIPOn0emYjgD84JXkkOIG5F90Bro=;
        b=oVLBRLqOet8mxj7jyyZseHV/kfd57Sou4yempgncmqeHyqX6D/kr9GpffXNqEUngvp
         MM1d4/9V9DB83yeYpRReIW5vte63FcbUw+3BNP0g9lUed+VkPhFR+ezRFnKwrH0Q26Wk
         wY2C5vfdNXNQZXnsL+hZQwmTh17zpldYJVzwYNxosi8VXlMcePkCC2xcEE1zBd/SfQFG
         QgyEPZvlxziK/uUemx4jpxVGVrXPK+dNIslOihJkDafSmyxQCmTiTS28jY0FGdy6Tn0Q
         PH7qWTD0wtDgXt7bTzNV6wL0SExBFTyxjrY3hHArg25HT1AGhl9OuxXd3I99aZuW2IcW
         3LHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760130102; x=1760734902;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PsuLBV0OmF371x/EIPOn0emYjgD84JXkkOIG5F90Bro=;
        b=hEV2dtSN8Htf0ayQ3+ba8Ig0xeFWwJv4jG7u1NCR0xiXe0vo7LVgA3nm0JWeXSxaXg
         AIwiHdGbbSrv3vJF3dMrhv7N964XNHuD18gcckMb3THxRHEOBMwit4PrkVI+UdlIT/kk
         ZHRKx/i/5uHdzByq1FzRBijkLg4eHzPdqU69rxIAXsohmWQUZBB79pMSL1tA0Y6UCArK
         hzagg0tQcurbyjbhbMMVCBBhTZr1MTFCt2UQ3QUXPe5sztWKvjNvLMTGmazjpLMD0DXp
         5MSR3O/ELGbYdJI6x+WVQN7TIjm/uJNfiN5K53D5zwW1UKdJHTqVfjlHt0gkU5IU3ZOE
         cpnA==
X-Gm-Message-State: AOJu0Yz1v7uPmeQk8C3O8r3c+ni9f0AJvVo3qHMJpMpWEj5dIu03NaAQ
	tGcJgFlItOSTQ37stwBfrpddgvPlCpwqyYF+KyGLbP4NJmrX8MFGqTPlvYU/+ezlJSMIxA==
X-Google-Smtp-Source: AGHT+IHz67BmbDRz7vaXdynm75bczZlJMUZRCdI88KE42hQdLfMx12/LTYPHuhem6rl8rxKh1lPnTUw=
X-Received: from pga9.prod.google.com ([2002:a05:6a02:4f89:b0:b65:2c4c:b5ae])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:72a2:b0:32b:6e33:7cf8
 with SMTP id adf61e73a8af0-32da83e0614mr18673280637.42.1760130101786; Fri, 10
 Oct 2025 14:01:41 -0700 (PDT)
Date: Fri, 10 Oct 2025 21:01:31 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
Message-ID: <20251010210134.2066321-1-xur@google.com>
Subject: [PATCH 1/4] kbuild: Fix Propeller flags
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

Fix the code to enable/disable Propeller build flags to be
consistent with the documentation.

Signed-off-by: Rong Xu <xur@google.com>
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1d581ba5df66f..53c02fc3b348a 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -121,7 +121,7 @@ endif
 #
 ifdef CONFIG_PROPELLER_CLANG
 _c_flags += $(if $(patsubst n%,, \
-	$(AUTOFDO_PROFILE_$(target-stem).o)$(AUTOFDO_PROFILE)$(PROPELLER_PROFILE))$(is-kernel-object), \
+	$(PROPELLER_PROFILE_$(target-stem).o)$(PROPELLER_PROFILE)$(is-kernel-object)), \
 	$(CFLAGS_PROPELLER_CLANG))
 endif
 
-- 
2.51.0.740.g6adb054d12-goog


