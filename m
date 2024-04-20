Return-Path: <linux-kbuild+bounces-1622-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EF68ABC12
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Apr 2024 16:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED639281535
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Apr 2024 14:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0B11E4B2;
	Sat, 20 Apr 2024 14:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="36y2mTXg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32FFB669
	for <linux-kbuild@vger.kernel.org>; Sat, 20 Apr 2024 14:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713624797; cv=none; b=PwRo6hbkLUgpMosr+itW9ofQzwy/PFUkH1Wqw89PYiKsmezbUvb3fCX/agmLnwJe+c6+srqhgajCSn6kr408OL8k6y8D587osKkBsL3drKHKRTbblVoPJOgcNkq6OqlRQRpUhCTySMXsZPbvRVqArGFCpGiDPGPkPPa00rC0/f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713624797; c=relaxed/simple;
	bh=L2pAJDIgd09N9dPeAJlChvryG82fGM15z0HZ+noCtdE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=M5hZeUtqdjWrpQwib5SW0mdyTNXzUY0PPMu8mJD7hXsy77zqAoNILMpdedRZCgTsAjXK1Son86mucf0DzgaDAiKGNhlKoS1GR8tpP0kOnAw7fAx5/SlqBRvb2Exor0Fd11TfwVqAkHX1LjHZW94Ehspic0WOYAew5x9vaNukR64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=36y2mTXg; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-343f08542f8so2015621f8f.0
        for <linux-kbuild@vger.kernel.org>; Sat, 20 Apr 2024 07:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713624794; x=1714229594; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WKQ+BVS60yeZluvBwBFdf26Wahd7Nx6DRPBmcI5HHBs=;
        b=36y2mTXgfXi5aRRo1C5ZUlCoDwdWF8+p+rP2OtweYIJ8nscHwGnlJpmouVCVpRkfIZ
         DihndyXd7B3UYt/vKNK6lpdW/lliTfHopMeBupDq0t9wwyEtW+QJ+wvUO4i29upo85Nw
         EH1bd+hDyKYwjsND53OnOzMWkjdkq2M3woGGbN6+ZkDK97krB21iwuVZk8+rQzp9meHZ
         60BtZoL7bYtUGlnV23sGQBJrcjlPeVDmlsfkINXLXS4UD4CHcYmi4etZjQggabnHk6Xn
         WD0j64f9pQJLPKhm9SuYtjWWMGN/9HUf4l0zNZi2cwxgp/m2UQr08CHDlXuWP589pn4p
         ukTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713624794; x=1714229594;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WKQ+BVS60yeZluvBwBFdf26Wahd7Nx6DRPBmcI5HHBs=;
        b=n4YC2O8VwMIbN9vJoGYzVBl9ewH3HZqvFqg8gJhjhWx5kKy6Bkdp7ub3cy3UWVW5yA
         ffonC55yo5sZh1vu9KzORzQ9Uo6lwLQSLTPkyfrjaNNxT6/628i/0omvR50wrKERE5qB
         f/rvEfuW+Yqql5OJyWOmyisbuw16lHYq+CaD7CC/ODiwASJqv2wtNpsDAWkTijXa0QSa
         Mt4fdnROHKBGgsv6Dnakv/8pfa29uBW3qF7e6kvPa3Rr/9axzbQ9Kq2ql+ppUR7zVznc
         Dp5XZVeJBQv0xXY2KR2aLMSIT7LNlJv5eJSCHpqDhb15gcS4/JHM+dvyLOL603j0pr1t
         kQ/w==
X-Forwarded-Encrypted: i=1; AJvYcCXK5z3O639kj1Od8LhAqCIr7npXEneCFBEhB8gZ/ihAPa/+P1doDF4eb3JQpjaQ7aRM2FXiENlUR57C7P/oqtzrrth3hqBV6ClXO/E1
X-Gm-Message-State: AOJu0Ywsc+LfTNbjYwubtLMXltbKzppPKg1STXz1aojGEHAz1R5e0hAH
	ISI2rtBVmWjvUTGkK7v8RucdV2bVl+PfjMWqS5+KkC/XqnAdPn5AnEBBLEn8z+Z/m2lu6Q==
X-Google-Smtp-Source: AGHT+IFESR6rh3Rt6iU3NFcfXf3QYRALOCJbIwQqEu4aWr9NbToafOPj9bPwIIzNjk/5XGbyV8Sb0YfD
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:adf:f051:0:b0:34a:5683:ce68 with SMTP id
 t17-20020adff051000000b0034a5683ce68mr9885wro.9.1713624794183; Sat, 20 Apr
 2024 07:53:14 -0700 (PDT)
Date: Sat, 20 Apr 2024 16:53:04 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5043; i=ardb@kernel.org;
 h=from:subject; bh=kaOxBt3VsuilePPxOqc4JRvXBj5H43zTLJ3gqsXHoSs=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIU352vkPU0/eiFnef0TofXqSp6s3w+F7E1qq5t58d3TLP
 gmdfPedHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAi838w/A+9lb7N8jLbm2r1
 Rwtdzx76vOty1tU/ZuY9++x3iDC6ro1n+MkopdEjZy4Udu3ixIjfl9Y47/KTMlS4nT3h+yU9owS LRkYA
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240420145303.238068-2-ardb+git@google.com>
Subject: [PATCH v5] kallsyms: Avoid weak references for kallsyms symbols
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

kallsyms is a directory of all the symbols in the vmlinux binary, and so
creating it poses somewhat of a chicken-and-egg problem, as its non-zero
size affects the layout of the binary, and therefore the values of the
symbols.

For this reason, the kernel is linked more than once, and the first pass
does not include any kallsyms data at all. For the linker to accept
this, the symbol declarations describing the kallsyms metadata are
emitted as having weak linkage, so they can remain unsatisfied. During
the subsequent passes, the weak references are satisfied by the kallsyms
metadata that was constructed based on information gathered from the
preceding passes.

Weak references lead to somewhat worse codegen, because taking their
address may need to produce NULL (if the reference was unsatisfied), and
this is not usually supported by RIP or PC relative symbol references.

Given that these references are ultimately always satisfied in the final
link, let's drop the weak annotation on the declarations, and instead,
provide fallback definitions with weak linkage. This informs the
compiler that ultimately, the reference will always be satisfied.

While at it, drop the FRV specific annotation that these symbols reside
in .rodata - FRV is long gone.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Acked-by: Nick Desaulniers <ndesaulniers@google.com>
Acked-by: Kees Cook <keescook@chromium.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/all/20240415075837.2349766-5-ardb+git@google.com
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
v5: - avoid PROVIDE() in the linker script, use weak definitions instead
    - drop tested-by, replace reviewed-by with acked-by

 kernel/kallsyms.c          | 31 ++++++++++++++++----
 kernel/kallsyms_internal.h | 25 ++++++----------
 2 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 18edd57b5fe8..fada7fbb24cf 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -34,6 +34,31 @@
 
 #include "kallsyms_internal.h"
 
+/*
+ * The real definitions of the symbols below will not exist yet during the
+ * first pass of the link, but are guaranteed to exist in the final link.
+ * Provide preliminary weak definitions that will be superseded in the final
+ * link, to avoid having to rely on weak references, which require a GOT when
+ * used in position independent code.
+ */
+
+#ifndef CONFIG_KALLSYMS_BASE_RELATIVE
+const unsigned long __weak kallsyms_addresses[1];
+#else
+const int __weak kallsyms_offsets[1];
+const unsigned long __weak kallsyms_relative_base;
+#endif
+
+const u8 __weak kallsyms_names[1];
+
+const unsigned int __weak kallsyms_num_syms;
+
+const char __weak kallsyms_token_table[1];
+const u16 __weak kallsyms_token_index[1];
+
+const unsigned int __weak kallsyms_markers[1];
+const u8 __weak kallsyms_seqs_of_names[3];
+
 /*
  * Expand a compressed symbol data into the resulting uncompressed string,
  * if uncompressed string is too long (>= maxlen), it will be truncated,
@@ -325,12 +350,6 @@ static unsigned long get_symbol_pos(unsigned long addr,
 	unsigned long symbol_start = 0, symbol_end = 0;
 	unsigned long i, low, high, mid;
 
-	/* This kernel should never had been booted. */
-	if (!IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE))
-		BUG_ON(!kallsyms_addresses);
-	else
-		BUG_ON(!kallsyms_offsets);
-
 	/* Do a binary search on the sorted kallsyms_addresses array. */
 	low = 0;
 	high = kallsyms_num_syms;
diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
index 27fabdcc40f5..cf4124dbcc5b 100644
--- a/kernel/kallsyms_internal.h
+++ b/kernel/kallsyms_internal.h
@@ -8,24 +8,17 @@
  * These will be re-linked against their real values
  * during the second link stage.
  */
-extern const unsigned long kallsyms_addresses[] __weak;
-extern const int kallsyms_offsets[] __weak;
-extern const u8 kallsyms_names[] __weak;
+extern const unsigned long kallsyms_addresses[];
+extern const int kallsyms_offsets[];
+extern const u8 kallsyms_names[];
 
-/*
- * Tell the compiler that the count isn't in the small data section if the arch
- * has one (eg: FRV).
- */
-extern const unsigned int kallsyms_num_syms
-__section(".rodata") __attribute__((weak));
-
-extern const unsigned long kallsyms_relative_base
-__section(".rodata") __attribute__((weak));
+extern const unsigned int kallsyms_num_syms;
+extern const unsigned long kallsyms_relative_base;
 
-extern const char kallsyms_token_table[] __weak;
-extern const u16 kallsyms_token_index[] __weak;
+extern const char kallsyms_token_table[];
+extern const u16 kallsyms_token_index[];
 
-extern const unsigned int kallsyms_markers[] __weak;
-extern const u8 kallsyms_seqs_of_names[] __weak;
+extern const unsigned int kallsyms_markers[];
+extern const u8 kallsyms_seqs_of_names[];
 
 #endif // LINUX_KALLSYMS_INTERNAL_H_
-- 
2.44.0.769.g3c40516874-goog


