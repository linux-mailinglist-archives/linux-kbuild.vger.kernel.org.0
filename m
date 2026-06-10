Return-Path: <linux-kbuild+bounces-13700-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NS7rHAXCKWpicwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13700-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 21:59:01 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 578F766CA56
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 21:59:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MnJbwc0I;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13700-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13700-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25C2C301C198
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 19:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AF4379C3F;
	Wed, 10 Jun 2026 19:55:54 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A523749FE;
	Wed, 10 Jun 2026 19:55:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121354; cv=none; b=Vl2YUb+tkllEphARnr/mTUmkxSt5bkte+weyXR4F51GTupBHRMRD3QPOYVA2INUI+618MJ7ebkTXhNyJbjS4R9tpqgHIRIaqvf6mMa6o+FWmNlMHRnEhlOxMqp6ZQRjgasGm+2w/Lwu8+hN17R4fRUZ9jivHD568PGm7d1Xn95s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121354; c=relaxed/simple;
	bh=7yCRnBdSoBx0d1yeDH0mLW91nVbKFmCjBssiBqG6qhA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G1LxvH9I4YGmuS1VZ9xEZrnF+jG1frX18fZmf/moemyJKlqR8woQwsFWEn4vCvxAmtBJ2AS9UPvPTxkyVOuS8pu2cTMOVuO7YFH6awkIhaMaHLlift02Iawg4L7/sYAU5YilQj06EjHi6ONMcCCNtuK4vTTRSYgl2bXKbkcezxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnJbwc0I; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51CE1F00893;
	Wed, 10 Jun 2026 19:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781121353;
	bh=rfNmIKeDfuYBvW4Bocig2oTJSa1GAXNgA7P0PHQmb0E=;
	h=From:Date:Subject:To:Cc;
	b=MnJbwc0IYgI6UXEzLc8FlU/oS3uyel21t8Bx4W4MI5JXpupRdKM/uE44/OXkoJnPq
	 dN24Vm1OhxFac6X+0NNSU65ODzGK+DCiMqYaskGM7YBnGFfPBZQPT55Ri5roF0gMqt
	 6D5umH1uHLJiMLyXKHJ0pIx1uXsNsBZYOPoP0NBsJCLaY+0ycdRweBPpYz/7d0xcq5
	 T6BJCsA39sv+vXpQyLPzaUNqxhRBy3TPTiSIAbIwoGi8jYk4vcNH8lvzcpUCtGNm/F
	 01UBEjob8zQ9p1HGV5wCYmWib1T3Cf/eFudOkjRI8n4hZe/nnbyfh4/IEM35QaPU8V
	 URbXs7hhfr6Mg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 10 Jun 2026 12:55:25 -0700
Subject: [PATCH] kbuild: Use ld.lld for linking host programs when LLVM is
 set
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-kbuild-use-lld-for-linking-hostprogs-v1-1-70396fe42ee3@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQqDMBCF4avIrDsQLVHpVUoXJk7i1JBIxpSCe
 Pem7erxbf53gFBmErg1B2R6sXCKFe2lAbtM0RPyXA2d6nrVtwpXUzjMWIQw1HUpY+C4cvS4JNm
 3nLygsu6qx3HQ2gxQU1smx+/fzf3xtxTzJLt/23CeH96W/UWIAAAA
X-Change-ID: 20260610-kbuild-use-lld-for-linking-hostprogs-0cf3588755b7
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728; i=nathan@kernel.org;
 h=from:subject:message-id; bh=7yCRnBdSoBx0d1yeDH0mLW91nVbKFmCjBssiBqG6qhA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmaB91PPo7yW3zwuOnrc5PNjX5c75Dwr66ZusSrqOXZ7
 BRH7yS/jlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjAR8WMM//R/9i3Zbb7qwapn
 99a71h3Mnm216UVdZ/bR7zGCoVOCNV4yMszdW+PsWpIpozCVU7f4i0NM30JJB/PK517LGNNmVO5
 4ywEA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13700-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[google.com,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:morbo@google.com,m:justinstitt@google.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:nick.desaulniers+lkml@gmail.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 578F766CA56

Currently, host programs are linked with HOSTCC using the toolchain's
default linker. This can result in confusing behavior when using the
LLVM Kbuild variable (which states that the user would like to build
with the LLVM toolchain instead of the GNU one), as clang's default
linker is ld for most platforms, not ld.lld. The documentation mentions
HOSTLD=ld.lld is set but this variable is not used by Kbuild proper,
only within some tools/ projects. Kbuild provides the HOSTLDFLAGS
variable, which allow users to provide the '-fuse-ld' or '--ld-path'
flags to customize what linker is used, but this is not super obvious to
folks not familiar with Kbuild.

If the user has not customized the linker already using one of these
flags, default to ld.lld when using the LLVM variable, which is more in
line with user expectations when using that variable.

Closes: https://github.com/ClangBuiltLinux/linux/issues/2167
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 37fdb454b637..ae263f964e82 100644
--- a/Makefile
+++ b/Makefile
@@ -525,6 +525,9 @@ OBJCOPY		= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
 OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
 READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
 STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
+ifeq ($(filter -fuse-ld=% --ld-path=%,$(KBUILD_HOSTLDFLAGS)),)
+KBUILD_HOSTLDFLAGS += -fuse-ld=lld
+endif
 else
 CC		= $(CROSS_COMPILE)gcc
 LD		= $(CROSS_COMPILE)ld

---
base-commit: 1a1e62a5a48494cdf33e3bfb82fb8f408da7c4cc
change-id: 20260610-kbuild-use-lld-for-linking-hostprogs-0cf3588755b7

Best regards,
--  
Cheers,
Nathan


