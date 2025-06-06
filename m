Return-Path: <linux-kbuild+bounces-7379-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FF6ACFBD8
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 06:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 898483AD54F
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 04:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E301E9906;
	Fri,  6 Jun 2025 04:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gs0eht9K"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1FA1E98E3;
	Fri,  6 Jun 2025 04:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749183066; cv=none; b=K/f8Bs3a/97xWUdW8308loPdtdKR5V+5/4Nduq7MSihIIrkDFdGm6yffabwfw8MljkNQ68DWzoQ3YDC29zZLJEpgOC6V+HaaoGNNx4a/NLUbDJ8hP5WCZY5k9EoVwfj5oYdpyrfGhc4/e4W3whWoLgZpclfe+XC9rWWaLqmOdsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749183066; c=relaxed/simple;
	bh=ayF3R0tSKj0OJesZ+fxPbrtJx/oOovwQFsLtj1f9dNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CKcgvrSW7tKwDb0sP5s7LxTb7eLib+JPTywp1SWq3uhurqwUDm7agiveGX+Xh2fZTSBntHocDH3mOvhvNkjnZYDe2HfhmZ8ESGjho0qITWlg18aMEGML3hdYAkpjL+QhtuSKzPMiPMbGFaAnYrr0aYdGhjNRNTnrscU4Wawi1UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gs0eht9K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF47C4CEED;
	Fri,  6 Jun 2025 04:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749183065;
	bh=ayF3R0tSKj0OJesZ+fxPbrtJx/oOovwQFsLtj1f9dNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gs0eht9KyYSIR04NLPdWdnjHK4a2jqq8E1qqSpU+qCGXKO6Zr266K6i0xPWvHqkJ8
	 n/HXl86H5TDghuykMRCSaWePMRjg0stQF1CDYlZQVGKzs5w3WZkr1CuuSSsKcyLvIT
	 bOlC/BnQ9E4qwfej6USY03CbxHqF8BEV4PFJJESu1wBouTCfoU43JxasvRb8ERjYf4
	 Kd+W56skc6IRT/LFwPfVDULg3CixW5f2bTpCD8O9HNUMx5NXGoPJXHVbRqI0CGTrrl
	 5MuZYYjxs6j2veLP7qz/lxhN51atg/oJsSzFOtjaKhkogudnHGaYche2ZouLYSXbxq
	 JYYK5zQDQFfPA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Petr Pavlu <petr.pavlu@suse.com>,
	Alexey Gladkov <legion@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/4] kbuild: keep .modinfo section in vmlinux.unstripped
Date: Fri,  6 Jun 2025 13:10:25 +0900
Message-ID: <20250606041029.614348-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606041029.614348-1-masahiroy@kernel.org>
References: <20250606041029.614348-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 58a635a6d5bd..ce292ae70a93 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -830,6 +830,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 
 /* Required sections not related to debugging. */
 #define ELF_DETAILS							\
+		.modinfo : { *(.modinfo) }				\
 		.comment 0 : { *(.comment) }				\
 		.symtab 0 : { *(.symtab) }				\
 		.strtab 0 : { *(.strtab) }				\
@@ -1043,7 +1044,6 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
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
2.43.0


