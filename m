Return-Path: <linux-kbuild+bounces-9385-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F69DC2D93B
	for <lists+linux-kbuild@lfdr.de>; Mon, 03 Nov 2025 19:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68F6918990B7
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Nov 2025 18:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393F8313273;
	Mon,  3 Nov 2025 18:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkFyHOqZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC9D199230;
	Mon,  3 Nov 2025 18:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762193007; cv=none; b=s/OM39JZeGotEKjW84/RySIYOu987sUsTNapVjukp4xrq6BjLDpHUOODQS7bBTOI2sMnWdJfTTYFhXRP8keVdIfBOuwI72nv0KKafh0MeZIeu5VGde610h3m/trvB0lUnMN7yu9VNu1zl+D83SvfmFDcfngj8Bt/AR+P5nIRbLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762193007; c=relaxed/simple;
	bh=UL8Js49huRx7aT4gp/I4Ht+cvGv/co458eSlIZFYkRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZX4hvYeKdQ/8jsZDaVvxdLV9YR5WpuCIgC5KGgw/+soODbRRzh5klxPCct7PeteMr5seU79QPEbndKSPKVRBCbIhpt1XShQfp4YyTyImWyuqsDzS5gofv4+XAfESjuW8hBhKkiA0IgeQSYhDF8c1YIy1C476oUmow8AOLpeIPuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkFyHOqZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B18C4CEE7;
	Mon,  3 Nov 2025 18:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762193006;
	bh=UL8Js49huRx7aT4gp/I4Ht+cvGv/co458eSlIZFYkRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lkFyHOqZdOj/xDaP5JCI6P6etqjVHMZetVPPbr27e9XRl4yATkgTiE3YiyN2ZqnKG
	 6MeHT0/dJTAkdEOdJV/cLCDUDIIa20lePqd2TfaNJEr5LSHVDKUiFcxg7DfEqLH+L5
	 SS34xFBYR/nxw8sH74I6jY9CJOnqePrg2ii91JlnV4vBKF590ls5Fi0tWwUzB+RZ1q
	 Ys395tNcVrKA3mxAQFsDkUiZ1iTfV3fa1JCyZesRik4f9oVv8LQI2Tcm9nXWQZNgXz
	 rXdgJyT3pQupdTUWu18Y/66B9+yBQ3dVSdUJSaeKRYy2FNS5Pw/tcghH3tUxSYi8ay
	 bZX+G+EINiooA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Jakub=20Hork=C3=BD?= <jakub.git@horky.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	nsc@kernel.org,
	alexandre.f.demers@gmail.com,
	alexander.deucher@amd.com,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.4] kconfig/mconf: Initialize the default locale at startup
Date: Mon,  3 Nov 2025 13:02:32 -0500
Message-ID: <20251103180246.4097432-19-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103180246.4097432-1-sashal@kernel.org>
References: <20251103180246.4097432-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.7
Content-Transfer-Encoding: 8bit

From: Jakub Horký <jakub.git@horky.net>

[ Upstream commit 3927c4a1084c48ef97f11281a0a43ecb2cb4d6f1 ]

Fix bug where make menuconfig doesn't initialize the default locale, which
causes ncurses menu borders to be displayed incorrectly (lqqqqk) in
UTF-8 terminals that don't support VT100 ACS by default, such as PuTTY.

Signed-off-by: Jakub Horký <jakub.git@horky.net>
Link: https://patch.msgid.link/20251014154933.3990990-1-jakub.git@horky.net
[nathan: Alphabetize locale.h include]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my comprehensive analysis of this commit and the kernel
repository, here is my determination:

## **Backport Status: YES**

### Analysis Summary

**Tools Used:**
- Git history analysis (git log, git show, git branch)
- File examination (Read tool on mconf.c and nconf.c)
- Web search for ncurses locale initialization patterns
- Repository comparison across branches

**Key Findings:**

### 1. **Code Change Analysis**
The commit adds just 2 lines of code:
- `setlocale(LC_ALL, "");` in the main() function before init_dialog()
- `#include <locale.h>` header (alphabetically ordered)

This is placed at scripts/kconfig/mconf.c:932, immediately after signal
handler setup and before any ncurses initialization.

### 2. **Bug Impact Assessment**
- **Scope**: Affects `make menuconfig` display in UTF-8 terminals
  (PuTTY, and others that don't support VT100 ACS by default)
- **Symptom**: Menu borders appear as "lqqqqk" instead of proper box-
  drawing characters
- **User Impact**: Degrades usability for kernel developers/users
  configuring kernels in affected terminals
- **Severity**: Non-critical but user-visible cosmetic/usability issue

### 3. **Risk Analysis**
**Extremely Low Risk:**
- This is build-time tooling only - does NOT affect kernel runtime
  behavior
- Standard ncurses programming pattern (documented in ncurses best
  practices)
- No dependencies on other kernel subsystems
- setlocale() is a standard POSIX C library function with well-defined
  behavior
- Change is isolated to menuconfig tool's main() function

### 4. **Companion Commit Evidence**
Critical finding: The companion fix for nconfig (commit 43c2931a95e6b)
**has already been backported** to 6.17 stable as commit 707f0e1262828,
signed-off by Sasha Levin on Nov 2, 2025. Both fixes address the
**identical issue** in parallel tools (mconf vs nconf).

**Inconsistency**: Having nconf fixed but not mconf creates an asymmetry
where `make nconfig` displays correctly but `make menuconfig` still has
broken borders.

### 5. **Backport Precedent**
Found evidence of similar kconfig/scripts fixes being backported:
- "kconfig: nconf: Ensure null termination where strncpy is used"
  (multiple stable backports)
- Other build system fixes when they affect user-visible behavior

### 6. **Stable Tree Compliance**
Checking against stable kernel rules:
- ✅ **Bug fix**: Yes - fixes incorrect display behavior
- ✅ **Important**: Yes - affects common developer workflow
- ✅ **Small change**: Yes - only 2 lines + include
- ✅ **Low risk**: Yes - build tooling only, standard pattern
- ✅ **Self-contained**: Yes - no dependencies
- ❌ **Security fix**: No
- ❌ **Regression fix**: No - longstanding bug
- ⚠️ **Stable tag**: No explicit "Cc: stable@vger.kernel.org" in
  original commit

### 7. **Backport Status**
The mconf fix has already been **prepared for backport** as commit
9ee168ca1754b (signed-off by Sasha Levin) and exists in
remotes/build/linus-next, but has not yet been merged into the 6.17
stable HEAD (7660ce69123ea).

### Recommendation Rationale:

**YES - This commit should be backported because:**

1. **Consistency**: The nconf companion fix is already backported; not
   backporting mconf creates an inconsistent user experience
2. **User Impact**: Improves usability for developers configuring
   kernels in common terminal emulators
3. **Zero Risk**: Build-time only, standard locale initialization, no
   runtime kernel impact
4. **Clean Application**: Should apply cleanly to all stable trees
   (verified against 6.17)
5. **Precedent**: Already prepared by stable maintainer (Sasha Levin
   signed-off 9ee168ca1754b)
6. **Simplicity**: Minimal 2-line change following best practices

**Stable kernel rule alignment:** This is a straightforward bug fix that
improves user-visible behavior with minimal code change and zero risk to
kernel runtime. While not critical, it meets the stable tree criteria of
being "important enough" to fix a common usability issue affecting
kernel developers.

 scripts/kconfig/mconf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 84ea9215c0a7e..b8b7bba84a651 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -12,6 +12,7 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <limits.h>
+#include <locale.h>
 #include <stdarg.h>
 #include <stdlib.h>
 #include <string.h>
@@ -931,6 +932,8 @@ int main(int ac, char **av)
 
 	signal(SIGINT, sig_handler);
 
+	setlocale(LC_ALL, "");
+
 	if (ac > 1 && strcmp(av[1], "-s") == 0) {
 		silent = 1;
 		/* Silence conf_read() until the real callback is set up */
-- 
2.51.0


