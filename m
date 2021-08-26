Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF10B3F81DD
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Aug 2021 07:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238262AbhHZFFt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Aug 2021 01:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238002AbhHZFFs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Aug 2021 01:05:48 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 319FAC0613D9
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 22:05:02 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id k24so2051214pgh.8
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 22:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H+ke82JqnNzuF+ETLARNzezEA9Zqm2D4YO8akYC5ijQ=;
        b=TXfA89AwrHNBCE0emeWk24ecxJ5IcsflSZCiMHER4Vz/S6r2VxQGH+ZyLfhNaiGz2X
         8hn6ZM+WaZgk8lsalj+53TMWoYSZihHlWGdPZZQ2Lk7u4nLLuXnHnUhhUYlLqCs+ltCD
         YCETgE3Vuy9QfKCuisQgOQr6bNjw6Az3WpSOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H+ke82JqnNzuF+ETLARNzezEA9Zqm2D4YO8akYC5ijQ=;
        b=bqTxTKvdm1lC2Qg4sYHVHOoALW9FzoDQmiiIUoDagy/ryE6t1imd+ZuqwrOZfZ2T3T
         uGNJH6V6kjTSY89gHcsSuNOr6BfUdKQZr8ardsvq4fpvveJktqX6PdFroUg0iW/TsPF7
         tiXUcMZk+8Dh/9sDqRhFTa2r8P1/8xtSMqQBT2ehPFjcgc6moIhbp5ZmMJ+uvxhzvIEm
         k75kk34TrzSMunM2ZIIckw14CcQCG6fF2PUyELIE2beRFGfHj3RJFZt2JO7ToWfRxYuY
         bNhjeeCR0/U2UcfAwQV6Ci2iDBbTVUA1sSUgxU1qw/eZFP5yNRbO0OYaMXgJgX9mYsVf
         1INw==
X-Gm-Message-State: AOAM531cxc8wLXe3qx63WQcbDdBNdFPgw6yjXqfbZnrgUKGC2AS++tIj
        MJfQ5hpBHiCYWlXw4opvCDtcAw==
X-Google-Smtp-Source: ABdhPJx2VMSKs/v7tqMFkn/Q6/kBji0mAtIa+Anlr5oH0jYuxB1l7qI8qu3PXXevarRmfGhnqeoBRA==
X-Received: by 2002:a63:c158:: with SMTP id p24mr1726458pgi.336.1629954301691;
        Wed, 25 Aug 2021 22:05:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d18sm1812151pgk.24.2021.08.25.22.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 22:05:00 -0700 (PDT)
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
Subject: [PATCH v2 4/5] Makefile: Enable -Warray-bounds
Date:   Wed, 25 Aug 2021 22:04:57 -0700
Message-Id: <20210826050458.1540622-5-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210826050458.1540622-1-keescook@chromium.org>
References: <20210826050458.1540622-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113; h=from:subject; bh=oefMcHZzjrqvoOMjUB7suXN8EJKiDU2oIYgtW+uUBtg=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhJyD5aFIio04DmLvoRaIim4FnyDX46vN/W1R6TAc9 7X8LHOKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYScg+QAKCRCJcvTf3G3AJnbVD/ 99uKUWved0lEF54nU1F7qKRM+Mv7siWIawdByX70YCMH1LpDZs6ja7HAHyb5nY0zJbQwGopcJsFn11 yntizr+UNLRhKE+CI5hmHijdbpaXrvNxCaSJF+DAkyEjqlmlAHSm1FWzX2ffYiEMhJTdPUebBpDVYr xwj4co1+92cPTQZg9VaD5UN55j9gc46QTYRsyvBl2jxtW8DPSVTWy7vaCya9Bn4TY5evml2nwFt3p+ sf7fn9Y1rf8xHpOEa+gNVbFst4tZ3KV9UupkpsSLi7+VLwDm9g2fwhma1aWdrtuO3q7iBbKEs3Y2Qq ans0Np+r32K3v5Pm7PYx8VDN9zn0LvK9Oc4Gsm6blZyPCqulPENZid0NeFXBICff4z2MgWn+UR4fyJ EqSn/aDYwWG6PjKkkfVr4NZr/olZHzwEhpaqReNAWzV01WUSmo+cmq3LIR7SslJXMiPM9F33KwApfq guhvH6SLi67EfhowGkIyFpDil1Keh+khqje+ZsIJgTqAhiBF72scXtqvP73hNT6w3M5x46LZyRLDbN TjvGaYP/k4JRtFdZYCxLFFVDov+8nlgA09DuTuePiFy68KyvBo1pZPZSNJejo1N5DSu5ll3PmckN+A IwAMOP/e2UwotUVUgDM95mAQA/ypXqzU/BhSxY9MkQfLOT5IAjW2i5ByugJw==
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

