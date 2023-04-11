Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0CAD6DE583
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Apr 2023 22:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjDKULJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 Apr 2023 16:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjDKULJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Apr 2023 16:11:09 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36AB6E5A
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Apr 2023 13:10:44 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-54bfc4e0330so177048007b3.3
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Apr 2023 13:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681243792; x=1683835792;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kAz690gVxE8TfKjgFFdLa3/V7T3THIGi813h83xR35g=;
        b=eX9hSaKuZddrGiRb81kOHRHUQ8d+cRaNseEvFFxq+rbJMpuRDbassOCn41qnbg97xM
         HRT6Ec7dww6nMhII92UEzKUn+ke7SZ3cgJ+jQSThSNXEiSbJv2Ds5CZ8MqTYpuK2/Glp
         QpYIafPTmjGwEBZFO+1eL5EHxM/DpuEPBtyoSOxI1bDk69SoBMLBRxbpx7afZ8m2/Ndc
         Q87xsW8YKx6N56SETlZaYX9fiIoirH4ZBG9E6qy/e/yDX7epe/92zYaBT6akUbIpaAxI
         ZN1c1CWfFwxhW8OovXCrd9DaQXbXh/0285fKanj8OrLo8SfI0mOKiE7iKIu3viH2C8U5
         Aj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681243792; x=1683835792;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kAz690gVxE8TfKjgFFdLa3/V7T3THIGi813h83xR35g=;
        b=pb+1RTTWja7pVEuYJWu2phaw+2UY54TlGOCge0APtEzMaWadccUEc0u0O6gnV85Gpt
         Qi7jkjSsnZBuSkk/dKEL4ny46Wd8fGpRYg0UzoZnrod0bSlX4i/8hIHpbsfqSNDCx3y/
         FjYY/4ZwWm5PwYFsnJkRmOtOt0gp6iCEpPca4d3LfwTi6GRGKb9eCvf2GI/y0dKJNMCj
         2XTQCaCFZtV7kFqd6ROTstfwF4ph2bx1LEY4fQL9fKgKB4CmoSuBUhgU6yJHGMvG5Lyd
         iULSiJydbKfGICjTJxODHJcbmoq9i5VGkHlwrFy40YxDQobZtodsOjnQEZKzUfqXl36x
         VAJw==
X-Gm-Message-State: AAQBX9euscNUH2kP5My+NgsUYRjW0/1WZ2q1PwJdLp3OJXZIU6qK2/Mm
        hNhgoWAc7Emcg22Y44ZRiP0ZchaTSCTc
X-Google-Smtp-Source: AKy350ZUYQ9eRpLHHcBQUCJlIYZXit4cqkSYLGUe1f+VBzTmSuoJJzSriclFdSsI0oQI0TNGzvqUovPjLfnD
X-Received: from meowing-l.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3eba])
 (user=maskray job=sendgmr) by 2002:a05:690c:d0f:b0:545:f3ed:d251 with SMTP id
 cn15-20020a05690c0d0f00b00545f3edd251mr380659ywb.1.1681243792318; Tue, 11 Apr
 2023 13:09:52 -0700 (PDT)
Date:   Tue, 11 Apr 2023 20:09:44 +0000
Mime-Version: 1.0
Message-ID: <20230411200944.2591330-1-maskray@google.com>
Subject: [PATCH v3] Makefile: use -z pack-relative-relocs
From:   Fangrui Song <maskray@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Peter Collingbourne <pcc@google.com>,
        Will Deacon <will@kernel.org>,
        Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 27f2a4db76e8 ("Makefile: fix GDB warning with CONFIG_RELR")
added --use-android-relr-tags to fix a GDB warning

BFD: /android0/linux-next/vmlinux: unknown type [0x13] section `.relr.dyn'

The GDB warning has been fixed in version 11.2.

The DT_ANDROID_RELR tag was deprecated since DT_RELR was standardized.
Thus, --use-android-relr-tags should be removed. While making the
change, try -z pack-relative-relocs, which is supported since LLD 15.
Keep supporting --pack-dyn-relocs=relr as well for older LLD versions.
There is no indication of obsolescence for --pack-dyn-relocs=relr.

As of today, GNU ld supports the latter option for x86 and powerpc64
ports and has no intention to support --pack-dyn-relocs=relr. In the
absence of the glibc symbol version GLIBC_ABI_DT_RELR,
--pack-dyn-relocs=relr and -z pack-relative-relocs are identical in
ld.lld.

GNU ld and newer versions of LLD report warnings (instead of errors) for
unknown -z options. Only errors lead to non-zero exit codes. Therefore,
we should test --pack-dyn-relocs=relr before testing
-z pack-relative-relocs.

Link: https://github.com/ClangBuiltLinux/linux/issues/1057
Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=a619b58721f0a03fd91c27670d3e4c2fb0d88f1e
Signed-off-by: Fangrui Song <maskray@google.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile                      | 3 ++-
 scripts/tools-support-relr.sh | 8 ++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 5aeea3d98fc0..d9c6d1839cf0 100644
--- a/Makefile
+++ b/Makefile
@@ -1113,7 +1113,8 @@ LDFLAGS_vmlinux	+= -X
 endif
 
 ifeq ($(CONFIG_RELR),y)
-LDFLAGS_vmlinux	+= --pack-dyn-relocs=relr --use-android-relr-tags
+# ld.lld before 15 did not support -z pack-relative-relocs.
+LDFLAGS_vmlinux	+= $(call ld-option,--pack-dyn-relocs=relr,-z pack-relative-relocs)
 endif
 
 # We never want expected sections to be placed heuristically by the
diff --git a/scripts/tools-support-relr.sh b/scripts/tools-support-relr.sh
index cb55878bd5b8..4c121946e517 100755
--- a/scripts/tools-support-relr.sh
+++ b/scripts/tools-support-relr.sh
@@ -7,8 +7,12 @@ trap "rm -f $tmp_file.o $tmp_file $tmp_file.bin" EXIT
 cat << "END" | $CC -c -x c - -o $tmp_file.o >/dev/null 2>&1
 void *p = &p;
 END
-$LD $tmp_file.o -shared -Bsymbolic --pack-dyn-relocs=relr \
-  --use-android-relr-tags -o $tmp_file
+
+# ld.lld before 15 did not support -z pack-relative-relocs.
+if ! $LD $tmp_file.o -shared -Bsymbolic --pack-dyn-relocs=relr -o $tmp_file 2>/dev/null; then
+	$LD $tmp_file.o -shared -Bsymbolic -z pack-relative-relocs -o $tmp_file 2>&1 |
+		grep -q pack-relative-relocs && exit 1
+fi
 
 # Despite printing an error message, GNU nm still exits with exit code 0 if it
 # sees a relr section. So we need to check that nothing is printed to stderr.
-- 
2.40.0.577.gac1e443424-goog

