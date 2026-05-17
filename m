Return-Path: <linux-kbuild+bounces-13222-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNcGKOpKCmrFzAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13222-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:10:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA795644FF
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B599305B2BB
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 23:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B423E3D667E;
	Sun, 17 May 2026 23:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIGD+qcQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA913D565D;
	Sun, 17 May 2026 23:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779059158; cv=none; b=YRdgh6Wl6NWOnywbRN7/4lgNMF8xNIzYOju2Tc56JUIr4rhOrMW+jgsKruIxgr9jP3AGWTEalKIi5DvXaiRoNf7XISuO0BuEYmTp3N68yTdheG1LP5M7NjqU5NwiAnwvK3NEQb4PyAYhyAivviFupfxarOMZqNH0ayHJFXVZUeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779059158; c=relaxed/simple;
	bh=hvjZPNT+5a0UKRa8dDdsLzMe5ziU1OJl2oO7umb3pLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t3fcbh5h5ObveEqhSuWiSJZsVEevObGA5/1wUevgEzNWxpdYsvw7UZt/Hx/dX5tn81PUk4qC/v4rnBeH1BvvMRzWE02MYBxJ5rjS/+2Gb9eqLxed/BFq5cgWtxn72tZCZpIPpFJa5hgCDAp5DFRYJSf+9cHbsCChN1rfCCCu1vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZIGD+qcQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE6DC2BCF6;
	Sun, 17 May 2026 23:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059158;
	bh=hvjZPNT+5a0UKRa8dDdsLzMe5ziU1OJl2oO7umb3pLk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZIGD+qcQxnI+azTs8uss7xym6pDF3JfNhkygt2RmLnscUEkZEA9Q145aa3Ajoc8If
	 bxztGJ1oIsJ/q8OFccp7mJ9kSegW5vnIbe2kn+FN2Zt86IlIxJyevpWV6IJkQ54hUn
	 VtHjKuAOL03jCV8KQeLjAro+n7X2a6fz8N2UDxa55O/8BRSAXyVYUPs6yIMOu5zR0a
	 8O+3CaaakhnVTCh2PqMGKEJVrvaPFc6UtjOPSQM0zslP/B0Qp9+ZgAjMdFQmz72Pas
	 DTBINrdw506HSq0aubCnVIkBm3YdhPtkLrakGeGybRXH1xixjYY523tBEHiLvXDUIP
	 5Jm0xr3HI/p/A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:14 -1000
Subject: [PATCH v2 11/16] x86/build: Drop unnecessary '-ffreestanding'
 addition to KBUILD_CFLAGS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-11-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1604; i=nathan@kernel.org;
 h=from:subject:message-id; bh=hvjZPNT+5a0UKRa8dDdsLzMe5ziU1OJl2oO7umb3pLk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnpumzIgwZI+I3VS1S+p/2XcuC9OZP/u39s+PCUs9y
 hMpnva9o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEwki5Hhr2ilZOcjzncLy6cL
 /f6tY6z7bJuH8BXh+1dWP73mnCP2rpXhn3LXvaL1V1cLfWVTNuZ0/+ehIfnic6RPT3lsrcdSQz5
 vXgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: 0BA795644FF
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
	TAGGED_FROM(0.00)[bounces-13222-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zytor.com:email,alien8.de:email,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the addition of '-ffreestanding' to
KBUILD_CFLAGS for 32-bit x86 is unnecessary, as the linked LLVM bug is
resolved in all supported LLVM versions.

  16cb16e0d285 ("x86/build: Remove -ffreestanding on i386 with GCC")

intended to make the addition of '-ffreestanding' clang only but due to
a bug in the adjusted check from

  d70da12453ac ("hardening: Enable i386 FORTIFY_SOURCE on Clang 16+")

it has been applied for all versions of GCC and clang < 16.0.0. There
are no known problems with removing this for GCC but if one surfaces, it
can be restored under a CONFIG_CC_IS_GCC block.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <kees@kernel.org>
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


