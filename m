Return-Path: <linux-kbuild+bounces-7415-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED29AD1F5D
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 15:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C1FD16D04B
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 13:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190FD25A2C8;
	Mon,  9 Jun 2025 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGYPsIJa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E130E2459E6;
	Mon,  9 Jun 2025 13:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476735; cv=none; b=uvGr2p3Cg5xjfN/U9+TxopOPq7hNfSSThb23RlZcNNFkABXHXZJIlGc5WbP0290vaKLj1XGvTTTEf9yHxsChIsXmEq5uNqNqXX6khbkn/R5bO6+oSHGJpf3ef2WjRWLzRRqqRYp/0k/ZcsANAP2nSr/3eJS8Tg7pvpDDJLtVzco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476735; c=relaxed/simple;
	bh=qrZpZsMrsU1gfoQb0W7EnINpdzrBuhVDdB9nntc+yHM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kOxlitqiPQLYJZmy76exHvUYHMXYOM+GgPLfPABexF7/58sFrHrsMBka1em5M4+5XUU5BuNgDeEoPkX0sX8EtDq+PgTJKJJa1MMXstQNJ05C/KKakzrfqcEzRsTeZ5SuVTaSc4Pp6czh9K2EkQQiAH9LiT5R7eiOpGT4PVmU7wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGYPsIJa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FBAC4CEEB;
	Mon,  9 Jun 2025 13:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749476734;
	bh=qrZpZsMrsU1gfoQb0W7EnINpdzrBuhVDdB9nntc+yHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eGYPsIJaxeA1ix1f75mufoMmoKZkSYa79NQI27j1tU5R92a2+ZFlAu1ZMaU81iFRS
	 GG0OROhbqWeArfwDxN/vPF9csu3wRDzIr47PwzSof6+HHAZL2V+Ub/YoeIY8kqvI7t
	 Qty+aqeXRlfzTF9IpJ+Fj8CHitKKKiXsJoBpVzCDHsT0rO6PsGmbc8AxlIVXSALNLR
	 TNsvkccl/7Fhdgmv8kDOaWBpPjCv/hhG8lpVpFU59tfJza4xdzCkZbpX9iOlJpTEPv
	 zoA4nZ90vGSzSAYVLT0/XwhZdd9/u6cWpzXdRNZSjaEd4nMQ5T1lwtGrr5A7oVosM5
	 Co55uLOp+U6Lw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 6.14 10/29] um: Add cmpxchg8b_emu and checksum functions to asm-prototypes.h
Date: Mon,  9 Jun 2025 09:44:51 -0400
Message-Id: <20250609134511.1342999-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609134511.1342999-1-sashal@kernel.org>
References: <20250609134511.1342999-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.10
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


