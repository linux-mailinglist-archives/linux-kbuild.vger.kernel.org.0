Return-Path: <linux-kbuild+bounces-8128-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E37B10C01
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 15:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BBDC1C81448
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 13:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF712E11A8;
	Thu, 24 Jul 2025 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPDY2RvE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E562DC347;
	Thu, 24 Jul 2025 13:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365016; cv=none; b=RyX5aQLnCD/o7vloJCROCKQV2GDaIG4K8bs3Mjn0j7ws/9mOO+SPhOMrCClu+dAL2S08iuqcJlNaguXwDTYWpNS/uuHrK+zd+27hALSj13fNHQTJnoDtLT39l1RsRjcMWn1SnmKMzkDAF+62vz1h91svZ//kQLTZkZ1kkRsS7fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365016; c=relaxed/simple;
	bh=6Uahpcn0qMSHeFT4Ck6YJPepsBL+WJAqsNKhS9PQYgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TlGoy5DiF4oPAN2N3X9ANrd9hzuj1OHQQ8le0KSpVfCgS72tvMiztcK6fwGLXwakujpyXTjTWujbujK/VhiWfXH2P/DrEc/D6eu+ylu0cVH+IUkMTXm1ykfQa8hRFKrEgkUvhNGW+vaQOPt2YvfmenNkWlNzomnEf65JRsw3UIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPDY2RvE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6FEC4CEF5;
	Thu, 24 Jul 2025 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753365016;
	bh=6Uahpcn0qMSHeFT4Ck6YJPepsBL+WJAqsNKhS9PQYgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jPDY2RvE2g44xCQzLEgoi41z8kS52Y583ijdvyl1ATow5Bririr6ILosHp7JNDbGx
	 EVCvyF+bi7qewHlSDtJr+cxQrTJel5oGjyN0uFFK7JmrVrfgRTc3cn67hGmzL+YfZA
	 eioDVZY6tMPVwbCUaWSjcnOcpIOqumlBfb76u12gZbXY+IX9vWhaGbIHl/ajihs063
	 2r04PSgiKOR5Ne+8fqKvK/cxXsk6J1Wbld+aUtGoH+0DgWEW1MiGKTodj6ZT/a16dM
	 QHs8iqX9ZOAe6x+dxlac3C2U+yKk4zqPCEx0qEM52VsU5gtzIHmK8iul2ccUEhWKG1
	 bvGRbZ5SqrmgQ==
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
	linux-kbuild@vger.kernel.org
Subject: [PATCH v5 03/10] kbuild: keep .modinfo section in vmlinux.unstripped
Date: Thu, 24 Jul 2025 15:49:40 +0200
Message-ID: <d44055fc22d4a53b7f87758d31cb4d640c8f8cca.1753354215.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753354215.git.legion@kernel.org>
References: <cover.1753354215.git.legion@kernel.org>
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
2.50.1


