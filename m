Return-Path: <linux-kbuild+bounces-4528-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 018819BF311
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 17:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 330A71C21137
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 16:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B83A2022FA;
	Wed,  6 Nov 2024 16:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pps9zq+W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B6F1E04AC;
	Wed,  6 Nov 2024 16:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730909929; cv=none; b=QCKG8wsyLpEwDKXXzPpSX5UUXE32Njb5yYGCBn+sVhMj5IcQHsprKH+eeEDFV4dqCOPgrwN8J1avUHhTC334ecFkczSDjjEylkk7cblJ6fVMqsVP3SgV3xfKwJv+VENhfxU3e3alMwx78OlaM3d7Eiyd4vntSRTRs6N8nZ4A7vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730909929; c=relaxed/simple;
	bh=k9tWT/FSzffihY/db8sVNhdySykmh+eiRYELPcAcGv0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L5K4XH4QLcbp2z2WK7H6pGHSY0PUmDpUuHXzeD5QGy4by34/johI4ovSBHrcuv5odn5X+XTyggugS1mTYpC4frTfyNQwvkVGnxY6550CRXzzHGTD//W+AmZhKDpQrzbO8zHUS/Wg5EjFUARGOyUMoavHB7ya/pOl1GoVW8XzR3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pps9zq+W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683E1C4CECC;
	Wed,  6 Nov 2024 16:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730909929;
	bh=k9tWT/FSzffihY/db8sVNhdySykmh+eiRYELPcAcGv0=;
	h=From:To:Cc:Subject:Date:From;
	b=Pps9zq+WRch8jkV0Z7gLVcexSVBgAgisGb5VAGMjBVPR9d4XIzTYwn0XXZThthFJD
	 ZTPmjf++A7zkiS74tE0BmAhNSZdTKi9TtfUg3G1s0n1s1HgMS8hbupXxMdWrn3D77v
	 wE1wlicpwm5nOsVlnGD/incgvgWUQ5m8bmM+bmJokxARm4ByogbAPX6GerkfoPkvin
	 VfuQcxUCywxD7H/ZquHOFrNuiECSFFfitNiQKepow96+FgAkV2pKGtIboWGx2Y0tgH
	 umYstO4Dgv39fBaQh1t63/8VyPM4xjh/UDSTaa1vvHlZhBa+Oggj48JtlQLSCYQO2/
	 PlsnKQQFRbJbw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
Cc: linux-kbuild@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: fix .data.rel.ro size assertion when CONFIG_LTO_CLANG
Date: Thu,  7 Nov 2024 01:18:42 +0900
Message-ID: <20241106161843.189927-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit be2881824ae9 ("arm64/build: Assert for unwanted sections")
introduced an assertion to ensure that the .data.rel.ro section does
not exist.

However, this check does not work when CONFIG_LTO_CLANG is enabled,
because .data.rel.ro matches the .data.[0-9a-zA-Z_]* pattern in the
DATA_MAIN macro.

Move the ASSERT() above the RW_DATA() line.

Fixes: be2881824ae9 ("arm64/build: Assert for unwanted sections")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arm64/kernel/vmlinux.lds.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 58d89d997d05..f84c71f04d9e 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -287,6 +287,9 @@ SECTIONS
 	__initdata_end = .;
 	__init_end = .;
 
+	.data.rel.ro : { *(.data.rel.ro) }
+	ASSERT(SIZEOF(.data.rel.ro) == 0, "Unexpected RELRO detected!")
+
 	_data = .;
 	_sdata = .;
 	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_ALIGN)
@@ -343,9 +346,6 @@ SECTIONS
 		*(.plt) *(.plt.*) *(.iplt) *(.igot .igot.plt)
 	}
 	ASSERT(SIZEOF(.plt) == 0, "Unexpected run-time procedure linkages detected!")
-
-	.data.rel.ro : { *(.data.rel.ro) }
-	ASSERT(SIZEOF(.data.rel.ro) == 0, "Unexpected RELRO detected!")
 }
 
 #include "image-vars.h"
-- 
2.43.0


