Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96FA48A5C6
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2019 20:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbfHLSY7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Aug 2019 14:24:59 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:36613 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbfHLSY4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 14:24:56 -0400
Received: by mail-pf1-f202.google.com with SMTP id e20so66811114pfd.3
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Aug 2019 11:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=XDtrvkw0RFhKlN+LitTFqDIh4jTE9hk9LUw2Z5/BXjo=;
        b=Ac+IVyvk7parVxP2zH0uEVQKxR0ydkkSBoXdSfu6yTKAkHTUbHxzBAVJSs/41U/W+1
         q/YatPQqWA+RWEYP82fguAlLV+fLGTo46TX/ZZJftwBdAcJ6HgP8V4O05CrdFClEIc0+
         rOnN4FLNTcMxTMlJC9Vyb2s//YDejC9bkwHAwoQuDnN/ipNdDwP464Ix9QVO/9i9s7Zh
         3mCvvV+ZIxY7d/r2HpEWZRBnPGmFfx/oXxzr3p9KP80V4xAzziJYzk7/qh8u4S4qz4J/
         yFL4wqLruRhlh4n1ddmkBTvfGDu7jfPITZaKXRpIf+n1o8kmNZAL1VtOwqX/GZ+qXvSE
         Q4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=XDtrvkw0RFhKlN+LitTFqDIh4jTE9hk9LUw2Z5/BXjo=;
        b=cUhWkpvJ52xtIYU9vq18UEDhiFjNj8GC5WOWLbwMqLanJI9f4w2f/x3/uYNXrdp0eC
         SodkTzjF0Ufczm7Io/coGULxTibFFFUTuUM1UuxVqmgYlybxnXVbz0VBOdLsKYfAPLuZ
         M47g4Ykhg6wCa6pD29qo9pABTSb2BcR4mLnufh+UNxt6Wt56nof5K3Ypiko9qXxkfZxk
         f4VNGIY47f+7XAQGWpBdno1Bl7HZruWne2Mmlr+MiIjQLlL1yF0a8mICVazBGBklHZhu
         afwrYLr3c/baHBXgY+yS7hbZ7DnMoRpFHiMZlfBIabb3SE5LF3VPDw6PdbD3kvpceGoX
         eiUA==
X-Gm-Message-State: APjAAAU1BakDq+ta0QUbIqwezxGhfdaU6dRqOBFo3aFnN8APZIbEit02
        AK+UAzDL674INhSFNIlbkd8zMWd8eGNYvtWM0AUjzg==
X-Google-Smtp-Source: APXvYqxojx8ZAclLIuaCdYnMNf57BJdquOeV+3jxKMDZqemroKozL9g2ej9A9l9TB9EWj+QedGRVRvM2JXu6kLXD8V2awA==
X-Received: by 2002:a63:fe52:: with SMTP id x18mr32603743pgj.344.1565634295264;
 Mon, 12 Aug 2019 11:24:55 -0700 (PDT)
Date:   Mon, 12 Aug 2019 11:24:09 -0700
In-Reply-To: <20190812182421.141150-1-brendanhiggins@google.com>
Message-Id: <20190812182421.141150-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v12 06/18] kbuild: enable building KUnit
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

