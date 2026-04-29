Return-Path: <linux-kbuild+bounces-12916-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBRYH/B08WkChAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12916-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:03:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC75D48E844
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B6CC30E33D0
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 03:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7F735B62C;
	Wed, 29 Apr 2026 03:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnFSowYs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98402DC32A;
	Wed, 29 Apr 2026 03:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777431624; cv=none; b=OQapHTMOfG/gMX4A47VHlkpKrFFWuVx8Wb5YrJeJgt6QyVIYZg6Z2qNHEx7IRTfsABpCQ1IGTbjmDaATgaTPIRx6lo7hwf+/IOA2pnQGSsEnzslQ6TPhzLKZ2HV0xEM23/r5NC3ygYV2i1sJLU4+K174EiBnzrLJO2RMJY9I7RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777431624; c=relaxed/simple;
	bh=sb0ZYq7FWD3z/UEfy/uIN57tuCsIQ9vcgZaPll8E9AI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AUDtV8fb6DsMdQGEXKuJPBdjQ6LnyHATS0lW9itLo+PIYNUBTOx/Y2qsXQumwKrQlOYfh0XYvefpDON/OVkKaSzbirAMvyR+8dTTRpGOM7hpNzMJJQUb1pjVzhravZbB3a2JpJVyCeuuEWQnwUZu+0t9nDsSEIN55KRqgAyqn+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnFSowYs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A38C2BCB9;
	Wed, 29 Apr 2026 03:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777431624;
	bh=sb0ZYq7FWD3z/UEfy/uIN57tuCsIQ9vcgZaPll8E9AI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LnFSowYsu9SlIh/kGf/jQQATUQsTGWkpm3hst9Ybz62FyVPU3lRoCB8ZZwCzRIQAJ
	 SUNgcfHeAAbMY9W5lX7pgCJ0Dzs2otPd/NsUYxu99pY5jIuphEEjiUeV4rUQPb9hqQ
	 eORjQHdACBoG0Eu6d2Z/SkcPqeqzxiCdEksZtLCFM/EM2kxzYdkJ2BrqBT0bo1IUlD
	 NSsJVldE9Wt1KNg1/xFz4B+E/jY0wcavgKIkxrbqlSGLdl8LsY8rbenZFYpbV/o42u
	 BK4uxB3BPNWBrkgODCtizd8UJEof6BTH2XxCCuwmVR6MFUNQ9zFk+nta6vh82l/cXI
	 xuPXVr+TLArUA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Apr 2026 22:59:12 -0400
Subject: [PATCH 06/14] arch/Kconfig: Remove tautological condition from
 AUTOFDO_CLANG
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-bump-minimum-supported-llvm-version-to-17-v1-6-81d9b2e8ee75@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Rong Xu <xur@google.com>, 
 Han Shen <shenhan@google.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=898; i=nathan@kernel.org;
 h=from:subject:message-id; bh=sb0ZYq7FWD3z/UEfy/uIN57tuCsIQ9vcgZaPll8E9AI=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkfS4zCk6YkWJwqkk+O2vZKdRljTINWyrnO9WfTzxdee
 7pW/z9rRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjItAmMDN1/LpZvuikQm5XB
 Fn7Uempo21XFKu60ug3/jx9/8PXYzgBGhofM+1ZJZFi5yOiFVC8PTfbra1olPiNG5+YjiZZ9Jq/
 /cwEA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: EC75D48E844
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
	TAGGED_FROM(0.00)[bounces-12916-lists,linux-kbuild=lfdr.de];
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

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the clang version check in
CONFIG_AUTOFDO_CLANG can be removed because it is always true.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Rong Xu <xur@google.com>
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


