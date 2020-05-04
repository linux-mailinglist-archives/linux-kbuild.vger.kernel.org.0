Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA091C3169
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2020 05:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgEDDNz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 3 May 2020 23:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbgEDDNz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 May 2020 23:13:55 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E72B3C061A0E;
        Sun,  3 May 2020 20:13:54 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x2so4886730pfx.7;
        Sun, 03 May 2020 20:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=QnqKa4NQZ9uOHOh6AZE0XOBDXfa05SAZBiRq2Vs574w=;
        b=dpDGMeyJ3c+m+FkuSbJVfUNO3WlmABtDuJ/hneCSaqYChrn91oUQeGwP3FURTAQ/x0
         qRhS90U+4LtxZFDtgfu5yuxbYARsaSCDZJaoszEtyd2Gx1bCSCGiusLEqmiXo1F+h/MV
         AYwIXEWBQMH/5AFZuSJhy5Sh2Lu05aoGSRp3bJ6YpVoPJQbx7DToOblWL7qFL5e1rLT1
         j1RslGiSRcDZiWwgF3GEEWExxD7rOrckadhlMqhpdrPx7/j4Y+SP43Hrkl1S6iY1ab8K
         JYHQaNraS6OZQEMoBHpNJJnYui4/SYlHrHV9nnTPtE7yt/5whuKQkwnzGOld/3E+FxJm
         P+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QnqKa4NQZ9uOHOh6AZE0XOBDXfa05SAZBiRq2Vs574w=;
        b=Fbf7GmQlQGMuP7Ol9IgXq/BgVFCFyS2ird6fCKCmsPzDGGBW0Q5B+IBFj0xMKfod1A
         05UIxGt0pcwL3euy1BKcd/IVk00b/OJRREcj7Wcnpz/ZAnq+bz2FJWX70/QKVervVywi
         gjsLHipn1YMxJH+13zbAB5HVj6cfT6qrTjzEvZ0MWFK70/oJ74SWQhrmsKPi6RUkxUxt
         snkVIKKRS9RLnJW/vIuwzKFJJMwx1R0xbE8Hg5HUypBcbYEO22Z7gNjLSTYg8SaYZ3JF
         9N3TILcRk+nWdfE1MQTnBeSUwwzwzo2fMdYWe7bDrTC2W7dzgH5NlAAr6mpoD3Wq1wfU
         iGaQ==
X-Gm-Message-State: AGi0Pub0d9vgNWGiv91K0VbGGn7qS602DiLNYPgS1Xm/Ycoact8/s6eB
        /gI5NusAlHl2hM0hig6jA7U=
X-Google-Smtp-Source: APiQypKRP33f02lFtJSXV9Qaed+QbVxqgbcHSNyOWxpGQYPXdwC3ysBY3epGAQ+sIcQj/Nt/wn4zhQ==
X-Received: by 2002:a63:d06:: with SMTP id c6mr7068285pgl.2.1588562034241;
        Sun, 03 May 2020 20:13:54 -0700 (PDT)
Received: from localhost.localdomain (23-121-157-107.lightspeed.sntcca.sbcglobal.net. [23.121.157.107])
        by smtp.googlemail.com with ESMTPSA id p62sm7400376pfb.93.2020.05.03.20.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 20:13:53 -0700 (PDT)
From:   Nick Desaulniers <nick.desaulniers@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <nick.desaulniers@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH] Makefile: support compressed debug info
Date:   Sun,  3 May 2020 20:13:39 -0700
Message-Id: <20200504031340.7103-1-nick.desaulniers@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As debug information gets larger and larger, it helps significantly save
the size of vmlinux images to compress the information in the debug
information sections. Note: this debug info is typically split off from
the final compressed kernel image, which is why vmlinux is what's used
in conjunction with GDB. Minimizing the debug info size should have no
impact on boot times, or final compressed kernel image size.

All of the debug sections will have a `C` flag set.
$ readelf -S <object file>

$ bloaty vmlinux.gcc75.compressed.dwarf4 -- \
    vmlinux.gcc75.uncompressed.dwarf4

    FILE SIZE        VM SIZE
 --------------  --------------
  +0.0%     +18  [ = ]       0    [Unmapped]
 -73.3%  -114Ki  [ = ]       0    .debug_aranges
 -76.2% -2.01Mi  [ = ]       0    .debug_frame
 -73.6% -2.89Mi  [ = ]       0    .debug_str
 -80.7% -4.66Mi  [ = ]       0    .debug_abbrev
 -82.9% -4.88Mi  [ = ]       0    .debug_ranges
 -70.5% -9.04Mi  [ = ]       0    .debug_line
 -79.3% -10.9Mi  [ = ]       0    .debug_loc
 -39.5% -88.6Mi  [ = ]       0    .debug_info
 -18.2%  -123Mi  [ = ]       0    TOTAL

$ bloaty vmlinux.clang11.compressed.dwarf4 -- \
    vmlinux.clang11.uncompressed.dwarf4

    FILE SIZE        VM SIZE
 --------------  --------------
  +0.0%     +23  [ = ]       0    [Unmapped]
 -65.6%    -871  [ = ]       0    .debug_aranges
 -77.4% -1.84Mi  [ = ]       0    .debug_frame
 -82.9% -2.33Mi  [ = ]       0    .debug_abbrev
 -73.1% -2.43Mi  [ = ]       0    .debug_str
 -84.8% -3.07Mi  [ = ]       0    .debug_ranges
 -65.9% -8.62Mi  [ = ]       0    .debug_line
 -86.2% -40.0Mi  [ = ]       0    .debug_loc
 -42.0% -64.1Mi  [ = ]       0    .debug_info
 -22.1%  -122Mi  [ = ]       0    TOTAL

Suggested-by: David Blaikie <blakie@google.com>
Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
---
 Makefile          | 5 +++++
 lib/Kconfig.debug | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/Makefile b/Makefile
index 981eb902384b..313a054e5dc6 100644
--- a/Makefile
+++ b/Makefile
@@ -825,6 +825,11 @@ ifdef CONFIG_DEBUG_INFO_REDUCED
 DEBUG_CFLAGS	+= $(call cc-option, -femit-struct-debug-baseonly) \
 		   $(call cc-option,-fno-var-tracking)
 endif
+
+ifdef CONFIG_DEBUG_INFO_COMPRESSED
+DEBUG_CFLAGS	+= -gz=zlib
+KBUILD_LDFLAGS	+= --compress-debug-sections=zlib
+endif
 endif
 
 KBUILD_CFLAGS += $(DEBUG_CFLAGS)
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index f6f9a039f736..1f4a47ba6c1b 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -213,6 +213,15 @@ config DEBUG_INFO_REDUCED
 	  DEBUG_INFO build and compile times are reduced too.
 	  Only works with newer gcc versions.
 
+config DEBUG_INFO_COMPRESSED
+	bool "Compressed debugging information"
+	depends on DEBUG_INFO
+	depends on $(cc-option,-gz=zlib)
+	depends on $(ld-option,--compress-debug-sections=zlib)
+	help
+	  Compress the debug information using zlib.  Requires GCC 5.0+ or Clang
+	  5.0+.
+
 config DEBUG_INFO_SPLIT
 	bool "Produce split debuginfo in .dwo files"
 	depends on DEBUG_INFO
-- 
2.17.1

