Return-Path: <linux-kbuild+bounces-5446-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6225AA0B906
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:05:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A25D73A1CE0
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 14:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3842023DEBE;
	Mon, 13 Jan 2025 14:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2x/WFUad"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9839823DEAE
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Jan 2025 14:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736777125; cv=none; b=n5JYz3XMe0SZk+vM3IfBZqAgsuYjF7GssXBfIObqOPVBZr2f7tl72AO+qAKtGzFMZG+6000jP+yJBoeJ1yda39oSN8JRi5rTHCxsH4CRwrkYSGrATZq+ElSHJbdISrD9X/DH6MXm/btIvhtOL0PKUpBL10CG6No7MsJ+HPkYxPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736777125; c=relaxed/simple;
	bh=3LnAsMhP1pZpm6rI95kHTS+/gw5w1gOhLmu4sHb5rac=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LtJCDAx3ui8mkPQm5bnOHwprAp3D3cWgau8qGC5hTvsSvtQ+ejEgaK6oB+pJBxYfup0YSug505vQXmL0VbrxZXywIgKwralRuxzF7TXnBT1jfIIpWShdBJ+6/kSSRk74+RX//XBP+XNYPOkoTSAUVdICCTRRBYmomJ6Jqse8+6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2x/WFUad; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-386333ea577so1595302f8f.1
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Jan 2025 06:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736777122; x=1737381922; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZPe1bNvuiIIATFBKvXi5cf5G8IqMVRN5Iv2+H/k4HE=;
        b=2x/WFUadoEo7uUqSwCj0yJbk8qbVaSXaDYcY619iuq4MZHQSxuwbRFo9/Zu8sf5vOI
         PmnmSQHC7sSoDi7GeiXWfSx4GT5Efe1x8gFpRfqWpDkBE9UaJbYhze6uAJepM4e1EBsP
         eJcEh4YDZaoj7puwz/UHSkD3IQDR2JbkFpsqU8AooZ1L2Tu2xgNnMcnPUN6wxcrkQndN
         DelVT0a8+dBbWO8PDv/xBEGPOyMVp/ItDr+JwA12nIbU2d2Ug1ApJzR7GTIJk1AezVcK
         gRv7tv9V5l3WxA7NXNHpBIi8vuGL+ZHcUjZFr7vySd/Z1CqRZ82ScX9tuOvb05SnYOIf
         vC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736777122; x=1737381922;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZPe1bNvuiIIATFBKvXi5cf5G8IqMVRN5Iv2+H/k4HE=;
        b=OV/bLsOX+HyZeTitlWHHOKQb9D2HMPXtE4/nXGTldLW+FbPqNZcfrVGgwBsynAIJfR
         sK0sT+qkRoO1sl4Ell1aQY82WWgikXvVVf5wUyL9O3O1c4uU/CSa5nCBfSTcmQLKHEMP
         fZUqf3N5azwTeZ5f5VCWpWKVxfYWbjvEj2DKEYgkGF0/LAzXO1aT+xXRk5eAuxSXaVcf
         nTbZzzLgKqaNB0tPkg7LJQlZtP3VdK0bYnDL8QDnLYkQ4iUmRziHyITSL5LzUH9ye992
         bUlWlIYy6WI6tSb2jOrCC6Cc/N54gC445z8qZ7toEMTRCQ64NsirItmDvKzZU8knjAeV
         BZlA==
X-Forwarded-Encrypted: i=1; AJvYcCU/nSktyzE19MjoAY03IBkQpFrSsTdnRZ20hwoVgcxyc2DUa5ezN/XoS2N+UZ+2T+u1S6Mdo/zowBARYVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YynvsIO/ecZm4Bu2KMJwfR1JsIs5I1gT+mqK5LYdzwH2NbCqzfB
	mikwZzR5opx36RLjl8xy+ipwtEUhryK9rdLxgzlBuIkkfDNF3pIAKpta2Em1m65sLTVj/a5AquC
	iuR9275SK+A==
X-Google-Smtp-Source: AGHT+IFCImalmFtqftfgPV7fXo5SPWkGINMDlx+uQu0uulLu5xXIGdZVMHnmcWHtKguwAmvevmLaJ75QWCDdYA==
X-Received: from wmbjg22.prod.google.com ([2002:a05:600c:a016:b0:436:a247:a0e6])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:a108:0:b0:38a:88ac:ed10 with SMTP id ffacd0b85a97d-38a88acedf9mr15222851f8f.25.1736777122192;
 Mon, 13 Jan 2025 06:05:22 -0800 (PST)
Date: Mon, 13 Jan 2025 14:05:16 +0000
In-Reply-To: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250113-objtool-strict-v3-2-8b51f94957fb@google.com>
Subject: [PATCH v3 2/2] kbuild: Add option to fail build on vmlinux objtool issues
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

When the this new option, OBJTOOL_WERROR, is set, also add --verbose:
if the build is failing then it's better to spit out any information
that might help diagnose the failure, even if that risks a very verbose
output.

Checkpatch-args: --ignore=CONFIG_DESCRIPTION
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
index 7395200538da89a2f6e6d21f8959f3f60d291d79..a1b264e532920dd649122968d5782ca8eff34ad9 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -277,6 +277,7 @@ objtool-args-$(CONFIG_HAVE_STATIC_CALL_INLINE)		+= --static-call
 objtool-args-$(CONFIG_HAVE_UACCESS_VALIDATION)		+= --uaccess
 objtool-args-$(CONFIG_GCOV_KERNEL)			+= --no-unreachable
 objtool-args-$(CONFIG_PREFIX_SYMBOLS)			+= --prefix=$(CONFIG_FUNCTION_PADDING_BYTES)
+objtool-args-$(CONFIG_OBJTOOL_WERROR)			+= --Werror --verbose
 
 objtool-args = $(objtool-args-y)					\
 	$(if $(delay-objtool), --link)					\

-- 
2.47.1.613.gc27f4b7a9f-goog


