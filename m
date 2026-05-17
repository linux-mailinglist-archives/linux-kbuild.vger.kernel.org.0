Return-Path: <linux-kbuild+bounces-13219-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMdbNKFKCmrFzAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13219-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:09:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B9B5644E9
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7970304E313
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 23:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A511A34107F;
	Sun, 17 May 2026 23:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vclbl3IT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817EC1E511;
	Sun, 17 May 2026 23:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779059150; cv=none; b=q9hWuzEJl8uB6H4GYq3RAq0RUx5fhjQ78EcPosUiLM37gjo1V87CRHf0UbASQz1CcN/ZjUurr1LLi3JzEcU4mRK+kCh7xvNavYc3P/eTci9mc9KRsodH3rzJNISEeVlKeoHz6cgDycSBG4xDow4ct7WcgeoYgE/nUXz7BuIrYeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779059150; c=relaxed/simple;
	bh=xt/hUeyba8w0CmJ8CXSb6hKOQbJSb9j0i1jLwFA91wA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JDUM+O8qziu8XUrixfna0drInSzrGaL3z679Y/whLfAzLE4vKuKqllMbsDQP1/aD6XwFwEdYbdXO/XIXrZMVlfRiae2GvoXG9wvk9Usvqg2M0HYQEHKHyhQran29CXZHrWSVgOTWcm7IwKsE3eUOQBls4PSGgWu9THX7eoh+lNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vclbl3IT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFE0C4AF0C;
	Sun, 17 May 2026 23:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059150;
	bh=xt/hUeyba8w0CmJ8CXSb6hKOQbJSb9j0i1jLwFA91wA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Vclbl3IT3wOblDXpomJab09F4LGnGTE3N74msN0m5v9afiVupdkx4tqBQ+aiGAjIv
	 8hxa/Jkchw+b0Te4x2YL1UsgEL8AyPw95deGcTryQWgICAt8KkNJmMT1UNbBKI7hSt
	 6/4CFyBT6tEFx6XMMawyQ0KYhBDwDSWmNgsC7//MFLMS376T6Y4/a2CKYjDqkVf9RX
	 0kPH8aR1jpItqqdH1vuPcVpr5swJ4GLs76BOqABYr/DFVRU9wA+rQW7ctJ6r54Fxzn
	 3Vm7+HD8/XdRdTMQj+dMR+jxcrTjfVlKw/BXASFKtCZhKCOFyaJR4BqaBe/WRCgE5z
	 /G0Nn4zKnvXyA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:11 -1000
Subject: [PATCH v2 08/16] riscv: Remove tautological condition from
 selection of ARCH_SUPPORTS_CFI
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-8-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272; i=nathan@kernel.org;
 h=from:subject:message-id; bh=xt/hUeyba8w0CmJ8CXSb6hKOQbJSb9j0i1jLwFA91wA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnhvVNZVOtHdfSCnRfhXW+EfikE6T7KH03J7cfrlnh
 VPKJLM6SlkYxLgYZMUUWaofqx43NJxzlvHGqUkwc1iZQIYwcHEKwET2qjIydLmylcT56KWrH82X
 zt31nZ358DXzJsfWrl3HFsgX/GJWYPhf1ueTY8JgeXmr3kSmuhbeF/NXKkzZJb3b000hWcZ67R4
 +AA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: 46B9B5644E9
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
	TAGGED_FROM(0.00)[bounces-13219-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,dabbelt.com:email,ghiti.fr:email,berkeley.edu:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the condition of the selection of
CONFIG_ARCH_SUPPORTS_CFI is always true, so it can be removed.

Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
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


