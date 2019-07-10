Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E24A764267
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2019 09:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbfGJHQo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Jul 2019 03:16:44 -0400
Received: from mail-pg1-f202.google.com ([209.85.215.202]:43683 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727303AbfGJHQn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jul 2019 03:16:43 -0400
Received: by mail-pg1-f202.google.com with SMTP id f18so917534pgb.10
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jul 2019 00:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Fb/CZ+Kk060SdN/y7lfCe8WEta+n71tTYM2wbCGeWoE=;
        b=ERVZ6zP12rxG8cbGYBF/uuVbuj5yYTVSqQ7Mh7/OGWseUfm6noG03q82SI9qQXx3Je
         pWGrAsalXeI1RTIsf6LKtntIHUsZsitCotbJtz8pwEW7Lu/X9aUWss7qQ485zdoRbwFV
         /i8UZSMJHz4L1Cbau0xAR1TC/YReWtlXtvKRAte7PmRsBFkQa66MYCMiyeOT5fBbODJ4
         k3EXtg4mvPezxRCxMMTSPsa/e6duY0CxIZrquM3gtgSDXksyvSxe8OO7wx0RUMqy5pNW
         OkK7emoPtW6PYXT+6knSPbs/JF793ZCJhiDcDEuLzDx4V8m2TxmGY0EmbLNXuhV4NYQv
         yk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Fb/CZ+Kk060SdN/y7lfCe8WEta+n71tTYM2wbCGeWoE=;
        b=p6lZwXVM0oZzotYYFoN1rMWp1LgVvvDiMDChclKWYbsMpJQIJLaGVpy0/6nmPXZYlN
         Cbt6cp+c5csEkRfOyFzyH4vQZtRgaAKhdv4hju30We6sa85fjvnkOtRmPbjm60OPdOH6
         rzBZNG8X/GgfAZ+doh/g5Rc21KjVEyg+TF91cflBd1iJguzQhO0yBa+wb/3inD5lRuup
         ffOZ6/qWaUflU8zZ2K20mim0mhtafdGY2585ZKVBEwe1QSzQQtGBb8uVTzYVWJev3v5T
         KuDXPCcK3SdSckFpxteHj7c3rDzcDuFljSg7O4oheChzacaLuGkFpTOtiE3uEb51lwTV
         1x8A==
X-Gm-Message-State: APjAAAWzpUIEjz+RHpMyl5sQKU3TGO6J+n2JV6RQGbRKfEJCrBLlwET7
        vPes2FF3pWykSNr1P3AN1yeI0LMi9T1XI7/3aziYRg==
X-Google-Smtp-Source: APXvYqwsumUcR66XTuZ8ckO5TQp7FZqC7HqAXuIKqxCFU++uh3jP4vJYNMyir4zNu2/OjewrUb1MtljexzGOvMkWrm3Niw==
X-Received: by 2002:a65:55c2:: with SMTP id k2mr35449420pgs.217.1562743002055;
 Wed, 10 Jul 2019 00:16:42 -0700 (PDT)
Date:   Wed, 10 Jul 2019 00:15:00 -0700
In-Reply-To: <20190710071508.173491-1-brendanhiggins@google.com>
Message-Id: <20190710071508.173491-11-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190710071508.173491-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v8 10/18] kunit: test: add tests for kunit test abort
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

Add KUnit tests for the KUnit test abort mechanism (see preceding
commit). Add tests both for general try catch mechanism as well as
non-architecture specific mechanism.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
---
 kunit/Makefile    |   3 +-
 kunit/test-test.c | 101 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 kunit/test-test.c

diff --git a/kunit/Makefile b/kunit/Makefile
index 1f7680cfa11ad..533355867abd2 100644
--- a/kunit/Makefile
+++ b/kunit/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_KUNIT) +=			test.o \
 					kunit-stream.o \
 					try-catch.o
 
-obj-$(CONFIG_KUNIT_TEST) +=		string-stream-test.o
+obj-$(CONFIG_KUNIT_TEST) +=		test-test.o \
+					string-stream-test.o
 
 obj-$(CONFIG_KUNIT_EXAMPLE_TEST) +=	example-test.o
diff --git a/kunit/test-test.c b/kunit/test-test.c
new file mode 100644
index 0000000000000..88f4cdf03db2a
--- /dev/null
+++ b/kunit/test-test.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit test for core test infrastructure.
+ *
+ * Copyright (C) 2019, Google LLC.
+ * Author: Brendan Higgins <brendanhiggins@google.com>
+ */
+#include <kunit/test.h>
+
+struct kunit_try_catch_test_context {
+	struct kunit_try_catch *try_catch;
+	bool function_called;
+};
+
+void kunit_test_successful_try(void *data)
+{
+	struct kunit *test = data;
+	struct kunit_try_catch_test_context *ctx = test->priv;
+
+	ctx->function_called = true;
+}
+
+void kunit_test_no_catch(void *data)
+{
+	struct kunit *test = data;
+
+	KUNIT_FAIL(test, "Catch should not be called\n");
+}
+
+static void kunit_test_try_catch_successful_try_no_catch(struct kunit *test)
+{
+	struct kunit_try_catch_test_context *ctx = test->priv;
+	struct kunit_try_catch *try_catch = ctx->try_catch;
+
+	kunit_try_catch_init(try_catch,
+			     test,
+			     kunit_test_successful_try,
+			     kunit_test_no_catch);
+	kunit_try_catch_run(try_catch, test);
+
+	KUNIT_EXPECT_TRUE(test, ctx->function_called);
+}
+
+void kunit_test_unsuccessful_try(void *data)
+{
+	struct kunit *test = data;
+	struct kunit_try_catch_test_context *ctx = test->priv;
+	struct kunit_try_catch *try_catch = ctx->try_catch;
+
+	kunit_try_catch_throw(try_catch);
+	KUNIT_FAIL(test, "This line should never be reached\n");
+}
+
+void kunit_test_catch(void *data)
+{
+	struct kunit *test = data;
+	struct kunit_try_catch_test_context *ctx = test->priv;
+
+	ctx->function_called = true;
+}
+
+static void kunit_test_try_catch_unsuccessful_try_does_catch(struct kunit *test)
+{
+	struct kunit_try_catch_test_context *ctx = test->priv;
+	struct kunit_try_catch *try_catch = ctx->try_catch;
+
+	kunit_try_catch_init(try_catch,
+			     test,
+			     kunit_test_unsuccessful_try,
+			     kunit_test_catch);
+	kunit_try_catch_run(try_catch, test);
+
+	KUNIT_EXPECT_TRUE(test, ctx->function_called);
+}
+
+static int kunit_try_catch_test_init(struct kunit *test)
+{
+	struct kunit_try_catch_test_context *ctx;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	test->priv = ctx;
+
+	ctx->try_catch = kunit_kmalloc(test,
+				       sizeof(*ctx->try_catch),
+				       GFP_KERNEL);
+
+	return 0;
+}
+
+static struct kunit_case kunit_try_catch_test_cases[] = {
+	KUNIT_CASE(kunit_test_try_catch_successful_try_no_catch),
+	KUNIT_CASE(kunit_test_try_catch_unsuccessful_try_does_catch),
+	{}
+};
+
+static struct kunit_suite kunit_try_catch_test_suite = {
+	.name = "kunit-try-catch-test",
+	.init = kunit_try_catch_test_init,
+	.test_cases = kunit_try_catch_test_cases,
+};
+kunit_test_suite(kunit_try_catch_test_suite);
-- 
2.22.0.410.gd8fdbe21b5-goog

