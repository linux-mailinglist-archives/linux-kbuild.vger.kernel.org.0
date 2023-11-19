Return-Path: <linux-kbuild+bounces-64-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 983067F047B
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Nov 2023 06:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A298280E50
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Nov 2023 05:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514EB538F;
	Sun, 19 Nov 2023 05:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItDSwe0z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D19538C
	for <linux-kbuild@vger.kernel.org>; Sun, 19 Nov 2023 05:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804EAC433C8;
	Sun, 19 Nov 2023 05:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700371962;
	bh=q2CXtWLrjQSU6v2TX31hrhnxbzzNC8tayyo4CW4QiQ8=;
	h=From:To:Cc:Subject:Date:From;
	b=ItDSwe0zoyH4wntxB9RCiIScC/C0hCDFUdKwnxIxYka4Xz4fvaa32WQWrFSIiYIYd
	 vWcE4aAfT9Wgg23v4MfW8VUihBekREtO54dJtkZwFoOXcVszl/+zidshJIwNaBT6gd
	 nki+xx+tneERWHUHySGpex4G5FjcIgrNN5RBEM5nqfP/w1k5aBb1gPzi9Zzl87+wXG
	 ZD03ZNOuXISAzNWzGhGPINirZDCxo0tvKj4ca7bmWAk8uFkCh+Gie3b7s4ABx0v4k9
	 FovgdsxuhzciXu/QpuXG0X36U5oEWS6sLL/o/tj5zvC/EvNuWJBl/fEhH/4FANjgV/
	 aQ5LIUjFHOwqQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] arm64: add dependency between vmlinuz.efi and Image
Date: Sun, 19 Nov 2023 14:32:34 +0900
Message-Id: <20231119053234.2367621-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A common issue in Makefile is a race in parallel building.

You need to be careful to prevent multiple threads from writing to the
same file simultaneously.

Commit 3939f3345050 ("ARM: 8418/1: add boot image dependencies to not
generate invalid images") addressed such a bad scenario.

A similar symptom occurs with the following command:

  $ make -j$(nproc) ARCH=arm64 Image vmlinuz.efi
    [ snip ]
    SORTTAB vmlinux
    OBJCOPY arch/arm64/boot/Image
    OBJCOPY arch/arm64/boot/Image
    AS      arch/arm64/boot/zboot-header.o
    PAD     arch/arm64/boot/vmlinux.bin
    GZIP    arch/arm64/boot/vmlinuz
    OBJCOPY arch/arm64/boot/vmlinuz.o
    LD      arch/arm64/boot/vmlinuz.efi.elf
    OBJCOPY arch/arm64/boot/vmlinuz.efi

The log "OBJCOPY arch/arm64/boot/Image" is displayed twice.

It indicates that two threads simultaneously enter arch/arm64/boot/
and write to arch/arm64/boot/Image.

It occasionally leads to a build failure:

  $ make -j$(nproc) ARCH=arm64 Image vmlinuz.efi
    [ snip ]
    SORTTAB vmlinux
    OBJCOPY arch/arm64/boot/Image
    PAD     arch/arm64/boot/vmlinux.bin
  truncate: Invalid number: 'arch/arm64/boot/vmlinux.bin'
  make[2]: *** [drivers/firmware/efi/libstub/Makefile.zboot:13:
  arch/arm64/boot/vmlinux.bin] Error 1
  make[2]: *** Deleting file 'arch/arm64/boot/vmlinux.bin'
  make[1]: *** [arch/arm64/Makefile:163: vmlinuz.efi] Error 2
  make[1]: *** Waiting for unfinished jobs....
  make: *** [Makefile:234: __sub-make] Error 2

vmlinuz.efi depends on Image, but such a dependency is not specified
in arch/arm64/Makefile.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arm64/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 4a1ad3248c2d..47ecc4cff9d2 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -158,7 +158,7 @@ endif
 
 all:	$(notdir $(KBUILD_IMAGE))
 
-
+vmlinuz.efi: Image
 Image vmlinuz.efi: vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 
-- 
2.40.1


