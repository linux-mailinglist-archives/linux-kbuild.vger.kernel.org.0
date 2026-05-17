Return-Path: <linux-kbuild+bounces-13218-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMOiE3hKCmrFzAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13218-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:08:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E515644CB
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F0A230459D3
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 23:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38D93D45C3;
	Sun, 17 May 2026 23:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="II85SHSV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC963161A1;
	Sun, 17 May 2026 23:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779059147; cv=none; b=GaW/jTr3G97wzX6borVlR0Y+FpcD+1LuWc+bbrsGUUQGp+s7zFSsPlnRmrpRUfbv/XrzD84mTx+H2jqLH+mDllXA4qqkpe58Pnghq9Bjb6+17yDFpH2mgQQMfF5kBw4kDRsQx57Kkrh9v1Z6woCrAMPTJjn6+T/U4sCkV49Zs8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779059147; c=relaxed/simple;
	bh=1JdIJ9vb9jL455rjHOOqE3nIS6G4mkOnP3omecCdeRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G1XrbhVWXkHl3SkOf3WRF92wHn2XLlZ4KKCYHy3kJyQH9dsFHXG82GvtYhYN3kSKdx5lqxjxF7I1lXU819Sts8oNnnJMFnn6z57SDxoErPw96luoLOrCKVFHkGj2OhRpxaOfXeCtiN/akT6nWYHJhK/gPZARjoOvstmcevpPkC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=II85SHSV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22416C2BCB3;
	Sun, 17 May 2026 23:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059147;
	bh=1JdIJ9vb9jL455rjHOOqE3nIS6G4mkOnP3omecCdeRw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=II85SHSVBGKfnV5vgFXTbKf9rEgp1YYAyEOs6BtGoj5be2aR6tvWwOd1Pumz4smzu
	 vm8Si0vaTQJF50m+fJcJx/93YPZyfFzKs52iRisLrIQ799oQ2SEv0Tgy30U8QfPWt5
	 +R6xbnPeajgcsHy811hZPd4erJu617fF/IpdqKOl0Qxr2o4qIJSHCXeTz8BjMW1Ff8
	 Vy6+5iAHanyi3H2e5ubFZ9OpOXXSrZDk8XDZyhNg3aFxMFFrGO7pCKTtch+mFrbxMQ
	 1mBIoJmZQ4mn22kPILRhxae5GJXhsbN5atq7zK/mYvW7leYFfN51KkKMJsUp5Hpycl
	 Z22ksK5WMxEFQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:10 -1000
Subject: [PATCH v2 07/16] ARM: Drop tautological ld.lld conditions from
 ARCH_MULTI_V4{,T}
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-7-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383; i=nathan@kernel.org;
 h=from:subject:message-id; bh=1JdIJ9vb9jL455rjHOOqE3nIS6G4mkOnP3omecCdeRw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnhs/L49o7y4JNXJJv+iu5Lrqz3orziqeE1/m+s003
 Zt41zmjo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEykfibDbxaj5IMfN5QeN9ZJ
 OFoWzvEotrShQEDsw/fJ3Pv/y7hKSzIyfEpZkj6n3ipjmnLGSXHnSMWKS8v23VH0Ewu/Yb5T6sd
 cXgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: A3E515644CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13218-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:email]
X-Rspamd-Action: no action

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the '!ld.lld || ld.lld >= 16' dependency of
CONFIG_ARCH_MULTI_V4{,T} is always true, so tit can be removed from both
symbols.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/Kconfig.platforms | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/Kconfig.platforms b/arch/arm/Kconfig.platforms
index 5c19c1f2cff6..386eccc81868 100644
--- a/arch/arm/Kconfig.platforms
+++ b/arch/arm/Kconfig.platforms
@@ -8,16 +8,12 @@ comment "CPU Core family selection"
 config ARCH_MULTI_V4
 	bool "ARMv4 based platforms (FA526, StrongARM)"
 	depends on !ARCH_MULTI_V6_V7
-	# https://github.com/llvm/llvm-project/issues/50764
-	depends on !LD_IS_LLD || LLD_VERSION >= 160000
 	select ARCH_MULTI_V4_V5
 	select CPU_FA526 if !(CPU_SA110 || CPU_SA1100)
 
 config ARCH_MULTI_V4T
 	bool "ARMv4T based platforms (ARM720T, ARM920T, ...)"
 	depends on !ARCH_MULTI_V6_V7
-	# https://github.com/llvm/llvm-project/issues/50764
-	depends on !LD_IS_LLD || LLD_VERSION >= 160000
 	select ARCH_MULTI_V4_V5
 	select CPU_ARM920T if !(CPU_ARM7TDMI || CPU_ARM720T || \
 		CPU_ARM740T || CPU_ARM9TDMI || CPU_ARM922T || \

-- 
2.54.0


