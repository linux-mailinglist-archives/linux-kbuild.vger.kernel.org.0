Return-Path: <linux-kbuild+bounces-8332-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0957CB1F76A
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Aug 2025 02:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15B5B17CBF3
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Aug 2025 00:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18AB4A1A;
	Sun, 10 Aug 2025 00:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5xt4tWU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67741B95B;
	Sun, 10 Aug 2025 00:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754785290; cv=none; b=aM4rOLcgbMMTKuARbGXDqwiT6g27Wxri7Pgp5ExAq5peSp87yoLmrK+I2BAoLz7qoIPPUYpaiMCcNdgW0kOHsnp/L24vjTSpoOkcku3HUFSoxYJCcLb2yi70Bp94uXtBn0spGp0SUk8noCzQa+Qj24PNrqFDGq2eIK6ke1PEREU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754785290; c=relaxed/simple;
	bh=9xzGAtpdNWcvjhR24Iy0bjkoFB8aCfSn9+it/U6QrsU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IVlPB2ruiRTA7P1GZUoySnCxrNZSwvgDTdSyHvcZugVlP7gmQmqAKoW+Y84QfkVjzGDDAxBYmDeA4wNU1M5yl9xjmOOgwkgFnBTCSFutveayaG5tg6fZlz0XU8W8/CSpbFc+nCoSUjHg2YzoH2jEDIKS9lsjJQ/PT1ua33qdPAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5xt4tWU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC956C4CEF1;
	Sun, 10 Aug 2025 00:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754785290;
	bh=9xzGAtpdNWcvjhR24Iy0bjkoFB8aCfSn9+it/U6QrsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D5xt4tWU8f41YFzXmTbE847jBw3EdZC/XoD2/BbUm9RlUksAi1gLC55YaBEUNH2CQ
	 8sEkCry1QjGSx8/Pj0mVG8c5FuqJV/eZOwoqoEn8X+npzaBlpMc8ZeLZ1CU7sLKnZ1
	 F5uHaALvxjKEJtF9xvHRKKNpSlF+hWdhQJTYxbSlXqDUGuv9ccBgp5M2kFtqxbhqGI
	 DctqHDdb1Jq+zg82S/ThSE3lcHSJbAyLS89oPvDA9gYZft85lw6pWY153dFPATkQ+0
	 D5WlgobdDBgp5p1IhuCaIyfkg4dIilRQAuofIokk9B7X23+t9FgSCIjEPh4yt4aMK5
	 AMginQf7RqXGQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Shankari Anand <shankari.ak0208@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nicolas Schier <n.schier@avm.de>,
	Sasha Levin <sashal@kernel.org>,
	nicolas.schier@linux.dev,
	thorsten.blum@linux.dev,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.4] kconfig: nconf: Ensure null termination where strncpy is used
Date: Sat,  9 Aug 2025 20:20:59 -0400
Message-Id: <20250810002104.1545396-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250810002104.1545396-1-sashal@kernel.org>
References: <20250810002104.1545396-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit

From: Shankari Anand <shankari.ak0208@gmail.com>

[ Upstream commit f468992936894c9ce3b1659cf38c230d33b77a16 ]

strncpy() does not guarantee null-termination if the source string is
longer than the destination buffer.

Ensure the buffer is explicitly null-terminated to prevent potential
string overflows or undefined behavior.

Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Nicolas Schier <n.schier@avm.de>
Acked-by: Nicolas Schier <n.schier@avm.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit is a clear security/safety fix that should be backported to
stable kernel trees. Here's my detailed analysis:

## Code Changes Analysis

The commit adds explicit null termination after `strncpy()` calls in two
locations:

1. **scripts/kconfig/nconf.c** (line ~596):
   - After copying with `strncpy(k_menu_items[index].str, tmp_str,
     sizeof(k_menu_items[index].str))`
   - Adds: `k_menu_items[index].str[sizeof(k_menu_items[index].str) - 1]
     = '\0';`

2. **scripts/kconfig/nconf.gui.c** (line ~361):
   - After copying with `strncpy(result, init, *result_len)`
   - Adds: `result[*result_len - 1] = '\0';`

## Why This Should Be Backported

1. **Bug Fix**: This fixes a genuine security issue where `strncpy()`
   does not guarantee null-termination if the source string equals or
   exceeds the destination buffer size. This can lead to:
   - Buffer overruns when the string is later used
   - Information disclosure (reading past buffer boundaries)
   - Potential crashes or undefined behavior

2. **Small and Contained**: The fix is minimal - just two single-line
   additions that ensure null termination. No architectural changes or
   new features.

3. **Low Risk**: The changes are straightforward defensive programming
   practices that cannot introduce regressions. They only ensure strings
   are properly terminated.

4. **Security Impact**: String handling bugs are a common source of
   security vulnerabilities. While kconfig tools are build-time
   utilities (not runtime kernel code), they process user-provided
   configuration data and should handle strings safely.

5. **Meets Stable Criteria**:
   - Fixes a real bug (improper string termination)
   - Minimal change (2 lines added)
   - Obviously correct (standard C string safety practice)
   - No new functionality

6. **Testing**: The commit has been tested by multiple developers (Randy
   Dunlap, Nicolas Schier) and acked by them, indicating confidence in
   the fix.

The defensive null-termination pattern after `strncpy()` is a well-
established best practice in C programming to prevent string-related
bugs. This type of fix is exactly what stable kernels should include to
improve reliability and security without introducing new risks.

 scripts/kconfig/nconf.c     | 2 ++
 scripts/kconfig/nconf.gui.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index c0b2dabf6c89..ae1fe5f60327 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -593,6 +593,8 @@ static void item_add_str(const char *fmt, ...)
 		tmp_str,
 		sizeof(k_menu_items[index].str));
 
+	k_menu_items[index].str[sizeof(k_menu_items[index].str) - 1] = '\0';
+
 	free_item(curses_menu_items[index]);
 	curses_menu_items[index] = new_item(
 			k_menu_items[index].str,
diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 4bfdf8ac2a9a..7206437e784a 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -359,6 +359,7 @@ int dialog_inputbox(WINDOW *main_window,
 	x = (columns-win_cols)/2;
 
 	strncpy(result, init, *result_len);
+	result[*result_len - 1] = '\0';
 
 	/* create the windows */
 	win = newwin(win_lines, win_cols, y, x);
-- 
2.39.5


