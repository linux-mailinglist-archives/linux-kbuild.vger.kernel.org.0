Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED746A595
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2019 11:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733301AbfGPJny (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 05:43:54 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:53940 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733285AbfGPJny (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 05:43:54 -0400
Received: by mail-qk1-f202.google.com with SMTP id d11so16353788qkb.20
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jul 2019 02:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=jufAXaUURqTtvupks8boLXlDljriz0DHAMYuxhv6lic=;
        b=vgpjGaWHBzHp9ycl7Gj2VvPUN4KEgffqXLjPFXd1s5ujHZe3mNs3njAqvdwJ/pmGw3
         cTbhhCjUBglYq1eqSSC2/VqemNQReHtHO5ekEj80R0GOCdZRfZlMYes2JOCN6sWABPu6
         RTo7zbnna68DX6bqksoVpM74FQZ/trOI14k7tVnje6LtNi3fa4Buw2HyANgHkkzueQMK
         8t0o/iQ+br0rWSl3vrgZXFzmyolX1OOI2GAXJBbdbbfCPa8PlSzOZt2TbS0KraBI1Ham
         covVnXHmFYADrljfP70Ep4gjXsasOB5sG1ihjrdHn2AaN0481p+2WqQRbwAEFWNBYJaJ
         HXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=jufAXaUURqTtvupks8boLXlDljriz0DHAMYuxhv6lic=;
        b=Nb0V/ehGPtjcYZf7PABiQBAA7BsRrOZedP/Lors1SgjV3l6BtbmnmFHOkbCrP0mlUW
         DcITpxQ3yoqn/9+XLpRNi9nz3UidwITv5vi9XNA0lv2yYJDjal0KWQFirDiKKtOsV7oN
         4FO856FNwoc9kx0yZrwuwr/YjWe1Rkin+eBOkx9drohpEqnbyiRCUTSvv6ncxb9ph39S
         bn0l+5+o9rrYfUkt8yGPMNNgUdXFuVoQoeuUAle2VfA2byz7TVGUnEG9jimsQijlrXJF
         M6ta9W+SkqcDEqwRVq4K7vlv4XVUFBXs9UrEvTMN3ifl8+u5q9nkOe1OphYuV2E6NgUi
         3A0Q==
X-Gm-Message-State: APjAAAUhCLRWdgTTfyglD5nvVCHDeIE/S4R8RQmt1gIZs9vifJZ4E3cj
        XUWGbf8ldTGbeOOahjBixtWpnCvk+qVBL0f66g38ug==
X-Google-Smtp-Source: APXvYqxdoQCxyS2vi6iOV0SdFglJCYiFfVTskokE9ndTy0QxxgXK+rPdzc5HOt48np2BPs4oIwccRZf5oOo7m1gjUarTgA==
X-Received: by 2002:ae9:c310:: with SMTP id n16mr21197178qkg.438.1563270233041;
 Tue, 16 Jul 2019 02:43:53 -0700 (PDT)
Date:   Tue, 16 Jul 2019 02:43:00 -0700
In-Reply-To: <20190716094302.180360-1-brendanhiggins@google.com>
Message-Id: <20190716094302.180360-17-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190716094302.180360-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v10 16/18] MAINTAINERS: add entry for KUnit the unit testing framework
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
index 677ef41cb012c..48d04d180a988 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8599,6 +8599,17 @@ S:	Maintained
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
2.22.0.510.g264f2c817a-goog

