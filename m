Return-Path: <linux-kbuild+bounces-11311-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJTPHDA+kGmJXwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11311-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 10:19:44 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD1E13B8EE
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 10:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77AC53017268
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 09:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0107C261B71;
	Sat, 14 Feb 2026 09:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kepPKtwN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5D91E5B63
	for <linux-kbuild@vger.kernel.org>; Sat, 14 Feb 2026 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771060780; cv=none; b=TYY/EpSUbMvsn56KK5D7KR9LsCuKYaFZOOqCUVT/cx5xqHM2OWy25fxc3k7a+vOeGRBsH+1azAm+Qs0CFpMRDtYmRH1QUOLp8nW7MBmZoBAidqlBf7xyH2y+7JBwBCZ9Aj6/zv2GFZIxgsnrZBClMHOeMdG/Haef3vVCGlvtI+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771060780; c=relaxed/simple;
	bh=iTQT/f63/NTG2n1qHyZZ0DDibc+pJuT6de7hffhTxC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nqe6kWn8Tqxe4J9k7xRISGwCbz5Cm9XRlTd6GsQiCRGso5qF5/LihYgJY82o6M8Bkur5kOOlgGkur906ZAlEUu9SLtMt1Fw46xCHjODO/gsYwfLj1EyK4sDz04BvT1rI9UVr4ND+gIlsR2sDJy64ZRJ9YQEeurkRYiIEMwJ8ukA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kepPKtwN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ad21f437eeso36875ad.0
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Feb 2026 01:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771060779; x=1771665579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xXmyU6/9u89ynx9eUjaTgPkrkBGrULDbWy2mJj9y3Dc=;
        b=kepPKtwNXZOt3TpjA6qfoxxqRSMY+ffZSWOiWdmWa11G+3sSTbGQBDzutz2riWod2t
         2K4c2Y4KFgos0IXqvxwXUv72R4EmTEMAuR6hzeOk9KdSEyI6YvUxgVtiwoL/U7YySJ7A
         eF/5w4WCA7qni1qCpR0C9j+sN+zc2oQ9MsjRD1yt9hd56bLn2K+t56B53fhbCfUZMLJv
         rn/lNLTi4wkRlyhqDQthtO+DQ2ZUjzJk7SUxCffat5j3jXcnC8oySSZjHUwVgSndDove
         F5iKUaXbHRoOPwBTUAxOsRkHpsqn99l1KcOiArAs8Mp0hY6wmWYd8nAVBNoKNNZWYHre
         fZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771060779; x=1771665579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXmyU6/9u89ynx9eUjaTgPkrkBGrULDbWy2mJj9y3Dc=;
        b=Y3Jl62YQu9iLDpmMLaN8vpwTh4H/LSnp5rKyjayFqDmBZuGOpdKw1+5o/eTSeSR6hi
         L6OWHjAqmZdtDWLjyaMQC1YHZ/QQx5guAvTZzqqgkCV2BsIoPget7Mdcn/8DU8xdGLVo
         CTOrbtHbIdkLrf5HdqI627zOoqF42oKnik4f8KzXHxlsfsnpx5Cio7J9Y5gKUcZQfbdZ
         mx2ip2ps6hT7i/2KElvSa8wel6B3mATOyJDaDCSxhkwJUUdBChT4i7GLoGBdHB8D2cYL
         TF+j6NgOhPV0DwfL7pTguRtP2PUnz88hIYDvPU5FOOmdAysxxdHp8H1icDqQaTo4YVQE
         +qiA==
X-Forwarded-Encrypted: i=1; AJvYcCXswC2ygfHIBdFSABZagFzIlpfbNI3m81BLkuAAaOBxifPQmJOXGsWdPJ6LSt12KIdI4zckKt4uFBwweUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLW4PmiHtTAmhYuM0b863clZdf8GvYTWmkuBTBelqhD550cpw+
	pp7Z2gr4APyoysxSgpVby+hlbsMDha/C8ISh4rnkkcXeS2HbwI1Ex7hv
X-Gm-Gg: AZuq6aK1ocJFA+OGZaF5+EPnQyGAx7Q9ueFFMrgt6WrpIu8P5th/Ag/HvVu05T4BJNI
	G57nrkVhsA/HGr1LJroi8YVA3lQJW3Xi5uWnO5B3JwoyF18z0LGu+DyjXvFPg+7i/v6zlb5wMhq
	oo0ZcQOZdKNTmrQj17bEOnRysuIafIFw+QFs2qZJ6prn04WcSBWYCgaSd0/9R+ajuLowztZgjCm
	uLi1tp3fdAKq5MfetV+aEywByYtDfuCAGlI/i63p2UR1O3kiKXoDgUnKUK60RGpoUKAlQ+U0vge
	74rrL+aYu3apj+ggPBh3/XpRlff7Dyz2n2p8nEEY5dN/6sWhULWyw7TH9r0LW0nO7kfUcw4vCE/
	yt7gcPyhPzc/0cH68FN32PFbqWonJCWka2u8DG5q4qQiVvZ6HUmvL8fdBMoKLbTxKnYu3BVTjY0
	HC7rmDDrkstF+4hMGrPm/1RjQp3VjPQlpFBVk/a322J7xy/DLzgkWi5I+tcjVnfU2f0Oo3jXTVY
	O5t3Hs2lkWRY2CaDmdn3E8eJg+s29v+
X-Received: by 2002:a17:903:b46:b0:2aa:e9f0:146c with SMTP id d9443c01a7336-2acba4a11aamr33267525ad.29.1771060778911;
        Sat, 14 Feb 2026 01:19:38 -0800 (PST)
Received: from rishabh-QEMU-Virtual-Machine (firewall3.vnrvjiet.ac.in. [103.248.208.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d595fsm13265395ad.43.2026.02.14.01.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 01:19:38 -0800 (PST)
From: Rishabh <rishabhssap@gmail.com>
To: rishabhssap@gmail.com
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Kees Cook <keescook@chromium.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] Makefile: Globally enable fall-through warning
Date: Sat, 14 Feb 2026 14:49:31 +0530
Message-ID: <20260214091931.3519-1-rishabhssap@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-11311-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rishabhssap@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: CAD1E13B8EE
X-Rspamd-Action: no action

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
2.51.0


