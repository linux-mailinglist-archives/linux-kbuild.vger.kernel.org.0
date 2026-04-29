Return-Path: <linux-kbuild+bounces-12912-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MF7WGIN08WkChAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12912-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:01:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E19C348E7D6
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72EC130ADF66
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 03:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A7A36923F;
	Wed, 29 Apr 2026 03:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaNBLH8l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8113502A9;
	Wed, 29 Apr 2026 03:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777431615; cv=none; b=d79fHVbG/pExfFAxFuK7pxxkH1/aOKi5lMFfe2O/c3eF//bRju7MuRjd8tk2VYa9HUSg+Gh3lCB5rdwhRFQh/12hQXTTH8GRacBpJC+mCMs4ZOSn0PNro05TBDyeB21H8p6FpqIiykyFAHoYn1AuwMBSKdFG5PZ+Hfx4gUhJfx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777431615; c=relaxed/simple;
	bh=l+BZ3WvsdjWNqGwGVoSMkP3Od041K02aE94g62dX1Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a3Wk5+yaRYRxEha3hmAYwSrrcFRiuTbgoJCxM/LS9F2TQfoldyeofamK6wLeyMppwenX4wyRTtg5ZNxQp7Q26eSHvuQsS4Btmdr4xhp/Aiyu72Rdg+J9A68vOfCWicl9u457qKQmwgFT5ZqqBgTOAECo3ZCANekPWvrNKZQGXac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaNBLH8l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CF1C2BCB7;
	Wed, 29 Apr 2026 03:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777431615;
	bh=l+BZ3WvsdjWNqGwGVoSMkP3Od041K02aE94g62dX1Ts=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oaNBLH8lKlJvEJu2YSkg1SJ1nt+JlZlNThCJFxtWzbw1XQH7aZ0BYqXtmR/8tRhsc
	 84gfMmAx1yGeuI5hPodJ0DXPFMW+VAEojcVpFZSn7xagUeq3mtcoZGsVxCRaBX5qg5
	 Z2D22XYAKpDZ8rG5PkD9VDDiPWKgqiRjGBWSVNL/QgTjMvmG36ric5MoZvjwy/CbU+
	 30vhJ7tLsqyH6qcWnH982q0KtfeSGSGCUWhwLUlPS4nCY+vJejsRWPuR+iWkLS3hLD
	 863KRDg49t53xUNjbhf12Dn/1ZSz25k7GjevGp1e276+GohFfHPc1mRRaNLqTrjq2w
	 0JypUcMDZDySA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Apr 2026 22:59:08 -0400
Subject: [PATCH 02/14] security/Kconfig.hardening: Remove tautological
 condition from CC_HAS_ZERO_CALL_USED_REGS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-bump-minimum-supported-llvm-version-to-17-v1-2-81d9b2e8ee75@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109; i=nathan@kernel.org;
 h=from:subject:message-id; bh=l+BZ3WvsdjWNqGwGVoSMkP3Od041K02aE94g62dX1Ts=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkfS4w6qm6s51SQYvA6cO+1vYNifsLqeaYJ1Wvtp4SLP
 9eyk1vTUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACayNYfhfxrXmfCtRTMZ2X6f
 ejr3S4lPqERD3D9Xx7undzmJcR056s7IsCW+jWOFWvQd14StkZMbF0nuSv3y9fy2CM3iMx+Umjf
 uYQEA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: E19C348E7D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12912-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the '!Clang || Clang > 15.0.6' dependency for
CONFIG_CC_HAS_ZERO_CALL_USED_REGS is always true, so it can be removed.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Kees Cook <kees@kernel.org>
Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
Cc: linux-hardening@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
---
 security/Kconfig.hardening | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
index 86f8768c63d4..a0461d648396 100644
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -189,9 +189,6 @@ config INIT_ON_FREE_DEFAULT_ON
 
 config CC_HAS_ZERO_CALL_USED_REGS
 	def_bool $(cc-option,-fzero-call-used-regs=used-gpr)
-	# https://github.com/ClangBuiltLinux/linux/issues/1766
-	# https://github.com/llvm/llvm-project/issues/59242
-	depends on !CC_IS_CLANG || CLANG_VERSION > 150006
 
 config ZERO_CALL_USED_REGS
 	bool "Enable register zeroing on function exit"

-- 
2.54.0


