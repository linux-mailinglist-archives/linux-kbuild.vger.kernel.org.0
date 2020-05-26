Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8151E2847
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2020 19:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728594AbgEZRSj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 May 2020 13:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728523AbgEZRSi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 May 2020 13:18:38 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE75C03E96D
        for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2020 10:18:38 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id v1so21231297ybo.23
        for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2020 10:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=qz8XL5HjRypO1RoMKqirUSXQ6SNzxq1AQO7Af1uk7eg=;
        b=aV+EtZWfxq8hZz390kw22ff2bERfaAxS+NwmsZdiIUYAvoCIzy6goI4eJRxT3jrPh8
         xZYkVZxurB1Lv/uWfUfFZ3pJ5UsvfeEIXy854tkDM9LazUXsuIeOmUybAr4CYx3HQmVF
         qyGFlExpbOoOyFc7nVlxMSoptdyr/Q9z8Xo/uO/3QgOoZd9/YiPasUywI8nfmj9Vlg8u
         IVLFQthtuCm0vWlOg2NN9zs23tyOQBP6RENrKAVbXKWf/MOCFN11o2vkNBkxIN20dZzL
         RqrWSqv9lpx2dbFJ6M0CSj/EZEFGfKqE1UBO6lue5FJgw9NbeGY1eKIIgrXnUwRlX98o
         rIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=qz8XL5HjRypO1RoMKqirUSXQ6SNzxq1AQO7Af1uk7eg=;
        b=LVWeT6AnKwYVb3nz2d4uGb1e3OIwVoVLGhvFkDRjdCUwi3s1fBmodKEOe0PG5juoaI
         WYa+eKvFep36E5wOvUwRK/zP0ZSQwhGKI0vgWKDF5zRgvq9/AZhI0RjZDqknu5snOkcr
         JKOoMxsrSPCEquYUmSRyl5bQAlfwURO+TZbzew1ThXuKoi1YZT3LjWDfJ8yomuKDxqZD
         wpsfLgQd7anM/38VTfN2HmJqoHojVjz9/t+3JlEAh4LEI/ddexRSBZYWEIvQCTA6rPxJ
         m4nOmmte92AHPTrJ+NkxDQ/wGAVeVcw5vKeffLrSgZ0TeCNB1lSSNTY7f8jGWLxnljOr
         Q1nw==
X-Gm-Message-State: AOAM531NeGTDNBBqAJWA//5Q4p4CwMyGRXcU3aqdulyTnr+45VLo/r6E
        P21j1sV9D4m/9Pqh+jqhVebDY54R91kZwtAKPcs=
X-Google-Smtp-Source: ABdhPJxDPm+wkkMpsgRhYQTwpsCoaf6b9kFkH+TSAz8TH+6AQcwtg18bXA+ESWI7ZJpAj2iTVtikPUMoMUzhnggZv7s=
X-Received: by 2002:a25:253:: with SMTP id 80mr3241130ybc.405.1590513517344;
 Tue, 26 May 2020 10:18:37 -0700 (PDT)
Date:   Tue, 26 May 2020 10:18:29 -0700
In-Reply-To: <CAK7LNASkcLx-K+W1va9WxfxZ=7H-w65QbyBt=88dzK1NrrM_PQ@mail.gmail.com>
Message-Id: <20200526171830.151966-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <CAK7LNASkcLx-K+W1va9WxfxZ=7H-w65QbyBt=88dzK1NrrM_PQ@mail.gmail.com>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
Subject: [PATCH v5] Makefile: support compressed debug info
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
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
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

Thanks to:
Nick Clifton helped us to provide the minimal binutils version.
Sedat Dilet found an increase in size of debug .deb package.

Cc: Nick Clifton <nickc@redhat.com>
Cc: Sedat Dilek <sedat.dilek@gmail.com>
Suggested-by: David Blaikie <blaikie@google.com>
Reviewed-by: Fangrui Song <maskray@google.com>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes V4 -> V5:
* Drop unrelated hunk from a dirty tree.

Changes V3 -> V4:
* Add thanks line to commit message as per Masahiro.
* Swap Sugguested-by to Cc for two lines in commit message, as per
  Masahiro.

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

