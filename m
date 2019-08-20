Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1D2296DA8
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2019 01:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfHTXVS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Aug 2019 19:21:18 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:35104 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbfHTXVR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Aug 2019 19:21:17 -0400
Received: by mail-qk1-f201.google.com with SMTP id z2so233140qkf.2
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Aug 2019 16:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=dJI3f1SN7FHCWsT2YqJJAK+Vl1EvHBTDcI6eHyMtfac=;
        b=JPSvTdqrh5Hh7hmPhj7PWqFqjSO1pIitbg6P2pVs6R16DndX+uXzWVgyVVrWOFqwkb
         krpCIxpzbHY6OSf1BUFGonJTCWm2ABvcgKj+4ZkhPReEXTRKKgxCHtCYVoPySSPzRxdu
         DkJbZieHqOXFNnUqmCSsNo9Tukc3/7f58R2FRI/eWpyzGwwMUhQCebkt72Oi2fDqSbkV
         cti+345QxDVHZxwO+deZlFSFk1yEcErYxJM0g/FN6264KIjdj+ogwLW5Ni5WRRQSqqVW
         5kFNE7dRZSLPPX1nSVetLzZP5UI4scCNwGBlpIGf1Bqai6FTQz1NbkglGkpv6/BArW7W
         B4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=dJI3f1SN7FHCWsT2YqJJAK+Vl1EvHBTDcI6eHyMtfac=;
        b=M1rSp7b2wr8JD3wGKkzlXVUPrKVBuhWTJ7byK5WbpThQ8doecPArK+HDbEsGvyU9ko
         yoncQyt3pKz9OgbFboS18LXAnCV6yoDOrkh3oeiXHO4mM7V15ulVcXBlMla5ANWg9N4q
         YCvllgY+dB6oRerTfzAbESLzqDFsUpRR6hcZEfeii81OjAm1zhozt+8BxqnxnAEOrWen
         rh9CTirjqRdaOQ/sS9L5+DopAl2Va2yDoTja0AG/8ZCony9lw9b5qfeOBoMUqXqGek5/
         47KL5CwWlEv63Fhhh0CNDyegi9Vtmkk3lg4u3bQqa6oDaFkuuTsonWJoGlLn0psUsa8N
         oiSg==
X-Gm-Message-State: APjAAAUT4M6Fvi3OXysxYJpKS2Q+HG0CZVV+E7YeaHwmY014PpLaI7J4
        5lbpkCWUUZtA9CxdHkoDCVfIIz2TPbr4i1lz/hq0kw==
X-Google-Smtp-Source: APXvYqyHSDrw/H0KHUwTj03jK169STEQ/ER8j6HHgZyfEVFWAzdBG41wuCfhIFzlcxq30giOP1Z93ZVa6G2k4a5fw8FcGA==
X-Received: by 2002:ad4:45d3:: with SMTP id v19mr16123072qvt.90.1566343275753;
 Tue, 20 Aug 2019 16:21:15 -0700 (PDT)
Date:   Tue, 20 Aug 2019 16:20:36 -0700
In-Reply-To: <20190820232046.50175-1-brendanhiggins@google.com>
Message-Id: <20190820232046.50175-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190820232046.50175-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v14 08/18] objtool: add kunit_try_catch_throw to the noreturn list
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
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Fix the following warning seen on GCC 7.3:
  kunit/test-test.o: warning: objtool: kunit_test_unsuccessful_try() falls through to next function kunit_test_catch()

kunit_try_catch_throw is a function added in the following patch in this
series; it allows KUnit, a unit testing framework for the kernel, to
bail out of a broken test. As a consequence, it is a new __noreturn
function that objtool thinks is broken (as seen above). So fix this
warning by adding kunit_try_catch_throw to objtool's noreturn list.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
Link: https://www.spinics.net/lists/linux-kbuild/msg21708.html
Cc: Peter Zijlstra <peterz@infradead.org>
---
 tools/objtool/check.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 176f2f0840609..0c8e17f946cda 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -145,6 +145,7 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
 		"usercopy_abort",
 		"machine_real_restart",
 		"rewind_stack_do_exit",
+		"kunit_try_catch_throw",
 	};
 
 	if (!func)
-- 
2.23.0.rc1.153.gdeed80330f-goog

