Return-Path: <linux-kbuild+bounces-13214-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPMAFhBKCmqtzAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13214-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:06:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B716F56444B
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0849303280B
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 23:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB513D4116;
	Sun, 17 May 2026 23:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJvFpmiy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EA233859C;
	Sun, 17 May 2026 23:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779059140; cv=none; b=C7Bd0Dl5uzWg79+GXfsAwaxL5DnZDaD4fTAIeiNLNfdVDubEdsobUSbgz/qaVJgJG1b2RLAEAJtOkzv4dAOtsAoQa8UF3QcZP4ghWjZBc4dDJ+b+CHOL838PIzjgXuxGaVgcMqTHW4KdbQd0XpiuCzeR3UwkcMVl+qgj0T8mSgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779059140; c=relaxed/simple;
	bh=YfEm8FBArmiuV/irEQDmk4NgtmRFGY6kjLc0CatzI6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IXTiPql51ikryFvltINf79IWhbSMBdBmhV4QX/+iTHgBpr9zZOcLDVAl+7913250Dgj3c4w861LCJ6uq0YWOwfJsk5Qv6tPBhKaN5L3eC7NlbqVI7AAILgoYP3rG1mOAh0nGUw4N+DIz8iSiqcp7J2MU7kLPJf2P+G5UWOU5SMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJvFpmiy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71715C2BCB0;
	Sun, 17 May 2026 23:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059137;
	bh=YfEm8FBArmiuV/irEQDmk4NgtmRFGY6kjLc0CatzI6E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IJvFpmiy2y9ngZf9eKR1lU4yqGsDYSObWzgSsw1aPIVM9zc5gxx3pebbioe0VPVKQ
	 Jb3FHTMCRxWFXNuxZizuh0V3yiR/BS21/QvEl/FAuMVh/EpbKJskqlDj+80kKSCYQH
	 ucGs2q6pvPzqLXg0Tqn4CT30pylN80fPyK3DtwnwU3HdI9bNIyVVZHpQLIrjMtKNVM
	 xJSon8cRMVCAwEzeTxNnaus0Vtc1UWkPOq65pUtRmjFy3VTXHgTBelMBXVe1vn8k51
	 D3ZR4x27x+F4crMnWE2TNZaAZgIwVD5/C5n/9KCf6oH57zOuc8jgataJwbJJCJWYef
	 7szCmpv3V/Olg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:06 -1000
Subject: [PATCH v2 03/16] security/Kconfig.hardening: Remove tautological
 condition from FORTIFY_SOURCE
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-3-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-hardening@vger.kernel.org, linux-security-module@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1194; i=nathan@kernel.org;
 h=from:subject:message-id; bh=YfEm8FBArmiuV/irEQDmk4NgtmRFGY6kjLc0CatzI6E=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnhts/At/WnR93v/7QPL0r7MeX0t/nVN+zZX17azP1
 YdnsK/U6ShlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQAT4ZzByLBcX/dGibU801Yx
 cQ0BPa4lO5qNA55OZWd+bfmraqv/RHNGhmch5xn55fj+N89aona2sq9vN/+iRZ9zD9TtOvpF54/
 DVA4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: B716F56444B
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
	TAGGED_FROM(0.00)[bounces-13214-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Action: no action

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the '!X86_32 || !Clang || Clang > 16'
dependency of CONFIG_FORTIFY_SOURCE is always true, so it can be
removed.

Reviewed-by: Nicolas Schier <nsc@kernel.org>
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


