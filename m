Return-Path: <linux-kbuild+bounces-13215-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sI7lCCFKCmrFzAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13215-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:07:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B114656447A
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3C903036775
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 23:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60C83D6CAF;
	Sun, 17 May 2026 23:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxGVTqjm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01D43D6690;
	Sun, 17 May 2026 23:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779059140; cv=none; b=sChUBbJBCJTNUK9cC4hKD2SY8vdJdhOQGfGdWsoJ5qboMxsimgKD5qDVYHJEvC7LczJnyb3hVe4QZchKo/nJD1J2wKro7PA3Mzsp8OfZTNsQp2nqjGmW4cljiuxnW1rZTEUhDCOwtbMHDEqROiuod06qPt0jcQC0ZOuk5HQRVHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779059140; c=relaxed/simple;
	bh=NbvxRGPRdLLz8f2twSL8Hl1CgnbTDAstxmL+2JiqVFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bsp0/1VvN9l+ZdT6LTVKK5zDEW3B2yux8m6obZZL+y3dB6tI1mhmZVT4Y741BwdbZn8XTGe7tcgE45/DiNNtt7Zo0/hZmyzVuJ/5jcDmo9N0IrL+CiZcQn1ZSN8Z1jD8L9OE/2M0kdJ9r7HmqMMCT4hzXuBwRZyjCxYrnbv0HVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxGVTqjm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24478C2BCB3;
	Sun, 17 May 2026 23:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059140;
	bh=NbvxRGPRdLLz8f2twSL8Hl1CgnbTDAstxmL+2JiqVFo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SxGVTqjmGmnWiqvVoHbzvMCiPiCyQgw1hGCCGdfa334N7vMyDs2D5rDFDmnPShK30
	 algF43L8K5cjLnMxYWHTTvKW0V8kE/FNJWp2nd+txYgVdTfEbN5HXSInyhM4TnJ3+D
	 PJPIya2qxy9JOMZNWlC/EH6DFjaPgF41/CP03nIdIF2jMvBjCCZejWV27+LbvIDVg5
	 s1k5FhGPUm7dz9n1vE4xZGk5Od3SHUp6OrpH04bd3S4bbP7TcN42cMD7lI3vWbSo4G
	 offzH2OZfzUlBO7+slze3/b6sp5RMPnKYTYDVwIjeiZhSeJhT+MpcpPg17Z2JHkeo8
	 P5R/8b/Hb4HGw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:07 -1000
Subject: [PATCH v2 04/16] security/Kconfig.hardening: Remove tautological
 condition from CC_HAS_RANDSTRUCT
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-4-b3b8cda46bdd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=nathan@kernel.org;
 h=from:subject:message-id; bh=NbvxRGPRdLLz8f2twSL8Hl1CgnbTDAstxmL+2JiqVFo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnht/fvxz5c686YpbZpdZfvi/+PfFpLaougsrePMcH
 EIy3WXYO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBNFmRkmPlbJc8n5bf/kkON
 mrYrjfa++Pbw2MxpSlcEbOwzHGJ3HWX4Z3lslYLpmYlHJokkbpsv8DJsldz5KVvDAlq7N22ZsvF
 9HCMA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: B114656447A
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
	TAGGED_FROM(0.00)[bounces-13215-lists,linux-kbuild=lfdr.de];
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
has been raised to 17.0.1, the '!Clang || Clang >= 16' dependency for
CONFIG_CC_HAS_RANDSTRUCT is always true, so it can be removed.

Reviewed-by: Nicolas Schier <nsc@kernel.org>
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
index e4f23c08a17a..b90cf9ed4642 100644
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -274,9 +274,6 @@ endmenu
 
 config CC_HAS_RANDSTRUCT
 	def_bool $(cc-option,-frandomize-layout-seed-file=/dev/null)
-	# Randstruct was first added in Clang 15, but it isn't safe to use until
-	# Clang 16 due to https://github.com/llvm/llvm-project/issues/60349
-	depends on !CC_IS_CLANG || CLANG_VERSION >= 160000
 
 choice
 	prompt "Randomize layout of sensitive kernel structures"

-- 
2.54.0


