Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96171308D9D
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Jan 2021 20:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232733AbhA2ToK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Jan 2021 14:44:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbhA2ToF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Jan 2021 14:44:05 -0500
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2BC7C061573
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Jan 2021 11:43:24 -0800 (PST)
Received: by mail-qk1-x74a.google.com with SMTP id u66so7949844qkd.13
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Jan 2021 11:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=3SeeNcVsK2P/XlQ94PAyrrJlSF2nsUa9roDX0u/Qyk0=;
        b=n3LuAM9o8mgd/+DA1a0GIDX9oPnXPqpqvuILu/cChVKUM5teGNlfcTzEVlTXavzk+O
         8YcSVrE7+bxZ6PILpHDWg6kJf7KCcGUdp4L4ta9a4xYccVAlVrKzEclQDccBMJBkIz2+
         CtVem1uB6hI1pJF679uQmTboCuR5WGgTFwAT8eZ56rRifzWHxznMwua1Sm9j6YJDqo47
         0W7DbwDIBijstkONoVDUIZ7ISZHpvrxHbcaRuhPsAEk/FPQAEy2L7WzmZTQnINPMppDp
         P5CYEX993wZY678AsoxOAO/1PFzw5/GmAbKKpXReq0QgsK9bjrmgot1fOJ//BvzcUkA/
         DkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=3SeeNcVsK2P/XlQ94PAyrrJlSF2nsUa9roDX0u/Qyk0=;
        b=r+F8yANQS1RID2pZHBBrt9xzZmvbMiePUj2BIIZixR8v9gcBjwQlXoW/GtHdVT/emD
         oL5Hv3urPJZiPwJeQAU4N11+vPpKLliOrClkUYYh05YjmwjgJkg4dihq7O+3Z54YBTi1
         Fxz7whX5f1thjZbyXF5CfVXefgsUJLz5Ov+bDeLz6PJn+FrBdTaDU9Jset/nroHo4Gco
         RGnZUEeOBAYhKNG/56du+iHh8H/hCO817DjY0DrMaVCt61VkH+VgEG8J9lLjkCoiiWcq
         QXGMv79QZv3vBLYrJpYPu0Ww6MV6cW26UvNdS8wWTFVtxnd6IS6zPEjlIqCzFqtNMx7a
         LHAQ==
X-Gm-Message-State: AOAM532wbOcBNAxeFlbIup6F1vvaeQ7D7AIIa6CO6BOgZJ7KpdQtAalc
        SejR0+NM56OYeHKNYpg6Z1MODdURhra+4nt1Glc=
X-Google-Smtp-Source: ABdhPJzmLTyrTl81fsKySXCx+7Nn8/qZl7i0MRMwGNomzVPxL7QV+uEFKsqAvuafgWtjkVaMFJt51l4xcH65WGPrM1Y=
Sender: "ndesaulniers via sendgmr" 
        <ndesaulniers@ndesaulniers1.mtv.corp.google.com>
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:186b:: with SMTP id
 eh11mr5646289qvb.30.1611949403920; Fri, 29 Jan 2021 11:43:23 -0800 (PST)
Date:   Fri, 29 Jan 2021 11:43:16 -0800
Message-Id: <20210129194318.2125748-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v6 0/2] Kbuild: DWARF v5 support
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
        Jakub Jelinek <jakub@redhat.com>,
        Fangrui Song <maskray@google.com>,
        Caroline Tice <cmtice@google.com>,
        Nick Clifton <nickc@redhat.com>, Yonghong Song <yhs@fb.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DWARF v5 is the latest standard of the DWARF debug info format.

DWARF5 wins significantly in terms of size and especially so when mixed
with compression (CONFIG_DEBUG_INFO_COMPRESSED).

Link: http://www.dwarfstd.org/doc/DWARF5.pdf

Patch 1 is a cleanup that lays the ground work and isn't DWARF
v5 specific.
Patch 2 implements Kconfig and Kbuild support for DWARFv5.

Changes from v5:
* Drop previous patch 1, it has been accepted into kbuild:
  https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?h=kbuild&id=3f4d8ce271c7082be75bacbcbd2048aa78ce2b44
* Trying to set -Wa,-gdwarf-4 in the earlier patch was the source of
  additional complexity. Drop it that part of the patch. We can revisit
  clang without the integrated assembler setting -Wa,-gdwarf-4 later.
  That is a separate problem from generally supporting DWARF v5.
* Rework the final patch for clang without the integrated assembler.
  -Wa,-gdwarf-5 is required for DWARF5 in that case otherwise GAS will
  not accept the assembler directives clang produces from C code when
  generating asm.

Changes from v4:
* drop set -e from script as per Nathan.
* add dependency on !CONFIG_DEBUG_INFO_BTF for DWARF v5 as per Sedat.
* Move LLVM_IAS=1 complexity from patch 2 to patch 3 as per Arvind and
  Masahiro. Sorry it took me a few tries to understand the point (I
  might still not), but it looks much cleaner this way. Sorry Nathan, I
  did not carry forward your previous reviews as a result, but I would
  appreciate if you could look again.
* Add Nathan's reviewed by tag to patch 1.
* Reword commit message for patch 3 to mention LLVM_IAS=1 and -gdwarf-5
  binutils addition later, and BTF issue.
* I still happen to see a pahole related error spew for the combination
  of:
  * LLVM=1
  * LLVM_IAS=1
  * CONFIG_DEBUG_INFO_DWARF4
  * CONFIG_DEBUG_INFO_BTF
  Though they're non-fatal to the build. I'm not sure yet why removing
  any one of the above prevents the warning spew. Maybe we'll need a v6.

Changes from v3:

Changes as per Arvind:
* only add -Wa,-gdwarf-5 for (LLVM=1|CC=clang)+LLVM_IAS=0 builds.
* add -gdwarf-5 to Kconfig shell script.
* only run Kconfig shell script for Clang.

Apologies to Sedat and Nathan; I appreciate previous testing/review, but
I did no carry forward your Tested-by and Reviewed-by tags, as the
patches have changed too much IMO.

Changes from v2:
* Drop two of the earlier patches that have been accepted already.
* Add measurements with GCC 10.2 to commit message.
* Update help text as per Arvind with help from Caroline.
* Improve case/wording between DWARF Versions as per Masahiro.

Changes from the RFC:
* split patch in 3 patch series, include Fangrui's patch, too.
* prefer `DWARF vX` format, as per Fangrui.
* use spaces between assignment in Makefile as per Masahiro.
* simplify setting dwarf-version-y as per Masahiro.
* indent `prompt` in Kconfig change as per Masahiro.
* remove explicit default in Kconfig as per Masahiro.
* add comments to test_dwarf5_support.sh.
* change echo in test_dwarf5_support.sh as per Masahiro.
* remove -u from test_dwarf5_support.sh as per Masahiro.
* add a -gdwarf-5 cc-option check to Kconfig as per Jakub.

Nick Desaulniers (2):
  Kbuild: make DWARF version a choice
  Kbuild: implement support for DWARF v5

 Makefile                          | 16 ++++++++++--
 include/asm-generic/vmlinux.lds.h |  6 ++++-
 lib/Kconfig.debug                 | 41 ++++++++++++++++++++++++++-----
 scripts/test_dwarf5_support.sh    |  8 ++++++
 4 files changed, 62 insertions(+), 9 deletions(-)
 create mode 100755 scripts/test_dwarf5_support.sh

-- 
2.30.0.365.g02bc693789-goog

