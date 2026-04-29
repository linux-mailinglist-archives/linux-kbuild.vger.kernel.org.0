Return-Path: <linux-kbuild+bounces-12913-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHYvLKZ08WkChAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12913-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:01:58 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3904E48E802
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 901DC30C4439
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 03:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F96A35A381;
	Wed, 29 Apr 2026 03:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uWP/pqHF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1718733F59E;
	Wed, 29 Apr 2026 03:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777431620; cv=none; b=nvJOTCCBPdEYALraVvYp0iELabKayBQNzKUhVVq1XRbsDaiHFrkJAZ22DBOCU7XP+jPHDBygSAlANhP46sbMlVzZB0VQlBivSxRx/7vRK+X5dDHQgkg05ydSdedxcWs2M2z+aIQOpTVHheAVto7qvC+z5wxeGXRx6wc2ChlyL+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777431620; c=relaxed/simple;
	bh=B64x5kBJeiiR2SGmTWoalog2nb0TO9RlUTl8TyWAhjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c7qUj+hMtiW+Nr7finI/UYICTIV2lttUlKnLJAdX0FKKzeNYzMYkTOA3Mf0q+iyiH5xryjyUmBc/zXObcmVK+WmAR0vmc/MpAvUV2luHPl5QHTBVtwGnKPu7iR9zz7g7/8XQGQsbDJrP29JU45Ca+Cu/Wd0czGreujHw3deHYAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uWP/pqHF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C5BDC2BCC7;
	Wed, 29 Apr 2026 03:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777431617;
	bh=B64x5kBJeiiR2SGmTWoalog2nb0TO9RlUTl8TyWAhjM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uWP/pqHFMyYafTSUxvOJ48YWUoXKR8nsFUC0Vwmmgr3aCHi9DpkXYk+hmdqjnyIR9
	 Qteuew43Ans0Sw6yolM5+VbHy45JwBSfESnnMt+vlceDkHF5eucKOR6FEQqmCP9OwY
	 Wv7YavF3dPxyKSc0DHTrbStG5rDLRHWaACi1TCEcAxuE1YxZnO9B+wEh5V0m/8PmpK
	 6OO/mciYxwTTeo0RFJYvXBQjG7lVhoFXAt3tPRtZ9q1LQXMl1ecPtakRZwMgDMSn3N
	 UJ55zygbTglRnVU8AZEN0kxjJY7v4HwKHmxSZsdRWYa4vvERQCDnmTnR/e8U512Go9
	 mMBqF/T3VA+3Q==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Apr 2026 22:59:09 -0400
Subject: [PATCH 03/14] security/Kconfig.hardening: Remove tautological
 condition from FORTIFY_SOURCE
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-bump-minimum-supported-llvm-version-to-17-v1-3-81d9b2e8ee75@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-hardening@vger.kernel.org, linux-security-module@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148; i=nathan@kernel.org;
 h=from:subject:message-id; bh=B64x5kBJeiiR2SGmTWoalog2nb0TO9RlUTl8TyWAhjM=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkfS4ziZZ8dqr5uNGfZtteTfz4IuB68Us19+tT4YyLnN
 t1ojRY/01HKwiDGxSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAmor6AkWHam+w/Mc8XtiWY
 /rNVWv62LYPj+Uczb3dZ1xqep97TT75m+MP1jr3Boj2/99fOj1+0Q7Iijz7mE1tbYbJ/1mezTR9
 XhHEAAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: 3904E48E802
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12913-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the '!X86_32 || !Clang || Clang > 16'
dependency of CONFIG_FORTIFY_SOURCE is always true, so it can be
removed.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Kees Cook <kees@kernel.org>
Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
Cc: linux-hardening@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
---
 security/Kconfig.hardening | 2 --
 1 file changed, 2 deletions(-)

diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
index a0461d648396..e4f23c08a17a 100644
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -213,8 +213,6 @@ menu "Bounds checking"
 config FORTIFY_SOURCE
 	bool "Harden common str/mem functions against buffer overflows"
 	depends on ARCH_HAS_FORTIFY_SOURCE
-	# https://github.com/llvm/llvm-project/issues/53645
-	depends on !X86_32 || !CC_IS_CLANG || CLANG_VERSION >= 160000
 	help
 	  Detect overflows of buffers in common string and memory functions
 	  where the compiler can determine and validate the buffer sizes.

-- 
2.54.0


