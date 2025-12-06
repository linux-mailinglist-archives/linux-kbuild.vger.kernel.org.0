Return-Path: <linux-kbuild+bounces-10026-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F464CAA7F8
	for <lists+linux-kbuild@lfdr.de>; Sat, 06 Dec 2025 15:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A77BA322787B
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Dec 2025 14:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB0A2FE07B;
	Sat,  6 Dec 2025 14:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTyhVDhy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126EA2FDC56;
	Sat,  6 Dec 2025 14:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765029800; cv=none; b=fXAWI5Us33vfD1vcllFIJS9WglmU2J/VQ9B0zwXS6zPvBoektH1Cnp4O/xzq6BrRJHOJfuarywdsZVu5BwJIRInalq+VOO8Fg53aaRFX8aWbB3z4Y94mlOBPdR5Cp20Uu9qLzH50NEvBg0lHqDCCjAzoP2BFXLZClkzatt8d9n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765029800; c=relaxed/simple;
	bh=NS4Xr1fGxL/eg6tHwlX4g6+yoClMCNZ2LkZ9ME2kvOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B/DLez9OmwPxOHvAHAtLGgG7dqul27Q6tbelB1k0EGLSMWotZCRdxVcZQ4cMqvQc56YfvNoL+/fkdLWv6xB+ut+9vawqYYK8HClQ357uaBBrAsQ3a/SceTT5FAqCwe1jAC38uII5ll99KsiATEy4Fvwh4gxkVLR7vSpvsb3cG6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTyhVDhy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1784EC4CEF5;
	Sat,  6 Dec 2025 14:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765029799;
	bh=NS4Xr1fGxL/eg6tHwlX4g6+yoClMCNZ2LkZ9ME2kvOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OTyhVDhyWaHqQk7zszSMXVzz5etAqXDtW0y6hcdAn/GHnawxMnHCmEjl3czyaNjLx
	 6qZFNjrTLiXGc0V0q6cvPoV0chhEigdTtpM2sgUI1QDsRRyVSznd4hcSBN+YVVlHpA
	 iI9SP3NGq+tmTNGnHedVkAvbJeeEqOmyOmdnnGFhKny8m3BJTjTPsrXeY2vX6WkUfU
	 eMkhxrPHgCUHVBMc4VcHixM4OxtQ+fz/jnRc4oesvKW9GAcR34XOnNw44L237U5rRJ
	 qOmwtRei+o61+juSzAb3XifhA7LZldnA4IAY1fJSOpY9vv8LL41NGY2alLDnIsG+dc
	 A0ABDNACEodHg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Mikhail Malyshev <mike.malyshev@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	alexandre.f.demers@gmail.com,
	torsten.hilbrich@secunet.com,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-6.1] kbuild: Use objtree for module signing key path
Date: Sat,  6 Dec 2025 09:02:17 -0500
Message-ID: <20251206140252.645973-12-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251206140252.645973-1-sashal@kernel.org>
References: <20251206140252.645973-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mikhail Malyshev <mike.malyshev@gmail.com>

[ Upstream commit af61da281f52aba0c5b090bafb3a31c5739850ff ]

When building out-of-tree modules with CONFIG_MODULE_SIG_FORCE=y,
module signing fails because the private key path uses $(srctree)
while the public key path uses $(objtree). Since signing keys are
generated in the build directory during kernel compilation, both
paths should use $(objtree) for consistency.

This causes SSL errors like:
  SSL error:02001002:system library:fopen:No such file or directory
  sign-file: /kernel-src/certs/signing_key.pem

The issue occurs because:
- sig-key uses: $(srctree)/certs/signing_key.pem (source tree)
- cmd_sign uses: $(objtree)/certs/signing_key.x509 (build tree)

But both keys are generated in $(objtree) during the build.

This complements commit 25ff08aa43e37 ("kbuild: Fix signing issue for
external modules") which fixed the scripts path and public key path,
but missed the private key path inconsistency.

Fixes out-of-tree module signing for configurations with separate
source and build directories (e.g., O=/kernel-out).

Signed-off-by: Mikhail Malyshev <mike.malyshev@gmail.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nicolas Schier <nsc@kernel.org>
Link: https://patch.msgid.link/20251015163452.3754286-1-mike.malyshev@gmail.com
Signed-off-by: Nicolas Schier <nsc@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have the complete picture. All stable trees that contain commit
13b25489b6f8 (v6.13+) have the incomplete fix and need this patch. Let
me finalize my analysis:

## Complete Analysis

### 1. COMMIT MESSAGE ANALYSIS

The commit message is clear and well-documented:
- **Subject**: "kbuild: Use objtree for module signing key path" -
  clearly states what it does
- **Body**: Explains the problem with detailed error messages and root
  cause analysis
- **References**: Explicitly mentions commit 25ff08aa43e37 as the
  incomplete fix it complements
- **No Cc: stable@vger.kernel.org tag** - the maintainer did not
  explicitly request stable backport
- **No Fixes: tag** - However, logically this fixes the same issue as
  25ff08aa43e37, which has `Fixes: 13b25489b6f8`
- **Has Reviewed-by and Tested-by tags** from Nicolas Schier and Nathan
  Chancellor

### 2. CODE CHANGE ANALYSIS

The change is a **single character change** (literally changing one
word):

```makefile
# Before:
sig-key := $(if $(wildcard
$(CONFIG_MODULE_SIG_KEY)),,$(srctree)/)$(CONFIG_MODULE_SIG_KEY)

# After:
sig-key := $(if $(wildcard
$(CONFIG_MODULE_SIG_KEY)),,$(objtree)/)$(CONFIG_MODULE_SIG_KEY)
```

**Technical mechanism of the bug:**
1. When building out-of-tree modules with `CONFIG_MODULE_SIG_FORCE=y`
   and separate source/build directories (e.g., `O=/kernel-out`):
   - `$(srctree)` points to the source tree (e.g., `/kernel-src`)
   - `$(objtree)` points to the build tree (e.g., `/kernel-out`)

2. Module signing keys are **generated during kernel compilation** and
   stored in `$(objtree)/certs/`:
   - Private key: `$(objtree)/certs/signing_key.pem`
   - Public key: `$(objtree)/certs/signing_key.x509`

3. After commit 25ff08aa43e37, `cmd_sign` correctly uses
   `$(objtree)/certs/signing_key.x509` for the public key, but `sig-key`
   still uses `$(srctree)/certs/signing_key.pem` for the private key.

4. This creates an **inconsistency**: The `sign-file` tool is called
   with:
   - Private key: `/kernel-src/certs/signing_key.pem` (WRONG - file
     doesn't exist there)
   - Public key: `/kernel-out/certs/signing_key.x509` (CORRECT)

5. Result: `fopen()` fails with "No such file or directory" when trying
   to open the private key.

**Why the fix is correct:**
- Both signing keys are generated in `$(objtree)`, so both paths should
  reference `$(objtree)`
- The fix is logically consistent with what commit 25ff08aa43e37 did for
  the other paths
- The conditional `$(if $(wildcard
  $(CONFIG_MODULE_SIG_KEY)),,$(objtree)/)` only adds the prefix if the
  key path is not absolute, which is correct behavior

### 3. CLASSIFICATION

- **Type**: Bug fix (not a feature)
- **Category**: Build system fix
- **Severity**: Causes complete failure of out-of-tree module signing
  with CONFIG_MODULE_SIG_FORCE=y
- **Security relevance**: Low (doesn't fix a security vulnerability per
  se, but affects security feature - module signing)
- **Exception category**: Build fix - these are explicitly allowed in
  stable

### 4. SCOPE AND RISK ASSESSMENT

- **Lines changed**: 1 line (trivial)
- **Files touched**: 1 file (`scripts/Makefile.modinst`)
- **Complexity**: Extremely simple - just changing `srctree` to
  `objtree`
- **Subsystem**: kbuild (build system)
- **Risk level**: **VERY LOW**
  - Only affects out-of-tree module signing with separate source/build
    directories
  - Only affects configurations with `CONFIG_MODULE_SIG_FORCE=y` or
    `CONFIG_MODULE_SIG_ALL=y`
  - The change is logically correct and consistent with the rest of the
    code
  - Cannot break anything that was working before

### 5. USER IMPACT

- **Who is affected**:
  - Users building out-of-tree modules (e.g., NVIDIA drivers,
    VirtualBox, ZFS)
  - With separate source and build directories (`O=/path/to/build`)
  - With module signature enforcement enabled
- **Severity**: HIGH for affected users - module signing completely
  fails
- **User reports**: The commit message shows this was reported as a real
  user problem with specific error messages
- **Prevalence**: Common scenario for distribution builders and
  enterprise environments

### 6. STABILITY INDICATORS

- **Tested-by: Nicolas Schier** - the kbuild maintainer tested it
- **Reviewed-by: Nathan Chancellor** - well-known kernel developer
  reviewed it
- **Link to patch discussion**: Shows proper review process
- **Age in mainline**: This appears to be a recent commit (October 2025
  in the patch date)

### 7. DEPENDENCY CHECK

**Critical finding**: This commit has a dependency:
- It requires commit **25ff08aa43e37** ("kbuild: Fix signing issue for
  external modules") to be present first
- 25ff08aa43e37 requires commit **13b25489b6f8** ("kbuild: change
  working directory to external module directory with M=")

**Affected stable versions**:
- v6.13.x: Has 13b25489b6f8 (the bug) and backported 25ff08aa43e37
  (partial fix) → **NEEDS this patch**
- v6.14.x: Has both 13b25489b6f8 and 25ff08aa43e37 → **NEEDS this
  patch**
- v6.15.x: Has both → **NEEDS this patch**
- v6.16.x: Has both → **NEEDS this patch**
- v6.17.x: Has both → **NEEDS this patch**
- v6.6.x and older: Does NOT have 13b25489b6f8 → **Does NOT need this
  patch** (and would break if applied)

**Backport note**: This commit should ONLY be backported to stable trees
that already have:
1. Commit 13b25489b6f8 (the original behavior change)
2. Commit 25ff08aa43e37 (the partial fix)

This means v6.13+ stable trees only.

### SUMMARY

This commit is an **excellent candidate for stable backport** to kernel
versions v6.13+:

**Positive factors:**
1. ✅ Fixes a real bug that causes complete failure of module signing
2. ✅ Extremely small change (1 line, 1 word)
3. ✅ Zero risk of regression (only fixes broken behavior)
4. ✅ Properly reviewed and tested by kbuild maintainers
5. ✅ Complements an existing fix that was already backported to stable
6. ✅ Build fix category - explicitly allowed in stable rules
7. ✅ Clear, well-documented commit message
8. ✅ Affects users who follow best practices (separate build directory)

**Concerns:**
1. ⚠️ No explicit `Cc: stable@vger.kernel.org` tag (but the first fix
   also didn't have one and was still backported)
2. ⚠️ No explicit `Fixes:` tag (but logically fixes the same issue as
   25ff08aa43e37)
3. ⚠️ Must only be applied to v6.13+ stable trees (where 13b25489b6f8
   exists)

The commit passes all stable kernel criteria: it's obviously correct,
fixes a real user-visible bug, is small and surgical, has no new
features, and has been tested. The incomplete fix in stable trees is
currently causing module signing to fail for users with separate
source/build directories.

**YES**

 scripts/Makefile.modinst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 1628198f3e830..9ba45e5b32b18 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -100,7 +100,7 @@ endif
 # Don't stop modules_install even if we can't sign external modules.
 #
 ifeq ($(filter pkcs11:%, $(CONFIG_MODULE_SIG_KEY)),)
-sig-key := $(if $(wildcard $(CONFIG_MODULE_SIG_KEY)),,$(srctree)/)$(CONFIG_MODULE_SIG_KEY)
+sig-key := $(if $(wildcard $(CONFIG_MODULE_SIG_KEY)),,$(objtree)/)$(CONFIG_MODULE_SIG_KEY)
 else
 sig-key := $(CONFIG_MODULE_SIG_KEY)
 endif
-- 
2.51.0


