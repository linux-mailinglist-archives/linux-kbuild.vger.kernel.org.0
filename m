Return-Path: <linux-kbuild+bounces-13221-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHmgNPdJCmqtzAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13221-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:06:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0A6564422
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E41D3022915
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 23:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4B73D667C;
	Sun, 17 May 2026 23:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKRYxwAn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7821E511;
	Sun, 17 May 2026 23:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779059155; cv=none; b=HSJkkW0wM0t/Bup6WLHVBtfTwka2xE/znWnzwS0HDFBbI3mqnomarGyHCLTf7X6dvL/rNP3EuXVir6utZbR/d3O/sqhTsU4UNlwKV6PwWs0zNtvAX3i8AI8U+WjpVJRQoZaIZQLDHBohzyUPQUnnky2u+oVwZ4BpGg+TPqf/p9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779059155; c=relaxed/simple;
	bh=lcWqe5FPRSMTs4llVEK0KjaOnNDgj9f9MUj5+Q6kb9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kFvQZOF1SGzEovXYP8J0a8Z1II9iasIjB4HosA8vjwWdzweW88iieiuaBkxMURRehvtlnsJ73qCQ9DeO5keJVusHU/Kh075RrBG6yaQlYP20hMGUQxwm3qP44VEib+lQ4tJbupWiUjM6fR2Je4w90foF571nsZGhBRqyDFtICPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GKRYxwAn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF590C2BCB3;
	Sun, 17 May 2026 23:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059155;
	bh=lcWqe5FPRSMTs4llVEK0KjaOnNDgj9f9MUj5+Q6kb9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GKRYxwAn9QlblyLBfjYxDhd53Tokp9JqWTyFOOcENtKokxb2KdbO7yGODMiLB6Vv+
	 JBr5TcZ9znXsNwy67iuuwYg9SBEzwDe9imK3CHenZ7Eh1a+3FjZnYE7Rd9+w75sc+N
	 hbXVmmVyMKIyFywTDKS5Jb/nDNdDCS35OWWCOWt9IoqigQHDS5YXN5qiAOTaZTE3zE
	 sKQ/X+iDR4u5WGLUunsfi3VO0+Rc4aNd5UKtbUkq7BaGpRPKVVu07XFEgjwCUwO80e
	 JnVpfYjLIlAd5QnQcj96LICqTGU/3BFT92pXKGmc1FBKqe/TILjoK7qC/MkIoEc5jd
	 deFH0nwxy9yaQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:13 -1000
Subject: [PATCH v2 10/16] scripts/Makefile.warn: Drop -Wformat handling for
 clang < 16
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-10-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1364; i=nathan@kernel.org;
 h=from:subject:message-id; bh=lcWqe5FPRSMTs4llVEK0KjaOnNDgj9f9MUj5+Q6kb9w=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnpvKZrQJ7mF/vftwEO+RhO0vT5Wv/GngFfzj4sr6G
 /KCi/jWdJSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJrFzL8M+YR2oek9sc764P
 Ox7+kzM6zLmD55x6aoT+nnlrPBeY7itm+B+SzrRQfUJacfimL56ObhVSiy0evWM2O/XeNX3/ROu
 5O9kB
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: 8B0A6564422
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13221-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the block dealing with -Wformat with clang
prior to 16 can be removed since the condition for its inclusion is
always false.

Reviewed-by: Nicolas Schier <nsc@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Makefile.warn | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/scripts/Makefile.warn b/scripts/Makefile.warn
index e77ca875aea4..35af7d6c6d18 100644
--- a/scripts/Makefile.warn
+++ b/scripts/Makefile.warn
@@ -135,16 +135,6 @@ KBUILD_CFLAGS += $(call cc-option, -Wno-stringop-truncation)
 KBUILD_CFLAGS += -Wno-override-init # alias for -Wno-initializer-overrides in clang
 
 ifdef CONFIG_CC_IS_CLANG
-# Clang before clang-16 would warn on default argument promotions.
-ifneq ($(call clang-min-version, 160000),y)
-# Disable -Wformat
-KBUILD_CFLAGS += -Wno-format
-# Then re-enable flags that were part of the -Wformat group that aren't
-# problematic.
-KBUILD_CFLAGS += -Wformat-extra-args -Wformat-invalid-specifier
-KBUILD_CFLAGS += -Wformat-zero-length -Wnonnull
-KBUILD_CFLAGS += -Wformat-insufficient-args
-endif
 KBUILD_CFLAGS += -Wno-pointer-to-enum-cast
 KBUILD_CFLAGS += -Wno-tautological-constant-out-of-range-compare
 KBUILD_CFLAGS += -Wno-unaligned-access

-- 
2.54.0


