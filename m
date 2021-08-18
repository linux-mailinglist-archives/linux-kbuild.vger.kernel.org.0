Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60BFE3EFED2
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 10:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240146AbhHRIMD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 04:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240003AbhHRIMA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 04:12:00 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58800C0617A8
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 01:11:22 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id y23so1449493pgi.7
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pvc8FYTWoOHIm8j1TKo43QLNqnXNJipb45HEg4CLwMg=;
        b=a9BG+RcP0MIEuaPYKP32XKuk9RSJoyc2XYI53zcUldllIFTpuQz0V8ZPcqT4TxEENo
         CZEnuMUkvNuLQPlGpy19UVBp4CfAx7fL812LJun6d7yVS7d5tEXCjKbOOpo5QOkxA7dv
         NvoifxAIiM0Sz8xyEwTASp0mxGVverwuuT/MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pvc8FYTWoOHIm8j1TKo43QLNqnXNJipb45HEg4CLwMg=;
        b=X/ErY0XguD5/6rxdj3+O+BgUaCLIzUNINOtnKZo44ForY5ivUPs17w6zCUsMjzaU0O
         /h8o+Z36IcCETQU1ILo0JAL2F3lxGDNXfXpMDvriHkx3T9wFTbg9oTXwBt3vgaE8lPvT
         HHnaxPjO49vcZ2p5xDTl7afO1qNBEiBT5otd5e5iU2jWT5ORDtmnrOBlXu0dcxXz3J8n
         eFdqMXnT7aFhaY+ZdiRgh0hB31xXLyDDuV30dnCjU10GcHUl1461mvGzFOoqkIsLyt+Z
         jTMgC6PAqHiWXI9VoaPPzj9FLc37dCdSv0F6bsDngBTZV0N9f6uAe/BmAkbZd6ogsgBo
         xSeA==
X-Gm-Message-State: AOAM532FVbAnJs5DzxKn8wHAI2IHWfp3A0ilhBq3op3C6ZzKRS03Mk8x
        yBKkjZ5oT0dEBPkBbD3+lBwWPQ==
X-Google-Smtp-Source: ABdhPJzHErneH8CMtqAbL30rQcncRCBdl39QSSdhA5ZeWpVjhOQkC2qbPMdkOdMsoUgx9CjCVAiHeg==
X-Received: by 2002:a65:63c1:: with SMTP id n1mr7776085pgv.398.1629274282004;
        Wed, 18 Aug 2021 01:11:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g202sm5103235pfb.125.2021.08.18.01.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 01:11:21 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        clang-built-linux@googlegroups.com, linux-hardening@vger.kernel.org
Subject: [PATCH 4/5] Makefile: Enable -Warray-bounds
Date:   Wed, 18 Aug 2021 01:11:17 -0700
Message-Id: <20210818081118.1667663-5-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818081118.1667663-1-keescook@chromium.org>
References: <20210818081118.1667663-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092; h=from:subject; bh=rvvfb+lJ3OE28Z6jfKAAwAF5uvGem1fIeunf1UcWOFo=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHMCl+H7K3EfJm5a4Yz7JgDu5Hns280iVsxefcQ+8 DYYrBKuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRzApQAKCRCJcvTf3G3AJsN6D/ 9zxdMqHYgAcTr5lbwMyEwEdDgo20EoKNXKWVbKTAvpHy+dG169wey8IaNWUCxoSwa3Eqia7BoaEryJ BakrEhNUmZicL6u6EX4+DcWFD26hf7OxycxvLgFeJA0+NgmWkAf+i8MSJ5Iwb8IK2rrncEAReXJDb1 XwlXCdUDD3MvZWQ5VEj/3Frw6587IkEIr6C8ADtnCHgmYYggQp4j0WTKdecXJQPbs7GiGVkS+nerB0 PwS0T/az6WYgedUMB+mS0V44sJRJDIDH2YWfVYodJFBNaSMAskgL1yFhxpOSKuD7uEpC77u/HW+WGH fpVemidphbzkgRRvYa2+7Of8TgOpQ5jWqYP7O3/1NytzggrD/z/7rNkP1x3onxH38vyGQRCOe4vgTG x9zXY78qC+S3q+XKJFsLI73dt4S98CTt16J2Te3rTbqgAF9FFrYjSOu+VGZkiGI1NPi1r+2aI1nFRa Y7ufBViMvuPBg26pVnixZUEDqCb+vElybbYeztsLSYqHoFOAm5w2btNqSHaa1rFRSUSe6qcvV/6+4l 37nyhOnWIlry/IVhBhmS713HAeSMTSdRijKkm1bRaZjHQbsA5U6dE2AKMOnOGcbsVZC9s9pnrrXcmT TOzJ9XwF/LeewP7YJMg3pwwtLOB8vCYQdW2nIrJC8HaGZTL7C5qEmJP4Fpcw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With the recent fixes for flexible arrays and expanded FORTIFY_SOURCE
coverage, it is now possible to enable -Warray-bounds. Since both
GCC and Clang include -Warray-bounds in -Wall, we just need to stop
disabling it.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Co-developed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Makefile b/Makefile
index a4aca01a4835..af22b83cede7 100644
--- a/Makefile
+++ b/Makefile
@@ -1072,7 +1072,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
 
 # We'll want to enable this eventually, but it's not going away for 5.7 at least
 KBUILD_CFLAGS += $(call cc-disable-warning, zero-length-bounds)
-KBUILD_CFLAGS += -Wno-array-bounds
 KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
 
 # Another good warning that we'll want to enable eventually
-- 
2.30.2

