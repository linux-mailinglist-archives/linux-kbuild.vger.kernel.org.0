Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0800462229
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Nov 2021 21:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232221AbhK2U3t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Nov 2021 15:29:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233414AbhK2UZr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Nov 2021 15:25:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72450C0254FC;
        Mon, 29 Nov 2021 09:01:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 32E5FB81260;
        Mon, 29 Nov 2021 17:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4458AC53FCD;
        Mon, 29 Nov 2021 17:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638205276;
        bh=0Weje5hoMUc5BJflAblG6alZb9thJPnAILV+D0mM5/M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AcRPkJjLruSaLIhcr860hu26QbKiSydWtBZqSZ0MviH67RHvYBh7xGEofAOg85lvg
         J0fZGbcsg4BJOsOCjIAzoYOexBui2LZUx0Yu+GRU5JPPll01pg8Cma1/EPiZgbBhz2
         qLxg4VqBhQ3FP+kfmkFiom2W+29AF0vzNEUeTkZ56uSM9ThQDw61qm5oOQl5Ul/2YO
         YZTmsq6YlKadFkahwwjMFB9fpqE9LCPjkAWECfnyidD8DTl30H31GU3UbnMA7KZBDO
         K5DdALey8T+RJr+DWBQU7QrAYLE4YttBwKTBsDk4ajf6KVUP6ksFgQDsvaI8xNR2jN
         lHWLEYNW4urzQ==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Tom Stellard <tstellar@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Jakub Kicinski <kuba@kernel.org>, cki-project@redhat.com,
        kernelci@groups.io, llvm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH RFC 2/6] mm, slab: Remove compiler check in __kmalloc_index
Date:   Mon, 29 Nov 2021 09:57:59 -0700
Message-Id: <20211129165803.470795-3-nathan@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211129165803.470795-1-nathan@kernel.org>
References: <20211129165803.470795-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The minimum supported version of LLVM has been raised to 11.0.0, meaning
this check is always true, so it can be dropped.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 include/linux/slab.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 181045148b06..d3fb5ac71c24 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -411,8 +411,7 @@ static __always_inline unsigned int __kmalloc_index(size_t size,
 	if (size <=  16 * 1024 * 1024) return 24;
 	if (size <=  32 * 1024 * 1024) return 25;
 
-	if ((IS_ENABLED(CONFIG_CC_IS_GCC) || CONFIG_CLANG_VERSION >= 110000)
-	    && !IS_ENABLED(CONFIG_PROFILE_ALL_BRANCHES) && size_is_constant)
+	if (!IS_ENABLED(CONFIG_PROFILE_ALL_BRANCHES) && size_is_constant)
 		BUILD_BUG_ON_MSG(1, "unexpected size in kmalloc_index()");
 	else
 		BUG();
-- 
2.34.1

