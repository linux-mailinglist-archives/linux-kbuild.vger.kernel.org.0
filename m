Return-Path: <linux-kbuild+bounces-12917-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKHpCCx18WkChAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12917-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:04:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6B948E871
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CBF730FB218
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 03:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A0B340A6B;
	Wed, 29 Apr 2026 03:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJ3pLhdG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E500372661;
	Wed, 29 Apr 2026 03:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777431627; cv=none; b=TGjfJw+LUsJudjnk8fPfpa6IGGiEZP0yI3lFSomlhsaeC6mczqxcKrvypm9Jik/dKp+xi2Lg2cAGt1/HOS7wdTyAdvBbGZqU0L9E+Yo+BKGIfBAdCgpj7Y/lm0aA59og6dCctf5xHjQU4slfHu2FbF4x5aO8fGv9LtNq63Y2SV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777431627; c=relaxed/simple;
	bh=1JdIJ9vb9jL455rjHOOqE3nIS6G4mkOnP3omecCdeRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bo+SwTHKBUOPLHdIvylobOxlnBElxR/XFUk20TEC1SdhMd/KbzvPXbMC06zi+sGgz634sj55ECq8PxWlz/fg5ZkdpH+nhUdFJCQY9Lv0Z/trUOs67IPEFbNYoDogCYjArtWzlHZeewiIlI61km3QSCkWhpQATypyMZ9T2ofChgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJ3pLhdG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1340DC4AF09;
	Wed, 29 Apr 2026 03:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777431627;
	bh=1JdIJ9vb9jL455rjHOOqE3nIS6G4mkOnP3omecCdeRw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kJ3pLhdGN3XL6E75i+JKII54KfNjB0NOcy/Sr5jUvlmmcYstHGhL4lxCx7/U/Vt7B
	 EGggW68aq2ouGcWsaI16bBjezwPVA8Szbeyt6l6fiFaeE9WPwI0hpkIOoZ6pzFVwJf
	 uJhsAYkm2Qls+KUcRmG5XnpQv6GhpSNhG+zdNmdwXcT1rQqIT44aupOQ2PvxHWzAFz
	 b/Ii7tzN9Sj9x2P7lSYTDIW93cGs8HG+h7c/I2l59Gc0v54MfHys390tiBiMRV5ZI3
	 D4Xx3sQAsoew3DkR5jym2P7YHKza0FbtiUTYiwdLGbnRmAPfZGOUPBJeMUoWA4YsRh
	 pw8khPjWoak9w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Apr 2026 22:59:13 -0400
Subject: [PATCH 07/14] ARM: Drop tautological ld.lld conditions from
 ARCH_MULTI_V4{,T}
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-bump-minimum-supported-llvm-version-to-17-v1-7-81d9b2e8ee75@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383; i=nathan@kernel.org;
 h=from:subject:message-id; bh=1JdIJ9vb9jL455rjHOOqE3nIS6G4mkOnP3omecCdeRw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkfS4wurXbq/2wgWbHk6oK5a2yEM+6wsHuHbQndd5evU
 WxWXYt4RykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjIsXpGhgslufoeCQ7CT0yt
 NCyXcNW/cdTZHqV5x4snKuzwjqOnUhl+s/BNUK76a/ZbRDHNIubpr/yO2dUfNsw5O5eBY4rYUs5
 f3AA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: 9A6B948E871
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-12917-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,armlinux.org.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:email]

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


