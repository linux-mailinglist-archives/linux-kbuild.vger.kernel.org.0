Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E11AE630B4
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 08:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfGIGeF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 02:34:05 -0400
Received: from mail-ua1-f74.google.com ([209.85.222.74]:53359 "EHLO
        mail-ua1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbfGIGeE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 02:34:04 -0400
Received: by mail-ua1-f74.google.com with SMTP id z23so1773816uag.20
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Jul 2019 23:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=xqyprLFtmsoy8kXd9YLO/VFwieDqS65MPOOJ9C+cs/4=;
        b=BV0dE8SvbznNengE0ZbiFjAkJDhECZRlV6y0anjBwPZPZ1QJAxXC1g/NWLJmkwh2dQ
         ymUxDZfk5Xo5TuLgPcbXMU1zelBpG5lRvdeCkasNl4X/Vnt9x4r1W8pPWC4/g+lUwaKi
         8JU4Z1wA6vTfOZEjHhdR9Mlf+yIQ7pF/76uNwAV9V52L6+GkfjA6GEFVHibZRCvNE6a8
         Fu4VfyO8IzEKX7M6CI/FgWBxODziZFM48h2BxhCVoZ3/hlGN10lCqjL51sWnlSnDcy2T
         mBdvBHfYXaqHr68JZPdHCE3Q2egJ+2F4FMM5YKC+b5EV9OgFhj4bqtOQ/+4RJplYTmiD
         NT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=xqyprLFtmsoy8kXd9YLO/VFwieDqS65MPOOJ9C+cs/4=;
        b=NpVzJmAjAb/up9DdD9ryf+TjQFOFulltTj/m0Jlq4smuTZVsjevXfRN3eqMwMFL9K/
         28JHdqUhUmBB1lIo/eN+pa8ZKnRMG8W5IkbIj1EGdbR+pY8aynHbm/MUzks4t42qWlhr
         8FwFwPSeSjL5r2TtrLLGbedMO7Du/semxURqama4q42990vsTecGFWYK9UC6xSGDgaLK
         aXX1zGR7YFuLd8D3FPnTWetWkTNfZ5tJnEAJ3W4WAG6RUvFERIZbKJtlnVgmJQg2r3hD
         Th153/zETxCAm4BCPlI71jz/iwWigjfkaiMWmPLBpB6TssWRRqaGozgvJ3dCxLIN8lDY
         DdjA==
X-Gm-Message-State: APjAAAX1O6rPLdFPOJAAOPXpWNa5Xsym6+0sJ5psGm1pp4HzoLYIlxq/
        O3L4ycWzWDO2IAFmxJgsE6waw8mbe7K1ojHMuuYguQ==
X-Google-Smtp-Source: APXvYqwNJiHBkRfCSkqsV5H5ZuEZsj6nanDgGNZ3VAmzTo0fg8lJCoDeNDmY/ozNQHmnZsAUL9Mc41SFcAh6mWnqjC3NSQ==
X-Received: by 2002:ab0:20d8:: with SMTP id z24mr4416164ual.1.1562654043545;
 Mon, 08 Jul 2019 23:34:03 -0700 (PDT)
Date:   Mon,  8 Jul 2019 23:30:11 -0700
In-Reply-To: <20190709063023.251446-1-brendanhiggins@google.com>
Message-Id: <20190709063023.251446-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190709063023.251446-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v7 06/18] kbuild: enable building KUnit
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
index 3e4868a6498b2..60cf4f0813e0d 100644
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

