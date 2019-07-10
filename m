Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F783641F9
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2019 09:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbfGJHQN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Jul 2019 03:16:13 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:45690 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbfGJHQN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jul 2019 03:16:13 -0400
Received: by mail-pf1-f202.google.com with SMTP id i27so832646pfk.12
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jul 2019 00:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=iuxOaaMz6/nuHb4KDKomfiTWkThnS6wenM774buKrcs=;
        b=swqomuh58V+Sg//U5cqY4Rh1tAi5bpvhwwunna8PvZbQacehjqw+jiBLjywU0PbaV9
         EpODX3G17IiD5mmqty6Ua7/wUUbyRya6LeMviTjJAwbg/+76UIMSyvVrzPVSUJ2WEY6n
         7lKwDj5zpEYSoIULXjTR+oBBCZfl1dvR7J33Y2miUOUDO2Sy18EJCy+VItMzFFxQAIdY
         /T4mQvRlNaRhUjVLmQuSsEc2qgj1X526Ie3m5Fj/WHcsnej2NpsOOSsTm8U1rai+iQqu
         RmvsSm+44+WEG138VYE5wa2mwKza4bSKWLX0erx0LKL6ndVzLZQYCX9qJk+XOClYHS4x
         pMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=iuxOaaMz6/nuHb4KDKomfiTWkThnS6wenM774buKrcs=;
        b=GLsGOiNpecIpxskYigPgKAABAtR7+YabCH4xktMa1P/fiT6pwAatZ+CjgnGx4V9SiJ
         l160nZxP8DQnv0J6kdkyG1JyuemzepbqpF/FB/RPqdnrR/6FXhCnW2/wJ1sO3MyB6jMe
         EEmK9jNteHhutTGOvsM0M2h3Mq47Snu3ZYwiczH/Gw6xcJjtxh1XWARb2Qc1x5fA2xWF
         rzMimjNZTKJ2nHm3m7tC8m+HJCPIWaC4BtcN0UXvXSRREXmm4rbF7Hn24V//mZZvINPO
         IcCAwrHXW2DWl3l95JG7QGRPyMUiR60Pv0fxoDbqCfAbWOnl0+tiznIE84ZeuVzeLfZb
         IsRw==
X-Gm-Message-State: APjAAAXx9uWCghVQhIqnqFFs1fYkn+VaO6W/pXQK51izZ5cgAP8sAFrH
        98JUykULBjTqc/1QIESeigeSoXWK9U7uU6O501PJaw==
X-Google-Smtp-Source: APXvYqwvKVOfsz0NTC0mYXChGLM55lyRHym2AQRa0cKt8qzoul87EQvweiisK/9Kb7Yw/xDtn57GMjoaeQBD5oomo5boFg==
X-Received: by 2002:a63:c442:: with SMTP id m2mr22869503pgg.286.1562742972197;
 Wed, 10 Jul 2019 00:16:12 -0700 (PDT)
Date:   Wed, 10 Jul 2019 00:14:56 -0700
In-Reply-To: <20190710071508.173491-1-brendanhiggins@google.com>
Message-Id: <20190710071508.173491-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190710071508.173491-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v8 06/18] kbuild: enable building KUnit
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        jpoimboe@redhat.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        peterz@infradead.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch,
        jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
        khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
        mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org,
        richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

KUnit is a new unit testing framework for the kernel and when used is
built into the kernel as a part of it. Add KUnit to the root Kconfig and
Makefile to allow it to be actually built.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
---
 Kconfig  | 2 ++
 Makefile | 2 ++
 2 files changed, 4 insertions(+)

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
index 3e4868a6498b2..0ce1a8a2b6fec 100644
--- a/Makefile
+++ b/Makefile
@@ -993,6 +993,8 @@ PHONY += prepare0
 ifeq ($(KBUILD_EXTMOD),)
 core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
 
+core-$(CONFIG_KUNIT) += kunit/
+
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
 		     $(net-y) $(net-m) $(libs-y) $(libs-m) $(virt-y)))
-- 
2.22.0.410.gd8fdbe21b5-goog

