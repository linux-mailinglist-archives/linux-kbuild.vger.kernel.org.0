Return-Path: <linux-kbuild+bounces-12924-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC14Kst18WkChAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12924-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:06:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3A648E8BE
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BCE3313BBD9
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 03:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC82F38239A;
	Wed, 29 Apr 2026 03:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBYZjgxu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A935136D517;
	Wed, 29 Apr 2026 03:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777431647; cv=none; b=raT2GmN5YOCgNhaNMvShdWoFRA8UOT4nUHPJmtaFxX/2fkTDdi9R8Oot0+IGJ2MRsOlKFkPAlW1/lCrGxITfNRW/NSC0FvV7lqn7BuKAljUolOCOnhOtDniQSqpeTQj9v/b9m2stQCXeFnjE0ry0TeKKIc1GkDypFApxZAHZFX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777431647; c=relaxed/simple;
	bh=p29GNujMGgy4u9zyDlNqemqJP0uhDc8uvzvz9n4B3sk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mHgq6AAVNJNxe/LJHRBsNKyyyS3M6uvDMTFcIEKLEKfTxY8tyEVrEaGcgbBb0SF/JWn+sTnAsRvTAvVPXW8/04fwtIWpMIhReoe0iiU47Pn2ot8Q9ICqVkAHn43D6a/yT4UUitMzwxzvqcgjDg1kXyTfJlF+Ly+lBzQV+TAjxyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBYZjgxu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8AAC2BCC4;
	Wed, 29 Apr 2026 03:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777431647;
	bh=p29GNujMGgy4u9zyDlNqemqJP0uhDc8uvzvz9n4B3sk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KBYZjgxuRqomfmssP4fr9HYmPjfm9VxITY2IKRj/wH2EpuYoxQe5s6ign6y8l927E
	 16o3SGjUkEi13bLxLmlfL10CoEoL+Q6SUMOcnbmH2wrWW3uU7k+3rUsMFAEqc7cKlk
	 4gSV7ojNv9K76Yfr5tzHhbvRpeDcWeDQaPexeZ2UsYGtthmcqxNOrWwpDQmthEx7Cj
	 vVorY0O52Rc0jmS9PHUJxV37cMx5JGjAT7yskwg10mqXWXxfDnK736PCzRbiZIW+n1
	 jjiv6DNSxFQmhGNborV19HYRei/RYc0mcGTBURBAxNeIbLrB0yv9IN5FlhymEqiKUp
	 tf8q/jX2MxA1A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Apr 2026 22:59:20 -0400
Subject: [PATCH 14/14] kbuild: Remove check for broken scoping with clang <
 17 in CC_HAS_ASM_GOTO_OUTPUT
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-bump-minimum-supported-llvm-version-to-17-v1-14-81d9b2e8ee75@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1298; i=nathan@kernel.org;
 h=from:subject:message-id; bh=p29GNujMGgy4u9zyDlNqemqJP0uhDc8uvzvz9n4B3sk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkfS4xvaTKmGup2TnT0i2zeZZVt/W9FV0ye+rHXC3qSn
 NN2HYjrKGVhEONikBVTZKl+rHrc0HDOWcYbpybBzGFlAhnCwMUpABPZco7hn5bdux7uQhdjLh1j
 6wOp2n2HEyydn3lVJ8k18kSJH49kZWT4xaNm+E4uSG4i/03Gu4v28Chej4sO/VI6gVlhX+zSRh4
 uAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: 3E3A648E8BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12924-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:email]

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the check added to CC_HAS_ASM_GOTO_OUTPUT by
commit e2ffa15b9baa ("kbuild: Disable CC_HAS_ASM_GOTO_OUTPUT on clang <
17") can be removed, as the issue it detects is guaranteed to be fixed.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
---
 init/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 2937c4d308ae..6da6cf019d1a 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -118,10 +118,7 @@ config GCC_ASM_GOTO_OUTPUT_BROKEN
 config CC_HAS_ASM_GOTO_OUTPUT
 	def_bool y
 	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
-	# Detect basic support
 	depends on $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
-	# Detect clang (< v17) scoped label issues
-	depends on $(success,echo 'void b(void **);void* c(void);int f(void){{asm goto(""::::l0);return 0;l0:return 1;}void *x __attribute__((cleanup(b)))=c();{asm goto(""::::l1);return 2;l1:return 3;}}' | $(CC) -x c - -c -o /dev/null)
 
 config CC_HAS_ASM_GOTO_TIED_OUTPUT
 	depends on CC_HAS_ASM_GOTO_OUTPUT

-- 
2.54.0


