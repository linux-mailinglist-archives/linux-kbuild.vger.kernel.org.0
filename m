Return-Path: <linux-kbuild+bounces-13226-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMfdB0dKCmrFzAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13226-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:07:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBDB564490
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FEC930048E7
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 23:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BC23D6CAA;
	Sun, 17 May 2026 23:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNFbevge"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB823D7D8E;
	Sun, 17 May 2026 23:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779059170; cv=none; b=Fc5wu6Id/+F1fCE6onkGnBoHSm+SN7XJE+WsAnCXXBPQrCS3E3Fcsv6PagIIJCcEHNJ2Wcm7/e09YD7H+sk1OMBxBozK6herjNqTM2rSgABhFwIR+MQ7FilG7lwJlLkLCtkZcy0S6F+Q6MtMG7gz5vSM1UbmJ11GgPk/yc1BgrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779059170; c=relaxed/simple;
	bh=8m6x5wnunBWxbVlZbtA148oYqLF0VsukfvcyqBz4UQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nGoOrQQmzkntfXMx2fyVsk3qNlno9UMaZrvBqCd0rv+ioD4S9KSacmHbQvWupxtgcLZU025Z/mcFw3D+wZDFT0wEiOw/zHehUOlagvJZdNYZLOen1xXgGpGYAnNNjdYBB70VwV4MIsd06y/kxE0qkbFIeJ30WzShSxE9PQea3zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNFbevge; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB37C2BCFC;
	Sun, 17 May 2026 23:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059169;
	bh=8m6x5wnunBWxbVlZbtA148oYqLF0VsukfvcyqBz4UQ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lNFbevgeVS1mW11lkW8TQe6kAAZqBINxcExooUXnfLSiajvg082pC9pca/6Hyzqlq
	 Wdl1sQ5HzLOYIur/cPldfilrZIDRCSBBQQbjY3gE/b3e/B+6RnVs2HAU4k4O/UdSCE
	 7iMuN9KhreIXJQ6SxTKLFuvBZv+zmIBXxkdFTRoY3fnQr3jI8qH5H4Byssay1fVMSU
	 dx24SpIWUOm4RWDv7282aWDlsQN+etCwDQ2YgbfN8YU0nhE7wDPXJ2/Cn8EY/CD9o+
	 +VqzY2gKW9RzYtx8Yaz/qc8Myyo5/Wn3cCJAGHrYaBeTiQEIVvhgjzZrp4qTGuqCbR
	 naTRGrd7kiT8A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:18 -1000
Subject: [PATCH v2 15/16] compiler-clang.h: Remove __cleanup
 -Wunused-variable workaround
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-15-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1219; i=nathan@kernel.org;
 h=from:subject:message-id; bh=8m6x5wnunBWxbVlZbtA148oYqLF0VsukfvcyqBz4UQ0=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnptXfohLOaw83zhtjZHdDU7Zlzt+aD3zfs6+2Kktr
 mvqf5nnHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiimsZGVZmV6c3Nx6w+CDo
 0bXq/bfp5woyY490/l7bOnHr67S4eUWMDDefvnkQvaz8dlCzl+Lub9Hunfv56g7+/2C67J+6W/l
 FHnYA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: AEBDB564490
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
	TAGGED_FROM(0.00)[bounces-13226-lists,linux-kbuild=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,infradead.org:email]
X-Rspamd-Action: no action

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the redefinition of __cleanup with
__maybe_unused added to it is unnecessary because the referenced LLVM
change is present in all supported LLVM versions. Drop it.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Peter Zijlstra <peterz@infradead.org>
---
 include/linux/compiler-clang.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
index e1123dd28486..eadf48b7b5b1 100644
--- a/include/linux/compiler-clang.h
+++ b/include/linux/compiler-clang.h
@@ -5,15 +5,6 @@
 
 /* Compiler specific definitions for Clang compiler */
 
-/*
- * Clang prior to 17 is being silly and considers many __cleanup() variables
- * as unused (because they are, their sole purpose is to go out of scope).
- *
- * https://github.com/llvm/llvm-project/commit/877210faa447f4cc7db87812f8ed80e398fedd61
- */
-#undef __cleanup
-#define __cleanup(func) __maybe_unused __attribute__((__cleanup__(func)))
-
 /* all clang versions usable with the kernel support KASAN ABI version 5 */
 #define KASAN_ABI_VERSION 5
 

-- 
2.54.0


