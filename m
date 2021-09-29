Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B78BB41CE16
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Sep 2021 23:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346965AbhI2V3L (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Sep 2021 17:29:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346968AbhI2V3I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Sep 2021 17:29:08 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FDF8C06176F
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Sep 2021 14:27:26 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id v14-20020a05620a0f0e00b0043355ed67d1so11234997qkl.7
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Sep 2021 14:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=MW+dGcYoW6OnAGQelBXtE4Ow4ZA6fkyzfNYjYrI2dg0=;
        b=ehSIGen7rcDV5FoKmyJqv7AM6JzrLJIhOSNSBq7fdf2L6kEUSQYs0bX/ivFr6qHET6
         QLbd1hWBvQNs1dSoo3uubM2LfTALNxesitV+57Djw2IRCc9h0QkaVjktF+I6NM6egA5F
         7VdVY0kYuzR8EDuWLZFm9OsR/0AE616mFc8hObpExpmlNtSdj3C2DUHL/a3hjIckdOrl
         aHjNaslvAnV89vbHiR5IG3qvMyQjKdlZlAzGKCwSdRqiZ9Ys6KlWqkXWvX1EJloHkKmb
         Z9oF87rQd4x+olzmsBe8TBbibQ2RZJOFP7tbj1ypYMxxtGL8bV/cwt/9f4Oy0mBW+j6I
         gbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=MW+dGcYoW6OnAGQelBXtE4Ow4ZA6fkyzfNYjYrI2dg0=;
        b=7s14qk+kpAmekOhHoWuVWxvqRF7MEswKQtpB7L8AnbopAT/XFXh9ZO+MfyyUqW8PXE
         fc4aWJPDNXis6HcJaDlgzByTWzp+Z1GymB56yNFeGbLQ/I69806xu0lPRVL/0+n9Nx2L
         mR4uyfy+wN2qZMixrnetYZC7RIj5JJg2uP9JuKpyVHY2VkSfj6BlhvnzcKT1VPX0MWI8
         UN4FVhJYFTi4n1hZw/NrGyKF730OHbvVVuO0EbuFKZAa/RdyGPnVfSRP8cHNQbrTkiE8
         uX94vHcLWCYztJ1Uivbbn7C6mRadWmkKzrs/WxBQhxQ2FPmStRKEOPqIQ6fUKrHhYGbQ
         mtYA==
X-Gm-Message-State: AOAM532JcrC0mKGeOBe3RwStnsILBPvOOjX9fsmOuDK6Azi9lt0rWuuz
        jLQOmHRD3NoonxZ1ldiEsG0iaPFoXmYDoZ/Za5SyHA==
X-Google-Smtp-Source: ABdhPJwCs0j75saROJYED02fGyd+eJ8PZweJbRLoPXBzHwpSpeXkxhNIY8yNm3Cb1iuATR9LjzK4TsE+hv2/ybSM5bcQ1g==
X-Received: from mactruck.svl.corp.google.com ([2620:15c:2cb:201:83f4:ff43:90d6:efd3])
 (user=brendanhiggins job=sendgmr) by 2002:a05:6214:1225:: with SMTP id
 p5mr615132qvv.21.1632950845646; Wed, 29 Sep 2021 14:27:25 -0700 (PDT)
Date:   Wed, 29 Sep 2021 14:27:11 -0700
In-Reply-To: <20210929212713.1213476-1-brendanhiggins@google.com>
Message-Id: <20210929212713.1213476-4-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20210929212713.1213476-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v2 3/5] device property: build kunit tests without structleak plugin
From:   Brendan Higgins <brendanhiggins@google.com>
To:     shuah@kernel.org, davidgow@google.com, arnd@arndb.de,
        keescook@chromium.org, rafael@kernel.org, jic23@kernel.org,
        lars@metafoo.de, ulf.hansson@linaro.org, andreas.noever@gmail.com,
        michael.jamet@intel.com, mika.westerberg@linux.intel.com,
        YehezkelShB@gmail.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, ndesaulniers@google.com
Cc:     linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
        gregkh@linuxfoundation.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The structleak plugin causes the stack frame size to grow immensely when
used with KUnit:

../drivers/base/test/property-entry-test.c:492:1: warning: the frame size of 2832 bytes is larger than 2048 bytes [-Wframe-larger-than=]
../drivers/base/test/property-entry-test.c:322:1: warning: the frame size of 2080 bytes is larger than 2048 bytes [-Wframe-larger-than=]
../drivers/base/test/property-entry-test.c:250:1: warning: the frame size of 4976 bytes is larger than 2048 bytes [-Wframe-larger-than=]
../drivers/base/test/property-entry-test.c:115:1: warning: the frame size of 3280 bytes is larger than 2048 bytes [-Wframe-larger-than=]

Turn it off in this file.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
Changes since last revision:
 - None
---
 drivers/base/test/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/test/Makefile b/drivers/base/test/Makefile
index 64b2f3d744d51..7f76fee6f989d 100644
--- a/drivers/base/test/Makefile
+++ b/drivers/base/test/Makefile
@@ -2,4 +2,4 @@
 obj-$(CONFIG_TEST_ASYNC_DRIVER_PROBE)	+= test_async_driver_probe.o
 
 obj-$(CONFIG_DRIVER_PE_KUNIT_TEST) += property-entry-test.o
-CFLAGS_REMOVE_property-entry-test.o += -fplugin-arg-structleak_plugin-byref -fplugin-arg-structleak_plugin-byref-all
+CFLAGS_property-entry-test.o += $(DISABLE_STRUCTLEAK_PLUGIN)
-- 
2.33.0.685.g46640cef36-goog

