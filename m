Return-Path: <linux-kbuild+bounces-5263-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5F79FDB8D
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Dec 2024 16:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2798D161603
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Dec 2024 15:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE4519340E;
	Sat, 28 Dec 2024 15:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RyB1waud"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92493193074;
	Sat, 28 Dec 2024 15:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735400811; cv=none; b=Tm39Em2rKPiSfx818qQDy42BJswaa3fl28atEB5AFk6SvjNKQpDPY3DbMovKB87zdPrR+0rzg5292c5/oZ/FhuJQgSBLTOFoHD0FLdokDCiyhshGy8vDju4Js+vwBKGlnSWPUbWY1E88GhEyW9+hPWacJrk+uYXoeGicK79f8vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735400811; c=relaxed/simple;
	bh=WqtxnCMne4gQ2oePRU52ATqcQNgyvzDruGB9m32CQx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZBNAaWfItsKiWvcuo57EX3UPWdxwQrPWIsFsPovzfHQzaw4l1kAnMukJKDFPTlbHnx08q+jad1QFBrOc5OOQG9BGcMRsRtoXZjWlJRpZTmxqSOAaQaKEwtWEVMW7lGha+Tar+IkE9WntTFqvC+lRQTeESHAmyV0zPQIBBUtTtzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RyB1waud; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04919C4CED3;
	Sat, 28 Dec 2024 15:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735400811;
	bh=WqtxnCMne4gQ2oePRU52ATqcQNgyvzDruGB9m32CQx4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RyB1waudZ56secv7nG0uJlxUK0a3ciEdZ5/LGLW9hwvwK5ckPJwt2iBL1PYrYuyNr
	 /f1fIWLxIxR0RK2M7QfcBfC5QyiDFGdGYzV2/izCm5Mw+4j6IdoRLAYJt5hiR79ECt
	 +2OILQEBTXqHIYbGBL9Nla6j33iXPBeEPaQTH4NyxTfFw+XFDGKO+oHADkthndReTU
	 461FZVn8sLVzrJ6JyXdBfKFaF8zVFlSPX5nDVtolRXG8Yydad8jATYBtapCZxvSsph
	 SDKgQt/wxN1v1j3oigES6OOetGAIDkXxe2ZmikA3YzSy/Rtv1R9d4U0DV9FhuKajEN
	 IlN9xDV/UehEw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	linux-modules@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] module: get symbol crc back to unsigned
Date: Sun, 29 Dec 2024 00:45:28 +0900
Message-ID: <20241228154603.2234284-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241228154603.2234284-1-masahiroy@kernel.org>
References: <20241228154603.2234284-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 71810db27c1c ("modversions: treat symbol CRCs as 32 bit
quantities") changed the CRC fields to s32 because the __kcrctab and
__kcrctab_gpl sections contained relative references to the actual
CRC values stored in the .rodata section when CONFIG_MODULE_REL_CRCS=y.

Commit 7b4537199a4a ("kbuild: link symbol CRCs at final link, removing
CONFIG_MODULE_REL_CRCS") removed this complexity. Now, the __kcrctab
and __kcrctab_gpl sections directly contain the CRC values in all cases.

The genksyms tool outputs unsigned 32-bit CRC values, so u32 is preferred
over s32.

No functional changes are intended.

Regardless of this change, the CRC value is assigned to the u32 variable,
'crcval' before the comparison, as seen in kernel/module/version.c:

    crcval = *crc;

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 include/linux/module.h   |  4 ++--
 kernel/module/internal.h | 10 +++++-----
 kernel/module/main.c     |  2 +-
 kernel/module/version.c  |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 94acbacdcdf1..903ef8fe4c04 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -430,7 +430,7 @@ struct module {
 
 	/* Exported symbols */
 	const struct kernel_symbol *syms;
-	const s32 *crcs;
+	const u32 *crcs;
 	unsigned int num_syms;
 
 #ifdef CONFIG_ARCH_USES_CFI_TRAPS
@@ -448,7 +448,7 @@ struct module {
 	/* GPL-only exported symbols. */
 	unsigned int num_gpl_syms;
 	const struct kernel_symbol *gpl_syms;
-	const s32 *gpl_crcs;
+	const u32 *gpl_crcs;
 	bool using_gplonly_symbols;
 
 #ifdef CONFIG_MODULE_SIG
diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index daef2be83902..f10dc3ea7ff8 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -55,8 +55,8 @@ extern const struct kernel_symbol __start___ksymtab[];
 extern const struct kernel_symbol __stop___ksymtab[];
 extern const struct kernel_symbol __start___ksymtab_gpl[];
 extern const struct kernel_symbol __stop___ksymtab_gpl[];
-extern const s32 __start___kcrctab[];
-extern const s32 __start___kcrctab_gpl[];
+extern const u32 __start___kcrctab[];
+extern const u32 __start___kcrctab_gpl[];
 
 struct load_info {
 	const char *name;
@@ -102,7 +102,7 @@ struct find_symbol_arg {
 
 	/* Output */
 	struct module *owner;
-	const s32 *crc;
+	const u32 *crc;
 	const struct kernel_symbol *sym;
 	enum mod_license license;
 };
@@ -384,7 +384,7 @@ static inline void init_param_lock(struct module *mod) { }
 
 #ifdef CONFIG_MODVERSIONS
 int check_version(const struct load_info *info,
-		  const char *symname, struct module *mod, const s32 *crc);
+		  const char *symname, struct module *mod, const u32 *crc);
 void module_layout(struct module *mod, struct modversion_info *ver, struct kernel_param *kp,
 		   struct kernel_symbol *ks, struct tracepoint * const *tp);
 int check_modstruct_version(const struct load_info *info, struct module *mod);
@@ -393,7 +393,7 @@ int same_magic(const char *amagic, const char *bmagic, bool has_crcs);
 static inline int check_version(const struct load_info *info,
 				const char *symname,
 				struct module *mod,
-				const s32 *crc)
+				const u32 *crc)
 {
 	return 1;
 }
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 5399c182b3cb..e58bff88b8d6 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -86,7 +86,7 @@ struct mod_tree_root mod_tree __cacheline_aligned = {
 
 struct symsearch {
 	const struct kernel_symbol *start, *stop;
-	const s32 *crcs;
+	const u32 *crcs;
 	enum mod_license license;
 };
 
diff --git a/kernel/module/version.c b/kernel/module/version.c
index 53f43ac5a73e..4e5731d403af 100644
--- a/kernel/module/version.c
+++ b/kernel/module/version.c
@@ -13,7 +13,7 @@
 int check_version(const struct load_info *info,
 		  const char *symname,
 			 struct module *mod,
-			 const s32 *crc)
+			 const u32 *crc)
 {
 	Elf_Shdr *sechdrs = info->sechdrs;
 	unsigned int versindex = info->index.vers;
-- 
2.43.0


