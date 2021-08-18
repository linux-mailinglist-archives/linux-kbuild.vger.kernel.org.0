Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A18FC3EFB23
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 08:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237805AbhHRGJX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 02:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238444AbhHRGIb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 02:08:31 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1DABC061A06
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 23:05:59 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id w8so1142651pgf.5
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 23:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mboTeGUKr9yolgqYZyfRuYdmdGDjzaFuP+f8ddDuJQs=;
        b=VXB5rWrOkOUtfCqlqmI5NSVNx72RB77dAy2oZKxsFgyJYk7pRfvjGekORMHd3qeDjV
         w62NkRG1JnHmoQW1LYbSqf66ms3qEBb5M12TfQfmYL+UCdit3vS6intdi7dOK4yxjtOO
         0a7us/8TNkOy5LfwCUNfHgiRrh5IwxNX3jPnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mboTeGUKr9yolgqYZyfRuYdmdGDjzaFuP+f8ddDuJQs=;
        b=ay+tsPVszaR+qQaTAvW1OOX+PQGUGHAAogQKoPJAYu0olj91toOps7Clf4DWdlUaoo
         0x3+XVW91cZCJHXWmHP9bd6BIfeGHaJT1SYjD23S9q48CvvZWeotdJXUQF0QGLuRVFLr
         GhokwyC8+slinCa4pnhbNtreu12i7TzW42gd4j4Xhpg4FQA9BX37yESORdALyYiyEfPR
         0NHof7Eu1yIy9Wm0V+VKB42DEBTUl/uLrtlVGEVmGcmsP8SvcZfQ5DQofDiLCMiQSJRu
         VUz5vUX2XkoBFBn6nbVH7NMqCQ9LNT0oIdrmXowuOF51TZ8YCv/yhXamPL8hPAXL2MpR
         Dfow==
X-Gm-Message-State: AOAM532/o3rw8M3xRtg8rFwPm/3XpAoh8UvwrLebLf1hd+cXMESEr0Oa
        zJdCl2sX1tfsG1EaFDBqLnrIdQ==
X-Google-Smtp-Source: ABdhPJw0NQnubE2J9ww2IV6yMWGOt/X1HjRivrIndHgKRL2cM8oCkbJtHPmmWE3y9dhwziqzIdlJ6Q==
X-Received: by 2002:a63:2442:: with SMTP id k63mr7181356pgk.54.1629266759640;
        Tue, 17 Aug 2021 23:05:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v15sm4713102pff.105.2021.08.17.23.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 23:05:59 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>, Daniel Axtens <dja@axtens.net>,
        Francis Laniel <laniel_francis@privacyrequired.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
        linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-hardening@vger.kernel.org
Subject: [PATCH v2 29/63] fortify: Fix dropped strcpy() compile-time write overflow check
Date:   Tue, 17 Aug 2021 23:04:59 -0700
Message-Id: <20210818060533.3569517-30-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260; h=from:subject; bh=sAqjTzTf+mWFy7xD73ZEpzjamgoLfVlMB8Pw3aei0Xc=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMkHMEpm10nE/aAHB48K6cSsvZL5sfcJfQj9wD4 87AucWeJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjJAAKCRCJcvTf3G3AJoHIEA CVNsWBrDfaVMhp7dy0y/IJxDyV8yomgG4F72g/uCRRfJZ6t0QDX4mJHghw3qnhtNERaVf1zfyT4EpR Q+CnBXAbbYOY29o4ZaC5ADslFqQrcq5UXqAtvXX2hNdtEpN7jEvy+T0Dp7gErnaLTs1ZlewzFJixmh 05xnc5PGkQ/a2fhA/CtaXfcvvgj/Y1w7itfG3KT1Pc8P7hAB0xQUn5JwIyBFfsLsANHAXHUbw9VYDP fZZ0GNAEXZSrloJoa/3h+EnpUqfUAHZ6NG7o5k6rBUn2ktEbmeFwRAcvF137eXA++u2tSdegoXt14J LaoJ3RY4se8BmlCpgiOu6mTSPrs6Jb74GZdcpGwlL++bhsP342ng60dkvdbosL5Cz5rcQRxwrJ252w 1U0/10JSG6NNPtAYO7As1zp/w4iaNAbTundBjm6o+FckreellK+acr/YR5tu8mhYcwwjhv7Gn0PW53 tctiINRIsKtDHMAo5AYvcxOB0Cxa8Q44hhowrhkhYkzBO6F+t4p0Ht1Gse9m+/b9W5FzR+ruuTjN4b sJwG5NlgDrw9HodFlOrFU0g6f9jy+pOvo/aUejebmfFQ0E0rMohB1Ca6a4NGl1oW+3zmYJgmF3QYnL 3ztj9l/h7QOAIug/e6PSNcgokPbHAFyVpu6eHLsTcqKbjMMcdhK2ihPt1Oaw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The implementation for intra-object overflow in str*-family functions
accidentally dropped compile-time write overflow checking in strcpy(),
leaving it entirely to run-time. Add back the intended check.

Fixes: 6a39e62abbaf ("lib: string.h: detect intra-object overflow in fortified string functions")
Cc: Daniel Axtens <dja@axtens.net>
Cc: Francis Laniel <laniel_francis@privacyrequired.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/fortify-string.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
index 7e67d02764db..68bc5978d916 100644
--- a/include/linux/fortify-string.h
+++ b/include/linux/fortify-string.h
@@ -287,7 +287,10 @@ __FORTIFY_INLINE char *strcpy(char *p, const char *q)
 	if (p_size == (size_t)-1 && q_size == (size_t)-1)
 		return __underlying_strcpy(p, q);
 	size = strlen(q) + 1;
-	/* test here to use the more stringent object size */
+	/* Compile-time check for const size overflow. */
+	if (__builtin_constant_p(size) && p_size < size)
+		__write_overflow();
+	/* Run-time check for dynamic size overflow. */
 	if (p_size < size)
 		fortify_panic(__func__);
 	memcpy(p, q, size);
-- 
2.30.2

