Return-Path: <linux-kbuild+bounces-5176-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7924F9F6939
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 15:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0609163D87
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 14:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02711F03DB;
	Wed, 18 Dec 2024 14:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uLKz8fHM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F043B1E9B1C
	for <linux-kbuild@vger.kernel.org>; Wed, 18 Dec 2024 14:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734533945; cv=none; b=fCV654twL42Kgs4OgBX4inyPJdA/IxZvkMf6JjwkTJHRbinKS7yrQPKM95xWVeGvmWZgRjJNNRDCguPls7DIS7+9lDWxgLgZxGdFlbGdrNhn+yM/oSvr/0fldm3Vhu59TwFjBYuU0eloEjtzChJflIQAetLHdNciw7XMSkvIPdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734533945; c=relaxed/simple;
	bh=vafDbXBf+QfMxG6+rjWXgv88J6vjtPaiFaHXbRrgmRo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WKH5sd+N9AzF1qc18R506XEKPxEOHynW0dFhJXmFOBULTPs7P6kk+dRLNEfZG+RLW07FIWTv/Zquayu5E7IXjx3chZMOlojTc0/edDTycPu9MPTxNbJgo29P9tZ7ojmXDEiApJ/8KalqG5e2+fzASezkc6a5L3WFKuyo1UW1pTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uLKz8fHM; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4359eb032c9so36095505e9.2
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Dec 2024 06:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734533942; x=1735138742; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+fxq85lD6PQT2A+RCvBP9upNyfET7edCFQdJ5Qc6idU=;
        b=uLKz8fHMvJYDm5qi3QlRmw8prr87P6YS67XLrVdLOirHX6tUYAhlXV3Yd0eD3yy5RX
         H9JMvvTpU1YStfWTFXl0zrfauWyllSmLaS/ucNiZySUJfeLc/3sSMXh8yf9YhpI70gsa
         Mf6ORdjKLqb1Ci/qKkdKmsEoYqJTArPamYnP+5I/RPxvDrMRZF2H4Bo8PlR1nzaNkkiF
         5aJ4Zw+nrnKQHJvMBlrUtftAG4f5ZU4AEBRolfxmLHXV/45GogNIxVZUz99FIclbZNlc
         gkMMeiPNebLRHMNcTiZ8XqZR56MM23pEws3fLjWEcSPVRYTFWAjHbrHBNqaTFek9GisV
         yYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734533942; x=1735138742;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fxq85lD6PQT2A+RCvBP9upNyfET7edCFQdJ5Qc6idU=;
        b=UYiiNU5FensttWmRK7DoZa9ivvA0EtevKuf5Z4NGmxAqwydPEd6QG80IrmzdHl1+ZJ
         wq4+S1L3NFbWxB/2+GopWKBwwH01pLFbRjTPr9g1zrq4dMrpU6oghgKMgKIqTqJyJ8Kq
         /HlDbLem3Yp0bhVU30kwxMKCZLLk/pbGA1vooqhTxPAA0Rqgqq0yBq1YI57/QVfEu/a0
         +SDWz31YNSAXnitiBEEjyw2KnBnQ17RtwYQm+T+pcO0TrJuWAbGFnHoq6RCGKVkbE5bI
         7j2U/VZgAgVtjzR6PKTOmadHutfCH1KL5r1pTYDni3fsWY+qeEr95X6AtgDuVKO+qaZ4
         WdgA==
X-Forwarded-Encrypted: i=1; AJvYcCW6zDNW7zZSLGoYBAD+WgkOhs7wS3KO2f/4tsp5v7+26t0AUJsY8fG2ydZcKL7jV9vQSrjQ8wwKCE8f6UQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtzKrDcDKFQS6leNiyiHZY76R/vk5fWFc8ZH7IItkzJtJYBjgI
	YTiBIuUFRaXuqXSTq77l/78BaC9RpDx894eYTKA6U48oVFZtUL0WHczuUYXtVSaxu799KQtp2Ds
	JUnnb9BlenQ==
X-Google-Smtp-Source: AGHT+IH6nFaGWCuLmtEVK7MkT2qc20xbncxkKqUUs/d5E7z2van0Z9iQNOqaZ3mX/Vt8cvgsSyrqh3ATVeu6rw==
X-Received: from wmbhn6.prod.google.com ([2002:a05:600c:a386:b0:434:9eee:e503])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5248:b0:435:14d:f61a with SMTP id 5b1f17b1804b1-436553eb4a4mr23858575e9.25.1734533942686;
 Wed, 18 Dec 2024 06:59:02 -0800 (PST)
Date: Wed, 18 Dec 2024 14:58:56 +0000
In-Reply-To: <20241218-objtool-strict-v2-0-a5297c961434@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241218-objtool-strict-v2-0-a5297c961434@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241218-objtool-strict-v2-2-a5297c961434@google.com>
Subject: [PATCH v2 2/2] kbuild: Add option to fail build on vmlinux objtool issues
From: Brendan Jackman <jackmanb@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

NOINSTR_VALIDATION is pretty helpful for detecting bugs, it would be
helpful for the build to fail when those bugs arise.

If necessary it would be possible to enable this for individual
warnings, it seems unlikely there's a use-case for that though. So
for now just add a global setting.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 lib/Kconfig.debug    | 10 ++++++++++
 scripts/Makefile.lib |  1 +
 2 files changed, 11 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index f3d72370587936fa373129cc9b246f15dac907be..3ee92da4733a3a504991d5dbb4d0cee84f519d64 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -545,6 +545,16 @@ config FRAME_POINTER
 config OBJTOOL
 	bool
 
+config OBJTOOL_WERROR
+	bool "Run objtool with warnings as errors"
+	default n
+	depends on OBJTOOL
+	help
+	  Fail the build when objtool produces warnings.
+
+	  By default, objtool just prints warnings to the terminal without
+	  causing a build failure. This config changes that.
+
 config STACK_VALIDATION
 	bool "Compile-time stack metadata validation"
 	depends on HAVE_STACK_VALIDATION && UNWINDER_FRAME_POINTER
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 7395200538da89a2f6e6d21f8959f3f60d291d79..a53e052ae0532e886fcb2019025cf7216e484bd2 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -277,6 +277,7 @@ objtool-args-$(CONFIG_HAVE_STATIC_CALL_INLINE)		+= --static-call
 objtool-args-$(CONFIG_HAVE_UACCESS_VALIDATION)		+= --uaccess
 objtool-args-$(CONFIG_GCOV_KERNEL)			+= --no-unreachable
 objtool-args-$(CONFIG_PREFIX_SYMBOLS)			+= --prefix=$(CONFIG_FUNCTION_PADDING_BYTES)
+objtool-args-$(CONFIG_OBJTOOL_WERROR)			+= --Werror
 
 objtool-args = $(objtool-args-y)					\
 	$(if $(delay-objtool), --link)					\

-- 
2.47.1.613.gc27f4b7a9f-goog


