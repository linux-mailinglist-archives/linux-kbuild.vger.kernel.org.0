Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D27F9341155
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Mar 2021 01:08:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232805AbhCSAH4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 Mar 2021 20:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232549AbhCSAHd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Mar 2021 20:07:33 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74200C06174A
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Mar 2021 17:07:32 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id u17so50874639ybi.10
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Mar 2021 17:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=5Emq+iuVQGpmMwtcy6w0xRBsVleZrZvcnaaANEk1ZJs=;
        b=UJBrhn9csrae4D32w5TPXc6WEHl33keJm5xYcTjx/EwIpI3+rQeUSiRyFlAzu9GvqD
         TfxnBD9BjpqcDXZuNb9zaPTN5KuPnkeBTgKXM5dWZX8BNqqRLDfcU0kLH8n1fRp5WwBQ
         SK2Vxei0vZ8/qX0ETOprGvipyjzaJytIUBH67dbk8c8pliuS01SE5DZ2mq1PGlt2fRE6
         8xeqmjC5hHPUKAnwnlq55QAeNKG6gueCazG53FfcTNV1P/3JKDDiiefpV5aNNvLWB9kY
         A9uEVTLOdP8bRl0yjEYfOxB0ZcTIyZMTqVUilbGVUIrtAb05G3VTo09qXpVQXIDSLJlu
         PFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=5Emq+iuVQGpmMwtcy6w0xRBsVleZrZvcnaaANEk1ZJs=;
        b=kJxs5KCVvHDz5lIDsVQHsnx6CdUjLRic9Y3ImjfHQQsxpCXXigkgDbmniago9/q1uW
         9mU3j78Krr0ROdkR2vo6A0Bin98+wLKe2ipP1qeKY7bTPpECssvSEP2OF29sKtgPrC0Z
         gEG1xtyjTU+ZHY+CmJxmWMtY0XTQeYJU0XB5vjZD+XyhD21BQOpHrHxvMMyL4qRMmS6z
         K3sBevcuVq5GZNZ9Zo3v1qhWIsQRkjVQBh1+RvO9kmSO0+Sn6WF2mAcx7qG6HEYuaUC2
         /WajJOWDkwrhJYqPQf/BniQYXp38LxQNfgO/4VMxV1nSFs2Gc68/f1zFvEKCrxkMHzZS
         ymng==
X-Gm-Message-State: AOAM533jVSDKCfREPLA8K2Rz/TaxmlIXirKFauCzZZ4Oyv+bAnqQggx8
        fcIRE3fJkdi4Fl+qimhk6SMrcVbUFQE+YLlMfOM=
X-Google-Smtp-Source: ABdhPJzaLPfW+pT8UOLt5/X/AcW+ktOCr1wy5zsvJ3AD37rrsFPFzzMX1eVSVGqLksVxi8X+xToIgShbD4XiEtFz2T0=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:840a:6dbd:4c5:5c01])
 (user=ndesaulniers job=sendgmr) by 2002:a25:7645:: with SMTP id
 r66mr3073115ybc.36.1616112436728; Thu, 18 Mar 2021 17:07:16 -0700 (PDT)
Date:   Thu, 18 Mar 2021 17:07:06 -0700
Message-Id: <20210319000708.1694662-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH] Makefile: fix GDB warning with CONFIG_RELR
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     clang-built-linux@googlegroups.com,
        Fangrui Song <maskray@google.com>,
        Elliot Berman <eberman@quicinc.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Peter Collingbourne <pcc@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

GDB produces the following warning when debugging kernels built with
CONFIG_RELR:

BFD: /android0/linux-next/vmlinux: unknown type [0x13] section `.relr.dyn'

when loading a kernel built with CONFIG_RELR into GDB. It can also
prevent debugging symbols using such relocations.

Peter sugguests:
  [That flag] means that lld will use dynamic tags and section type
  numbers in the OS-specific range rather than the generic range. The
  kernel itself doesn't care about these numbers; it determines the
  location of the RELR section using symbols defined by a linker script.

Link: https://github.com/ClangBuiltLinux/linux/issues/1057
Suggested-by: Peter Collingbourne <pcc@google.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile                      | 2 +-
 scripts/tools-support-relr.sh | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 5160ff8903c1..47741cb60995 100644
--- a/Makefile
+++ b/Makefile
@@ -1088,7 +1088,7 @@ LDFLAGS_vmlinux	+= $(call ld-option, -X,)
 endif
 
 ifeq ($(CONFIG_RELR),y)
-LDFLAGS_vmlinux	+= --pack-dyn-relocs=relr
+LDFLAGS_vmlinux	+= --pack-dyn-relocs=relr --use-android-relr-tags
 endif
 
 # We never want expected sections to be placed heuristically by the
diff --git a/scripts/tools-support-relr.sh b/scripts/tools-support-relr.sh
index 45e8aa360b45..cb55878bd5b8 100755
--- a/scripts/tools-support-relr.sh
+++ b/scripts/tools-support-relr.sh
@@ -7,7 +7,8 @@ trap "rm -f $tmp_file.o $tmp_file $tmp_file.bin" EXIT
 cat << "END" | $CC -c -x c - -o $tmp_file.o >/dev/null 2>&1
 void *p = &p;
 END
-$LD $tmp_file.o -shared -Bsymbolic --pack-dyn-relocs=relr -o $tmp_file
+$LD $tmp_file.o -shared -Bsymbolic --pack-dyn-relocs=relr \
+  --use-android-relr-tags -o $tmp_file
 
 # Despite printing an error message, GNU nm still exits with exit code 0 if it
 # sees a relr section. So we need to check that nothing is printed to stderr.
-- 
2.31.0.rc2.261.g7f71774620-goog

