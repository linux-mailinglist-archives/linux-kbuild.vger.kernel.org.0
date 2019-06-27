Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA8558746
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2019 18:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbfF0QkU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 Jun 2019 12:40:20 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:24497 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbfF0QkU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Jun 2019 12:40:20 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x5RGdDPx001384;
        Fri, 28 Jun 2019 01:39:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x5RGdDPx001384
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561653557;
        bh=MYrNi+Xd6YMTfmz3pQOfdZHAzwLaAH2VFWzvGIIyMfM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FawWg3mvas6tq+8fjdCOIzO2/Fo1SUHXQcsbhnsscqariUpD7EpRIWplQ3l95tm3O
         PSPrpIVGwMznVpo+S7XkC6DW9FbiCaHQxY+HiKIJYixlSULY3xlJzYn0ArtDgX91DX
         rLJPylko8ap8cIo62wn34SLEsucmLFtVCfLZRjz4zU+mqYFSwY+ozAsjnHdvw3AgF2
         Rzsp6IM9WKAV2MuGaIfqm4xG2YD14qLvXIc9pXG42nZ11H33u7gHOgbUxNI9nPxotR
         xLiZhJMCrdmI23Pv9xz7zjhLeO+dd+Qje4JZuUmxVFlwLF1irl9Fd277b3RGlDgapz
         tk6BWkAe61Bew==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Jani Nikula <jani.nikula@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH v3 3/4] kbuild: support header-test-pattern-y
Date:   Fri, 28 Jun 2019 01:39:01 +0900
Message-Id: <20190627163903.28398-4-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190627163903.28398-1-yamada.masahiro@socionext.com>
References: <20190627163903.28398-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In my view, most of headers can be self-contained. So, it would be
tedious to add every header to header-test-y explicitly. We usually
end up with "all headers with some exceptions".

There are two types in exceptions:

[1] headers that are never compiled as standalone units

  For examples, include/linux/compiler-gcc.h is not intended for
  direct inclusion. We should always exclude such ones.

[2] headers that are conditionally compiled as standalone units

  Some headers can be compiled only for particular architectures.
  For example, include/linux/arm-cci.h can be compiled only for
  arm/arm64 because it requires <asm/arm-cci.h> to exist.
  Clang can compile include/soc/nps/mtm.h only for arc because
  it contains an arch-specific register in inline assembler.

So, you can write Makefile like this:

  header-test-                += linux/compiler-gcc.h
  header-test-$(CONFIG_ARM)   += linux/arm-cci.h
  header-test-$(CONFIG_ARM64) += linux/arm-cci.h
  header-test-$(CONFIG_ARC)   += soc/nps/mtm.h

The new syntax header-test-pattern-y will be useful to specify
"the rest".

The typical usage is like this:

  header-test-pattern-y += */*.h

This will add all the headers in sub-directories to the test coverage,
excluding $(header-test-). In this regards, header-test-pattern-y
behaves like a weaker variant of header-test-y.

Caveat:
The patterns in header-test-pattern-y are prefixed with $(srctree)/$(src)/
but not $(objtree)/$(obj)/. Stale generated headers are often left over
when you traverse the git history without cleaning. Wildcard patterns for
$(objtree) may match to stale headers, which could fail to compile.
One pitfall is $(srctree)/$(src)/ and $(objtree)/$(obj)/ point to the
same directory for in-tree building. So, header-test-pattern-y should
be used with care since it can potentially match to stale headers.

Caveat2:
You could use wildcard for header-test-. For example,

  header-test- += asm-generic/%

... will exclude headers in asm-generic directory. Unfortunately, the
wildcard character is '%' instead of '*' here because this is evaluated
by $(filter-out ...) whereas header-test-pattern-y is evaluated by
$(wildcard ...). This is a kludge, but seems useful in some places...

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Tested-by: Jani Nikula <jani.nikula@intel.com>
---

Changes in v3: None
Changes in v2:
  - New patch

 Documentation/kbuild/makefiles.txt | 10 ++++++++++
 scripts/Makefile.lib               | 11 +++++++++++
 2 files changed, 21 insertions(+)

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
index 55ae1ec65342..281864fcf0fe 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -67,6 +67,17 @@ extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
 endif
 
 # Test self-contained headers
+
+# Wildcard searches in $(srctree)/$(src)/, but not in $(objtree)/$(obj)/.
+# Stale generated headers are often left over, so pattern matching should
+# be avoided. Please notice $(srctree)/$(src)/ and $(objtree)/$(obj) point
+# to the same location for in-tree building. So, header-test-pattern-y should
+# be used with care.
+header-test-y	+= $(filter-out $(header-test-), \
+		$(patsubst $(srctree)/$(src)/%, %, \
+		$(wildcard $(addprefix $(srctree)/$(src)/, \
+		$(header-test-pattern-y)))))
+
 extra-$(CONFIG_HEADER_TEST) += $(addsuffix .s, $(header-test-y))
 
 # Add subdir path
-- 
2.17.1

