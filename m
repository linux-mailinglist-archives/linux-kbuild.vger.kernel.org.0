Return-Path: <linux-kbuild+bounces-12919-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM45GnR18WkChAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12919-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:05:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B593D48E8A0
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61A3C3118BA0
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 03:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3048D3502A9;
	Wed, 29 Apr 2026 03:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I6Bpjqv/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A1A142E83;
	Wed, 29 Apr 2026 03:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777431633; cv=none; b=LXvsw7K2pWqFqt6ShZnMB/eByk9bNN2eqYGKnZpsDJAE8/9+GJVlcOqr5YUG0ldTs2y+PO352gDtmI5492hhSMrYp9g1wEQdhCnKPsLdqNTnpOG4l1mynXmKZTGjtouIVw7JauPz1qHi/8Nil39Z6bqpElYHIz5Bu6NuWmVa8Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777431633; c=relaxed/simple;
	bh=VV8j8atRtBl0rZ3kwWWsXkUtQK3wCUXY33E84mExNh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p9KYfWt9x1Jf+ijTha/oJnF91MDAHOjdLHJHOrF4nz9eLYqSVB5OAmUiTqWHKG9PjHxY5GJcbKYjclgGVo0AhVj1eSe0J99XPoDqXpOPg65Oqokxw4KtzFv3tqHEyYpDD8+sLHNbnT8PLiBCGpD3NURr43lSgvFi+EXrnEzCLa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I6Bpjqv/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C241CC2BCB9;
	Wed, 29 Apr 2026 03:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777431633;
	bh=VV8j8atRtBl0rZ3kwWWsXkUtQK3wCUXY33E84mExNh8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I6Bpjqv/CMr0eXGa8489oMOv3kr9X/MIEvlyI9K+JmcMWsduhjpx1tS7soM7ROzI8
	 Wp/0C6VHNovkixNtXuRbzduB7ikQg5slVRo5uD8ZWsYFVOTqWU+bAmzZOe02CXkU45
	 neQVyQkGuVQK6dnMBeNDjunbUiyn9MS+hXj3OyppExmxGu4lFVaegr3FOTHwwyGmX9
	 lJLz3qwr9u+S62Z4beafFYX/iWHoCki0rVPB5DdcEecdtc/csHx5IJBrEgwj9/gTA/
	 ueM4uP2m/IARoCao+J/CPFwAfE3lnnEQ7OxElSGFGwfHj+C43fhO0XStUW7+vCGWrS
	 76Fb9Nhi6MALQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Apr 2026 22:59:15 -0400
Subject: [PATCH 09/14] riscv: Drop tautological condition from
 TOOLCHAIN_NEEDS_OLD_ISA_SPEC
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-bump-minimum-supported-llvm-version-to-17-v1-9-81d9b2e8ee75@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2365; i=nathan@kernel.org;
 h=from:subject:message-id; bh=VV8j8atRtBl0rZ3kwWWsXkUtQK3wCUXY33E84mExNh8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkfS4zWdFaGX5oTWcf2wo7NfNMJ/+dzW6Xv6G17qDdDj
 OkZ/y2hjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRh4kM/xNP6u6/JLvfuSjk
 PJec1x/bz7532lczlsza9GPFzIbexqcM/8t2z3reft1noq+P3OmQTvM64+8rNeJ/eK65r9m6Sfl
 iGz8A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: B593D48E8A0
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12919-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ghiti.fr:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,dabbelt.com:email,gnu.org:url,berkeley.edu:email]

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the Clang dependency part of
CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC is always false, so it can be
removed. Adjust the help text to remove mention of Clang < 17, as it is
irrelevant for the kernel after the minimum supported bump.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/Kconfig | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7ffbf6032b61..c742c42fd39b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -873,19 +873,18 @@ config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
 	  and Zifencei are supported in binutils from version 2.36 onwards.
 	  To make life easier, and avoid forcing toolchains that default to a
 	  newer ISA spec to version 2.2, relax the check to binutils >= 2.36.
-	  For clang < 17 or GCC < 11.3.0, for which this is not possible or need
-	  special treatment, this is dealt with in TOOLCHAIN_NEEDS_OLD_ISA_SPEC.
+	  For GCC < 11.3.0, for which this is not possible or need special
+	  treatment, this is dealt with in TOOLCHAIN_NEEDS_OLD_ISA_SPEC.
 
 config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 	def_bool y
 	depends on TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
-	# https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4498694e15bf8a16
 	# https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=d29f5d6ab513c52fd872f532c492e35ae9fd6671
-	depends on (CC_IS_CLANG && CLANG_VERSION < 170000) || (CC_IS_GCC && GCC_VERSION < 110300)
+	depends on CC_IS_GCC && GCC_VERSION < 110300
 	help
-	  Certain versions of clang and GCC do not support zicsr and zifencei via
-	  -march. This option causes an older ISA spec compatible with these older
-	  versions of clang and GCC to be passed to GAS, which has the same result
+	  Certain versions of GCC do not support zicsr and zifencei via -march.
+	  This option causes an older ISA spec compatible with these older
+	  versions of GCC to be passed to GAS, which has the same result
 	  as passing zicsr and zifencei to -march.
 
 config FPU

-- 
2.54.0


