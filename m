Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E37D140F1FB
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Sep 2021 08:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245065AbhIQGM4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Sep 2021 02:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245049AbhIQGMu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Sep 2021 02:12:50 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A50A9C0613E1
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Sep 2021 23:11:28 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id a15-20020a0ce34f000000b0037a944f655dso87697552qvm.5
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Sep 2021 23:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=TXG48xSRlx8rIgQW++hQT3j5R9gwaLAhcS6CZziLHmQ=;
        b=WmhloRtjGIK9ydAlJ6OHR1E2w5RjxR8VBTPhCI/O0xak8DgT2MO76zuYYPl24VmGPp
         yse5VSvtdAU2msUdkpYQOJUnKSnFyFST5EPn8fCafk6yZQ46FNdPLWKTSBR3+zxtOBW7
         sNbBXeRo0RHv8ziNHdSoGEpUFFISJxxpYhiy+2MVKGbzGc7jYpxOV8tLAcwl+rv4VK8Q
         OMGMl9rnWCFAnIkBzs5nVhwMf8z+PicX1CD1YvIz5WrRHo6Ylwov8F5oYotxfS+1/LEt
         DKN9SHB8jZeMVVnMBsn1ODzNyalQkI/zxfzf3xRkXWq64KC757pRykt/gdw+TEESPIrZ
         Su1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=TXG48xSRlx8rIgQW++hQT3j5R9gwaLAhcS6CZziLHmQ=;
        b=RyI+5fH/mE3c7uM34AGWtL1aXvr31WiTVADNtC953jHIG1E7Dd+A+QSU+NDHQVJqrb
         4Q+l6TqPTVMT2DvoZ+CbZZJECxcCR9jBEbGhMobRsRgBPY5eOIFCes5L3BbuX5jBFyZx
         DFX8JFylPWNi573uHNJ1akk/qbUY8uVz3Vq2o3TgnhdnHf8v1gBnS9xj/PfAnKDB3HFe
         DI/eHNpDqkcFTFDfbWYeEj4GhjRqLJHT/mv+DnuWi3jCtNj5V0HXGP3STTKkUTcVyQl4
         w/FOpyRpGVL+sEO4y886WZ/7vHSsgf5S5tYwWXvPqdhIGS1VecOtR7Zwi9lUkTvGI+A0
         O4Wg==
X-Gm-Message-State: AOAM533zqu6efdXFmpw9XT4wCfVAvPyOeYlRzLhfnY6LxPdueGiu8Sty
        wU4x0kavifUW/Tw6EF5UX6vApSzLIXrIk5JC+JYF8Q==
X-Google-Smtp-Source: ABdhPJypn4hhdPHmNfweWLWHauxWHrVoQvMZsHWsDKioZ9IeJPJspxqNCPwjtYoY9xvXJMChe6ahFtlZ1gOXKE6/5Xximw==
X-Received: from mactruck.svl.corp.google.com ([2620:15c:2cb:201:4845:43ba:3ff5:2de1])
 (user=brendanhiggins job=sendgmr) by 2002:a25:ca08:: with SMTP id
 a8mr11249514ybg.231.1631859087755; Thu, 16 Sep 2021 23:11:27 -0700 (PDT)
Date:   Thu, 16 Sep 2021 23:10:59 -0700
In-Reply-To: <20210917061104.2680133-1-brendanhiggins@google.com>
Message-Id: <20210917061104.2680133-2-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20210917061104.2680133-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v1 1/6] gcc-plugins/structleak: add makefile var for disabling structleak
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

KUnit and structleak don't play nice, so add a makefile variable for
enabling structleak when it complains.

Co-developed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 scripts/Makefile.gcc-plugins | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
index 952e46876329a..4aad284800355 100644
--- a/scripts/Makefile.gcc-plugins
+++ b/scripts/Makefile.gcc-plugins
@@ -19,6 +19,10 @@ gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF)		\
 		+= -fplugin-arg-structleak_plugin-byref
 gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL)	\
 		+= -fplugin-arg-structleak_plugin-byref-all
+ifdef CONFIG_GCC_PLUGIN_STRUCTLEAK
+    DISABLE_STRUCTLEAK_PLUGIN += -fplugin-arg-structleak_plugin-disable
+endif
+export DISABLE_STRUCTLEAK_PLUGIN
 gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STRUCTLEAK)		\
 		+= -DSTRUCTLEAK_PLUGIN
 
-- 
2.33.0.464.g1972c5931b-goog

