Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E12988CB37
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2019 07:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727587AbfHNFw2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Aug 2019 01:52:28 -0400
Received: from mail-pg1-f202.google.com ([209.85.215.202]:38477 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727577AbfHNFw0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Aug 2019 01:52:26 -0400
Received: by mail-pg1-f202.google.com with SMTP id w5so67835171pgs.5
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2019 22:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=XDtrvkw0RFhKlN+LitTFqDIh4jTE9hk9LUw2Z5/BXjo=;
        b=saMDrOVjRKeQK/IyXLrIKKTej8JXwPZqG6sJSJzspUY0/Vy/4vjD74Uq6KaBZ8giTu
         aSQrymPIDBA9u9jdF3UZfEByMnMYgwVHxSq5bNSS9FqFYgj/2734mVL036n654EEM4y2
         KsOJEv05fKjKF+rDrbrxLIH47c6QNWJ48o49aql1AaRW/k1kZGisLqEOJZlAaRRp6rVg
         D6c1qhf78cJqdqIPoca7OfM8r1ij/g/0ge15DecTBlsydvLvgIJ+a8pgr/skhfIWUuWo
         ybz5j7sxBznT2cBuwPB6kXDuf1QIJXyYIdbPekKokrc/eMjbmBJuvdnHu5Ythn3lh2gz
         czYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=XDtrvkw0RFhKlN+LitTFqDIh4jTE9hk9LUw2Z5/BXjo=;
        b=do0OeOY6A+zW+vBDqIem4jWV+OZy5yhGo3jat3M5WII5zP9h0YTeWxjEUtvP0zFGCI
         mGdpuLoAizU+0fFmi9y6Rc7f2XTG3j/wGgaGpPFI66SWKD7qHjbGiNj26WFYpXji9hlE
         kDi2D2nFEes/JEOaWJmjPu1//CcMmVGci2pWZ9T92YhC2yaYGpOUgvfy8DGuiz0rV4Z2
         4xqSPqkiKUyqeySvuyUGGPxUIK4NYkP2nzVoYcamxMOsEka2oHGkduzcQTybXMOvr4RS
         H0RoSlcDWV85y094XuuT77V9KC1u+YblfnohqfZ4pKucUVCNsEJw+1Y2Qp6aDK8WAeLc
         D1Qw==
X-Gm-Message-State: APjAAAXr4mbWuDcSIxHtVqRcSk/btxAsjYIW9kvnqo2CF18MYYke6PDe
        1/JxfElOMrFtX2tHu5AVGkzsH9Ycd3ALSmXHKwAoKA==
X-Google-Smtp-Source: APXvYqxq+MfuyP3ARB3iygZvo6an8R1jW4rcA6hARFKN0G3haGYTLv0vmNCZJf3xUuojmYFx4j73XZnnj6yHGBpI3p9WKw==
X-Received: by 2002:a63:20d:: with SMTP id 13mr38240136pgc.253.1565761945419;
 Tue, 13 Aug 2019 22:52:25 -0700 (PDT)
Date:   Tue, 13 Aug 2019 22:50:56 -0700
In-Reply-To: <20190814055108.214253-1-brendanhiggins@google.com>
Message-Id: <20190814055108.214253-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190814055108.214253-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v13 06/18] kbuild: enable building KUnit
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
Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 Kconfig  | 2 ++
 Makefile | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Kconfig b/Kconfig
index e10b3ee084d4d..47886dbd6c2a6 100644
--- a/Kconfig
+++ b/Kconfig
@@ -32,3 +32,5 @@ source "lib/Kconfig"
 source "lib/Kconfig.debug"
 
 source "Documentation/Kconfig"
+
+source "kunit/Kconfig"
diff --git a/Makefile b/Makefile
index 23cdf1f413646..3795d0a5d0376 100644
--- a/Makefile
+++ b/Makefile
@@ -1005,6 +1005,8 @@ PHONY += prepare0
 ifeq ($(KBUILD_EXTMOD),)
 core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
 
+core-$(CONFIG_KUNIT) += kunit/
+
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
 		     $(net-y) $(net-m) $(libs-y) $(libs-m) $(virt-y)))
-- 
2.23.0.rc1.153.gdeed80330f-goog

