Return-Path: <linux-kbuild+bounces-13433-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0fwpOB6kGmpu6QgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13433-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 10:47:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2606D60BB4A
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 10:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 688F630382BA
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 08:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1372BEFF6;
	Sat, 30 May 2026 08:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmbTqBcG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4E213A258
	for <linux-kbuild@vger.kernel.org>; Sat, 30 May 2026 08:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780130842; cv=none; b=YvVTZAYJTDMVTX2tM82c/LNuJsohH/pZeS8RQp+GsKsM7eUH3TqC8uMyovfrAYICVuhZUoeRvP8NrCQRSTimBsk1uSQ6aN210mGQgbeBkvMsiBvjuZ661E27COu5zSzjjyPrjYf4CdhIaKYwhyHkAihMiCPoozfaClyjcPvbX8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780130842; c=relaxed/simple;
	bh=3s141OeWJZsAFTtcZxHtoCO8F5QURdQ6qmP9bQWWcz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJR97RtvJEoRyCZFaBn4MwnNwPfVGT8XQiayjuzt3OCfh3+UirAscoat68GAluROUJoW4lGD1dGRR4XuGMtR4vZLF9k7ViFZuNmqTDH+JV6XoGSTcc82O8UuRThQQdJnKdERGICs1fsMBj3ft8vqAolE1hGbeQr9JvaqRm6Q4jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmbTqBcG; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8413ac3d82fso7992590b3a.0
        for <linux-kbuild@vger.kernel.org>; Sat, 30 May 2026 01:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780130841; x=1780735641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnpJhGbhii8ejczVPq5ChKsIrAJvaGNigpG7q6h1f4A=;
        b=GmbTqBcGew8Xo/GgCT8ADsCmo21pLuKrw7mNgfXTXdo2xZCN6PEKsN74SdO45zTTPO
         M3Ke3hGNqIrn6F3UAapX8QRSl0T8FLgSmdBTiX3GGGE6ENF6E6tQb+q59ivsUOyRYjjj
         rqhtaqt8ZUY9doVr0gOdfbUK5d3twARxsZaLqRukekipEO2p6JdJKyUv/CujUhSltbqc
         zJS/c2fZbPEPzPPTCnSq3aDofPrChjuqm4/byS634AxS8StlPCGD8OnWVuDLdvX2zIB0
         bXYNcG9Z/7ZsgOUIXOf+/ZjrBBR8XCSyMWrObny0c/iVKYuOs/N1rw8j9w4Lf6QZ07hQ
         oYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780130841; x=1780735641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OnpJhGbhii8ejczVPq5ChKsIrAJvaGNigpG7q6h1f4A=;
        b=sIJlxAbEqzDFwmzeZn9Tjld1yqLDrKjSpPzf2viv5RigDA7CSjkSwH4/tz2yq4T83l
         GmCLEapKgd2e5c7abnColEG7cAdwwWzKtMLMHiiu6HfYppWiHIxYr874K2wED1G5nkdA
         rZB7RTs9+CySUpsjLf5Rr9CzDnngngQa81lG7fQtNFlJ3fShFdV44ILuccKa2jE9tBhw
         VJ7biCKt5xuoXXsE+5dXhLVkBQ5o1BJozO+tI4b4OiKcLBhp7UMSdHVGTZgDqo3pwg0V
         zaR8Q8j7syTgT22KkP0MYgI/mLm1OSB7Jd9Bhtx3CsEBqaxV/8iPbf7kDIzpqMpI69nJ
         mDRA==
X-Forwarded-Encrypted: i=1; AFNElJ9GWiqY5rpYCSOA6vK9/bmf5KjXmki3aePvfzh5YtsUNoGigiEHksSskQbLMkuvHpdWzT6ZTzUzFWELoFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ4DH/Nm8gO7UOpD+I6v2w8wh1VqZicVFRRvFdwqKzjuS5zkXI
	FAgX+Q4nNM1cGMQ+5McG2E8/4ksG2AzBAkseaSsnlsgeej1mzQMFMWv+
X-Gm-Gg: Acq92OEZuMKiNcwxP7rNjlAfFSYfVhfM25D5iHh497T7h0vxH9KoprR3cvz1qCH83kA
	/2MyRQUrkqlBcq/ipy01ArBOlc6uVYjVrZ4pAMUnPXllggc7w5/ebophDbbN7s6BpFPZ6Gm7149
	HjBcJyVhsAunIxtaGHraGvqmPt4bKxI9TeQBG3EuKSIgQ4JDU5XO0faZ/P5vguus8BAja+zN29R
	La0pe6XG8nGGSTmiWf1ZJVWBjZHpBqODnX+6bZR4gacqDxd15OfYlVdDAv5iPouM/EVlVwYFN6v
	RrCkHBv8fUki9Dv2JfCsSckRbGdtxwNdiH9tSrxx8jVWndU414bcV6Prs3dvbni4RMiDICGai5x
	OiweXRL0slEewJBPzfkHps2r4xAfD9EoZrmWcAckqXQSwzVIg61AcYgno3/lyuRXO7aIyBZLrli
	FfWSrDwiJKBIr+Er7uj4+0HRjXzHtaOET5TuaiCcS500296iZtuHwMlRxtXzPBcL6VgaUmfYFGT
	GI=
X-Received: by 2002:a05:6a00:aa8d:b0:82a:6461:6d15 with SMTP id d2e1a72fcca58-842257084e7mr3027529b3a.46.1780130840738;
        Sat, 30 May 2026 01:47:20 -0700 (PDT)
Received: from manish-VirtualBox ([106.192.123.134])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214cebc6esm4099273b3a.54.2026.05.30.01.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 01:47:20 -0700 (PDT)
From: Manish-Shah <mshah3409@gmail.com>
To: mshah3409@gmail.com
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Kees Cook <keescook@chromium.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] Makefile: Globally enable fall-through warning
Date: Sat, 30 May 2026 14:13:44 +0530
Message-ID: <20260530084430.8485-1-mshah3409@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <my-first-patch>
References: <my-first-patch>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-13433-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mshah3409@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,markovi.net:email,socionext.com:email,embeddedor.com:email]
X-Rspamd-Queue-Id: 2606D60BB4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Signed-off-by: Manish-Shah <mshah3409@gmail.com>
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


