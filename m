Return-Path: <linux-kbuild+bounces-12915-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOYjJup08WkChAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12915-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:03:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF02D48E83D
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DD3030570CD
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 03:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0EC83502A9;
	Wed, 29 Apr 2026 03:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJxYKu2p"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE6C28C009;
	Wed, 29 Apr 2026 03:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777431624; cv=none; b=ptNikZvOtEqC2Q6A3JyAB6w46U3JtT2koFEooZAPXtPvRDYSAPbDK7R5bE74j/DfDmnbBjWI55UJEmo2+IUVk5zLbMj0NOHKkUZo71CTbqZ95n4JIgZB1zt4T/PFKiSEK26yNGqwmdJwY0RdIeFMG2m8wYFo3LsDibf+E1+wSQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777431624; c=relaxed/simple;
	bh=Js/Qvk/YTQYtq9kxTfkSbTTWXZs6T4sny7CJeepDclE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cLamDN9OjOhbT2lLy9uRQ/9OIbEqIjsWbYrts1YS4UvfR/2goLyDA3IE7AhZp3BsHmau9x+9cONG3w+inKEWcAeF+A7hPoCSsy88MmEPc+Ar3EB/wnulZKeccBvqdbSdxjLm79ERpy5lxFUROZQXNLe9VNg/GFpDPiKcOnUxTlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJxYKu2p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1916C2BCC4;
	Wed, 29 Apr 2026 03:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777431622;
	bh=Js/Qvk/YTQYtq9kxTfkSbTTWXZs6T4sny7CJeepDclE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qJxYKu2pTTfEtNptBanzcW5vBWXJHh9HOXYL4Hnvsm7DyC5Sbv/BtAo7kyFzpCFyT
	 VuGyB2SbLvTWvPctfJGqfxVAQfSlDPRCwz34nYI86J6uP3A1M5omMEDsgxoepL1j3p
	 tniH6Hfzm592O7Y1Ye7JLItZWJJlwxJUlNbYQ9cOMcAf7/REjdz31F01Uq1BgXV/8/
	 7cbOn//YXbVrz4mIS/6P9mJ3BHiWj24n/wITenmfL5VFRhh845I9aIZgEq0E3BblSd
	 G7cNfAr6YMF3yNAholEjEFrKUfJZm1aMx7d79TZl+vK8KXkYTZpxj6/u/d5Huf0CaH
	 hMxeDAtZNY3Lg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Apr 2026 22:59:11 -0400
Subject: [PATCH 05/14] arch/Kconfig: Remove tautological conditions from
 HAS_LTO_CLANG
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-bump-minimum-supported-llvm-version-to-17-v1-5-81d9b2e8ee75@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=991; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Js/Qvk/YTQYtq9kxTfkSbTTWXZs6T4sny7CJeepDclE=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkfS4xWizrsn+aoXte5d0Pv9yPiCYcj/gr9n9lvJVyQf
 mIH07vlHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiU9Yz/M897cH9Zpe1FIvn
 uvl7v7WpBnUxF/071mM6m/3SuuDV2TaMDJu3GB04xJrnbfrjluF3HXFfjc8y//ao6K26O8f7nO3
 h7ywA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: EF02D48E83D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12915-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, two dependency lines in CONFIG_HAS_LTO_CLANG
are always true because Clang will always be newer than 17.0.0, so they
can be removed.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index e86880045158..0d34bcafecaa 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -806,9 +806,6 @@ config HAS_LTO_CLANG
 	depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
 	depends on ARCH_SUPPORTS_LTO_CLANG
 	depends on !FTRACE_MCOUNT_USE_RECORDMCOUNT
-	# https://github.com/ClangBuiltLinux/linux/issues/1721
-	depends on (!KASAN || KASAN_HW_TAGS || CLANG_VERSION >= 170000) || !DEBUG_INFO
-	depends on (!KCOV || CLANG_VERSION >= 170000) || !DEBUG_INFO
 	depends on !GCOV_KERNEL
 	help
 	  The compiler and Kconfig options support building with Clang's

-- 
2.54.0


