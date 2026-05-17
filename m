Return-Path: <linux-kbuild+bounces-13220-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6C8ONPFJCmrFzAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13220-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:06:25 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F34564412
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76034301875D
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 23:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABA83D5223;
	Sun, 17 May 2026 23:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VY9rQByG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45103D4116;
	Sun, 17 May 2026 23:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779059153; cv=none; b=osXgBxZxVebLs70r2RHLr2IUzg/9FeNxtru2YiDBZhOnKbjVivw9HgL9+t9RE5rElAN1OUw0BqRi43GkdIerO3AiC3rkvNcwKqa3mU9qrys7iuibeYHxeOqpvah7e7Rgl1rltkYZfysGJWOikDjk6IxC0zOWqkYQqtLv9Wz+dVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779059153; c=relaxed/simple;
	bh=GyD4YMZK6iTmrrn0wIfJEk2rAg5lFRlkKYqjrNci574=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h20DsyIExEoPDYT82ywOhVFong2Iwy8fi2/lmz+0hfp7/JcLMvj2HZhMqWP+oAqRmPBJ+pIE6leHqWZtgsAU0doQVDWeSxqWS2V/giDV4keaak06SCJRYNT7etxM4HgARPunaYEHPN0xF9QmRkbNmqQ5CwL50IvCZAmtkZyWYBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VY9rQByG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1873C2BCB0;
	Sun, 17 May 2026 23:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059153;
	bh=GyD4YMZK6iTmrrn0wIfJEk2rAg5lFRlkKYqjrNci574=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VY9rQByGfVV6L5TlUYA1iU5QY4+/BVcBz4dJI/HUsdFzgbBP8uu67By+mBz6wwT4j
	 bdbMkAr997DMCcBguFjWaK49BOnxJ7CDog1BwLIXk2ydYPL4xkjQjKeaXgXL9qx847
	 KKERQCTlx7AQt+leIUiQKZsAX4IgVuqMHrkz3nNqd2V/0+KPkGlfN5YPkhbzjiftQj
	 h3uq2RfqzoaBm/d/iB28SE/JVb0kfgKamEp8GHsm+2YOZZdQNGaVoUvupAK1PHsYjz
	 eZ/fkhx+7lT2pPP7O3vZbPHjF5aSTBX+VQsBNKaFsRGJ4hgQ3xXurcr4numuwFArsN
	 +QuC8/lxZHwlg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:12 -1000
Subject: [PATCH v2 09/16] riscv: Drop tautological condition from
 TOOLCHAIN_NEEDS_OLD_ISA_SPEC
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-9-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2385; i=nathan@kernel.org;
 h=from:subject:message-id; bh=GyD4YMZK6iTmrrn0wIfJEk2rAg5lFRlkKYqjrNci574=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnpviOQ6piJWJG/gVr/RhmsKhdVHvi5xJe4xmgCGD6
 HPJ720dpSwMYlwMsmKKLNWPVY8bGs45y3jj1CSYOaxMIEMYuDgFYCIL2BgZ9kVwT/vheaBqY9M6
 Mbm+tzI762wPT5omVb7Q/PaD1bUcRxkZ5uoITxf+x5V08M73Q1V6eV8tbh1/+E9NUt9yd/XDwwc
 nsAIA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: 51F34564412
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13220-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,berkeley.edu:email,dabbelt.com:email,infradead.org:email,ghiti.fr:email]
X-Rspamd-Action: no action

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the Clang dependency part of
CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC is always false, so it can be
removed. Adjust the help text to remove mention of Clang < 17, as it is
irrelevant for the kernel after the minimum supported bump.

Acked-by: Paul Walmsley <pjw@kernel.org>  # arch/riscv
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
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


