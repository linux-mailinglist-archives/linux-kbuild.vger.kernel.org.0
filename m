Return-Path: <linux-kbuild+bounces-7058-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19763AB151C
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 15:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 626204C5B23
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 13:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24990289E01;
	Fri,  9 May 2025 13:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JxwG/8us"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F2A21E0BA;
	Fri,  9 May 2025 13:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746797094; cv=none; b=ty+vQpJu2GmTzeNqtWjhTSlpUfiG8OS/z610x7l9VFdfudBRSZslH1ouyzVlU3G7t925Eh8FLGNqnl0dSQBCoeAPS6FGuIv4FUjnzaGINF/TX3Y5dE7rkmcfq25y7IRLf5xBgKvUnfGSosbF1AJNYneRIfp1ZGI/hj1MOFWnPW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746797094; c=relaxed/simple;
	bh=//9lzpVGgJgH5dckdFT6lkdeWW64NUaL8R3hWQGXwzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=au8fESlKdIgIhwMuBM26Zd/3h+tVzQt7kV6wYg7X578dspW3cLCkidgEQr3svlMibYePIX1SFKU2NULuGiruNldTDQ3ftzDdlZYjnSAURrzHvUzql5i2mbQu5mdwvvF04Wz1KcjUk09FTSdvgxXMYpZVCdLkDQ20sqt4gZlDyAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JxwG/8us; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B2FC4CEE4;
	Fri,  9 May 2025 13:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746797093;
	bh=//9lzpVGgJgH5dckdFT6lkdeWW64NUaL8R3hWQGXwzE=;
	h=From:To:Cc:Subject:Date:From;
	b=JxwG/8uszPd6sAEOzeGB3+jP/3WgjLhRjzMDz/BfTv+/hCP+sXVI1ie0zK6reNBAK
	 IEQOmh/P22oEHvjJ6vpffUVB2bvz8byqi3J2Klv5UpKPRgcad94yax6sn+WSNxQfWn
	 3bPgty1YZZ66ETkHeS/h3u6zAXGZlsoTgKOyGxoN+UX3mnzidKmCiAedZWNyYAEyLl
	 zamRanOfjc2bMCGJsoz3DHPzT+SmSHfUHajbO9/MIhtpAJ3SxpWzyOyBd24O5Qr0jq
	 dnODdxdtswx81T95QlpbHU2ia0XNvFmQKW/G5BjvsnvkdrrgsFRGAssFLpjLiRtKa7
	 pD7BKB0zYWy7Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] init: remove unused CONFIG_CC_CAN_LINK_STATIC
Date: Fri,  9 May 2025 22:23:59 +0900
Message-ID: <20250509132407.2662203-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a leftover from commit 98e20e5e13d2 ("bpfilter: remove bpfilter").

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 init/Kconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 63f5974b9fa6..c5199984d4b1 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -87,11 +87,6 @@ config CC_CAN_LINK
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m32-flag))
 
-config CC_CAN_LINK_STATIC
-	bool
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag) -static) if 64BIT
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m32-flag) -static)
-
 # Fixed in GCC 14, 13.3, 12.4 and 11.5
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921
 config GCC_ASM_GOTO_OUTPUT_BROKEN
-- 
2.43.0


