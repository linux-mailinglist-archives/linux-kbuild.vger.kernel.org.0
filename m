Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1E23EDE8C
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Aug 2021 22:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbhHPUWA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 16:22:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:53926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232127AbhHPUV7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 16:21:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C33A60F35;
        Mon, 16 Aug 2021 20:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629145287;
        bh=DZeJgaBVOuro+yCALFSGg+G7kUBtualFHpqyFlfXJlE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oNpRW+iMog1tMCCH//whIBeMwOu/Iqw0xTxSH0sK2cO0OEgEHaFwN/PpX8zo1PLvU
         RSVn+m+lUanW4g7B25rxiHtWT40GNc2DJay6+UOvR/h+Wtvp7fvEaPhlBbMsV1rrMn
         hB26Xt7S1CSayjlK51WJUHsjOO3sT/A+Lswwn4NBcKZGf7qOR4eVLj8mZOlsGbwU/J
         kynDYbKI1eJyyNxNx57wqp3vqb3L1QrYcbIOFWYCcWApsh1H/meKhQ7ZSB4d2mWEkE
         KxDkiXKRg8cyBFS6auM+nHYOffHpH+3ZbTkrRJx7qj/v0SUI06yKy5YTzyqTojQwYI
         9juZoAMIUvxnQ==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 3/3] kbuild: Shuffle blank line to improve comment meaning
Date:   Mon, 16 Aug 2021 13:20:56 -0700
Message-Id: <20210816202056.4586-3-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.rc2
In-Reply-To: <20210816202056.4586-1-nathan@kernel.org>
References: <20210816202056.4586-1-nathan@kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

-Wunused-but-set-variable and -Wunused-const-variable are both disabled
for the same reason but there is a blank line between them and no blank
line between -Wno-unused-const-variable and the block.

Shuffle the new line so that it is clear that the comment applied to
both flags and the next block is separate from them.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 07b76274396e..7d5007cdfa5c 100644
--- a/Makefile
+++ b/Makefile
@@ -794,8 +794,8 @@ endif
 # These warnings generated too much noise in a regular build.
 # Use make W=1 to enable them (see scripts/Makefile.extrawarn)
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
-
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
+
 ifdef CONFIG_FRAME_POINTER
 KBUILD_CFLAGS	+= -fno-omit-frame-pointer -fno-optimize-sibling-calls
 else
-- 
2.33.0.rc2

