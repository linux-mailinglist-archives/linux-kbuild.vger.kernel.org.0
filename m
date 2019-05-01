Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E99810FB7
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 May 2019 01:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbfEAXDw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 May 2019 19:03:52 -0400
Received: from mail-yw1-f73.google.com ([209.85.161.73]:36146 "EHLO
        mail-yw1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbfEAXDw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 May 2019 19:03:52 -0400
Received: by mail-yw1-f73.google.com with SMTP id j62so1157800ywe.3
        for <linux-kbuild@vger.kernel.org>; Wed, 01 May 2019 16:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=D2ed1P31yZM+QgJhlTzUd+8uEk27FFwdOzf2d998Bjo=;
        b=m4vpSF6hFQAvyyKEfmi7ffOWm5Cf8YCWIkxIT3+iDVpIWfsS1ULEGwFu6Ost8hat7u
         rnhVAV5Vv9xJT6lOo63I/DHxpQiJpkpLAZN5u2XWO0V9OZ52Ydehqa5w7vEuBON6+gXZ
         3STK4kvqQOndMzEtqqLGS2SsTTQyPWssIWHMj8ElJqdMrQ0MviI+sSHecTz/rzS/tJ10
         CF6G0RJyeUDcEjoGw8kICUMbi8yNT0pIJerdnIVD9Od+WW+ixwtgrJBY3UFTTqTO2Fw3
         Zh8c7NNZ6oqBIahVmM/STUzcD/MOIBXoqKt5JLGq4l8hekE/mIoIfmXWjCZu/3iEiU9+
         WUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=D2ed1P31yZM+QgJhlTzUd+8uEk27FFwdOzf2d998Bjo=;
        b=KCityuM/fyzbKNNRMg2NzpGQo4Go1cZvCHB1Wh1cKYDRSqeRzORlOUEPEwSRbpr5Ri
         qBmDHIIb/3NrNDVYx3t6bOk6Exvjea6LYhwaFQibtJtqaoPGf+E7tmxPEG/jdx9XKfNl
         oUwZ93ImNnId/z+jRCY/RZFMcRGnqUdsf8iDh0keUtIzWW/o6d6+yHHYex1NE/k64ml8
         Q2Ak3k0AvvtI1K1wuu2lyMG9AK0CZx59nVDNRtbELu5DI0AWfAVNyBMWy/GfznK6TxT3
         GJqNHQOw+Skds1BFUuuR+RjXeznsQsB/BXR0zAP6GHSUV4q517MIQktuLwtVVoSdfGyp
         exhA==
X-Gm-Message-State: APjAAAXxNeWJh8Ojw0dCjDos4KByob2YxCHP5awLrbbeIgRi/ZPd5kyZ
        cU0V1RVDZMsnVq/M8BqEoXJ5/Ohu85+E13mu+XzzGg==
X-Google-Smtp-Source: APXvYqyFMKmsofIlGtyIYxY2auw/Yjye1Kqb5EY69r+kXArsnv/jL7sTkqGRu0OAeuaZKfIN87CHtxO88oGy68C0yADwLw==
X-Received: by 2002:a25:6649:: with SMTP id z9mr362486ybm.25.1556751830941;
 Wed, 01 May 2019 16:03:50 -0700 (PDT)
Date:   Wed,  1 May 2019 16:01:15 -0700
In-Reply-To: <20190501230126.229218-1-brendanhiggins@google.com>
Message-Id: <20190501230126.229218-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v2 06/17] kbuild: enable building KUnit
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        keescook@google.com, kieran.bingham@ideasonboard.com,
        mcgrof@kernel.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com,
        dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com,
        joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com,
        knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au,
        pmladek@suse.com, richard@nod.at, rientjes@google.com,
        rostedt@goodmis.org, wfg@linux.intel.com,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add KUnit to root Kconfig and Makefile allowing it to actually be built.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 Kconfig  | 2 ++
 Makefile | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Kconfig b/Kconfig
index 48a80beab6853..10428501edb78 100644
--- a/Kconfig
+++ b/Kconfig
@@ -30,3 +30,5 @@ source "crypto/Kconfig"
 source "lib/Kconfig"
 
 source "lib/Kconfig.debug"
+
+source "kunit/Kconfig"
diff --git a/Makefile b/Makefile
index 2b99679148dc7..77368f498d84c 100644
--- a/Makefile
+++ b/Makefile
@@ -969,7 +969,7 @@ endif
 PHONY += prepare0
 
 ifeq ($(KBUILD_EXTMOD),)
-core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
+core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/ kunit/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
-- 
2.21.0.593.g511ec345e18-goog

