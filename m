Return-Path: <linux-kbuild+bounces-3732-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DE29857F2
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 13:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FE7E1C22DDA
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 11:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106BA12AAC6;
	Wed, 25 Sep 2024 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N20vghRL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99376FDC;
	Wed, 25 Sep 2024 11:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727263538; cv=none; b=UlFQ4XcOiw6fuys48jkJezY55tc8lPkkM1IwbViaFTYUrbEQwCc7rKwKMXsPr8/YhUcNfbe57O2JZ5jeAvMGGqugaYMPOxESq0l/z1WZojm8AQj7epHsv7mpLgN7WX4puCdrXijeIMUiJutYlKRnytTUspweGGbyAx4srdO5kaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727263538; c=relaxed/simple;
	bh=puhxPJH/amOnms7SLF2+4j5c1YRzIKGbh4esV2Il+tA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=keKLVVepb1YABLJkceXTb4xITWnlP0AWk5ltNxMI1lJDtj+Evx3v57yUaEW2tLK/oZFdqP/xqsMx2tEfj5em+ca8CH91v4yWnaUlPiLc1AnZuUp9WUmybr3NzrkOWNfW6psoWtAmIW8fyJuwZxRJqn9AdLS0RjoG8AqktPyvHkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N20vghRL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A03EC4CEC3;
	Wed, 25 Sep 2024 11:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727263538;
	bh=puhxPJH/amOnms7SLF2+4j5c1YRzIKGbh4esV2Il+tA=;
	h=From:To:Cc:Subject:Date:From;
	b=N20vghRLGx1HqbBtVbX4cqbCJy7T4LsHJRnSCzM4sSUTwar6lQrTlqEfTawObD/2g
	 +tTqdDd9cbzS7hlHrlTj4rqhSMBzClpljzBbZLamZKUKRNp7ceh89/TzF4FkuaTXmD
	 4JAyDQWlRz80B4XBYhDYzI8NahPKNo0ONMdq+NOa9lbA+qZObOKKFTsKsfkipCQPPL
	 5wHe2ESjcxLHraE0pl/rW6EOXTR78u2bP0YmAdMlGgKDsIBOHK0bNqxAIgZYCPjN0f
	 ZwMPoXk6xolDbWUY3eZERc7ngsPoHZ8aZkh1HsIYcZcGJ19/4pcVYcI3Ji6YNTBscQ
	 QjIBAyKiIbaaw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Marco Bonelli <marco@mebeim.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: fix infinite loop in sym_calc_choice()
Date: Wed, 25 Sep 2024 20:25:31 +0900
Message-ID: <20240925112533.184957-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit f79dc03fe68c ("kconfig: refactor choice value calculation"),
Kconfig for ARCH=powerpc may result in an infinite loop. This occurs
because there are two entries for POWERPC64_CPU in a choice block.

If the same symbol appears twice in a choice block, the ->choice_link
node is added twice to ->choice_members, resulting a corrupted linked
list.

A simple test case is:

    choice
            prompt "choice"

    config X
            bool "X"

    config A
            bool "A prompt 1"

    config A
            bool "A prompt 2"

    endchoice

Running 'make defconfig' results in an infinite loop.

One solution is to replace the current two entries:

    config POWERPC64_CPU
            bool "Generic (POWER5 and PowerPC 970 and above)"
            depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
            select PPC_64S_HASH_MMU

    config POWERPC64_CPU
            bool "Generic (POWER8 and above)"
            depends on PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
            select ARCH_HAS_FAST_MULTIPLIER
            select PPC_64S_HASH_MMU
            select PPC_HAS_LBARX_LHARX

with the following single entry:

    config POWERPC64_CPU
            bool "Generic 64 bit powerpc"
            depends on PPC_BOOK3S_64
            select ARCH_HAS_FAST_MULTIPLIER if CPU_LITTLE_ENDIAN
            select PPC_64S_HASH_MMU
            select PPC_HAS_LBARX_LHARX if CPU_LITTLE_ENDIAN

In my opinion, the latter looks cleaner, but PowerPC maintainers may
prefer to display different prompts depending on CPU_LITTLE_ENDIAN.

For now, this commit fixes the issue in Kconfig, restoring the original
behavior. I will reconsider whether such a use case is worth supporting.

Fixes: f79dc03fe68c ("kconfig: refactor choice value calculation")
Reported-by: Marco Bonelli <marco@mebeim.net>
Closes: https://lore.kernel.org/all/1763151587.3581913.1727224126288@privateemail.com/
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/parser.y | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 1ad60f9e164e..bc43fb67c7c4 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -159,8 +159,14 @@ config_stmt: config_entry_start config_option_list
 			yynerrs++;
 		}
 
-		list_add_tail(&current_entry->sym->choice_link,
-			      &current_choice->choice_members);
+		/*
+		 * If the same symbol appears twice in a choice block, the list
+		 * node would be added twice, leading to a broken linked list.
+		 * list_empty() ensures that this symbol has not yet added.
+		 */
+		if (list_empty(&current_entry->sym->choice_link))
+			list_add_tail(&current_entry->sym->choice_link,
+				      &current_choice->choice_members);
 	}
 
 	printd(DEBUG_PARSE, "%s:%d:endconfig\n", cur_filename, cur_lineno);
-- 
2.43.0


