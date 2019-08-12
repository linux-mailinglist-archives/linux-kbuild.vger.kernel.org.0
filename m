Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0DBB8A5D8
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2019 20:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfHLSZG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Aug 2019 14:25:06 -0400
Received: from mail-pg1-f201.google.com ([209.85.215.201]:42292 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbfHLSZB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 14:25:01 -0400
Received: by mail-pg1-f201.google.com with SMTP id l12so18417556pgt.9
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Aug 2019 11:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=dJI3f1SN7FHCWsT2YqJJAK+Vl1EvHBTDcI6eHyMtfac=;
        b=TCXT4rGGA9pYgeGSCQOuwK+doWXPxrVb0AOPXxXQYGefHSTyEI76rZLOMEBucLYXJP
         Kl/YP3d/wByIytQWP4Kex8kaDH6aXm10JGy9E26rvvCKnc3kWivdZWxW7mVjjPVG1jdc
         B5d8cMNDdAEsb8NTNOmBKDM3Grrx/HJiMeWHQ25J7USIwDfTXkGqGcQUWCu16x4oIewF
         ArXvn7g3xON93c+6BDTa3AZGqLIr2NI17irPbGs2Lcc+bpTd4KtL3QtbRH+aysicvRrL
         s0pHKa7gRu0wDTB4A6uHp4C/kpR0hLfAxfUhmFjy8/5MrJWQJLRtKBIqN2ZlHzPzkuTo
         6woA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=dJI3f1SN7FHCWsT2YqJJAK+Vl1EvHBTDcI6eHyMtfac=;
        b=K74GotH163jXSCOH5sraWM8gxvVGN8tqX+pn1BnzKGc4QTtatmfypP6nxjDSsqr3iP
         iWgHM3wjUi4RG3g80qDsU61R4XKm9zWzM9CwjtS6OosVCAJTZ/gcM6dcCkQZuGyXUhgw
         dqG6im5ptI6muwboq5Y5vCliOKSSZQeVj+I42KIF6GKauapj4b+OefmLmGXCSnAezZJv
         FUbMAlW4m54kTPqskntgEEexdqrolKTycjD0biRSWglQpa2KtQ/8wVJ0/QwcZYjnA4eg
         4RrsR4Cm3D+kq4b65MCBKPImgSnK5VV7GoMzm5WvwKQ2OZygSTBsXpfNY5SOTk/IAuEv
         jDpw==
X-Gm-Message-State: APjAAAVSwGd4MRVpwQetVghs8w3+sUx/qH9oi8VT6iEh0islbAFbVsXB
        cG1RTUqSsT7cm5moZr1LSB3bqwJrhJiSUxZ+ck4c1w==
X-Google-Smtp-Source: APXvYqw92Wf36wL6Vq2NvamqmhQfIJvYCMbrqX7shiORRX3/SG4CRBa9Fefpmbw4Gnie+/T7oijkOxElDm0pwXK0Yzhrzw==
X-Received: by 2002:a63:e901:: with SMTP id i1mr30762084pgh.451.1565634300656;
 Mon, 12 Aug 2019 11:25:00 -0700 (PDT)
Date:   Mon, 12 Aug 2019 11:24:11 -0700
In-Reply-To: <20190812182421.141150-1-brendanhiggins@google.com>
Message-Id: <20190812182421.141150-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190812182421.141150-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v12 08/18] objtool: add kunit_try_catch_throw to the noreturn list
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

