Return-Path: <linux-kbuild+bounces-7602-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CBEAE294C
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 15:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA5D23B54EE
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 13:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01B4211497;
	Sat, 21 Jun 2025 13:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCq25/PR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F34F20D4E1;
	Sat, 21 Jun 2025 13:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750514264; cv=none; b=N9KkSi5QZeiJLU5/1FwDNDksdISWMIuNaIpJ2te+6gN8qVQLGbaOGykjet1Z3A/QAr6cflVDEhbOxiOWsDyVGngs7mtTMXWj5gIPkaKamdyLiXiQzaz4dhp5SRttcFN1VIibLzherhrT5pbExjjfKj019ZF/wkuDoTHWeUDR98c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750514264; c=relaxed/simple;
	bh=KUafdHVAFlR3dIvZDr3EeiL7KupPBGcv8xjCd5EYL7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tOWJW22wQ4sBHJBONiowiO3Wa23rr6aT5bFDqa1Hdm7iIteONFchX8b2Oiylh8t35zKsgEDRHr+qR4UQH6+u9owXdTs7AO6tZ3BduoqGf2uifbaAD0y7o9tk+7VWfGkmWY3mt0lmI4ND2gRggbhOltudQ2j5CqOpOq3uEdDFv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCq25/PR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BBB5C4AF09;
	Sat, 21 Jun 2025 13:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750514263;
	bh=KUafdHVAFlR3dIvZDr3EeiL7KupPBGcv8xjCd5EYL7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OCq25/PRcRZlK95RHWzkqXJ+EKEB60MZvwjTeO0MIIgDESs8xKXCzaaTDzm7dc+ue
	 dypbzqRKPCfBLp5llR7ewrAyMYvIK4yoU/Ni/buCo8Cx1jijlgZWd1LGGEph6ppjeX
	 dibVTqeKCUQp0Au7duiUeklV9PcR3JQ44jQuNZf2L4MfkiVc1YiIN0tux9GtvQ9Pnm
	 8Jhm3BgMxnzaPr1JwPG6+UFvgV3VuAyel2OD2pUGt6wOUaxWaecdrvMNhRtvgQ15Uh
	 0ZAlG6hNxIud1mOI1Mj+yuCLbH9AXdlweYfXQhh0bSBsKJHP2pbCCIGYeLprr+4NOe
	 TVcDU0VvJjivg==
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH v4 3/7] kbuild: keep .modinfo section in vmlinux.unstripped
Date: Sat, 21 Jun 2025 15:57:15 +0200
Message-ID: <f1e2247ad4ec6a947de18acdefb4295cb361a62b.1750511018.git.legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750511018.git.legion@kernel.org>
References: <cover.1750511018.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Masahiro Yamada <masahiroy@kernel.org>

Keep the .modinfo section during linking, but strip it from the final
vmlinux.

Adjust scripts/mksysmap to exclude modinfo symbols from kallsyms.

This change will allow the next commit to extract the .modinfo section
from the vmlinux.unstripped intermediate.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---
 include/asm-generic/vmlinux.lds.h | 2 +-
 scripts/Makefile.vmlinux          | 2 +-
 scripts/mksysmap                  | 3 +++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index fa5f19b8d53a..1791665006f9 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -831,6 +831,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 
 /* Required sections not related to debugging. */
 #define ELF_DETAILS							\
+		.modinfo : { *(.modinfo) }				\
 		.comment 0 : { *(.comment) }				\
 		.symtab 0 : { *(.symtab) }				\
 		.strtab 0 : { *(.strtab) }				\
@@ -1044,7 +1045,6 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 	*(.discard.*)							\
 	*(.export_symbol)						\
 	*(.no_trim_symbol)						\
-	*(.modinfo)							\
 	/* ld.bfd warns about .gnu.version* even when not emitted */	\
 	*(.gnu.version*)						\
 
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 4f2d4c3fb737..e2ceeb9e168d 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -86,7 +86,7 @@ endif
 # vmlinux
 # ---------------------------------------------------------------------------
 
-remove-section-y                                   :=
+remove-section-y                                   := .modinfo
 remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
 
 quiet_cmd_strip_relocs = OBJCOPY $@
diff --git a/scripts/mksysmap b/scripts/mksysmap
index 3accbdb269ac..a607a0059d11 100755
--- a/scripts/mksysmap
+++ b/scripts/mksysmap
@@ -79,6 +79,9 @@
 / _SDA_BASE_$/d
 / _SDA2_BASE_$/d
 
+# MODULE_INFO()
+/ __UNIQUE_ID_modinfo[0-9]*$/d
+
 # ---------------------------------------------------------------------------
 # Ignored patterns
 #  (symbols that contain the pattern are ignored)
-- 
2.49.0


