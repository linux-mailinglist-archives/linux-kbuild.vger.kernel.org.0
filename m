Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF44447CC2
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2019 10:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbfFQI2E (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Jun 2019 04:28:04 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:51861 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727994AbfFQI2C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Jun 2019 04:28:02 -0400
Received: by mail-qt1-f201.google.com with SMTP id a18so8555911qtj.18
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2019 01:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bPJF89cE4tB1wXKocb/qXW7wfYtIegjLntcYJJ0aEtU=;
        b=o3ogFQ5rdp7cs19G6mteH4rVDUn7teQlurDS0jWzA1kqGwAdqcTxbcDaERqO0pAcK0
         Eh/sClefw5IpL+NRbzQmr6gm3oBb2p8bAzIgg9VsGdKoZ8PJcp2xIjTn/DeBFhMeb7uR
         dNswLweSgYBoYpma1nvfuatrGqhK85GbkGMdIeoO4zRE00IECRglOhzr+/nawhYV39ee
         bQDQC5r2qfCqDqtCzLuaxcLPUb91JojIyYu9tnH2DTcRG9G6JLjrnwscNnQBm+FLS7Tv
         KGYroA3avaB1RnLa65qQXoiFVl6APqQtkplsbvke9XY0m46ewZR6DehJ3wQkF6J665bz
         WPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bPJF89cE4tB1wXKocb/qXW7wfYtIegjLntcYJJ0aEtU=;
        b=e5rR/4AUavlFQF+UvozMKKpT4QA4R4ijZeV0E0FJDAs2PqOQD3+ohFIGVlBBL6kwia
         U6V5c2tZvXL6Lkp5urK0y1RlyPghnvX57cvmngzd0iJk6tyke0L+eD+cy7YWBkw90f+d
         NS4yQHqbJW8x2hXxf6cIeGGmYQQ3t4t05mQIa1Jv/bCAi6N0JZweDnmVv+WQu5pszzx1
         tu33kca5Y7Dt4oRDtdtP23un3Q5lQkkemBLFegQL6q8adXG0ub6Xo2YeFXveUvITNEYO
         LBVQb6zzIjxV0Ja0wo/dXnqxo5cbANh5djcLY2Of2z9wOAykE7as1BW/DpQzKALVXUkY
         BUwA==
X-Gm-Message-State: APjAAAXmukQyTmN/MMEsO1Wx5XCEto4CKrBsE3MD21zjy+eiYI1h2oaS
        S/i9ratpqh3nIT9JGHDH+YNVZqgC2EdMinpZKhXRdA==
X-Google-Smtp-Source: APXvYqyTbtjCAcLDWOBf80YN420uGxHfWPtOCpnCXNoMdm2lw18nK8fM3CaU+vc/SrSDk5njDqLK9j/e5783XfBqOv3IRQ==
X-Received: by 2002:ac8:2ac5:: with SMTP id c5mr86955007qta.332.1560760081475;
 Mon, 17 Jun 2019 01:28:01 -0700 (PDT)
Date:   Mon, 17 Jun 2019 01:26:11 -0700
In-Reply-To: <20190617082613.109131-1-brendanhiggins@google.com>
Message-Id: <20190617082613.109131-17-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v5 16/18] MAINTAINERS: add entry for KUnit the unit testing framework
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

Add myself as maintainer of KUnit, the Linux kernel's unit testing
framework.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 57f496cff9997..f3fb3fc30853e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8590,6 +8590,17 @@ S:	Maintained
 F:	tools/testing/selftests/
 F:	Documentation/dev-tools/kselftest*
 
+KERNEL UNIT TESTING FRAMEWORK (KUnit)
+M:	Brendan Higgins <brendanhiggins@google.com>
+L:	linux-kselftest@vger.kernel.org
+L:	kunit-dev@googlegroups.com
+W:	https://google.github.io/kunit-docs/third_party/kernel/docs/
+S:	Maintained
+F:	Documentation/dev-tools/kunit/
+F:	include/kunit/
+F:	kunit/
+F:	tools/testing/kunit/
+
 KERNEL USERMODE HELPER
 M:	Luis Chamberlain <mcgrof@kernel.org>
 L:	linux-kernel@vger.kernel.org
-- 
2.22.0.410.gd8fdbe21b5-goog

