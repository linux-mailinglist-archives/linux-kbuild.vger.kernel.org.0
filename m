Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7955F0BF
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2019 02:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbfGDAjM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Jul 2019 20:39:12 -0400
Received: from mail-pg1-f201.google.com ([209.85.215.201]:54715 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727605AbfGDAhr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jul 2019 20:37:47 -0400
Received: by mail-pg1-f201.google.com with SMTP id t2so2564922pgs.21
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Jul 2019 17:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=XlrqH678HDR84yo41rM73BaaQaGuXs9XZZneq4FOZeY=;
        b=ffmju7yr7gRfaJbHZ/EKKmVncl8VlWULQaThQY06zll3+6WpQG6lpGZ4OPQmMivptS
         8hDYradWvLpP2Ynet+Ye7uV0kLczbf6RFD8mFVTANX2yg7wM9YbXidQ/FQZgq07MWegb
         OGw9om8WRHzmMMnObSBGoIx3ybtRj+V2h+ffEXd5lxF3Nc0UTcEdl8L3/UVHObrq7Hpr
         pb1JvhsO78qMQnHwg/Ed80IloOa6WYSoqzkmmaIisIDaOlJlxgcTtQcFCed7VfZAR09f
         b9pzfPkA2sw/PBcf5XMV0Aycvwei2GOmUX9h6Qyralx5M52IFq4n3EvX8Bsm6682vUXZ
         cuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=XlrqH678HDR84yo41rM73BaaQaGuXs9XZZneq4FOZeY=;
        b=QbFV/U/TaPuNtHtTZzWoAK2NUzQNvSTHZ3N/FbbF6oBfmT9/ZoSkYsZOlwFk3yKdaE
         mMSLqlDA7hI8UrNCGXEWkRj7f2IsEGpD0EEhFCCdkkixaHpXnb/VO28dvO2Uamq8bykc
         5kmBxGm9Y07ZKcEDZtiyik2t1KPLo+u1l0UG5p+IfD822r0AYGdSl4PirTPpEpP7Bo9W
         +lgLZIaj1GQL3t+u/r8wl8EhUSLoiJwRCWIyX/OkXO5tqHflQLZk8DT6U85QD/mMrihK
         kQcKyj9Im8cv1VnaimjCFzV4nm2I3NXtBrTLf+8fZnaIYqN6h+f8Hd/T4vV1q+yTYrPx
         OAuQ==
X-Gm-Message-State: APjAAAUXuIK6pQxeBJaLQGHCVtr1zpk1V5clrbCCSnWDeIEAO9m6t84y
        8TeGcO7MefnWGzjNFJF1xUYsvvQpZtt9Af1Zjd+W4A==
X-Google-Smtp-Source: APXvYqzEyrStQtoN+0MmqxKcoxkpwGwMdPWPCVJ2v+rt7FevA703DgZaVQugKeZ2rVGA0cnHCH+IEhNvyiDaQ8b6b05Cdg==
X-Received: by 2002:a63:1b07:: with SMTP id b7mr39423299pgb.133.1562200665901;
 Wed, 03 Jul 2019 17:37:45 -0700 (PDT)
Date:   Wed,  3 Jul 2019 17:36:03 -0700
In-Reply-To: <20190704003615.204860-1-brendanhiggins@google.com>
Message-Id: <20190704003615.204860-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190704003615.204860-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v6 06/18] kbuild: enable building KUnit
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
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

KUnit is a new unit testing framework for the kernel and when used is
built into the kernel as a part of it. Add KUnit to the root Kconfig and
Makefile to allow it to be actually built.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
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
index fabc127d127f9..44e0d730dd5b6 100644
--- a/Makefile
+++ b/Makefile
@@ -991,7 +991,7 @@ endif
 PHONY += prepare0
 
 ifeq ($(KBUILD_EXTMOD),)
-core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
+core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/ kunit/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
-- 
2.22.0.410.gd8fdbe21b5-goog

