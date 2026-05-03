Return-Path: <linux-kbuild+bounces-12975-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM6hJPEK92kHbgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12975-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 03 May 2026 10:44:33 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5E24B4F11
	for <lists+linux-kbuild@lfdr.de>; Sun, 03 May 2026 10:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAEDA30038C7
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 May 2026 08:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2363803D2;
	Sun,  3 May 2026 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ar6Wv54G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2E839B971
	for <linux-kbuild@vger.kernel.org>; Sun,  3 May 2026 08:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777797869; cv=none; b=IFX0lzWYDWvOyrGp5UMscomgNv2/2v7H3v6x8g71fMv3dNasiDoRRQUHYGc5XNLtqfiVqnpz0tuptpee6lkLdkME77agaSiBKhUgAzFLdHEcC/WkzjfW4yPwuwY2qlAQZmC62Z4HZefn8PPPtMRfuqed11qf0U0i/0e9CqOX3Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777797869; c=relaxed/simple;
	bh=QfKkTLYMWzXxUWRmm/meHrS/pX3vkUb5T8BIkWe/yno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E7VvDCcFE7mlu3zJjWjXMW0geyS835rOvcrFmMczqM/cJIep3GFCJKA0r5I8TYPei4qSDLgreaJvuA+n8Lw2v88gXdIN/+qyumwntJ/cDztd2mLi24fdtOS8MN7AZ7CYxyztQRGgt4VBOn3BZN3oiqnpdRoQX2iyACakbuOIKco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ar6Wv54G; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36505450d0dso1479466a91.1
        for <linux-kbuild@vger.kernel.org>; Sun, 03 May 2026 01:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777797868; x=1778402668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8wOqdenjzVxeKrDsCP/AxtwKtAi+H1v2ol1Mn/Odz4I=;
        b=Ar6Wv54G53c1yEXo63gQ0uJ0ocG8LGu8AuetOf82cNhhVw3BEIEvq9byQwExN8K54e
         clKjeuSsyF6xtwZToERb6/xei4/Tq8+K7t3G1EE5cHzMo2cjT9JllmO10ePiTkkuiH4Q
         0REKhWN0+SJXUUyagiZZZon9+pGXLDubwS6/3tZgnjYfV5RLBsVSFqjF0Hp4HrBDmDAc
         ISDMLmR4aoz2PMklH1re80/yhUIFLzJGFN72e9JvCOakKZoQwRGdGncj0MzoeMuRtqYc
         t+ZRAkhs2viwn6UcA+LC+/yWBb1oKZJsIJlEcPjpomaUowkdAV3MxbzZRN8qH/E+gNiM
         0vPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777797868; x=1778402668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wOqdenjzVxeKrDsCP/AxtwKtAi+H1v2ol1Mn/Odz4I=;
        b=Nn0iQSOB7QnhQYBJ+cMmXvxRzVJkPjthLAJkaatD9wVzy5WDXKHU+EAiTFzrg7PA4c
         ycnTNPYdY8osSf08ND5s8c6Rxt9W53jfMR2VsVSPVLXrP0FQK18sY0cNf/s/ghPU073C
         Dss4X1PXdQBq05Dbi3MUZxbe5jZOMdJKJnxrRgg6T69DkEZLBilY6euS7lLDdALDWBMq
         GbeF8ERMBg53cg3DIEdqFZ4jkHuBun5T6xKHXdQwv91wIf6FIGsSyl5sFjDJG35tRzBl
         RYtQ8pizoo+6H+bbDUKvvtdB27VWUZDG9ZUI13ndnUFIpsA6ehh22A/vAQTFt0jvKYEg
         GAZw==
X-Forwarded-Encrypted: i=1; AFNElJ/TGZtiu4Tt7VXK/5rEKLq7E1AvvCyNN2STopBooVTXNptUBJqQgX8QwjlO8ux4Jnbh/8ex6uZ/2zhHICM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy2fQhX97wNJt/NFczEg/x1bOuU2jqrLRyK5ZvStwV2C1wkD+L
	uX8gpeEBFEOJweE4/AsH7YRPr+kdSKrlZQAEpCUvZf87g8jKwvkLVjSf
X-Gm-Gg: AeBDieu5/DRa2mi4gxbg98qUiLmibHDEaNecE9uqbcs+hlS/m4AWvJtcQ0mit0uJbM0
	r15vh7O+5WLNh4weug2IxfL5ywMKrEHTt682W285ibIa14ZEwoC/knMKYmKqMTx5l4YSgfHE6Cv
	4x+VDtCcL0SogTUo+mkvlcsV7cBJOLEcHIIjwfe6tnn+SAW9a8qI5qiJdvLF5KRlXZ8DBP6qNBm
	4MIUVC6GEfuvGfAStrQ4xnDAKgIm59/tF+XhIjQTOPZRxiZXh5vbNI3gALS9aFtAzGIc7fJoUJK
	PVLZWATqAKAf55MnJGJhPpQAPFC/bD3NTR/+EatERq/7UwCmgDvno4vrdCFkOxFT5KxOiVuuwhD
	+QWuD0XJ4Z7PGVJPfvzKYulfBN1ErulFDIYA3ZaMhG91ngE9vXaVLpoR1rw9uXjSY9OYyYEfJuU
	RyLMu9WxLm5+7YU9uXWQVUssqGmb+lXsN3iJK+nc55oHLVO6a3VzGZPykWjnfPnQ==
X-Received: by 2002:a17:90b:3b4f:b0:35e:3e86:e2d1 with SMTP id 98e67ed59e1d1-3650cdbaa39mr5540069a91.7.1777797867674;
        Sun, 03 May 2026 01:44:27 -0700 (PDT)
Received: from localhost ([111.223.189.110])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-364ebf0399dsm7557325a91.6.2026.05.03.01.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 01:44:27 -0700 (PDT)
From: Damika-Anupama <damikaanupama@gmail.com>
To: anomaanupraba@gmail.com
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Kees Cook <keescook@chromium.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] Makefile: Globally enable fall-through warning
Date: Sun,  3 May 2026 08:44:16 +0000
Message-ID: <20260503084417.18012-1-damikaanupama@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EF5E24B4F11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-12975-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[damikaanupama@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[embeddedor.com:email,markovi.net:email,chromium.org:email]

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
2.53.0


