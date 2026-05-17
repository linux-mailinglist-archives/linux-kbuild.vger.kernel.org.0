Return-Path: <linux-kbuild+bounces-13216-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGNTIVZKCmrFzAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13216-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:08:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F635644AD
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BD33303FAD1
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 23:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20BC3D45C3;
	Sun, 17 May 2026 23:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pP37i3DD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5621F3B85;
	Sun, 17 May 2026 23:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779059144; cv=none; b=C1Cf+m0+hoOX20lGFKMaIvQjzZxK9E00eiSK4c6lep3dL1L6mWueUn3ahks5AW52qxtNhVej1selj/QAQhkBkY7cZGLbLq5+97ycansp2VBDuCGnA0A2yOk3DnaCAKj4FAqHwuXP77YPwTRHOIrUa26JJZW4UbOO8dAx+i2RBHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779059144; c=relaxed/simple;
	bh=19Rw+tS9ftgXCdxPfdLASsRDUPpfJwnFAJuXr7byz6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uV5kP9mO/9kRZsA9+pDaRHNEQP34t0vBZ5XyFF3hfchC6r/Zw+eUE3x2N1fjJBG6zi5tukoVa4/XcaHbfaigswsy3SeRoGewlwaJnqKakge2R8/10Aijb/RzCS+5i7G6YUS5GY1xomt0sWj9HvaWu+oaFYREHgqRChTp+/LjyCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pP37i3DD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5AECC2BCFB;
	Sun, 17 May 2026 23:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059144;
	bh=19Rw+tS9ftgXCdxPfdLASsRDUPpfJwnFAJuXr7byz6k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pP37i3DDmF7qc9mFcOIwFNOsiDCnodEmIk1daOpzc+Qv6Lar+fbCeIJcUsO6VEZKY
	 FKyzNRLM888mvHC6heQJceBz6CfwwAi//YgxrQ831GxUUE8KGi4J0zCU2axVgm8rS3
	 8BVRyVgQk5YqnXYWNXIbWCc5Q7NwQio9e6RQutm79QpBykqpKU1nafauDh/pzF2JoL
	 Dy/VgnsHWRlg5XPEVLlH0aXbaACNuHLFo6GmGdLqLYQo9mr0lHEpEbJjvz2ML1Hz9w
	 you/fgql8QVEZphDEl3wec2vTfEhhA5SxcA22YEz9IahAD7GM/MOEWB/p/l2mim3zd
	 VXiTIaXuf5L4A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:09 -1000
Subject: [PATCH v2 06/16] arch/Kconfig: Remove tautological condition from
 AUTOFDO_CLANG
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-6-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Rong Xu <xur@google.com>, 
 Han Shen <shenhan@google.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=907; i=nathan@kernel.org;
 h=from:subject:message-id; bh=19Rw+tS9ftgXCdxPfdLASsRDUPpfJwnFAJuXr7byz6k=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnhsfHxR049dVYVTz39jx/evOzDUrVdwuKb38O9fTk
 WfrHZbOjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRvGuMDL8ljNI9lPTP7GFc
 piPGuNbMraqpagFH0kpTZQlB+3sfdzL8M/Wztjms8lp6Y2y4TvDpTSnX9i5Id3i5ZdoLXq/adyc
 5uQA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: D3F635644AD
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
	TAGGED_FROM(0.00)[bounces-13216-lists,linux-kbuild=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the clang version check in
CONFIG_AUTOFDO_CLANG can be removed because it is always true.

Reviewed-by: Rong Xu <xur@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Han Shen <shenhan@google.com>
---
 arch/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 0d34bcafecaa..5d6e9f56210b 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -866,7 +866,7 @@ config ARCH_SUPPORTS_AUTOFDO_CLANG
 config AUTOFDO_CLANG
 	bool "Enable Clang's AutoFDO build (EXPERIMENTAL)"
 	depends on ARCH_SUPPORTS_AUTOFDO_CLANG
-	depends on CC_IS_CLANG && CLANG_VERSION >= 170000
+	depends on CC_IS_CLANG
 	help
 	  This option enables Clang’s AutoFDO build. When
 	  an AutoFDO profile is specified in variable

-- 
2.54.0


