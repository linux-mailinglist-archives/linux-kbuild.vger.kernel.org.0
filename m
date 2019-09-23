Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2699FBB08A
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2019 11:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439208AbfIWJDm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Sep 2019 05:03:42 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:50395 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439194AbfIWJDl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Sep 2019 05:03:41 -0400
Received: by mail-pf1-f202.google.com with SMTP id q127so9680086pfc.17
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Sep 2019 02:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=MYcfIKSKU50yEk2GBsBM2m5RiXljhL+2ZE7FFRNNMnA=;
        b=rgX9grwiH8698p8amnuLifl7FZpq0+HsIW+0F3DXrlfkC7hvnW46Ds1dX88Fg9hSwV
         1CpJGOYUJBrjisEw5rqXpm3twNK1EZkuUgTfzB4KelLLXmr2JYYAHDOzuLGGWfHk7Z8B
         JukbRj9cEH1VNXUV2BH75LBiPrL88f2OIldCwVVv9PXYQB8Mh1H2PYQsGyEqrGW6yt3l
         o1ZPJiLdbfP0Q1oObZ7+sD006GeglE2yLpEK1RuiUofJqAUpCu4mmj4kPJgozXX3SNra
         Y4OiNS/W8YHGVSNkDaF/i1OwHqdAhgUjePXoLxq4xZ9ltcdwITJG+eaLjBbhoU7NgIoX
         mhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=MYcfIKSKU50yEk2GBsBM2m5RiXljhL+2ZE7FFRNNMnA=;
        b=jWmtwCyL3v64W/4lps13kr+//fZVXd+z7D0yJXyTGeoRQx/HdR3DFdETiuBsz5bSFP
         nFcz61oGxw1jouIWoREaFAD0MAjSe+4f4janNH+mms7eTlgGmTQtv8OlULHl+d2Uilgz
         Npi7ZMFtzdHRBfoM2G5RSTfmqLUyGnwh6CPb15xZ7hmQXbuEkXGeHn/MXgFzuvMOtsLx
         QMSRMKuJZLkJjnD4ikPYdHRnqkLBaP6vQ5Am0pArsyaXDbx2YRV/8x2edjCKG8sXCmlC
         Ln6FeAaaXPeO/Zamyc0XEQYllHssBDRhHZxJEb9O8/2YiEKhBkTgoEj10fPduMmKZcTC
         R0Lw==
X-Gm-Message-State: APjAAAVLt/DqMSCLlNqxIuaoBaUkeYGJBdY0UzZ6b/PNkkYKFUG/zg7z
        k4fnegjYDcBPmxuoj26BNE3aYGaMwSmlzAlYd+2LAA==
X-Google-Smtp-Source: APXvYqxqbxTM5zGysUsGLrdt947Z5uprDPBuh1gcM9vTCBbii7SkiL91ZoHhXT0gUyKmK6pYMUz1UttJuY4q8vNzQE5tfw==
X-Received: by 2002:a63:221f:: with SMTP id i31mr28978881pgi.251.1569229418788;
 Mon, 23 Sep 2019 02:03:38 -0700 (PDT)
Date:   Mon, 23 Sep 2019 02:02:46 -0700
In-Reply-To: <20190923090249.127984-1-brendanhiggins@google.com>
Message-Id: <20190923090249.127984-17-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190923090249.127984-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
Subject: [PATCH v18 16/19] MAINTAINERS: add entry for KUnit the unit testing framework
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
        Brendan Higgins <brendanhiggins@google.com>
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
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a50e97a63bc8..e3d0d184ae4e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8802,6 +8802,17 @@ S:	Maintained
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
+F:	lib/kunit/
+F:	tools/testing/kunit/
+
 KERNEL USERMODE HELPER
 M:	Luis Chamberlain <mcgrof@kernel.org>
 L:	linux-kernel@vger.kernel.org
-- 
2.23.0.351.gc4317032e6-goog

