Return-Path: <linux-kbuild+bounces-12918-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHAtDkV18WkChAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12918-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:04:37 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EA448E881
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8A3631050DE
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 03:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25C333F59E;
	Wed, 29 Apr 2026 03:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsxnAek+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3AD175A7E;
	Wed, 29 Apr 2026 03:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777431630; cv=none; b=cn1z1gLQBHDF9WDqlrpwzeLwUYiD965Z69OeX2mpetgOexN7U9HjuT+Quj/GKzc25oFFMbN/HXSiPHe9negajZF5sC6R218PGUO9PQJZMTBdsJ4kzUhmf8s0LVrHsGYn+45Z862Htf6GG/BPbFYVfwkra8Din7YFHpwQOsvzBVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777431630; c=relaxed/simple;
	bh=vzaqTQhYZh+xvOuS+0eBnjbB2FREkk6iH/xqM4TGa0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gNwhtneuG2kqOQhYRfpnhUpMCD5hCrrrRgiqxejQQ7fmLRNIE9H+5zXUHmqjnTrD+h/O3fPTz3y+XlHc6yDrkHjDtNtlwQwzhRXr+kOIV3ZCmjb1Xi1FTLt3yUKIVoESy60Olaj1Xz6jpo9ScAQKagE9pS0sKVdCviMrkNTUK4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsxnAek+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB5CC2BCC4;
	Wed, 29 Apr 2026 03:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777431630;
	bh=vzaqTQhYZh+xvOuS+0eBnjbB2FREkk6iH/xqM4TGa0k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bsxnAek+AMbwi0N65LCy7M6WCqVTp1H47KxteLyooGCKrEkUx3kxhCRSYDmr+H1qG
	 lLBpl2juOFBqZJS0NZ2SwELArbPj3YkPUJkrGxH4vcJGW5WDgzP5Zns/cJ8sEnvkdn
	 cbgn7yyJ2+xp3ZLZqUVao6oWs/N69grhMAkzvWDgexR2rjl+5Kz0gja0+P9nR6dirt
	 Uonjfe6KaXmG0EBy9T85kbVicJ0FsVMrkpmZyIq+93cyWzYAUSPe6QtkplGvGsYqJo
	 yQ7qwMVoJona2c0H8COiE9EN+8KdErI6sVgueZT0FePYdhv9h6Z0eNSimnSoaDOyCg
	 8UnzEsM/F7V8A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Apr 2026 22:59:14 -0400
Subject: [PATCH 08/14] riscv: Remove tautological condition from selection
 of ARCH_SUPPORTS_CFI
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-bump-minimum-supported-llvm-version-to-17-v1-8-81d9b2e8ee75@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253; i=nathan@kernel.org;
 h=from:subject:message-id; bh=vzaqTQhYZh+xvOuS+0eBnjbB2FREkk6iH/xqM4TGa0k=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkfS4xceOsWfnF6scCyy4z3QLXIStO0d89vnI1/9El25
 qZ6nxP+HaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiD9oYGZawJs126fvEfMFA
 bFfAz1IV/qMhjzfoXV77kyfpqfKOq9wMf+Wlb3vK6r+VmnfI4FX82ccPLVOcP24tPX+1+6kDb83
 WbhYA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: D6EA448E881
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
	TAGGED_FROM(0.00)[bounces-12918-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[berkeley.edu:query timed out];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,dabbelt.com:email]

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the condition of the selection of
CONFIG_ARCH_SUPPORTS_CFI is always true, so it can be removed.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: Kees Cook <kees@kernel.org>
Cc: linux-riscv@lists.infradead.org
Cc: linux-hardening@vger.kernel.org
---
 arch/riscv/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d235396c4514..7ffbf6032b61 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -61,8 +61,7 @@ config RISCV
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
-	# clang >= 17: https://github.com/llvm/llvm-project/commit/62fa708ceb027713b386c7e0efda994f8bdc27e2
-	select ARCH_SUPPORTS_CFI if (!CC_IS_CLANG || CLANG_VERSION >= 170000)
+	select ARCH_SUPPORTS_CFI
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
 	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_HUGETLBFS if MMU

-- 
2.54.0


