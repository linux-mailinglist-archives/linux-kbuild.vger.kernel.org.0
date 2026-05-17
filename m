Return-Path: <linux-kbuild+bounces-13213-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJxwIOxJCmrFzAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13213-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:06:20 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6345643FB
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD66A302C146
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 23:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6963603D5;
	Sun, 17 May 2026 23:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyMEzv5J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274C13D47B8;
	Sun, 17 May 2026 23:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779059135; cv=none; b=VnltOIaiJeqz1+Sxtl2GsexEIAxY3Oq/ur9Sb7qgjcrqVF5WjBVwbML0FvWYHgLboUl0FeRsB7rvRlotymyDPPmeprjHvwdg5TAII07+3w9BvTdlMKn6pmGSfPUdtyqx9Kgxno4JBqSWUCCiBmZnayBx60f80iPIsQRPGFhvI5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779059135; c=relaxed/simple;
	bh=n5geXy75GzY0xfbQhH8lMaqrPIVTmkeJYtStfi4s3lA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=udvq5QUhWQSsiorKtVMdowAo2i3hTFYcRdVy3C9TjwHZHtIdsqgKGW5tBWghduSuRrWff4uZk682aOSoaqFijz57EaKAi6bShbH5BMW+hh6Ty1YYTvX4bs1UvrIDQaJVOAu9XLhl3bbfegVY2h4LPyhYD7JBygIhccTopPJU+Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyMEzv5J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEEBBC2BCF6;
	Sun, 17 May 2026 23:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059135;
	bh=n5geXy75GzY0xfbQhH8lMaqrPIVTmkeJYtStfi4s3lA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iyMEzv5JqHqllptCTqlK5+1NofSNS5FJtXJS2xprYPqZIXooVWvYLFU2nuJevIkmy
	 q/4sagjdZnPlz2AuLLu84/CyOoKRxO+F8tAC+9Olt5TWY8P8cAow74CeN1KowbRUi/
	 RefJes3nTa4J4/LZFT7r/0Qy01Ro99jME15VQr2qONJKSfCdQCqfrV/HhCapnWd1sd
	 dmmPcIPrMbkaV+6tqfUITtoS1MQ7WppbB3KT4DsCOEL2YPu/YVO7gYCt/PAEqVNAkY
	 DRxIp7o6C5uW9pOu+faCjMCdi8mhinvuTp1Jn0Rxii1cyD6lnYcBmlOBf7BRZbj03T
	 9FR9FUxgnSnSg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:05 -1000
Subject: [PATCH v2 02/16] security/Kconfig.hardening: Remove tautological
 condition from CC_HAS_ZERO_CALL_USED_REGS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-2-b3b8cda46bdd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=nathan@kernel.org;
 h=from:subject:message-id; bh=n5geXy75GzY0xfbQhH8lMaqrPIVTmkeJYtStfi4s3lA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnhvWfvSY8G3N6wAvX4tbs7YLBTUfXnBgNRfXuoNXl
 r4NeJmV1VHKwiDGxSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAmoiHB8E9rYl8wxya1bOvV
 +48ft1wfcL6J59XL+NQvX+8z7a2UFepkZDgVNtOto65q00mH1mz3guOGu1SOT7rPd/hZ2VWdlsM
 GS5kA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: 2C6345643FB
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
	TAGGED_FROM(0.00)[bounces-13213-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Action: no action

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the '!Clang || Clang > 15.0.6' dependency for
CONFIG_CC_HAS_ZERO_CALL_USED_REGS is always true, so it can be removed.

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


