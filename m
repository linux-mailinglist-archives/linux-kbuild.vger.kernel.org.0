Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEB4F668E5
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jul 2019 10:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfGLISP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Jul 2019 04:18:15 -0400
Received: from mail-pf1-f201.google.com ([209.85.210.201]:48363 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726816AbfGLISO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jul 2019 04:18:14 -0400
Received: by mail-pf1-f201.google.com with SMTP id u21so5107604pfn.15
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jul 2019 01:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=i+cHtqqH4D1BH2a9iTheu+r071sQgiMbeMpUxd8ISoM=;
        b=oHpfhzNbJmulqM6XSNH5su9esA0AXBMlIYp9xnUAqjTBxFDowcENzhm8NkKmPbzmBf
         TfIjRelR04iLN1TttiN4WrjDbgNJqROj8ZHFleOvrhDsyhjxlOVAKSIO3dzyZoQobaI7
         JWKbSLVf4RHLIrH4o+UfsD8ykJ2/IyL5O6ecYkykXB52Po8SpR2jZoRpgc9FNom5cM7L
         rW8BibE3ShU7hHecNSLSWPt79g74xsWLSFavd+V86jp0tTlXJ/wwZuXnzaPPuQYJ21My
         /ZSaqrVaDRaCkFVnpYDKUKzv1IQHchCGI5eBif6HuLTcLqHw+1CSS5LXiGvHFAFfgFXn
         LNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=i+cHtqqH4D1BH2a9iTheu+r071sQgiMbeMpUxd8ISoM=;
        b=U+mvq7dM7Si3wOFk7E/Nm3SbmyRrvYDss0NAEtpVQHrUIzmWR/Bwz3PBAJKD6xtEQc
         DQzl7vjjrH0ELv/7qIw3zvh8kCefU9bTiPiDVUOBsbWvx6XjR5uZFFlpfGeHVuwiIy/X
         n5UGXBJ++MUwoMARfZxEJqxBRPi1bPhxfb4mHBvreOGR0luyjTuawfeR5q9HoEhL1m5P
         GFXZuHUkMBdTroMLvGMz6/91Dev+vmQupxdKlRMBcJ/Pxo/Jp6v6Bhn9zA8kv+5Zepiu
         87teQQ2mDZrvY+JY1IhOFRHWuW0wAleyld4gKHQooMq71RbE+U87nhjvEyVgvFzLfCU/
         TIDw==
X-Gm-Message-State: APjAAAWdIHPsq4hua/mxxrPdc+9/SGTMs05/PWNbMw3bR/c7GrS1WefK
        hsT1s+RcLnBbynfyInqZb3H4gseth/4t6/PqPoxKvg==
X-Google-Smtp-Source: APXvYqzz2gJJL34hDMbBwPs85xg2+0dv7RK7cTbtv7ZbF6XViPSV/DLjekY0hrvbIynZL7ZvM95IzPNpuP225+5zbR75Zw==
X-Received: by 2002:a63:3046:: with SMTP id w67mr9536501pgw.37.1562919492919;
 Fri, 12 Jul 2019 01:18:12 -0700 (PDT)
Date:   Fri, 12 Jul 2019 01:17:34 -0700
In-Reply-To: <20190712081744.87097-1-brendanhiggins@google.com>
Message-Id: <20190712081744.87097-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190712081744.87097-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v9 08/18] objtool: add kunit_try_catch_throw to the noreturn list
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
index 172f991957269..98db5fe85c797 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -134,6 +134,7 @@ static int __dead_end_function(struct objtool_file *file, struct symbol *func,
 		"usercopy_abort",
 		"machine_real_restart",
 		"rewind_stack_do_exit",
+		"kunit_try_catch_throw",
 	};
 
 	if (func->bind == STB_WEAK)
-- 
2.22.0.410.gd8fdbe21b5-goog

