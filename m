Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE36BB9A1A
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Sep 2019 01:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407046AbfITXT5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Sep 2019 19:19:57 -0400
Received: from mail-pl1-f202.google.com ([209.85.214.202]:52994 "EHLO
        mail-pl1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407107AbfITXT4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Sep 2019 19:19:56 -0400
Received: by mail-pl1-f202.google.com with SMTP id y2so5387626plk.19
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Sep 2019 16:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=iAt6nbLOTb6MSd0OQpor+vgL4LVt0KITsii11UOE388=;
        b=AYjtMTJ/bM129CXuepq5nEai9unWmuv9KrBsNEIaNyPvQ4Lt9h0LEysSES4HAewjdy
         29QdHAI+HmjwUpZpOFfp+65UA1AXawPyQBrV9eC7bzwv+iTdkaID8+C2RbUTQ424wFXU
         ikBwbFbcoWCNie+/3MBIfmo5PilLysY1O2sVT4F+CzBPblIy6HgcB1k/q+DaLNKLnOPG
         KGhX19FC/G+6Iq+SUJYyTo1TyMfAp7OPjYNGjrMoMDGT8Lcrz3+Do8Yd4VbmfMqldrGC
         31xONjlg/4CyE/OtZ+d8kznbXo+3NUSFplR4NcCXIsv/+7PDrkmrSqkTzl+KSxrv6PXb
         yRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=iAt6nbLOTb6MSd0OQpor+vgL4LVt0KITsii11UOE388=;
        b=enicf6pUY3lyAfhkmDxJmRCbQi9q3XG+uuHkCthTBRzmq4w/TW+YM2+1BI2vMIXT/R
         aUYHfmBy83J+bEr7OE57NM0KqK79JVPQCjogmuMRh8KKVubBryX3admzc10eH5PGSby+
         yHXI4nWnxAJTTnnRAgQBiYcVjjb+J5S8bxSKwTVWt+WPrc0SL90wrYw9viGPuuRGlXaK
         AtbBW9DVGn7zkg/j5/TuR0KlUBOLYzmFTmn4SFw/QjGWCQsIH25HctbXQ+CjOuJGNPDh
         oswd8/gAoqrEJ8k5j54ni8ocjWxpWR/LT3sAkJL+Cj/86PgbX/GI1udeGPPHLZrRPimS
         nmTw==
X-Gm-Message-State: APjAAAWN6WRC65dgRM+UmFH7EPJNY6KQAvTWyvTPBnPGjh21Ejh2Zfhz
        pk1UiYPpO2JIFyPxsOMldT3pK9lZlZVgsNrEC5V0vg==
X-Google-Smtp-Source: APXvYqwvNWfMwXT5OHmC0FOVMC3AvIVvQINgZf/DTvElVJK0vl4Su5PZQX9OXJ1XdFr+Yzg+uGF0Z+1UbeiJPCoJbgdZWw==
X-Received: by 2002:a65:4145:: with SMTP id x5mr4101853pgp.259.1569021595251;
 Fri, 20 Sep 2019 16:19:55 -0700 (PDT)
Date:   Fri, 20 Sep 2019 16:19:10 -0700
In-Reply-To: <20190920231923.141900-1-brendanhiggins@google.com>
Message-Id: <20190920231923.141900-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190920231923.141900-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
Subject: [PATCH v16 06/19] lib: enable building KUnit in lib/
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
        wfg@linux.intel.com, torvalds@linux-foundation.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

KUnit is a new unit testing framework for the kernel and when used is
built into the kernel as a part of it. Add KUnit to the lib Kconfig and
Makefile to allow it to be actually built.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Kees Cook <keescook@chromium.org>
---
 lib/Kconfig.debug | 2 ++
 lib/Makefile      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 5960e2980a8a..5870fbe11e9b 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2144,4 +2144,6 @@ config IO_STRICT_DEVMEM
 
 source "arch/$(SRCARCH)/Kconfig.debug"
 
+source "lib/kunit/Kconfig"
+
 endmenu # Kernel hacking
diff --git a/lib/Makefile b/lib/Makefile
index 29c02a924973..67e79d3724ed 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -96,6 +96,8 @@ obj-$(CONFIG_TEST_MEMINIT) += test_meminit.o
 
 obj-$(CONFIG_TEST_LIVEPATCH) += livepatch/
 
+obj-$(CONFIG_KUNIT) += kunit/
+
 ifeq ($(CONFIG_DEBUG_KOBJECT),y)
 CFLAGS_kobject.o += -DDEBUG
 CFLAGS_kobject_uevent.o += -DDEBUG
-- 
2.23.0.351.gc4317032e6-goog

