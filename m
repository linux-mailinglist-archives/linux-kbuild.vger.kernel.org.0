Return-Path: <linux-kbuild+bounces-7417-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 006BAAD1FDB
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 15:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F8283B0357
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 13:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77B413CF9C;
	Mon,  9 Jun 2025 13:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xl6BWzI1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4148BFF;
	Mon,  9 Jun 2025 13:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476824; cv=none; b=An67D/sMLj30hm/2CmHKMSAD1j/H844l7Pm3fICnw+dZX5x8I2GdmsS7RZ8u7lg6q5+3JtMH8AyVu3VqHSVxTs5bOGw22puWKOE0vLM+o7Onf8Ljy4Vtg9YqGUerMUG9V3lDSjKtpxHIZVu/JyHZEGAAay12INFlSdkPXAdOaxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476824; c=relaxed/simple;
	bh=qrZpZsMrsU1gfoQb0W7EnINpdzrBuhVDdB9nntc+yHM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GoT+D86ghOIHs7cix3JDolZcmlBMv7+npzPvBL9SWBajZpo3EjKSbhimEwkv4RR2L3/x+gMUOjSyIFcrVjdtYLS9fIvsuBSeqcPnEsNHbcCAZeRGhz6kj2Cp0qVrmiMWkXUg+zsJcozO77Gci7baN7pyudPN0zsLuPKTekt/i4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xl6BWzI1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A93C4CEEB;
	Mon,  9 Jun 2025 13:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749476824;
	bh=qrZpZsMrsU1gfoQb0W7EnINpdzrBuhVDdB9nntc+yHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xl6BWzI1V7sML4quOPwfSBAdFqC5Vejah1LJEoQCoBqPRMUP7z4tOGJ7r+FZvZGe9
	 DeKkWWUbu6OxeURd24oTuqfOw+Gf3U97wl5vNFQuWBCXTiziWaA45C885GpZCVWgQT
	 7HYXvIqQsds7SKtnoEmjCC3+eq+7pHhsrZ8AmVB/QAFUm5IhbL1iW8m1jh1t31bPlF
	 RtrYeDER9ETRQPAZkhJR+G/t87xjGhrxay68IiOUrKWFDjfGhC4+HozuS3cAcjT39i
	 E/IauLv2j5trMOlADsxcX6NoZ23EKyMdeQv368MxCHIj8/LDn9sJa3tglKtqPQ4k//
	 voPGS6UNcWOoA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 6.6 06/18] um: Add cmpxchg8b_emu and checksum functions to asm-prototypes.h
Date: Mon,  9 Jun 2025 09:46:40 -0400
Message-Id: <20250609134652.1344323-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609134652.1344323-1-sashal@kernel.org>
References: <20250609134652.1344323-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.93
Content-Transfer-Encoding: 8bit

From: Sami Tolvanen <samitolvanen@google.com>

[ Upstream commit 674d03f6bd6b0f8327f1a4920ff5893557facfbd ]

With CONFIG_GENDWARFKSYMS, um builds fail due to missing prototypes
in asm/asm-prototypes.h. Add declarations for cmpxchg8b_emu and the
exported checksum functions, including csum_partial_copy_generic as
it's also exported.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503251216.lE4t9Ikj-lkp@intel.com/
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Link: https://patch.msgid.link/20250326190500.847236-2-samitolvanen@google.com
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES**

This commit should be backported to stable kernel trees based on the
following analysis:

## Analysis

### Purpose and Context
This commit fixes a build failure in the User Mode Linux (UM)
architecture when `CONFIG_GENDWARFKSYMS` is enabled. The
`CONFIG_GENDWARFKSYMS` feature is a new kernel build system enhancement
for generating DWARF-based symbol versioning, which requires proper
prototypes in `asm-prototypes.h` files to generate correct CRCs for
exported symbols.

### Code Changes Analysis

**File 1: `arch/um/include/asm/asm-prototypes.h`**
- **Before**: Only included the generic asm-prototypes.h
- **After**: Added includes for `<asm/checksum.h>` and conditional
  declaration of `cmpxchg8b_emu()` for `CONFIG_UML_X86`

**File 2: `arch/x86/um/asm/checksum.h`**
- **Before**: Only declared `csum_partial()` function
- **After**: Added declaration for `csum_partial_copy_generic()` with a
  comment explaining it's for export type visibility

### Why This Should Be Backported

1. **Fixes Important Build Failures**: This directly addresses build
   failures when `CONFIG_GENDWARFKSYMS` is enabled for UM architecture,
   as confirmed by the kernel test robot report.

2. **Minimal Risk Changes**:
   - Only adds function declarations, no implementation changes
   - Changes are confined to UM architecture headers
   - No behavioral changes to existing code paths

3. **Follows Established Patterns**: Similar commits in the reference
   history (Similar Commit #1 and #5) that add missing prototypes to
   `asm-prototypes.h` files were marked as "YES" for backporting. This
   follows the exact same pattern.

4. **Critical Infrastructure Fix**: The `asm-prototypes.h`
   infrastructure is essential for proper symbol versioning. Missing
   prototypes can cause genksyms to segfault during build, making this a
   critical build system fix.

5. **Architecture-Specific Scope**: Changes are limited to UM
   architecture, reducing risk of regressions in other subsystems.

6. **Self-Contained**: The fix includes both the missing `cmpxchg8b_emu`
   prototype (conditional on `CONFIG_UML_X86`) and the checksum function
   declarations, making it complete.

### Comparison to Reference Commits
- **Similar to Commit #1**: Adds missing prototypes for genksyms CRC
  generation (Status: YES)
- **Similar to Commit #5**: Fixes missing prototypes causing build
  issues with symbol versioning (Status: YES)
- **Unlike Commits #2, #3, #4**: This is not just a comment update or
  cleanup, but fixes actual build failures

The fix addresses a concrete build failure affecting users who enable
`CONFIG_GENDWARFKSYMS` with UM, making it an important bugfix that meets
stable tree criteria for backporting.

 arch/um/include/asm/asm-prototypes.h | 5 +++++
 arch/x86/um/asm/checksum.h           | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/arch/um/include/asm/asm-prototypes.h b/arch/um/include/asm/asm-prototypes.h
index 5898a26daa0dd..408b31d591279 100644
--- a/arch/um/include/asm/asm-prototypes.h
+++ b/arch/um/include/asm/asm-prototypes.h
@@ -1 +1,6 @@
 #include <asm-generic/asm-prototypes.h>
+#include <asm/checksum.h>
+
+#ifdef CONFIG_UML_X86
+extern void cmpxchg8b_emu(void);
+#endif
diff --git a/arch/x86/um/asm/checksum.h b/arch/x86/um/asm/checksum.h
index b07824500363f..ddc144657efad 100644
--- a/arch/x86/um/asm/checksum.h
+++ b/arch/x86/um/asm/checksum.h
@@ -20,6 +20,9 @@
  */
 extern __wsum csum_partial(const void *buff, int len, __wsum sum);
 
+/* Do not call this directly. Declared for export type visibility. */
+extern __visible __wsum csum_partial_copy_generic(const void *src, void *dst, int len);
+
 /**
  * csum_fold - Fold and invert a 32bit checksum.
  * sum: 32bit unfolded sum
-- 
2.39.5


