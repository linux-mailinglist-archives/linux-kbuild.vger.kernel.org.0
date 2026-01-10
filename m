Return-Path: <linux-kbuild+bounces-10457-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB5FD0CB9A
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Jan 2026 02:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EAAE300DCB7
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Jan 2026 01:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC7121CC62;
	Sat, 10 Jan 2026 01:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8Xt3ZnD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4B12A1CF
	for <linux-kbuild@vger.kernel.org>; Sat, 10 Jan 2026 01:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768008909; cv=none; b=e1AjX/odgSX2YvURlBY69hrp1We4rYjrPvGsruBlQSa/rcAhwa0R3lgbZ3qLapOS6ZoSLX/CQB0qs3OgvkWsTsfsB50+yHWYr74ZRTrgJETW0ib/uhrfOEqCIv5MnBws0aIeJbQZD8Dspmukl4uJsLPLB3zILJrkMXQnrV/Et4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768008909; c=relaxed/simple;
	bh=xLPWOwur5lZyTIFQhKJgCuS3vM2v4fZ1AeSleNLa7T0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sznjcNEIQKMGwJecjE/AnxwlgZo7HlybLxgE+8cFrrqbOauwgTe1rOd4Gt3rmZ9/fhKlGizrrhyFQeGYSYbGdJYdbtxL/3fS1wgaZtDIABI+hXgEyLZElu1E4mlk6u0wd7gy9xRln/yHSXLCJ/rW3ncsp/HLCXXpR8s5rbXaZkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8Xt3ZnD; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34ccdcbe520so1810956a91.1
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Jan 2026 17:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768008907; x=1768613707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NsWZnuzRPjzvjOn98WGp9+L8/QX752dDvG+p5I6ytmo=;
        b=V8Xt3ZnDJnoudBle7rlPnr37yVUhoD6aNtpKRu+enc7XgfmixZa0nnI3kjFNpVdTk4
         RK7/FEWo/LadA8KagY9EUprdw1RLl6jmueN3ge/vXl1No+9F2ezwKPpcO15DwjkQxACi
         GcpXt6YCcjvpiRPWqdU76Isou0kARU6hRKnC/EfYIGwmYfYEmN4SOsGGEy95kw4X0ze+
         1iHh+XrPpVGC3j76mGiyRRO98hLECralDtWq0VC+DVz9L4G0OUQtHpzWm8zMpcFb7ddE
         SCaRY95blv60ucnzThL/u2UiFNd9yU5KTj4Z3P45+trXxQpkaSrnFDodcSKmyCNMuO5V
         /szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768008907; x=1768613707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsWZnuzRPjzvjOn98WGp9+L8/QX752dDvG+p5I6ytmo=;
        b=HViUGpnOfwr33OAlUZHgyaA14kIzwR7xwj1RBtIIhrybP82N1TdSFbZaPegXB07Dfh
         2MTYUH9rJiCGrz87J3vCO8iF7XTcWYcdALAkM26Aa4gjUbZ+lMvnA227nDCCYHLGI9Yj
         E3Dnx7ImxBd27agHrurlLKm66mNxsuF3EO+qyo/MtOYXNrmRCScvW2hy04KKC0Mxy1Oz
         qDs/le31DP5ckTc0Dwn9PpYdmh4d/IemLwCYi/Wz8K5I8ZMUNrfvjzoJt0zf6bqEAX3a
         qLJXdaDMIiDloIMmqRdg7g9dPlSwrXRPqjsifnN/D8QPH/wM2pKbA/ZSDc3MsurAoa45
         gclg==
X-Forwarded-Encrypted: i=1; AJvYcCXdhscpj5SMUtsKLx7NagI+HS8nmbeeP4WkI5dCIwgyRAF32PHn4w91OcnKjIM/FF2rszTG3Lg5nmKOO+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTp3/N1JMrBdM0r5SlU2UEKh8irhnE23wBPXilC7qOOyfXZG19
	U4WojpzfPBaYca6DhKEK0/GMjB8D8XYg1Az2VaM+R7B1wAsxRi2LcCdzh9BRpmZc
X-Gm-Gg: AY/fxX4AOooRPs4Yq+ebOVtOOoh6aBfWztaJDNJa9ITPlhA3y58usOKjtb2HayAQqQ1
	iS1YVTpzd8z+PXfUdsKmX3yhF9tO3E/O+ON0rbYJIILiMYZIFHnQFAeVhKFqWOQNTgygK/Z5jgh
	Y1xe9LvSxVHhWfUHGDdM3UInGJIKKcUuwrIAHCLaI57g0clnR62Y4/kHV42V2kUSXrDN1Jitn5u
	7RTanTfoYumtxpzDag1mdDer9oqtQkrdxIvk2JYskJXbxZLfVKjHi/0uc61nYTYaYMNrmpUKP6R
	OIDe6H7VzwZSvLk7TwXvNwwbVPM8OVG47v8KqlENy+iBQJszjt7tXrAmsnBDPZDHdfvfOYE7K5+
	p9WBlMz/c3X5aY0H/eI8N/szWvfpRrLgMwJF2C7a4iwOuw/sQmCA/ipEYlO3db6UND9TIM8L1Z5
	62f702XsY+FWvWdQXP
X-Google-Smtp-Source: AGHT+IG4haSCU8mLrpiROHRvGF2RpFG58Ht9x3CEvvHtSyyrAxmqjeIcd2/fYDfQi5FS0sQ3PX9vbg==
X-Received: by 2002:a17:90b:2692:b0:343:cfa1:c458 with SMTP id 98e67ed59e1d1-34f68c47998mr10983895a91.18.1768008906891;
        Fri, 09 Jan 2026 17:35:06 -0800 (PST)
Received: from PC.. ([2401:4900:88ab:2bed:6481:28de:e3bd:f865])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fb64d7asm11431057a91.11.2026.01.09.17.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 17:35:06 -0800 (PST)
From: MIshraMohit21-LE <mishraloopmohit@gmail.com>
X-Google-Original-From: MIshraMohit21-LE <mohit.mishra@lunaredgeit.com>
To: mohit.mishra@lunaredgeit.com
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Kees Cook <keescook@chromium.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] Makefile: Globally enable fall-through warning
Date: Sat, 10 Jan 2026 07:04:13 +0530
Message-ID: <20260110013412.14426-2-mohit.mishra@lunaredgeit.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>

Now that all the fall-through warnings have been addressed in the
kernel, enable the fall-through warning globally.

Also, update the deprecated.rst file to include implicit fall-through
as 'deprecated' so people can be pointed to a single location for
justification.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Kees Cook <keescook@chromium.org>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 Documentation/process/deprecated.rst | 14 ++++++++++++++
 Makefile                             |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index 49e0f64a3427..053b24a6dd38 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -119,3 +119,17 @@ array may exceed the remaining memory in the stack segment. This could
 lead to a crash, possible overwriting sensitive contents at the end of the
 stack (when built without `CONFIG_THREAD_INFO_IN_TASK=y`), or overwriting
 memory adjacent to the stack (when built without `CONFIG_VMAP_STACK=y`)
+
+Implicit switch case fall-through
+---------------------------------
+The C language allows switch cases to "fall through" when
+a "break" statement is missing at the end of a case. This,
+however, introduces ambiguity in the code, as it's not always
+clear if the missing break is intentional or a bug. As there
+have been a long list of flaws `due to missing "break" statements
+<https://cwe.mitre.org/data/definitions/484.html>`_, we no longer allow
+"implicit fall-through". In order to identify an intentional fall-through
+case, we have adopted the marking used by static analyzers: a comment
+saying `/* Fall through */`. Once the C++17 `__attribute__((fallthrough))`
+is more widely handled by C compilers, static analyzers, and IDEs, we can
+switch to using that instead.
diff --git a/Makefile b/Makefile
index 9be5834073f8..bdf8eac51b07 100644
--- a/Makefile
+++ b/Makefile
@@ -843,6 +843,9 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 # warn about C99 declaration after statement
 KBUILD_CFLAGS += -Wdeclaration-after-statement
 
+# Warn about unmarked fall-throughs in switch statement.
+KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough=3,)
+
 # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
 KBUILD_CFLAGS += -Wvla
 
-- 
2.43.0


