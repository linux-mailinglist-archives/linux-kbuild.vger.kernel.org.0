Return-Path: <linux-kbuild+bounces-7416-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A660AD1FB8
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 15:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 196A13A54AA
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 13:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A082580CC;
	Mon,  9 Jun 2025 13:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tpql7AYl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E544258CE8;
	Mon,  9 Jun 2025 13:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476787; cv=none; b=FAV0Bvq1SSQvGwvAgoHyc5bIIMlEYqwwgTps+QS8XaLKTMDGxTjIouG1xdVGAX9JKyb1EZ3lbyImQ73zp/cppytnsdRrDPVWE4fdF4ZoAp+Res/Bfdkcb1/bbD/xZlEokdo3DY8lDHppB6MRJjYW1iRW5CBuniertO0vLjqDJjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476787; c=relaxed/simple;
	bh=qrZpZsMrsU1gfoQb0W7EnINpdzrBuhVDdB9nntc+yHM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iXvCGFqneUrf6+b2hjZwxXoyqn2IofYGIaI9uosVr+qzgB5RYzJXfoeZNQbVmWnnErnzQh+adniWtr/GCfH5MyXaYKyI9Cww9If4Fiys6HYbcB+wVv+5P0uZH5OvSp60dmcuTzi+urb9rIDeAXA6B/vghzl9rCPbdg7eIkQl2Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tpql7AYl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4570CC4CEED;
	Mon,  9 Jun 2025 13:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749476787;
	bh=qrZpZsMrsU1gfoQb0W7EnINpdzrBuhVDdB9nntc+yHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tpql7AYl9cSAsIwlcDzqZ936LzjmDgvyQHu8rjYT3o7Gg/imVtBlxThb2yE9rqREU
	 n9F2RY9Sqw/EQQMTZDrVQ0RU61vVqPpIIgCchMLVXQGYMDQrw29SMgpWKbgYsx9bJX
	 PjX2rgr/waOV4daXUqTV56eIFPTIzq2rspAi+r0SoX3Rb6b7jxn/PcyLuK6SQ8yAsa
	 //c6fYnoPbj8Fsqb4fhys3aprW5DOnV5ZU4Rpxt8YiNxzHbILpGBu7yKX/Uao61ewu
	 UyslQzD9C7tB1EsafrKAkv3qMdcSCJpMEoAcsyQIbOWrZaNYcqRSi65AHJ7MbqwI6+
	 0XVInKzWJCkSA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 6.12 09/23] um: Add cmpxchg8b_emu and checksum functions to asm-prototypes.h
Date: Mon,  9 Jun 2025 09:45:56 -0400
Message-Id: <20250609134610.1343777-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609134610.1343777-1-sashal@kernel.org>
References: <20250609134610.1343777-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.32
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


