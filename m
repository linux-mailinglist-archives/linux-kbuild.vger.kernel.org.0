Return-Path: <linux-kbuild+bounces-10814-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCEGAfdIcmnpfAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10814-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 16:57:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2FA69547
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 16:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0904300A111
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 15:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851323542EA;
	Thu, 22 Jan 2026 15:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVeH/Sh3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3C935D5E2
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 15:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769097254; cv=none; b=YsUcJpeBwydW/C74svsLIKjRY+ywrWd9XfRcG8b/gie45ZkDR7KxjSujvlOG8TPZQze/KEDrtRf6PRFNUVXiB0ODWHoILG3NDulbrvjBsnZfdHjvKMvda+3F9psHjIp8uFEfDuD7oDCi0cSwkUm+wWIQLeDzXa4EkZUe5OOM0gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769097254; c=relaxed/simple;
	bh=CXDDbZvYxWl/vWbHgI9CiMUF7tj2Y/OY3GgU3TJdRUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oCxFDvh4ExJdKFMILvLzHOAj8l03cHXX9LUc0cVSbMQvXNtELrlg/HJAD/q3i6nBMEbqNcgyipMLGRvIxzn/JyHHXGQT13qHm+Gr9Ypa9aXEsEsfrKO8JmFPXWtg9y7obFSI5h5pIK4WwxwK+SiS9stkNtuF703qA9kCOPD3xhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVeH/Sh3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so11774915e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 07:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769097245; x=1769702045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rau68iNr/9xru2kcKm/mMcF5zIA+X5IB14xO3mvnhII=;
        b=nVeH/Sh3OY23UqNt5c+cVbFJbdoKRIE/GqlclW8NJch+ek9TcqHqd6ZHFCncvRwCW+
         jwBVrX6CrZNrMZDRrOKvjTPTEFnh9dDnjI0gTVIke12s7PQkckw/K7rqB4d+KxLZbeM2
         rnDBgkfolLTOjCffypiFzwSZz2wASYlb0zmavzHr0EcR6AYAj7ITYa9yCoIP1gYTmZ+f
         qvBCcEYPiZUGLQVjVhq0fPTiWdUDuoNqUtqpFazdfEqSHUrJg9hPEq7kalUinxoQ+M/c
         VWJI561I+tIqjb5wu4Rrf5X+mdoCoDllPOmRE/jamB9kHYDaH8VarkhZhvMbGOnpXIKp
         CX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097245; x=1769702045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rau68iNr/9xru2kcKm/mMcF5zIA+X5IB14xO3mvnhII=;
        b=EOUrN19iwzyTVTz0glLPgiS+jluADyw9WoStwfpRRJyrLKrRDcDgqV5sygMkMETlNt
         I9A/0gyQPd7AWObBC2olex2XVG965C8nyBR0K9pumBQ7yVntiOVFLFp5Nh8prWIiERaE
         XBlMNJbQ2LY/xLFEONqCewW+8nfJfDbIONVZ2VMqZpvhBurvU+MT8z16XEATJ8FKg8uN
         q6TUul0VZ3liSPAqKAZFgCfyoRc7n8Qfm6KIfPwp3N7cC/owlbvEteJc1a1uucBWtxf9
         BWdVxVptoTtaEWopV8Js7MDZT39SYr9/eaEZJmPybxN43r9b83MvJpNyZAJFxcAL3XyR
         xdYg==
X-Forwarded-Encrypted: i=1; AJvYcCX8CmvuIk5bY4oZBjfgoJqhlzfbGKgQUCtfIOD/2uONbEe64D8cjxHlegJPrM24bgZQon+krDspa5l6WsY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ6RmpdO8u0wT2BmUQ2lTo8EwTLVD3wSQ9nfFPgoS3mfLGBzuf
	T+JJY719nxVNJg4cD6JA+Et7hgo2MZva579vcTGp7MjEObnuOvKMVAgwXsy2sw==
X-Gm-Gg: AZuq6aIta+HZk8pHx55/8UXMOjOVBJzyjYZY9BCqTfUi6avyPqX8k/F811piC5bp8sQ
	fYD+aOFOUZFxJr9hGd0WVRn9wTSHbAIew8w9R7pWK+gdOgXSWOgLB7we6igxDXWkKfGSigYlXJT
	eaLE2dHgDDQZvcueWuW7CPYbkozN9a+6RCSRC0i9t0YtCKqYfQcv4Gxm+33ypLz6hh3koL/iinh
	q9MEOTTdTxDWP4Bu1DTij5bdVbs12l2WYdTSPYVXhKzQt9o1UASd466soehEtV6Q9KPdGCljx68
	a9t4DWdmkNFJcg3ssYv5BpfrIwR/GluLijM59751dQy0hGeZ753mbOi2vkRH47X7TwfkoGD8hgS
	mpAB6lGbEvGkeDPVMFJHOFEBDiL9f84T9oKDuJ1NnRo8xCfQmOeetHV3l5Q5gbzgEOoa4F78dVT
	LgctpeFx6e2Ee9ENze+niX7NiAiPn2nVWLnFEzloObpMUeMUtbUQ==
X-Received: by 2002:a05:600c:83cd:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-4804c95c9d3mr1338025e9.10.1769097244751;
        Thu, 22 Jan 2026 07:54:04 -0800 (PST)
Received: from moja.station (net-2-37-206-142.cust.vodafonedsl.it. [2.37.206.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804705b277sm78847775e9.12.2026.01.22.07.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:54:04 -0800 (PST)
From: Simone Rea <hheh47660@gmail.com>
To: hheh47660@gmail.com
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Kees Cook <keescook@chromium.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] Makefile: Globally enable fall-through warning
Date: Thu, 22 Jan 2026 16:53:46 +0100
Message-ID: <20260122155401.335643-1-hheh47660@gmail.com>
X-Mailer: git-send-email 2.52.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-10814-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hheh47660@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-foundation.org:email,embeddedor.com:email,chromium.org:email,mitre.org:url,markovi.net:email]
X-Rspamd-Queue-Id: 7D2FA69547
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
2.52.0


