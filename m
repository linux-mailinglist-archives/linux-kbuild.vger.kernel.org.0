Return-Path: <linux-kbuild+bounces-2572-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA2C934057
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 18:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F647281799
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 16:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2786E5B05E;
	Wed, 17 Jul 2024 16:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVVs+kHT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C4B1D52B;
	Wed, 17 Jul 2024 16:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721233468; cv=none; b=OoLoaVp7UnVUO2N12d9mJ4uC8Rhl2Dvoj9vvFUjojZcKLu+7956+Pc//ckpOiZ3dKcrYE1X/hMN52L199m5io6RKN55c/CDP7GkkQAlRuVpfYezDW65APP9MJS6N3LJOM4NaVgV5c2MkCazMk4jbruiaMN7i6O8C+7ZiyShINYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721233468; c=relaxed/simple;
	bh=woNVf/hlC39jwmwhwTBiy3CLo4N2VBfdKPIGYty3XsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fdlkKaPhKkE0/+35j0r4/iZTaz5vYHaFQKq2Xb3pR5CSTXtSRBp+Cqu+KcLx6nauIz3yhtLKzAqLBfj6fJQ8YoDzN4IE5xYgGXXOQh7RZD05reTynG6jW8dMhUl1/Di7i64T77FMRJULb3mDSuc32o6zSaTz8785XZyGYySZy5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVVs+kHT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1099AC2BD10;
	Wed, 17 Jul 2024 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721233467;
	bh=woNVf/hlC39jwmwhwTBiy3CLo4N2VBfdKPIGYty3XsQ=;
	h=From:To:Cc:Subject:Date:From;
	b=UVVs+kHTFY+/Lu8hmpFCBpmVLhGcReywaAypNu1x+6cUB/mwSa0h3xF30/nl+chEW
	 i6dzl9m3ekXi7nNdReByhOy/qho0x3s7JaMTDxAUiJFMw8yYT6kIYhd4IqNPZMEUu5
	 OtnnM8jlsUhy7jyCMxl1lPQQo/9eKNh82qU7H9Xm4xdTZ/NuvmqoomQLjdq/QkjyXZ
	 jz3lOAlDVsmanf3PrikyRB2RC9NDYD6WVB7nD7ZekmBEQzf9PDJN9Yw1rAAMNivHD9
	 yO3hw3Gk64nJ4y7IesndTYHhkzXiduERCycyAkqoIcvU/alDruclpeQbXx9c6mL/RL
	 INrToP7e4+Icg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: fix rebuild of generic syscall headers
Date: Thu, 18 Jul 2024 01:24:20 +0900
Message-ID: <20240717162421.1402773-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit fbb5c0606fa4 ("kbuild: add syscall table generation to
scripts/Makefile.asm-headers") started to generate syscall headers
for architectures using generic syscalls.

However, these headers are always rebuilt using GNU Make 4.4.1 or newer.

When using GNU Make 4.4 or older, these headers are not rebuilt when the
command to generate them is changed, despite the use of the if_changed
macro.

scripts/Makefile.asm-headers now uses FORCE, but it is not marked as
.PHONY. To handle the command line change correctly, .*.cmd files must
be included.

Fixes: fbb5c0606fa4 ("kbuild: add syscall table generation to scripts/Makefile.asm-headers")
Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/lkml/CAHk-=wibB7SvXnUftBgAt+4-3vEKRpvEgBeDEH=i=j2GvDitoA@mail.gmail.com/
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.asm-headers | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/Makefile.asm-headers b/scripts/Makefile.asm-headers
index 6b8e8318e810..8a4856e74180 100644
--- a/scripts/Makefile.asm-headers
+++ b/scripts/Makefile.asm-headers
@@ -87,12 +87,20 @@ $(obj)/unistd_compat_%.h: $(syscalltbl) $(syshdr) FORCE
 $(obj)/syscall_table_%.h: $(syscalltbl) $(systbl) FORCE
 	$(call if_changed,systbl)
 
+targets := $(syscall-y)
+
 # Create output directory. Skip it if at least one old header exists
 # since we know the output directory already exists.
 ifeq ($(old-headers),)
 $(shell mkdir -p $(obj))
 endif
 
+PHONY += FORCE
+
 FORCE:
 
+existing-targets := $(wildcard $(sort $(targets)))
+
+-include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
+
 .PHONY: $(PHONY)
-- 
2.43.0


