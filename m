Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D41D3F9C7A
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Aug 2021 18:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234458AbhH0QbN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Aug 2021 12:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233697AbhH0QbK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Aug 2021 12:31:10 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB83C0613D9
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Aug 2021 09:30:21 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id t1so6407361pgv.3
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Aug 2021 09:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H+ke82JqnNzuF+ETLARNzezEA9Zqm2D4YO8akYC5ijQ=;
        b=e+LKzFlkLmCnm0Uy0SnczxQ2uaSczRmJXNF59sh3lJBigg5vC629YE17XCpHD+FSoi
         J5MHuadPZDPIu2eF09UqeeazyZBC2HvFM7F9u4P5hA8CJTmcjOn8odWBRpUoWXwl7U5Z
         a0mg3f87URQ4LuN2CRcXnyqlblbIOuMmkrwTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H+ke82JqnNzuF+ETLARNzezEA9Zqm2D4YO8akYC5ijQ=;
        b=fFNGTugjKLA/8/JuUB+o9clcqsf0Bq/hnnhQMgecXd0wuXgu30BLMkvATSkpqaMIvc
         nEBURyz7K+EOeut7swYa4f85HlYYVgbLJLrj8xVPJjTMHVSjpvAVK7qqE5Ky/tbuZFKn
         bXsRGBY7/9ahYqSVDx1Rk8G0jW5J7NZg6o+PBw2pOEXupoKL7iCZ+kP6nEnuPjhQ630d
         tleyNaukyNRaGd/aXjJLWVku+1FzQmKRudocvnz7pqzThX4mM/UNtkht+MpHE9GLO+6/
         s5I2HkYRdCpF2hfe3t+JjR5XTvsHEAwDCfTr0Gwq+mdlv0s0OLfrsn1b5m+W8myuIDIx
         iBlA==
X-Gm-Message-State: AOAM533t9HF3qiTHA/4A99kLICm1eunX3fC9f5fSeY5LG9gFj68FXJo5
        4yTV7xHx+mozAPnNT0KubOW/5g==
X-Google-Smtp-Source: ABdhPJzVWD5kE7Vujy3R3rBTbCRZ8VfJ1Z6Z6J4uxCGV5F6llmErtgFAj9B8vh5uJImuxxBnOoSpAg==
X-Received: by 2002:a62:6143:0:b029:3c9:3117:c620 with SMTP id v64-20020a6261430000b02903c93117c620mr9956209pfb.30.1630081821279;
        Fri, 27 Aug 2021 09:30:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q13sm13041500pjq.10.2021.08.27.09.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 09:30:18 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Keith Packard <keithp@keithp.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        clang-built-linux@googlegroups.com, linux-hardening@vger.kernel.org
Subject: [PATCH v3 4/5] Makefile: Enable -Warray-bounds
Date:   Fri, 27 Aug 2021 09:30:14 -0700
Message-Id: <20210827163015.3141722-5-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210827163015.3141722-1-keescook@chromium.org>
References: <20210827163015.3141722-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; h=from:subject; bh=oefMcHZzjrqvoOMjUB7suXN8EJKiDU2oIYgtW+uUBtg=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhKRMXaFIio04DmLvoRaIim4FnyDX46vN/W1R6TAc9 7X8LHOKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYSkTFwAKCRCJcvTf3G3AJkHDEA CS1lNg3ppEL752ZcERsA8g+c+eYjHTxh15ZTmzUnEtLj6BwMfdbA4/x1xXrjYx1Bg3dJBsGFGhhpQt ozHruyY7Oo7N981nkjQ17v62G45VttSUW0Da9NH4LAmLVzsxHD0eNX4PVE5ZDbGbbH6eE5CrpdTzRJ iNUg4Bto8WHejlPUM/iWswUDI35C38Ckinp80US2/WBXEd2+4PmvnF2qkZGkmZ65WqzLdDZRh3LGu2 HBBxun0qKGvwYwui7oSaKwzCgWZKOkedPVBzfLc3xYcVrLu5swuJmTPLb7YT5WXPH2HdZI7FYqB/Py PjJtQhMrIn2yB8i83VdeCbOZ1IV70o6Eo7mSwFigYSWvtQnG3RZroi9sq1Agy027oHBW07Rvv/umF1 JhVtAHQtTEGjfr3kW89UTaY4HfFsD1JF4oi+CR12uO9+ci9R0DYPRkBFqjL2Y27danaiOyoY2u7yTx mZ6JPA0BHivZtZe/u+uSimSgojZF3B50suFMGmwa7kF/oonGQDz6IrnMy3twHYH7wzin56Vaj8oVVw B+4BrvUOeXYtj8To2ctra/tgAK26O/YGcMht6SuqX/ErTpO7QbpHL2fFyYf1kbmbIJc6vgwVesrVHg iqwNiKHwsWkpf7q4OjGMI+O6JX7fdDBcHhG2QRelqvzBoga7Vkav4a26D+iw==
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
index e4f5895badb5..8e7e73a642e2 100644
--- a/Makefile
+++ b/Makefile
@@ -995,7 +995,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
 
 # We'll want to enable this eventually, but it's not going away for 5.7 at least
 KBUILD_CFLAGS += $(call cc-disable-warning, zero-length-bounds)
-KBUILD_CFLAGS += $(call cc-disable-warning, array-bounds)
 KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
 
 # Another good warning that we'll want to enable eventually
-- 
2.30.2

