Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D17505790C
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2019 03:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbfF0Br2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Jun 2019 21:47:28 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:23030 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfF0BrZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Jun 2019 21:47:25 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x5R1kN10032702;
        Thu, 27 Jun 2019 10:46:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x5R1kN10032702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561599987;
        bh=WDRPQkivBXprK4igHGdl9r2j3LgF/wYIMSwIl3K1+Yg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WivM+rXCRIYZwfZ1CSkAAvkM4nWIDY2PokEdWczFLz6f1Gza4Q25KPZ4nwqT9xVFn
         fUda08WWmrAHd2D2pJznfkK0ehxmP/J6rBMmDh6g/MYQV+C6yV8KKhfN4XwexJBn6E
         DrzCzUEZFhg1Jhug6cKd23tOAb/uq4nlVVsroZE/xI4mQOcHYVbrrJ0KabZLW95cvE
         OPXCEj8bCutiWIU5G+p1HF+SdBGpGmYxuJtQkrw7EX/Ck1HjGcy5n9/zgyD0bCV5Ii
         TOa50K50pQfLzrfw/oT2RA2oZJCLWkuygzxs3yH8ZIm3huRDttbimPmJp4fjJ37PkC
         b1/+HWiqfpkcw==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH v2 3/4] kbuild: support header-test-pattern-y
Date:   Thu, 27 Jun 2019 10:46:16 +0900
Message-Id: <20190627014617.600-4-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190627014617.600-1-yamada.masahiro@socionext.com>
References: <20190627014617.600-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In my view, most of headers can be self-contained. So, it would be
tedious to add every header to header-test-y explicitly. We usually
end up with "all headers with some exceptions".

There are two types in exceptions:

[1] headers that are never compiled as standalone units

  For examples, include/linux/compiler-gcc.h is not intended to be
  included directly. We should always exclude such ones.

[2] headers that are conditionally compiled as standalone units

  Some headers can be compiled only for particular architectures.
  For example, include/linux/arm-cci.h can be compiled only for
  arm/arm64 because it requires <asm/arm-cci.h> to exist.
  Clang can compile include/soc/nps/mtm.h only for arc because
  it contains an arch-specific register in inline assembler.

For [2], we can write Makefile like this:

  header-test-$(CONFIG_ARM) += linux/arm-cci.h

The new syntax header-test-pattern-y will be useful to specify
"the rest".

The typical usage is like this:

  header-test-pattern-y += */*.h

This adds all the headers in sub-directories to the test coverage,
but headers added to header-test- are excluded. In this regards,
header-test-pattern-y behaves like a weaker variant of header-test-y.

Caveat:
The patterns in header-test-pattern-y are prefixed with $(srctree)/$(src)/
but not $(objtree)/$(obj)/. Stale generated patterns are often left over.
For example, you will have ones when you traverse the git history for
'git bisect' without cleaning. If a wildcard is used for generated
headers, it may match to stale headers.

If you really want to compile-test generated headers, I recommend to
add them to header-test-y explicitly. One pitfall is $(srctree)/$(src)/
and $(objtree)/$(obj)/ point to the same directory for in-tree building.
So, header-test-pattern-y should be used with care. It can potentially
match to generated headers, which may be stale and fail to compile.

Caveat2:
You could use wildcard for header-test-. For example,

  header-test- += asm-generic/%

... will exclude headers in asm-generic directory. Unfortunately, the
wildcard character is '%' instead of '*' because this is evaluated by
$(filter-out ...) whereas header-test-pattern-y is evaluated by
$(wildcard ...). This is a kludge, but seems useful in some places...

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - New patch

 Documentation/kbuild/makefiles.txt | 10 ++++++++++
 scripts/Makefile.lib               | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 5080fec34609..b817e6cefb77 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -1025,6 +1025,16 @@ When kbuild executes, the following steps are followed (roughly):
 	i.e. compilable as standalone units. If CONFIG_HEADER_TEST is enabled,
 	this builds them as part of extra-y.
 
+    header-test-pattern-y
+
+	This works as a weaker version of header-test-y, and accepts wildcard
+	patterns. The typical usage is:
+
+		  header-test-pattern-y += *.h
+
+	This specifies all the files that matches to '*.h' in the current
+	directory, but the files in 'header-test-' are excluded.
+
 --- 6.7 Commands useful for building a boot image
 
 	Kbuild provides a few macros that are useful when building a
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 55ae1ec65342..54444933bbab 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -67,6 +67,16 @@ extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
 endif
 
 # Test self-contained headers
+
+# Wildcard searches in $(srctree)/$(src)/, but not in $(objtree)/$(obj)/.
+# Stale generated headers are often left over, so wildcard matching should
+# be avoided. Please notice $(srctree)/$(src)/ and $(objtree)/$(obj) point
+# to the same location for in-tree building.
+header-test-y	+= $(filter-out $(header-test-), \
+		$(patsubst $(srctree)/$(src)/%, %, \
+		$(wildcard $(addprefix $(srctree)/$(src)/, \
+		$(header-test-pattern-y)))))
+
 extra-$(CONFIG_HEADER_TEST) += $(addsuffix .s, $(header-test-y))
 
 # Add subdir path
-- 
2.17.1

