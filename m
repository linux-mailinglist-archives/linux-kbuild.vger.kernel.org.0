Return-Path: <linux-kbuild+bounces-13223-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KyEFwNLCmrFzAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13223-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:10:59 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D097C564507
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8610306169B
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 23:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC1633859C;
	Sun, 17 May 2026 23:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YF2HwLEZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6AF1F3B85;
	Sun, 17 May 2026 23:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779059162; cv=none; b=TvVknwMfFUknSiPvICn2s6QLwV5jXmTSQY0QEmxlRdQFqc9NU6mqgRaXvEPIg7FzcMMfpE15oHGuvAjMbKke4aWPjsiRJkUtC6uvoPWGQPQWD50XVcwpPmn20PjjV3+NKzkaqIKSgCWUpuLQZzpjRiRo0n2FyKGsb5HNzqitcy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779059162; c=relaxed/simple;
	bh=qaPe+n1570ptkZy6Z7TErnkN2YpYM3CP2ZLschhWI9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OeurFUjQQoDTehsbZanad+04fUGwOhIQK+MB2xafafKFj5M09mSv8liaMg+bZrTPTgArdaE3hH6GOLItnMRnGDGyzI6cnGEIxvbn1RKyJxF+QNLMEXnb0B5DCZFq+PDdJPAUuH71tHokZhNXVrHz74inYWtHSOaA+qjCiUDqED4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YF2HwLEZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED65C2BCF6;
	Sun, 17 May 2026 23:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059161;
	bh=qaPe+n1570ptkZy6Z7TErnkN2YpYM3CP2ZLschhWI9E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YF2HwLEZTfGphgqokCSzNJr5NsdnnWCOG2hfd0VMJt+//JSwHCg8DLLPhDTgpVTsl
	 VCC41ISJhPBTy/9Ma0nxDjul9ui5n+CTWxn1zLpmrHXN2qjRNE6mn8eU8z+7RB1bFE
	 WG8xArTamV1m80wLvMaWFHJ9y3m89p3RNStKwxWomQxmgFKHU5qsKxjTTeMeO9vPc6
	 nufzWhY+s89eTxVFBgkReq+76AOhEu4LXXOusGlYF7f8mkvJ1cRbujBXRBuw32MEXH
	 e5oj/1CTw+eH6Y+DUMKjUrQFYGWrYRpTMVmq4vXQY9w4puU26RZXZLXun7VpIlHqvT
	 LgvopnJECJFAA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:15 -1000
Subject: [PATCH v2 12/16] x86/module: Revert "Deal with GOT based stack
 cookie load on Clang < 17"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-12-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2697; i=nathan@kernel.org;
 h=from:subject:message-id; bh=qaPe+n1570ptkZy6Z7TErnkN2YpYM3CP2ZLschhWI9E=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnptKbXfNas6/3aU77Wjlr2vpATfydxSr1L/X2vj1w
 oT+6QvKO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEfgUyMhy8WpuZUMB8127G
 SoNNqS2lmgll264eMV77MlSWpfTx/IsM/11Xz48MmdDvK3O1L9jTqNql3Pmf4cTWJX6/siWcb/Y
 2sAMA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: D097C564507
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
	TAGGED_FROM(0.00)[bounces-13223-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[alien8.de:email,zytor.com:email,infradead.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Action: no action

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the workaround added by

  78c4374ef8b8 ("x86/module: Deal with GOT based stack cookie load on Clang < 17")

will never be included, as the final clause in the preprocessor
conditional is always false. Revert the change to clean up the dead
code.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org
Cc: H. Peter Anvin <hpa@zytor.com>
---
 arch/x86/include/asm/elf.h |  5 ++---
 arch/x86/kernel/module.c   | 15 ---------------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/x86/include/asm/elf.h b/arch/x86/include/asm/elf.h
index c7f98977663c..0de9df759c99 100644
--- a/arch/x86/include/asm/elf.h
+++ b/arch/x86/include/asm/elf.h
@@ -54,9 +54,8 @@ typedef struct user_i387_struct elf_fpregset_t;
 #define R_X86_64_GLOB_DAT	6	/* Create GOT entry */
 #define R_X86_64_JUMP_SLOT	7	/* Create PLT entry */
 #define R_X86_64_RELATIVE	8	/* Adjust by program base */
-#define R_X86_64_GOTPCREL	9	/* 32 bit signed pc relative offset to GOT */
-#define R_X86_64_GOTPCRELX	41
-#define R_X86_64_REX_GOTPCRELX	42
+#define R_X86_64_GOTPCREL	9	/* 32 bit signed pc relative
+					   offset to GOT */
 #define R_X86_64_32		10	/* Direct 32 bit zero extended */
 #define R_X86_64_32S		11	/* Direct 32 bit sign extended */
 #define R_X86_64_16		12	/* Direct 16 bit zero extended */
diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index 11c45ce42694..b5b4de4f08e6 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -19,7 +19,6 @@
 #include <linux/jump_label.h>
 #include <linux/random.h>
 #include <linux/memory.h>
-#include <linux/stackprotector.h>
 
 #include <asm/text-patching.h>
 #include <asm/page.h>
@@ -132,20 +131,6 @@ static int __write_relocate_add(Elf64_Shdr *sechdrs,
 				goto overflow;
 			size = 4;
 			break;
-#if defined(CONFIG_STACKPROTECTOR) && \
-    defined(CONFIG_CC_IS_CLANG) && CONFIG_CLANG_VERSION < 170000
-		case R_X86_64_REX_GOTPCRELX: {
-			static unsigned long __percpu *const addr = &__stack_chk_guard;
-
-			if (sym->st_value != (u64)addr) {
-				pr_err("%s: Unsupported GOTPCREL relocation\n", me->name);
-				return -ENOEXEC;
-			}
-
-			val = (u64)&addr + rel[i].r_addend;
-			fallthrough;
-		}
-#endif
 		case R_X86_64_PC32:
 		case R_X86_64_PLT32:
 			val -= (u64)loc;

-- 
2.54.0


