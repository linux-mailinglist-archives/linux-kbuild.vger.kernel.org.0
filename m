Return-Path: <linux-kbuild+bounces-4922-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F419DFAB3
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 07:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E09181626DD
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 06:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560201F8AC7;
	Mon,  2 Dec 2024 06:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVyPaHPT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE10481A3;
	Mon,  2 Dec 2024 06:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733120961; cv=none; b=eva7FKk8p2g4iPD4K4nQQdQ0t63oPsPzZYhtYqt6Y6Qt/hBGIa5Z8kx648QcTjNVwGpjFypGztm3QSzzIwwZJfRWw/NPMkyJfj/gJk72FnNTch5n4tlV54KHydn3fcQDoc34q0o+dXk7OQE4iUUe9OmUjHJbqazviq1RS4yVUm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733120961; c=relaxed/simple;
	bh=EUPBnoU4PrZVChM2Uli3aR1C3C7+GwmYPx05eNznviw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TpfwI7NLVNtFyAnk/h9Rw1XU+S6XvWJxP1tbtrwbyggwRO6Va0OagjkEwBwfihY+qjGqjG4r4jspHiPn84KojmyELMfMx+DmrBJi18+VGK1tbHQS+1Sn+rCREhIZ4kgt+jcWTm2m4R1hIcNWoDIa1gEhKqZcuR0xmeY1qnnzcNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVyPaHPT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F6BC4CED2;
	Mon,  2 Dec 2024 06:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733120960;
	bh=EUPBnoU4PrZVChM2Uli3aR1C3C7+GwmYPx05eNznviw=;
	h=From:To:Cc:Subject:Date:From;
	b=KVyPaHPTahglMWsl5idPnjqLqDHXOZMY6trVR/p6NCTxCcQ06BvLWmCb5hKxAlDK1
	 Fhp4oj88Y62YsyxhnufYIsuKBitTmiWxNU3B+6r3AvOhsp9bzGKkkwKLHoHE5NYM5U
	 VYqbnwtsXwake5T4IOBlcXekHQG3WJ7wtlq2oolMysuEPsAomktxv49JjPVW6Fm7vR
	 d5aOIjG4oN30alkAOZB9soW4d4v9oXisEURHpCl52OTnsmCJSVTdP/ftHACTVk+f8I
	 KLbE578/nmxAFK1gk2BM4RieS3yG0+2ndUTBzxVbh7P+0Q21rIcLwvMplG3p71z9Hm
	 1UY9M36VBtjvQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	linux-openrisc@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Rong Xu <xur@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] openrisc: place exception table at the head of vmlinux
Date: Mon,  2 Dec 2024 15:28:22 +0900
Message-ID: <20241202062909.2194341-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 0043ecea2399 ("vmlinux.lds.h: Adjust symbol ordering in
text output section"), the exception table in arch/openrisc/kernel/head.S
is no longer positioned at the very beginning of the kernel image, which
causes a boot failure.

Currently, the exception table resides in the regular .text section.
Previously, it was placed at the head by relying on the linker receiving
arch/openrisc/kernel/head.o as the first object. However, this behavior
has changed because sections like .text.{asan,unknown,unlikely,hot} now
precede the regular .text section.

The .head.text section is intended for entry points requiring special
placement. However, in OpenRISC, this section has been misused: instead
of the entry points, it contains boot code meant to be discarded after
booting. This feature is typically handled by the .init.text section.

This commit addresses the issue by replacing the current __HEAD marker
with __INIT and re-annotating the entry points with __HEAD. Additionally,
it adds __REF to entry.S to suppress the following modpost warning:

  WARNING: modpost: vmlinux: section mismatch in reference: _tng_kernel_start+0x70 (section: .text) -> _start (section: .init.text)

Fixes: 0043ecea2399 ("vmlinux.lds.h: Adjust symbol ordering in text output section")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/all/5e032233-5b65-4ad5-ac50-d2eb6c00171c@roeck-us.net/#t
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/openrisc/kernel/entry.S       | 2 ++
 arch/openrisc/kernel/head.S        | 6 ++++--
 arch/openrisc/kernel/vmlinux.lds.S | 3 +--
 scripts/head-object-list.txt       | 1 -
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/openrisc/kernel/entry.S b/arch/openrisc/kernel/entry.S
index 440711d7bf40..ce6f2b08a35e 100644
--- a/arch/openrisc/kernel/entry.S
+++ b/arch/openrisc/kernel/entry.S
@@ -239,6 +239,8 @@ handler:							;\
 
 /* =====================================================[ exceptions] === */
 
+	__REF
+
 /* ---[ 0x100: RESET exception ]----------------------------------------- */
 
 EXCEPTION_ENTRY(_tng_kernel_start)
diff --git a/arch/openrisc/kernel/head.S b/arch/openrisc/kernel/head.S
index 439e00f81e5d..ec6d2a7d5b92 100644
--- a/arch/openrisc/kernel/head.S
+++ b/arch/openrisc/kernel/head.S
@@ -357,6 +357,8 @@
 
 /* =====================================================[ exceptions] === */
 
+	__HEAD
+
 /* ---[ 0x100: RESET exception ]----------------------------------------- */
     .org 0x100
 	/* Jump to .init code at _start which lives in the .head section
@@ -506,10 +508,10 @@ _dispatch_do_ipage_fault:
 
 /*    .text*/
 
-/* This early stuff belongs in HEAD, but some of the functions below definitely
+/* This early stuff belongs in the .init.text section, but some of the functions below definitely
  * don't... */
 
-	__HEAD
+	__INIT
 	.global _start
 _start:
 	/* Init r0 to zero as per spec */
diff --git a/arch/openrisc/kernel/vmlinux.lds.S b/arch/openrisc/kernel/vmlinux.lds.S
index bc1306047837..049bff45f612 100644
--- a/arch/openrisc/kernel/vmlinux.lds.S
+++ b/arch/openrisc/kernel/vmlinux.lds.S
@@ -50,6 +50,7 @@ SECTIONS
         .text                   : AT(ADDR(.text) - LOAD_OFFSET)
 	{
           _stext = .;
+	  HEAD_TEXT
 	  TEXT_TEXT
 	  SCHED_TEXT
 	  LOCK_TEXT
@@ -83,8 +84,6 @@ SECTIONS
 	. = ALIGN(PAGE_SIZE);
 	__init_begin = .;
 
-	HEAD_TEXT_SECTION
-
 	/* Page aligned */
 	INIT_TEXT_SECTION(PAGE_SIZE)
 
diff --git a/scripts/head-object-list.txt b/scripts/head-object-list.txt
index f12b4a7b8406..7274dfc65af6 100644
--- a/scripts/head-object-list.txt
+++ b/scripts/head-object-list.txt
@@ -24,7 +24,6 @@ arch/m68k/kernel/head.o
 arch/m68k/kernel/sun3-head.o
 arch/microblaze/kernel/head.o
 arch/nios2/kernel/head.o
-arch/openrisc/kernel/head.o
 arch/parisc/kernel/head.o
 arch/powerpc/kernel/head_44x.o
 arch/powerpc/kernel/head_64.o
-- 
2.43.0


