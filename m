Return-Path: <linux-kbuild+bounces-12371-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EI+KBwRy2lCDgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12371-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 02:11:08 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0847736295A
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 02:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46D3F303CE01
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 00:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C281448D5;
	Tue, 31 Mar 2026 00:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IVYqZG8s"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oa1-f74.google.com (mail-oa1-f74.google.com [209.85.160.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBFA74C14
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 00:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774915760; cv=none; b=XG35uKoQSCN0LL3xRDEScCL07HdP7xwKbAiE9cHSSLxpbjB6cUIg3XS3CdOJn7YrksbJbjHFHBRs7jrUN1jhHRRzRA4fIP9DprW1v/klgZR5erANNHldIce1D1ffUqcx34mZPF1LiG3/QNVmFoDkgUvTrJC2pWXX8RWdjZ3RTTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774915760; c=relaxed/simple;
	bh=0zzJj5XbJZNH/JIAf3ERvtI4s2NzTsyvLe8QvhS7z1I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=tTmGGJl7RhFLh7Q66Ou4Ul/LsY1HQZxf36dOF/7EQDJtgEJlUfqifPpnh0Ku4jv9r27Vl4A5VNyrFvcpsYZBNblDl/3phdvzD7z8554JnBtxagLYVSDHsAl11txDy4sGPC0lKL0tCHrF4yKqmxlRylQvOLTkNKaR+ejplH33xTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IVYqZG8s; arc=none smtp.client-ip=209.85.160.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Received: by mail-oa1-f74.google.com with SMTP id 586e51a60fabf-41702ea8343so967008fac.0
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 17:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774915758; x=1775520558; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Biv+L7zDH8OWARKW4shGacT9EOL/EfELU3DWE4aGIX0=;
        b=IVYqZG8s/YZSpZVdi9thc8TfPSFGyzHFeNYM0R0Kp5SsCjT++Ox+NeJJSVM/92sE3Y
         YJo6pU1gZBzH/s58BwiiQZv2R7TJbCfxrI0zpXuCQfR/tUcKr+YytWQHvFXrM3+qfV7c
         SsI9KplStAIpESUutlZKShFQEK5wlCYxggIQk+IIEHBssV30mBHowCvz/smnmnr3o9Tc
         QDqM3NGru/ITV3JsA/daB4on5r1bFxf80JcGJbvlTGTqRUeBX4E/gPsj6r6MEE9mw8ov
         fMw1l4x61OWSW1tNEDEySVGeR9bwiPk3n14OaJJV1ijvDodkMisTD7z1+W0593xyvasG
         CFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774915758; x=1775520558;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Biv+L7zDH8OWARKW4shGacT9EOL/EfELU3DWE4aGIX0=;
        b=m0+ZO1xLN4mqPrsv8l13GR0nY7PkTCcVDnRBRvGbzhnBQMpZGQ6sA70ka6EU+SQRZg
         X6NxP2sLrGW6xwWJG2Ry9+tRvuZRn3AZ1aTeacbbp1zGDnIWb4JEKZmShRamyPq2I5NI
         nBHwnb3YFSphVSuKGkEHeDtKiytLIzkJpdYY8+R3Q6rlz69agRizHha4t4ZRvqd9i/2g
         KjjwdbEUzsUOHBPgLthvX+b8KCcBTFBd4LrtBQeaHXHIRA+vBpzV/zj/5LFx2VybV8hm
         5eXGUJx1GKE/xfot+s2NNhzV14fQzyRB/U93nD01ZS0ezhzfLFUTqMkXf7c4I38bHUFX
         +dUw==
X-Forwarded-Encrypted: i=1; AJvYcCXr9cI4S5aG+57EvLR1slbGAyUxHSLhOatDj5/P8Zpe6dz9ZQvZq+VdF/B79UhHNN/ukC0G+AUb0VepTZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFVtkMPFTBlcDkqMn1/bFezrzNYC46dUclqp6igZRCBJ3864Vw
	8j1tEQvCswnuftV8fjwYf30SrpdLrLSv3MEGum8O9mxmNiGX8EE5oftdP9dZMFLVRooXxDmWQZ9
	+7ezKie1DLArcmc8B9p1HiyuMsg==
X-Received: from ilbdl5.prod.google.com ([2002:a05:6e02:2585:b0:4f8:9ed9:1e35])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:99b:b0:67e:3f0d:4229 with SMTP id 006d021491bc7-67e3f0d4596mr526703eaf.14.1774915757999;
 Mon, 30 Mar 2026 17:09:17 -0700 (PDT)
Date: Mon, 30 Mar 2026 17:09:08 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKMQy2kC/42NwQ7CIBAFf6XhLIaFUNST/2F6QNi2GysY0Kpp+
 u/SnrzpcV4y8yaWMRFmdqgmlnCkTDEUkJuKud6GDjn5wkwKWQslDb+cHzR4nvv45BQGChQ6rrX
 xCryUe2VZUW8JW3qt2VNTuKd8j+m9voywrD+CI3DgAnYILdToNR67GLsBty5el4M/bKOEddJZ1 Aa+7Wae5w8McaVs9wAAAA==
X-Change-Id: 20260327-kbuild-show-inlining-557d31d2293a
X-Developer-Key: i=justinstitt@google.com; a=openpgp; fpr=6E3AADB90F44DA9EB9CDCB6799D922A9379F2964
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807; i=justinstitt@google.com;
 h=from:subject:message-id; bh=0zzJj5XbJZNH/JIAf3ERvtI4s2NzTsyvLe8QvhS7z1I=;
 b=owEBbQKS/ZANAwAKAZnZIqk3nylkAcsmYgBpyxCth4ToybVBS8QAYW1JSRg4EFMkoArfUQneN
 aNgUGjGm/KJAjMEAAEKAB0WIQRuOq25D0TanrnNy2eZ2SKpN58pZAUCacsQrQAKCRCZ2SKpN58p
 ZAshD/44gdrcDdJnZkI9ro2nUYl9aLuGTtUVuuCouFlQNmROm1W9xkvhg0u0znR+XArJjWRKWhy
 CdnNw9HG5Qt8LkMeLteK1jbYtCHe+GCza2JCMj1JE2njoZeGaFVd/7ftISZKElkud6OerPgeswq
 tnj+TK/LJ7ptXJyeQvnpUH+M2SqPHB9v0Wrl6XVPO6VGYRSWaZ55/zdVkmF2Hh+vZ1wLXMjCYmd
 zANJRTGBBgcQcy4bM53fNtWMEqKa5kzJhW1GA0XXixfbXXh2PYcP8LfFWEX0Pz6QW+iISovQBsI
 7L3nW2ZYzUy1x/O6KxlcuQhoL/inwGzXHAQTWQzKoPb1pcYFnfXw4EaC0IDC6GiMWAc7NbnY5Ba
 HksrKUr5A6ihZ5Xjmn5DoDuz6FgyzR1a45/NqQQXYJ8ow432g+pwWqMoj5v/Tp6Tnc68cjcagGB
 veT0hHTW7mcMhNwv2JRMPbwy5kZlTV8thqk26T3mAcoYjiAgDMcXLmTuMAMM6L12l2zhWYXfoDw
 MJO419a6l3k7Tp4bUeone6uWRYBEVKtCAmff46rfLlqXNLzybfMmiiEvqqojPdXjqA49xhLU0u0
 qs3YV8GzPb9jeDG89GWkkvQkGMJVu/wJOAS7FeSJT29rVHOVkD1u2L355yLNdRBisxVYFvo2/G2 irbE13lKsu3R7Pw==
X-Mailer: b4 0.14.3
Message-ID: <20260330-kbuild-show-inlining-v2-1-c0c481a4ea7b@google.com>
Subject: [PATCH v2] kbuild: expand inlining hints with -fdiagnostics-show-inlining-chain
From: Justin Stitt <justinstitt@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>
Cc: Kees Cook <kees@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12371-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[justinstitt@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0847736295A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Clang recently added -fdiagnostics-show-inlining-chain [1] to improve
the visibility of inlining chains in diagnostics. This is particularly
useful for CONFIG_FORTIFY_SOURCE where detections can happen deep in
inlined functions.

Add this flag to KBUILD_CFLAGS under a cc-option so it is enabled if the
compiler supports it. Note that GCC does not have an equivalent flag as
it supports a similar diagnostic structure unconditionally.

Link: https://github.com/llvm/llvm-project/pull/174892 [1]
Link: https://github.com/ClangBuiltLinux/linux/issues/1571
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v2:
- Move to always enable option if compiler supports it (thanks Nathan,
  Kees)
- Change commit title and message
- Link to v1: https://lore.kernel.org/r/20260327-kbuild-show-inlining-v1-1-730ac2cae571@google.com
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index e1279c4d5b24..4972b23fb77f 100644
--- a/Makefile
+++ b/Makefile
@@ -973,6 +973,10 @@ KBUILD_CFLAGS	+= $(call cc-option, -fno-stack-clash-protection)
 # Get details on warnings generated due to GCC value tracking.
 KBUILD_CFLAGS	+= $(call cc-option, -fdiagnostics-show-context=2)
 
+# Show inlining notes for __attribute__((warning/error)) call chains.
+# GCC supports this unconditionally while Clang 23+ provides a flag.
+KBUILD_CFLAGS	+= $(call cc-option, -fdiagnostics-show-inlining-chain)
+
 # Clear used registers at func exit (to reduce data lifetime and ROP gadgets).
 ifdef CONFIG_ZERO_CALL_USED_REGS
 KBUILD_CFLAGS	+= -fzero-call-used-regs=used-gpr

---
base-commit: 7df48e36313029e4c0907b2023905dd7213fd678
change-id: 20260327-kbuild-show-inlining-557d31d2293a

Best regards,
-- 
Justin Stitt <justinstitt@google.com>


