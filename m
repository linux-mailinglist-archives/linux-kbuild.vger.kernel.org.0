Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCE71DD9D0
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2020 00:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730405AbgEUWAt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 May 2020 18:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729370AbgEUWAt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 18:00:49 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C527AC061A0E
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2020 15:00:48 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 5so6955886ybe.17
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2020 15:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=aKUpBFPk5Djn/rrzBrR97m/tGbj33/YMXzpAfYT/Utg=;
        b=YfIck0fBt7ZzzuTMrr5pga7iKwpjiyj+4n/07wlqGVK9mgcIabVUzrNa4nO4j7OtP+
         reVeuIbakaXGmwIynLZ8dYPg7eMq9ZhCF/fwU1gHuwru6vq+uvWVsJBgo6yQMRiQk2VO
         gqlaLQwxWr15H6Wi/Tv+vEnL7/nTmz3K3rJd0V0y7aMEd+JNBAK8uxalc8ZSqzD2IPmn
         0nrb3LhcgjJ0LpMYcWNfSsswtnXMzh99mH1u8/c13xBp/9b7aH1bGNncdV/T2PxPgsPE
         bER9J08JrOXSQKnziH2/fuMX4ZscwDwa2XrjoN8noC1kFcSMRdJdngd1QGCUTqQOpJnE
         758w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=aKUpBFPk5Djn/rrzBrR97m/tGbj33/YMXzpAfYT/Utg=;
        b=BexQ6CoARXOXWaC2YKNmPhBaCHY3vyoX61BWdWU2vlWDh21u5haXQtU9RLd2gv/xke
         tQ4mlqPSAqQppfF/zL/RK/nmZq7xKaY5Q104XzCohlCOSws0rd9+lz1LpBMW1aRvDyRW
         mKx30xbLqZ+SVAcuv08oT44XrpxYIYFJrCvYdIqKS0C67ofwt+wsosWYrLGWUDNWSM6f
         FpkaymQK6eveqsXs4biWoKzNl+sCIbfQ5NONU64bK9pLKH2jklTUiXefyDbN7OF03Pwp
         kaJkouVvPf5opYsT15OlHoV2rkwg1u+iI8DT5jpGk0DmkNkpmK/Ih5115mbg+7Vuewny
         /1Kw==
X-Gm-Message-State: AOAM530qnAg0ewi8PG1jNpetrBDoLrWIK7JUoqGGNrzll/KR32vWLNXI
        e6Tkg1ThnTuPeShYwluye9Oi9CIwDkHMOuDuT7U=
X-Google-Smtp-Source: ABdhPJxWbiv3OFdS/gVrZqGmjfHKBwB+yz9rWYVA+P3KukhI6r49sD9dEtv7tc/9vEuxkF4xjN2PcOAPuI0dz9JEc2s=
X-Received: by 2002:a25:4207:: with SMTP id p7mr17146898yba.424.1590098447910;
 Thu, 21 May 2020 15:00:47 -0700 (PDT)
Date:   Thu, 21 May 2020 15:00:40 -0700
In-Reply-To: <CAKwvOd=jOr4ZaLx-dSNTqZnGRATY1PZktUfu4JGWKRwRH=Ujnw@mail.gmail.com>
Message-Id: <20200521220041.87368-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <CAKwvOd=jOr4ZaLx-dSNTqZnGRATY1PZktUfu4JGWKRwRH=Ujnw@mail.gmail.com>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
Subject: [PATCH v3] Makefile: support compressed debug info
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Nick Clifton <nickc@redhat.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        David Blaikie <blaikie@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
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

For x86_64 defconfig + LLVM=1 (before):
Elapsed (wall clock) time (h:mm:ss or m:ss): 3:22.03
Maximum resident set size (kbytes): 43856

For x86_64 defconfig + LLVM=1 (after):
Elapsed (wall clock) time (h:mm:ss or m:ss): 3:32.52
Maximum resident set size (kbytes): 1566776

Suggested-by: David Blaikie <blaikie@google.com>
Suggested-by: Nick Clifton <nickc@redhat.com>
Suggested-by: Sedat Dilek <sedat.dilek@gmail.com>
Reviewed-by: Fangrui Song <maskray@google.com>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes V2 -> V3:
* Fix blaikie@'s email addr.
* Fix Fangrui's Reviewed-by tag as per Masahiro.
* Fix help text as per Masahiro.
* Fix -Wa$(comma)foo as per Masahiro.

Changes V1 -> V2:
* rebase on linux-next.
* Add assembler flags as per Fangrui.
* Add note about KDEB_COMPRESS+scripts/package/builddeb
  as per Sedat and Masahiro.
* Add note about bintutils version requirements as per Nick C.
* Add note about measured increased build time and max RSS.
 Makefile          |  6 ++++++
 lib/Kconfig.debug | 17 +++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Makefile b/Makefile
index 71687bfe1cd9..be8835296754 100644
--- a/Makefile
+++ b/Makefile
@@ -822,6 +822,12 @@ DEBUG_CFLAGS	+= $(call cc-option, -femit-struct-debug-baseonly) \
 		   $(call cc-option,-fno-var-tracking)
 endif
 
+ifdef CONFIG_DEBUG_INFO_COMPRESSED
+DEBUG_CFLAGS	+= -gz=zlib
+KBUILD_AFLAGS	+= -Wa,--compress-debug-sections=zlib
+KBUILD_LDFLAGS	+= --compress-debug-sections=zlib
+endif
+
 KBUILD_CFLAGS += $(DEBUG_CFLAGS)
 export DEBUG_CFLAGS
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index b8f023e054b9..7fc82dcf814b 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -225,6 +225,23 @@ config DEBUG_INFO_REDUCED
 	  DEBUG_INFO build and compile times are reduced too.
 	  Only works with newer gcc versions.
 
+config DEBUG_INFO_COMPRESSED
+	bool "Compressed debugging information"
+	depends on DEBUG_INFO
+	depends on $(cc-option,-gz=zlib)
+	depends on $(as-option,-Wa$(comma)--compress-debug-sections=zlib)
+	depends on $(ld-option,--compress-debug-sections=zlib)
+	help
+	  Compress the debug information using zlib.  Requires GCC 5.0+ or Clang
+	  5.0+, binutils 2.26+, and zlib.
+
+	  Users of dpkg-deb via scripts/package/builddeb may find an increase in
+	  size of their debug .deb packages with this config set, due to the
+	  debug info being compressed with zlib, then the object files being
+	  recompressed with a different compression scheme. But this is still
+	  preferable to setting $KDEB_COMPRESS to "none" which would be even
+	  larger.
+
 config DEBUG_INFO_SPLIT
 	bool "Produce split debuginfo in .dwo files"
 	depends on DEBUG_INFO
-- 
2.27.0.rc0.183.gde8f92d652-goog

