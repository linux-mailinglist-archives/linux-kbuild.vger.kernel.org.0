Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 906956C8769
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Mar 2023 22:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbjCXVWQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Mar 2023 17:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbjCXVWQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Mar 2023 17:22:16 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 079D217CD0
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Mar 2023 14:22:15 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id q30-20020a631f5e000000b0050760997f4dso1083124pgm.6
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Mar 2023 14:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679692934;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vmW56UJtv5GWWz8DLX1nqTrYB2t1IC9+OwPh+5MLOmQ=;
        b=gC7f0sm8D563vcLJO7aCR3uMKZ1am83NXi6YLU93KA1gYvU5X7df3p1ruXHgYeNfOO
         8sm1VrG0v15sBIymZw0pR1xBz6Q4deoiT0aInwnCAvFCu0n9iYfQnP/UpuQBOTr/jO+y
         69ScWoFpsgILRmjwQBM7qBFJJXmk6PgQRtZD65+iKmjLpMVHqWvVO0uuW5IQ5/QYKzKV
         ESCASqfeIObx8/soPDEB//kWW+Lt5+XNmdctV9/y9ZwETCrh2qBSCXQLII6SKCnRFO8m
         zEcIXx0WAPx0eNlYEP+MxJBYntk/B22Bg1Ck+WF35ao9zboP36VfAwMDFw3vQJ511zOg
         fuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679692934;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vmW56UJtv5GWWz8DLX1nqTrYB2t1IC9+OwPh+5MLOmQ=;
        b=r3G0XHslZ8Sb12xN6hKeOrYlnqQP2+sWhM9v9jdUxGd7ErjcYNS/9y3pGDhH5taVY+
         t9HOb1ow9Hn1hY2kBkg5s2qphTaF9XddNunWj2xPFGepI0bCIeSBcN3UWXDoYo1iEI/0
         rlJjlFWXwRfOkTxFabFNWg3vxMYPo6k4U5/zTzFY7m8Rt5nVvcg8CeyVQ34YOV40zolE
         OWUdHQDyRaYM6egAZNJV5UmR7RB1ShAgTwZcIINkLrdPQffF9nlAXdKxY8x1aIY6c1yx
         zh2UPK4Xx5CAf9mVqssj7eBZLbIDyFCiwnXUyYTqe3ouVFZpd+q81kueBCg18gT3uR4N
         Cw+g==
X-Gm-Message-State: AAQBX9cUkZ1u3JrTcCYnFZ0DSoku+gUqhtY+Lld6uP5wxXfN2ECbwtSX
        Nam2KcmW7SKLqTEsxDwcls4Fy0gZA2f2
X-Google-Smtp-Source: AK7set9ZfsxtON/msXs5821pU/T3nIBzaUkbe27oiMn0hJ3v/DwhxadgeqzR0fqI0B5zM4ozKPZ0317cd6oE
X-Received: from meowing-l.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3eba])
 (user=maskray job=sendgmr) by 2002:a17:90a:4a85:b0:240:2ae6:5eb8 with SMTP id
 f5-20020a17090a4a8500b002402ae65eb8mr1255141pjh.9.1679692934538; Fri, 24 Mar
 2023 14:22:14 -0700 (PDT)
Date:   Fri, 24 Mar 2023 21:22:10 +0000
Mime-Version: 1.0
Message-ID: <20230324212210.1001990-1-maskray@google.com>
Subject: [PATCH v2] Makefile: use -z pack-relative-relocs
From:   Fangrui Song <maskray@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Peter Collingbourne <pcc@google.com>,
        Will Deacon <will@kernel.org>,
        Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
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

As of today, GNU ld supports the latter option for x86 and powerpc64
ports and has no intention to support --pack-dyn-relocs=relr. In the
absence of the glibc symbol version GLIBC_ABI_DT_RELR,
--pack-dyn-relocs=relr and -z pack-relative-relocs are identical in
ld.lld.

Link: https://github.com/ClangBuiltLinux/linux/issues/1057
Link: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=a619b58721f0a03fd91c27670d3e4c2fb0d88f1e
Signed-off-by: Fangrui Song <maskray@google.com>
---
 Makefile                      | 3 ++-
 scripts/tools-support-relr.sh | 8 ++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)
---
Changes from v1:
* Keep supporting --pack-dyn-relocs=relr for older ld.lld versions

diff --git a/Makefile b/Makefile
index a2c310df2145..e23a85476d5d 100644
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
2.40.0.348.gf938b09366-goog

