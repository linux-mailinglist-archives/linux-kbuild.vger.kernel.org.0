Return-Path: <linux-kbuild+bounces-13227-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPfJN1JKCmrFzAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13227-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:08:02 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E995F56449F
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E5743008477
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 23:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F813D811B;
	Sun, 17 May 2026 23:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7oPw7yy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C167A3D6CC1;
	Sun, 17 May 2026 23:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779059171; cv=none; b=fYui30KDsUFx/HHfuZyn1ULnlhLfRQnuSAqyLkjDtXyzKKC/AvDGa+5zk+6fHqrIcrS7+iPTjKkRMY4p+zCUibxOBBpCZyr77lGfnCW7tspv7ZJWtcIz5G7A6Lp8Hf9XpKKlTRiNCoP9VfKgEGt2aoXF8kdsAdTZucmRmkIN5Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779059171; c=relaxed/simple;
	bh=8TLf3OqmauIWGgySari6qXrOUY+wLBpwaDDWcC12HMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HXLwoPL6yZXTJdWMsa11D55mPsnhvFTP1FWX+0GkyHabopvkzPNfvv+prbhAkGfwaB2KCO5V6TuaDr/2VsaAPWFsqKRKByPkU9kV4HO1i6K+4fZ0Zex4uBEyLfmr56Vg1OA8by1q+r4r8t/BZzoyqn+trdPDiuLMq8URgP29poU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7oPw7yy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F36CC2BCB3;
	Sun, 17 May 2026 23:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059171;
	bh=8TLf3OqmauIWGgySari6qXrOUY+wLBpwaDDWcC12HMQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V7oPw7yyz0m6Kv8y+l2sIB/KWkWzddf1MgF0ail340pj+SDMge4IcS+n5DIT9hC4p
	 29gwIT8KsrqOnAP/7pSir+neXjmscPyUc2m0xjm4eCr47+mXcLLg+800b4bORE2nU1
	 gD0KD8X+Qi3YVU7hRYOmvr9/abKbXAXyZH7OazU/78oViGE5ae3t+SLw1slaf0/hX+
	 tf1AKutvMgh/maDkXoO5NgVg7XUC0Wonue+7qISLoQNoDjSvawiQxk5QMAV1rQDlsX
	 WjOpcXspvdJWVz5qvTyEkFOi76Hv+ySVkvhNGk4bJBLjy0CEJCEi5qKIFvhmyie2H7
	 YFEO8tDvBoQpw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:19 -1000
Subject: [PATCH v2 16/16] compiler-clang.h: Drop explicit version number
 from "all" diagnostic macro
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-16-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=886; i=nathan@kernel.org;
 h=from:subject:message-id; bh=8TLf3OqmauIWGgySari6qXrOUY+wLBpwaDDWcC12HMQ=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnpuPLd16e/szqfvPPQUaQkrzH1QECV6dsaHji86bc
 w2cFeXMHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAi8u6MDOdOf6/UCi/6v/a5
 odbj4Jf/Vy6468eou8rI7ImOTK+mXAojw7XPv6QVd5f8bZFs0TNbIuxdfEWsnYdPzM543sGqB0x
 i3AA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: E995F56449F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13227-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This is more consistent with what commit 7efa84b5cdd6 ("compiler-gcc.h:
Introduce __diag_GCC_all") did for GCC.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 include/linux/compiler-clang.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
index eadf48b7b5b1..a105e2e8016c 100644
--- a/include/linux/compiler-clang.h
+++ b/include/linux/compiler-clang.h
@@ -122,10 +122,10 @@
 #define __diag_str(s)		__diag_str1(s)
 #define __diag(s)		_Pragma(__diag_str(clang diagnostic s))
 
-#define __diag_clang_13(s)	__diag(s)
+#define __diag_clang_all(s)	__diag(s)
 
 #define __diag_ignore_all(option, comment) \
-	__diag_clang(13, ignore, option)
+	__diag_clang(all, ignore, option)
 
 /*
  * clang has horrible behavior with "g" or "rm" constraints for asm

-- 
2.54.0


