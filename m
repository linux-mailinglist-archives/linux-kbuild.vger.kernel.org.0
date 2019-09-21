Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95DB1B9B84
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Sep 2019 02:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437341AbfIUAUl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Sep 2019 20:20:41 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:40432 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437342AbfIUATe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Sep 2019 20:19:34 -0400
Received: by mail-pf1-f202.google.com with SMTP id b8so5852714pfd.7
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Sep 2019 17:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=XEXF0aWtRP7hmX6yjkpnHC7BrzYVm/zOhA0NZRgvhNA=;
        b=Dra6iRlZbj4Rqx8BK5ci6GvPBA4YGhBJ6RMnCfqDC1Er0WhfonE4FgeNIqw1ZwuYHr
         2X/ff9rVqAivCTJkTEKyzDOHA9JyV+0IwGpKPzm3MIbV2G/fkld4uhJCgjwHET99xcxH
         fd2E5eVNVyo+FopmL4QsuAsP3jzbiXXUI3sugKiKTx2EsfLbt0yjShGCcnwWBp9GK8/R
         fyBJsgh2xa6GsMdCHoOEfxHFhnDogpkfUGhW3C2gDOA6Doowd/I8MiLnc2ivYmgcwTkO
         q7FDjqFAKdKJV0RBPHZK9Au3y5d5gtEzeR1VLV1ZWOSYGvztNB6q/aqOsUXOICUatjAE
         1Taw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=XEXF0aWtRP7hmX6yjkpnHC7BrzYVm/zOhA0NZRgvhNA=;
        b=LT/5an5yydZpvJaNxwU+0+6mchhnQTnragXtLqoadZwTwoRF+nkUHY+glQIAyrzIgL
         xeaCOlFJcLB38xKsFEShLhK2N/eGyMHIomjXqm0X+UMxUNiX5RXcyHB3SR5rTfT5DM+h
         qWLlOiHreX/kYqsaFACTX+orHYy4AlfzMxgT84OeTtMzYKHp6KZhAD6DcE+K0nIPd8Qj
         sNzxMTx16/+Omn9vS7fS47pqhYafTPJKjvy6HLOO2qdVyvkehlhNebDOCyIrhbHzGLaO
         37wA3D1gtK3pdmDP1xo8qEjof9hecU2n8xQWjMMjF4sgOnOGL+0zPJfToTCju64UF9VS
         oYuw==
X-Gm-Message-State: APjAAAWR3m6gDExaW+I9Cy2I5BVOqBgYs2Lzo7KlHJOPQhLk377HwjI9
        hjV2eZdBjjYGGcbmVro+38jfNshiw2cSvccDsdAeDw==
X-Google-Smtp-Source: APXvYqxlNiTiVDoLGm7gicBAQJqK6SEUb3uB1fEZiMQB7IRA2E+sdg+0+05mefYUZ9i4sFC+aICY+qZzL1Y5G4LZgbHmxQ==
X-Received: by 2002:a63:2f44:: with SMTP id v65mr17507270pgv.380.1569025172132;
 Fri, 20 Sep 2019 17:19:32 -0700 (PDT)
Date:   Fri, 20 Sep 2019 17:18:46 -0700
In-Reply-To: <20190921001855.200947-1-brendanhiggins@google.com>
Message-Id: <20190921001855.200947-11-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190921001855.200947-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
Subject: [PATCH v17 10/19] kunit: test: add tests for kunit test abort
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

Add KUnit tests for the KUnit test abort mechanism (see preceding
commit). Add tests both for general try catch mechanism as well as
non-architecture specific mechanism.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 lib/kunit/Makefile    |   3 +-
 lib/kunit/test-test.c | 106 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 108 insertions(+), 1 deletion(-)
 create mode 100644 lib/kunit/test-test.c

diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index c9176c9c578c..769d9402b5d3 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_KUNIT) +=			test.o \
 					assert.o \
 					try-catch.o
 
-obj-$(CONFIG_KUNIT_TEST) +=		string-stream-test.o
+obj-$(CONFIG_KUNIT_TEST) +=		test-test.o \
+					string-stream-test.o
 
 obj-$(CONFIG_KUNIT_EXAMPLE_TEST) +=	example-test.o
diff --git a/lib/kunit/test-test.c b/lib/kunit/test-test.c
new file mode 100644
index 000000000000..06d34d36b103
--- /dev/null
+++ b/lib/kunit/test-test.c
@@ -0,0 +1,106 @@
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
+static void kunit_test_successful_try(void *data)
+{
+	struct kunit *test = data;
+	struct kunit_try_catch_test_context *ctx = test->priv;
+
+	ctx->function_called = true;
+}
+
+static void kunit_test_no_catch(void *data)
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
+static void kunit_test_unsuccessful_try(void *data)
+{
+	struct kunit *test = data;
+	struct kunit_try_catch_test_context *ctx = test->priv;
+	struct kunit_try_catch *try_catch = ctx->try_catch;
+
+	kunit_try_catch_throw(try_catch);
+	KUNIT_FAIL(test, "This line should never be reached\n");
+}
+
+static void kunit_test_catch(void *data)
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
+	if (!ctx)
+		return -ENOMEM;
+
+	test->priv = ctx;
+
+	ctx->try_catch = kunit_kmalloc(test,
+				       sizeof(*ctx->try_catch),
+				       GFP_KERNEL);
+	if (!ctx->try_catch)
+		return -ENOMEM;
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
2.23.0.351.gc4317032e6-goog

