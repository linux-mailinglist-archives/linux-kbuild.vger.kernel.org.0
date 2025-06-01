Return-Path: <linux-kbuild+bounces-7327-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC68ACA2FC
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 01:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23C513B509D
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Jun 2025 23:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC0D2750F4;
	Sun,  1 Jun 2025 23:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYkLCa6n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CF6274FFE;
	Sun,  1 Jun 2025 23:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748820515; cv=none; b=O/f54mMlzzDKGb2bBgYPgpf2U9kEJz9qHlvgRjLE0kIIwAVtpmAwhwRdCyLOok2yJlNh91G4j3zoUSPM8G073f3Mw17kDXyNl1JPV3wBqaStg+iAAsVryTvZUVzmK9P8hHtlr+Npck7WLjeytJyzAYVxUuWLVzXjEzc4Wj5UMoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748820515; c=relaxed/simple;
	bh=1OpoCkRr6BC9qCOnxaGS+YPLqFvSBlTD/iYfkFoENqY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hImodnn/Y6lHexBbR/4NX+e0lr9R7wo2rtLfFDvGBjehzrakfkou3zfHqhq8bzc3qYUsja97Hvzw0LAg/qNPuygrWA0d9gwprahtJlacEj5exHWuIxSrspmNAEzu/oiewIDTdQY5Yf37ZF2S4+P8aIAVNvbGA8u46WXKjHSTYns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYkLCa6n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC2CC4CEE7;
	Sun,  1 Jun 2025 23:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820515;
	bh=1OpoCkRr6BC9qCOnxaGS+YPLqFvSBlTD/iYfkFoENqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iYkLCa6n+Pn4V9jCdWTZ3JrDQsE7FNjHSLTN5V5zaDjIE1iyPR/YoICDqfw0ERrT9
	 W0rBKwEiG55akD9NwdTwFX/Si7EqmRAnsHg7ZG53i1Gx0y7nTLG6orrlUo2cc42oeQ
	 oZNuo7pSWCeyMA5UVzDluhfiFN19xNJjLBlVuPgupFTadKa4WQFKxYCyr/mu7Gc6yj
	 8iOSWClMLsoHWXm10H24v3gv6Tb8CBDEqnzo3EDCbtMB1DcKwvfJYOnGzwoaPM1vrJ
	 vhmbDsfV9oTaHqYBMyEzVEqfe3iL/xnnEgd4TZNlvlHeUV5zrRT+loHn/FeLuNBjS0
	 17nbmMmk7CHWg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 080/110] Make 'cc-option' work correctly for the -Wno-xyzzy pattern
Date: Sun,  1 Jun 2025 19:24:02 -0400
Message-Id: <20250601232435.3507697-80-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232435.3507697-1-sashal@kernel.org>
References: <20250601232435.3507697-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Transfer-Encoding: 8bit

From: Linus Torvalds <torvalds@linux-foundation.org>

[ Upstream commit 550ccb178de2f379f5e1a1833dd6f4bdafef4b68 ]

This is the follow-up to commit a79be02bba5c ("Fix mis-uses of
'cc-option' for warning disablement") where I mentioned that the best
fix would be to just make 'cc-option' a bit smarter, and work for all
compiler options, including the '-Wno-xyzzy' pattern that it used to
accept unknown options for.

It turns out that fixing cc-option is pretty straightforward: just
rewrite any '-Wno-xyzzy' option pattern to use '-Wxyzzy' instead for
testing.

That makes the whole artificial distinction between 'cc-option' and
'cc-disable-warning' go away, and we can happily forget about the odd
build rule that you have to treat compiler options that disable warnings
specially.

The 'cc-disable-warning' helper remains as a backwards compatibility
syntax for now, but is implemented in terms of the new and improved
cc-option.

Acked-by: Masahiro Yamada <masahiroy@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Weißschuh <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

I can see an example of the problem on line 48: `-Wno-sign-compare` is
being added directly instead of using `cc-disable-warning`. Now let me
analyze the specific changes in the commit to understand what the fix
does. Based on my analysis of the commit "Make 'cc-option' work
correctly for the -Wno-xyzzy pattern", here is my assessment: **YES**
This commit should be backported to stable kernel trees. Here's my
detailed analysis: ## Analysis of the Code Changes The commit makes a
crucial fix to the `cc-option` and `cc-disable-warning` functions in
`scripts/Makefile.compiler`. The key changes are: 1. **In `__cc-option`
function (line 45)**: Changed from: ```makefile $(1) -Werror $(2) $(3)
-c -x c /dev/null -o "$$TMP",$(3),$(4) ``` to: ```makefile $(1) -Werror
$(2) $(3:-Wno-%=-W%) -c -x c /dev/null -o "$$TMP",$(3),$(4) ``` 2. **In
`cc-disable-warning` function (line 60)**: Simplified from: ```makefile
cc-disable-warning = $(if $(call cc-option,-W$(strip $1)),-Wno-$(strip
$1)) ``` to: ```makefile cc-disable-warning = $(call cc-
option,-Wno-$(strip $1)) ``` ## Why This Should Be Backported ### 1.
**Fixes a Fundamental Build System Bug** The bug is that GCC silently
accepts unknown `-Wno-*` options and only warns about them when there
are other warnings in the source. This means `cc-option` would
incorrectly return "supported" for unsupported warning disable flags,
leading to build warnings that shouldn't exist. ### 2. **Improves Build
System Reliability** The fix ensures that build-time compiler feature
detection works correctly across all supported compiler versions,
preventing spurious warnings that could confuse developers and automated
build systems. ### 3. **Minimal Risk of Regression** - The change is
contained to the build system macros - It makes the behavior more
correct rather than changing functionality - The fix is elegant: it
transforms `-Wno-xyzzy` to `-Wxyzzy` for testing, then uses the original
form if supported - No actual kernel code is affected, only the build
logic ### 4. **Affects Critical Infrastructure Code** From my
examination of the kernel repository, `cc-disable-warning` and `cc-
option` are used extensively throughout the kernel build system. The fix
ensures these fundamental macros work correctly across all architectures
and configurations. ### 5. **Follows Stable Tree Criteria** -
**Important bug fix**: Yes, fixes incorrect compiler option detection -
**Minimal risk**: Yes, only changes build macros, no functional code
changes - **Contained scope**: Yes, limited to
`scripts/Makefile.compiler` - **No architectural changes**: Correct,
just fixes existing functionality ### 6. **Historical Precedent**
Looking at the similar commits provided, commits that fix build system
issues and compiler option handling (like the similar commits marked
"NO" but for different reasons) are generally good candidates when they
fix fundamental problems rather than just optimization cleanups. The
commit addresses a real problem where the build system could accept
invalid compiler options, leading to confusing warnings. This type of
fundamental correctness fix is exactly what stable trees are meant to
include.

 scripts/Makefile.compiler | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index f4fcc1eaaeaee..65cfa72e376be 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -43,7 +43,7 @@ as-instr = $(call try-run,\
 # __cc-option
 # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
 __cc-option = $(call try-run,\
-	$(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
+	$(1) -Werror $(2) $(3:-Wno-%=-W%) -c -x c /dev/null -o "$$TMP",$(3),$(4))
 
 # cc-option
 # Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
@@ -57,7 +57,7 @@ cc-option-yn = $(if $(call cc-option,$1),y,n)
 
 # cc-disable-warning
 # Usage: cflags-y += $(call cc-disable-warning,unused-but-set-variable)
-cc-disable-warning = $(if $(call cc-option,-W$(strip $1)),-Wno-$(strip $1))
+cc-disable-warning = $(call cc-option,-Wno-$(strip $1))
 
 # gcc-min-version
 # Usage: cflags-$(call gcc-min-version, 70100) += -foo
-- 
2.39.5


