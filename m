Return-Path: <linux-kbuild+bounces-12321-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAzEBMv9xmnHRAUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12321-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 22:59:39 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 710D234BD45
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 22:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B75E13049E2D
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 21:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589FC39B48A;
	Fri, 27 Mar 2026 21:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C/KPNvgQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oo1-f73.google.com (mail-oo1-f73.google.com [209.85.161.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4894389447
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2026 21:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774648766; cv=none; b=WPGOhwq5LAYokAOpURyckx67wjP6jPOLr1YxIuh1WRRiplIrPXNZ4LARHmozjY9cCepD/HjQ0cHFsim3ysECVZmBTi64EPpZ5c+hGQysGOHuAxSiOhGXUL32wVSTBKhePWBDbVSkCPpzduMBTgAMX7udB/WvbShhxUcw0Ox0GAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774648766; c=relaxed/simple;
	bh=pUs9THT6DHn2Yh3ii6ZcA4QCK2Rk+meZhFMzqf6DDdM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=KzeR5aLikQ6fc/4rWZSLKyP03nHeFuKasiD92D6R5MOm+/qgEvoKitwpXbM5WIzYA6jFGYhUnhziIMP/cF2cE/fjybhhyuY9M6KAMjpdenhe5o2cvyovkpA+upfglIn8lH84lqRTLaL0URIx8RuoY13xt3xIHdKeQz9nusPWcDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C/KPNvgQ; arc=none smtp.client-ip=209.85.161.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Received: by mail-oo1-f73.google.com with SMTP id 006d021491bc7-67c30448569so5312759eaf.3
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2026 14:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774648763; x=1775253563; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bXUVdAQ2VqEkZsnQST785FFjZDxfkqJqi9/U/lqUA6Q=;
        b=C/KPNvgQho91kXsJdwiLtQKVB8ShDfGAR8BSz8KX8gNQHw/F4ur0+zSmyK/9BrjQCf
         wRPFxeniAGHx8XdagxAh8zWwFxDiO2nWUuozh7qPH2v+1uCmG8A5AWm8Q14YklnaRUYB
         LHLakCcJzitidSqY2ygG7sUsggliWOhBlVyUSkucwJ/IEI5wVG7N5VZUBYdipqS0L5p/
         GhIpAJnIvd3VCv4sfQfQJ9BUI3Ebfqj7PeADIxNcnPZi4w75V7zGUzswOLoNKiiVcvBX
         7tcslc/iYwXvSKp3JZvZJVeVKE8taVSUEi8nX1Wfror+uVEef/tqnYl/kN4o8FIcCWs+
         hGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774648763; x=1775253563;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bXUVdAQ2VqEkZsnQST785FFjZDxfkqJqi9/U/lqUA6Q=;
        b=jpmbBc1PsxBhRjaWBlYn/g+Q36wn73E061hy6+ZqaNmYvaq28KfAdadwlWpYPwez5S
         7lyUT1KpiI5bareizBoAbc6slICCzHd+b1o8w3DzgkeH6Tt0/nV00GqpMLc9+vVpDO6+
         Rk5EGkAcp2CRWt+k3qvjUFxtGtsrZYdWfVOGmJVU2jzR+TAG9aSRTWP00Y0kTJ/VrtiC
         04IBnU5BIe5Yr9VPmDDk3R+FpziZXpwvbX52xU10WWfeLgYl3bj3thtTgHwy3xGswqwC
         cUcFUeBaWcocoykC3kWwS01wt6bqCttH3HjjxoIke6ny6lSelv4+6SDS4J50Y3V6xwai
         S/MA==
X-Forwarded-Encrypted: i=1; AJvYcCXP57HRrhrKYt4IfVeuv3AMomUbepa+rxeAjn1enEbP6DinJvikhMhFARDcntXNqh4butpkq/sYFJQY6Ug=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEjqcQ4e/EtUgcvt6pLcU9LdMcnttKHKhvOdKWOL0DZ9ckFFWC
	+w1tDn5drT0+7SXZP5ZoXiB0hqecIOgjWHM/W9TMiykz7KUs9V/0Gz8euB4y6rxVlwKn0H56gJm
	6g9CqH6+qLh3CRBDIqohFAPfywA==
X-Received: from ilqp16.prod.google.com ([2002:a92:da50:0:b0:4f8:400c:308c])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:2914:b0:67c:1fc7:daa6 with SMTP id 006d021491bc7-67e185f1e03mr2232968eaf.10.1774648762484;
 Fri, 27 Mar 2026 14:59:22 -0700 (PDT)
Date: Fri, 27 Mar 2026 14:59:20 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALf9xmkC/4WNQQ6CMBBFr0Jm7RimBFBX3sOwQDq0E7ElrVYN4
 e5WLuDyveS/v0DkIBzhVCwQOEkU7zLQroDB9s4wis4MqlRNWakWb9enTBqj9S8UN4kTZ7CuW12
 RVupY9ZCnc+BR3lv20mW2Eh8+fLaXRD/7J5gICUs6MI3UsK75bLw3E+8Hf4duXdcvKFk4JbkAA AA=
X-Change-Id: 20260327-kbuild-show-inlining-557d31d2293a
X-Developer-Key: i=justinstitt@google.com; a=openpgp; fpr=6E3AADB90F44DA9EB9CDCB6799D922A9379F2964
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492; i=justinstitt@google.com;
 h=from:subject:message-id; bh=pUs9THT6DHn2Yh3ii6ZcA4QCK2Rk+meZhFMzqf6DDdM=;
 b=owEBbQKS/ZANAwAKAZnZIqk3nylkAcsmYgBpxv25vibCsY1AcfNIAiZK8Vc/x2WLaiNGyz8wL
 lmTfG9BTk+JAjMEAAEKAB0WIQRuOq25D0TanrnNy2eZ2SKpN58pZAUCacb9uQAKCRCZ2SKpN58p
 ZLU1EACPMFCyHnqyHs0hybIGSIyVIGgZ/EC39mnSfbpMvEbeiRMmQCDGF3Om16lIpbta6E4UfhV
 lRPmgkNnhH0H+eaVbn7EOZJZjYS0Gw87mvWkf/JpIctlcLdIunaLhAo4swGR0JqNvOYmcjZeWTo
 Me3aZ4OIKy4o/VsXhpVxP+zZJJs6zw5oRyN9BMtJgF4k0RMwvIYyOiqlmtvM+fNv61qtMao5edX
 opyhtyLTmH3oR8f5GqmzkPy/9b2tp9sUMTz6u7V0X0Mq6rHfPGuq1HBDk/3EF+KBScS4W4nrF33
 KznPxAiCKmI6sE94Ms1Uvgnz8PEHuPVdKeR3QxvoToA2iGZGsmzjaKzeMJXzkKCgDhXR2MdB7YZ
 bTlwLCR0VMZ0k/hi596pixgUOLd9QXV7LHk43gXFZw+fogrn3OFRiv6gZvr+EeIYIlK41vzaztO
 mm8SlKR0rgkKVfYUMahdozruDXiCvHm2DhtjEJ0kIOSk7PWyXJQsxzbGUYXjUr7n/+6xLrDjvif
 szb84/+QmluBK+Yu6rpfOeSHiJPnTEVHK5WN/4kAZTcfgE5gJEobyBItW+RyvL77WA4GthXdQtW
 92oxCWnREqxnbAKdQBTCV3YC05/mhXafL2uRjpY3GRNvu6pDyFSieuQoz1ur/D/2rTH2Lmoa2PL VOKxRXMf7K5KwRg==
X-Mailer: b4 0.14.3
Message-ID: <20260327-kbuild-show-inlining-v1-1-730ac2cae571@google.com>
Subject: [PATCH] kbuild: add -fdiagnostics-show-inlining-chain for FORTIFY_SOURCE
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12321-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[justinstitt@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 710D234BD45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Clang recently added -fdiagnostics-show-inlining-chain [1] to improve
the visibility of inlining chains in diagnostics. This is particularly
useful for CONFIG_FORTIFY_SOURCE where detections can happen deep in
inlined functions.

Add this flag to KBUILD_CFLAGS when CONFIG_FORTIFY_SOURCE is enabled
and the compiler supports it.

Link: https://github.com/llvm/llvm-project/pull/174892 [1]
Link: https://github.com/ClangBuiltLinux/linux/issues/1571
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index e1279c4d5b24..978726aeb1ef 100644
--- a/Makefile
+++ b/Makefile
@@ -973,6 +973,12 @@ KBUILD_CFLAGS	+= $(call cc-option, -fno-stack-clash-protection)
 # Get details on warnings generated due to GCC value tracking.
 KBUILD_CFLAGS	+= $(call cc-option, -fdiagnostics-show-context=2)
 
+# Show inlining chain notes for FORTIFY_SOURCE-related diagnostics.
+# GCC does this by default while Clang 23+ supports a flag.
+ifdef CONFIG_FORTIFY_SOURCE
+KBUILD_CFLAGS	+= $(call cc-option, -fdiagnostics-show-inlining-chain)
+endif
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


