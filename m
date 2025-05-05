Return-Path: <linux-kbuild+bounces-6937-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4B8AA9A3A
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 19:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 270C31899D48
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 17:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024411A00ED;
	Mon,  5 May 2025 17:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ny1zzinf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A081F4188
	for <linux-kbuild@vger.kernel.org>; Mon,  5 May 2025 17:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746465382; cv=none; b=DnpYf/VusivC6JYItaG5h0gRmXJj7PSLBrI+vD1npJh9S5ysB+j0LJ99nNT0n5KIPFlrQ3V2f29Cg3rbomurQ7ir8mrIqoa74zHbDUcvh2pGe/8IH2S8YxZrEk1qqotu0y5GZvndubWOvCaFte0FyQeG3bDkiLoJaSKnGKhjOj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746465382; c=relaxed/simple;
	bh=xLPWOwur5lZyTIFQhKJgCuS3vM2v4fZ1AeSleNLa7T0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oETxZ5WT4Z0ehBLLKoNXj4NBuPzrANvezM8JUXLy3lQr7wYhvVAWjsZNlKMdlDDxdbREGmM067E7sNbn4Sg81Y0IyOEU+5XCdSa8/lW4hqITlUbAGcABL9TiIFgjXBuuRvbHQ2bY2gMD0BqyCVPLNpPaVlnZmCcIu+E4U9eI1tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ny1zzinf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43690d4605dso33668215e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 05 May 2025 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746465378; x=1747070178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NsWZnuzRPjzvjOn98WGp9+L8/QX752dDvG+p5I6ytmo=;
        b=Ny1zzinfJT83chmS8kpkV7BsupLHIGcuiPyY+a7uQ0s4XAiiZYtQSkMmeU2sL36SEj
         kISZVLqlDPU6ZRRqZGz/g7HZl7OAqtC1zFqoSIs6Xv+J46tbqwgm+yfBj/W+rpg2aBK5
         dNeh1Hdns7cZ9PYbAnhqBaMN3bWkyWmck8IcGfgedBCjlB7jEO1dcES30PTRDfUbajrM
         4GacfZ7Q0Qfm8J22xVfZmvxMkKdOXX2hhmYqs9cA03z4e0EIA+cGL8JhgL1jGNa2zfgp
         Tuj/zJbk9tYlyIPU0acE5iJJaQyaLyBksKzVlY3fPD8sAC7VUqyh/ihMjNp2smMrn4lU
         tbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746465378; x=1747070178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsWZnuzRPjzvjOn98WGp9+L8/QX752dDvG+p5I6ytmo=;
        b=NfVFVK/Nnmdn5QzREkx8dGwmbPk2inpT3V4STAd2/4RUCRP6Epkpr/baG3bzkcpoau
         I2OUGg+83pWhm9mvW2ezbJdIxML6S0RLjYNphNpiVIvVb86iOaDD4jYjtMkC7QzaAx70
         fnnKslP1xQ58WrS14+z+6+iqTw3B3d4ftAeS5lm59XNaL1obJxQX/lDOQ0gqu4abGnLI
         57Fp6wXYj0c9eERY7OPc42JXN83PtIINBTO3m+GaNvVUyXA8DQGI+EoYHFpTomQhlkYt
         krJpfZfKwYHEQaVxrPrZmvN6cYn0QvHOKhzxVYyqZlo+Cp7MvGuyn95cLm29nKLa0qg6
         yEew==
X-Forwarded-Encrypted: i=1; AJvYcCXWbSCKHa1fImQGNjbfep11aH3041uSbzVR4AU3y566TYD/9BEc7iHh32XZrDMgz9MIMNinKDkDDuNbVtU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2P+EdGw3Nbi6KoqKrqLfMYRZBT6C2YuLzumB5euJUns5NyEs7
	VvWiK9XznJ2qSsibJ4CIpI8SURADMNMVWQGMb6TeWEB1EZXkRwNZ
X-Gm-Gg: ASbGncvyTgGe2bA0a0LXL4kIM85UwZtB4FCw88QjpLcR0sZ3SxxuW0/ovNClp8HuxRK
	fNkx4SEgI+gZKQWGpJOtSJ0ENldyvpnxygKd7LqtceGO55n80UqVwW4lbABD99tl5TN2af0L/Yw
	lJ0UuuNZ1E7kbECa2oai+lfFivalqOwMTjxgA82RpA8wpQtKFnXhJPWewgS+xcn4PVXPN4niKa7
	Bl/BNZfS8wk5328XdX5Volb0RrrY4NFLR+3Ypqn7WrhhJVfgwlQC/YMpLhCYrWmLQv4x75bt0Xu
	byPQ7ZGsjbBXa+EHoI1/wtSat/ik+0JJEhIf5vnNRKMTxg==
X-Google-Smtp-Source: AGHT+IFCq2btCpfZlVx3JCBuqw2azmNFSGuiBrqSE6YszRoEi1DMpySnZTXXWbMIN1RPLRsKmYHK1g==
X-Received: by 2002:a05:600c:a45:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-441c48bc863mr79292155e9.10.1746465377969;
        Mon, 05 May 2025 10:16:17 -0700 (PDT)
Received: from azouny-H610M.. ([154.178.16.64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a3113csm138652245e9.33.2025.05.05.10.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 10:16:16 -0700 (PDT)
From: Omar el Azouny <omarlazouny@gmail.com>
To: omarlazouny@gmail.com
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Kees Cook <keescook@chromium.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] Makefile: Globally enable fall-through warning
Date: Mon,  5 May 2025 20:14:30 +0300
Message-ID: <20250505171430.133971-1-omarlazouny@gmail.com>
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


