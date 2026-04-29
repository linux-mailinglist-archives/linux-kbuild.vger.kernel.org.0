Return-Path: <linux-kbuild+bounces-12921-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLOCJ7B18WkChAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12921-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:06:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A87D48E8B6
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91456312C967
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 03:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A387836DA13;
	Wed, 29 Apr 2026 03:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L316QQR6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6FF35C185;
	Wed, 29 Apr 2026 03:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777431638; cv=none; b=MO6oMNpqPMS5Lzi/AejJ84iezWVhsnPHsrHB3kXs71vCrdhl3lBVkNeUxuFtHpChA/tMFRtdFB6UnYSJXazrEdPpKGtfz9iMgUGM709LHAEXzlqrQmdF1g2mqeHYzKS9XzlKO/T5lU9FhgTmDXAgHk17abgkaZOH7p08GUPXt/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777431638; c=relaxed/simple;
	bh=n/MbJYWiGew4ocTzX5ZLLlt6hjO+FEPD5hl7/uoM04g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pS8C13tgU1yeGBaEMLAkIs5pHIs5eI1psPuz6qRIMiDJG/2v2QimREnCIhqKDRson2tmmaCh0OdtXT1BMgpg/dUMQNSpDAAY41XReYa0KYETm8aPO9TxZ75ZAJrfBvifiz2Di0elB1kTlvQCln0W/z1volhNsOi/4C50gFShsfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L316QQR6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93FCEC2BCF4;
	Wed, 29 Apr 2026 03:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777431638;
	bh=n/MbJYWiGew4ocTzX5ZLLlt6hjO+FEPD5hl7/uoM04g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L316QQR6uISAm50eY3ZdZr3b5Mtdyx500Rp/bwF93Af8QgYggRPXEZQXrUoroaFwT
	 Cx+XQJbWt131CeZAvhD7SowN+ujnx2w2Bm3jJxqBJ2MI+xdbSJVHH0Heu0s6OSZNM5
	 RNBjt+oQfHFKA6E/BVniS8cDOQZImsUbIKAQAJ6fbwVcM85k+V6hVbg1vyK9RVx2SM
	 VDOff+6gjvnYHk3G2Sj0lcS4/9PTRXctiskL/ZqA266WaiASouXcqk1g2I3VH4OagA
	 K0Py6ISEpPcfMpfyUFsIivNAv5spdEQAA9FYK/Ktl35pRSHC9AiPpEZ6KqgJ9zotsc
	 ZqeC+wlOqeRhg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Apr 2026 22:59:17 -0400
Subject: [PATCH 11/14] x86/build: Drop unused '-ffreestanding' addition to
 KBUILD_CFLAGS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-bump-minimum-supported-llvm-version-to-17-v1-11-81d9b2e8ee75@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092; i=nathan@kernel.org;
 h=from:subject:message-id; bh=n/MbJYWiGew4ocTzX5ZLLlt6hjO+FEPD5hl7/uoM04g=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkfS4zTXrFUsG46cEA3Mkr69g6/ZVPvvmjNCuzttqyeb
 bdId8/JjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRb98Y/ofziYspxuXOttmZ
 Hxz4nCfMZKfn9nXXnpXaJFqz29tds2b4p7o8/v7rT2JZXx7wzgrdoKh445ih9Wzbb4nX6nk38eT
 e5gEA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: 2A87D48E8B6
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-12921-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[alien8.de:email,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,zytor.com:email]

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the condition to add '-ffreestanding' to
KBUILD_CFLAGS for 32-bit x86 is always false, so the if block can be
removed.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: H. Peter Anvin <hpa@zytor.com>
---
 arch/x86/Makefile | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 46fec0b08487..5720f2470cfc 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -124,11 +124,6 @@ ifeq ($(CONFIG_X86_32),y)
         include $(srctree)/arch/x86/Makefile_32.cpu
         KBUILD_CFLAGS += $(cflags-y)
 
-    ifneq ($(call clang-min-version, 160000),y)
-        # https://github.com/llvm/llvm-project/issues/53645
-        KBUILD_CFLAGS += -ffreestanding
-    endif
-
         percpu_seg := fs
 else
         BITS := 64

-- 
2.54.0


