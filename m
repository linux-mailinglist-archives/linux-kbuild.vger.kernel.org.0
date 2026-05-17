Return-Path: <linux-kbuild+bounces-13224-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIikOCNLCmrFzAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13224-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:11:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B2A56451D
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E03A6302AD26
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 23:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94213D6CD7;
	Sun, 17 May 2026 23:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2W8e7N2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856123D6CD4;
	Sun, 17 May 2026 23:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779059165; cv=none; b=n8+342lkMJEp/DZkbndLRXAwWjCEEdMip0QaW4CtTv7Wyoa0Mbd6d4O5y8S3Ik4S3PWxRFJVram8QaTMohfvf3u0ZwY7VZRZb1C94hhnMncSogi38RnW2skfLHn8uR73CYsFvJjxmCHsn/a0zo9R1Ot35gqXaxnMPtO32y/jpXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779059165; c=relaxed/simple;
	bh=fETClpKIq4SLaWWppFV0wCLK1a8ciNPumQoKZtCRRBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B7/1j/nMJT8p/qJX3K8hGg3VeJ8lKwXuWJVqvkm37PkI5F79H5j4Abmq0Qy5T/0PqBgaJHqQGvhaNDdCZ36Qda4CXCob3Njxsz3K2+jT4AhHy5vorSmEHQlFYP9pEFD5i/yJKS8N9l5TKoYfihN6fLz2A2pH7fiIqU09QzGzkr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2W8e7N2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1EEC2BCF5;
	Sun, 17 May 2026 23:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059165;
	bh=fETClpKIq4SLaWWppFV0wCLK1a8ciNPumQoKZtCRRBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d2W8e7N2kQwFVekEwC4naW8eT6yNhNg5JmaS5xbmZbeIJM2GEtojUHit0qepfTIIA
	 KKnS3wDhu5bGnUtzXQL1RnSsvfXqIG/ex0SupGqLSsHxXsaA33WNbTvpC6mYU8aGZR
	 8asVRlu/skBvI82f7VP1d1SR3y7IzZ60DrxQqLfa+3U459ZcObkKAknupwZkWcJB8e
	 7rajyFZDpyrxglSAiM/6XIIcLzDqL8r2Sm4RzLQL2N9r3I1AuxNeC7wqzNupwNAuz3
	 VYyWuJl+72fQi9byF1JAwlKIF6Wt8bfcqHEGHap61GQibrJtdKlVc0Hzp3yIe/3FlQ
	 DuQ9XdTd0jUpA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:16 -1000
Subject: [PATCH v2 13/16] x86/entry/vdso32: Remove conditional omission of
 '.cfi_offset eflags'
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-13-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, "H. Peter Anvin (Intel)" <hpa@zytor.com>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1527; i=nathan@kernel.org;
 h=from:subject:message-id; bh=fETClpKIq4SLaWWppFV0wCLK1a8ciNPumQoKZtCRRBU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnpsMIhxrXRYENnA/8mCVd7x0dN6l0ynlFdoNW958+
 /xc2se9o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExkkz4jw6pQ9gsz/Z+Everk
 MOWQDt1XluTbfELDsW0J98xtkafOqDD891gZf33H19N+32Jb9JK+3bjplbLM9WztgivrzVWj29d
 P4AQA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: 44B2A56451D
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
	TAGGED_FROM(0.00)[bounces-13224-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[alien8.de:email,zytor.com:email,infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Action: no action

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the inclusion condition added by

  3e30278e0c71 ("x86/entry/vdso32: Omit '.cfi_offset eflags' for LLVM < 16")

will always be true. Revert the change to clean up the source code.

Acked-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org
---
 arch/x86/entry/vdso/vdso32/sigreturn.S | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso32/sigreturn.S b/arch/x86/entry/vdso/vdso32/sigreturn.S
index b33fcc501ba3..328bd3a4ef51 100644
--- a/arch/x86/entry/vdso/vdso32/sigreturn.S
+++ b/arch/x86/entry/vdso/vdso32/sigreturn.S
@@ -22,17 +22,7 @@
 	CFI_OFFSET	cs,     IA32_SIGCONTEXT_cs
 	CFI_OFFSET	ss,     IA32_SIGCONTEXT_ss
 	CFI_OFFSET	ds,     IA32_SIGCONTEXT_ds
-/*
- * .cfi_offset eflags requires LLVM 16 or newer:
- *
- *   https://github.com/llvm/llvm-project/commit/67bd3c58c0c7389e39c5a2f4d3b1a30459ccf5b7
- *
- * Check for 16.0.1 to ensure the support is present, as 16.0.0 may be a
- * prerelease version.
- */
-#if defined(CONFIG_AS_IS_GNU) || (defined(CONFIG_AS_IS_LLVM) && CONFIG_AS_VERSION >= 160001)
 	CFI_OFFSET	eflags, IA32_SIGCONTEXT_flags
-#endif
 .endm
 
 /*

-- 
2.54.0


