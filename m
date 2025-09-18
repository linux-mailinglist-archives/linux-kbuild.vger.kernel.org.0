Return-Path: <linux-kbuild+bounces-8850-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F9DB83739
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 10:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45D291C820EA
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 08:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03352F7AD5;
	Thu, 18 Sep 2025 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRFYP+la"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47932F7AC3;
	Thu, 18 Sep 2025 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758182825; cv=none; b=LWcs6SDynvuuC5rskqcHy9O6a+HAQPmQHOzvavr+Mr7gcxkN+09fsi0EeYBuqq6fuaNZC+yKgqKQTN8zspASnc6XWvzgkzIebURUQeHtMY5llv2DGwx1goHAv/aqrGcRGh7CXU1mT3JZI6GFHqc/3ORfHsHkKBGHOhpCCvUuSCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758182825; c=relaxed/simple;
	bh=iQ5SvAco/8JTZzvo/2fbFxIJ4aopT9Kas690js7coTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H0XdPJlKXhHZ8Jw+r4O7XKaBmzemJTFtjncs1Nzm2rhyGvYGb9wj/3eD0AsfopZRytG8LceFAi9ssmXZTxGYwoNR8FDnkJ1dUlAnAghWfubdhKfAgUk/YnJFEFBh07a31EBOeoLRMyMBJTfWJWNFrMlWwtQjT2+ObKul280Q+QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRFYP+la; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115E6C4CEF1;
	Thu, 18 Sep 2025 08:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758182825;
	bh=iQ5SvAco/8JTZzvo/2fbFxIJ4aopT9Kas690js7coTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CRFYP+laXm+hRkqcwWYAZBg5bBQb+830CDoZz3SQBddinCX60j431EXo97WegxZ6+
	 9Rr/PhiIT0TxzL0qqH2hHpPqNJIvjyZs1BUdISxsq6BJolaPxjhQRQOLBj9nBr4Po5
	 ZvEjNk/azg9CBX3oZ31CHYwgWEvQjLZwFcpygJ5mk9Wwmm5Tj0z/eSbKGmBcTPQFBl
	 a75RHIYpbEo6PeIudqwF/FuV8whW3bGniLa9ShTFmLiiKDjABZE8TJuSxWWPsed4RD
	 qudn6G9sSgvqTUJ6TGj0R2/aPFD7B1NZd1LFded7BXo/8TyhXmZumeQHL8hmFw/5AZ
	 T4prlZ+8J2dfA==
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v8 3/8] kbuild: keep .modinfo section in vmlinux.unstripped
Date: Thu, 18 Sep 2025 10:05:47 +0200
Message-ID: <aaf67c07447215463300fccaa758904bac42f992.1758182101.git.legion@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758182101.git.legion@kernel.org>
References: <cover.1758182101.git.legion@kernel.org>
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
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 include/asm-generic/vmlinux.lds.h | 2 +-
 scripts/Makefile.vmlinux          | 7 +++++--
 scripts/mksysmap                  | 3 +++
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index ae2d2359b79e9..cfa63860dfd4c 100644
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
index 4f2d4c3fb7372..70856dab0f541 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -86,11 +86,14 @@ endif
 # vmlinux
 # ---------------------------------------------------------------------------
 
-remove-section-y                                   :=
+remove-section-y                                   := .modinfo
 remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
 
+# To avoid warnings: "empty loadable segment detected at ..." from GNU objcopy,
+# it is necessary to remove the PT_LOAD flag from the segment.
 quiet_cmd_strip_relocs = OBJCOPY $@
-      cmd_strip_relocs = $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) $< $@
+      cmd_strip_relocs = $(OBJCOPY) $(patsubst %,--set-section-flags %=noload,$(remove-section-y)) $< $@; \
+                         $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) $@
 
 targets += vmlinux
 vmlinux: vmlinux.unstripped FORCE
diff --git a/scripts/mksysmap b/scripts/mksysmap
index 3accbdb269ac7..a607a0059d119 100755
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
2.51.0


