Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51C443FCCD
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Oct 2021 14:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbhJ2NAM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Oct 2021 09:00:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56636 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231548AbhJ2NAC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Oct 2021 09:00:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635512253;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=kyVwQJ+oTHxyAV8/0nCuXrzdlh3a/i0G3tMJzlHGlmQ=;
        b=C3253qHe+RySZqPl6xlg4mDU2WOxb4DVzgbjc8+M5KSjISgv3pQ1kDQQIUtkTO74OQAMBl
        Z/7l8CNIoGMQVxmHsd/nyuTHIJWbphWFNiQpqsLRzzQqzSglsRt7HkB6AZR81XjzoLK7dN
        lILuVcyEOWS4dtMO3hbQ3tvbrH+BH+M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-5lkrhrABMyy3NyBzc2_tqA-1; Fri, 29 Oct 2021 08:57:32 -0400
X-MC-Unique: 5lkrhrABMyy3NyBzc2_tqA-1
Received: by mail-ed1-f72.google.com with SMTP id c25-20020a056402143900b003dc19782ea8so9198291edx.3
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Oct 2021 05:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kyVwQJ+oTHxyAV8/0nCuXrzdlh3a/i0G3tMJzlHGlmQ=;
        b=wQIksO1l5b8irAFLrrx1PTKPHT0iXaRAjV2kjESWk2VOhjA/jPrC66DCAxtHteZ7Yg
         CeB7o4JUvoh31981STmLEp8kD5v1XdzEH/niGYhZb+MQyYs67np6topvsHm9oPOS7Bmq
         ZFfczbT80NKIU/DIZc2acps7wkUo3e/qune6qumzd/xUTZYRARvjYWsoa7FvtGF+UKUk
         H+tiNyVnMZKNU7fguO5TOxuKMIEKeRiMyr17VQDGK5rvBswYUq5IMH5u5LQryLadKT+/
         J6u1nMwsQwrvcygmJsO16+0kDSVQAycINcDhj2EvnN+0dTC7m7vgsfSocbLgpP9TCtDt
         HWcA==
X-Gm-Message-State: AOAM532XUnGBbLucIXy/jRkQXSj6RCA1zs4ZquhZGNM5/lEbgTlg7GGc
        cdtTrUUvt5U5NKvfhETtBGs3sPyO7iJEWv7Ygq08yP16G7Sw0wW+WJj0o8/kP8B09PbWv8dT+Su
        irX/OJyo60ERbGEUkql87V2TD
X-Received: by 2002:a17:906:6a21:: with SMTP id qw33mr13450145ejc.90.1635512251137;
        Fri, 29 Oct 2021 05:57:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZp38vCAAC3g2Fbh7NiCB+PIh/TSY6r7NtohuhyhJXwx8CuP5k0+V2ChESz0AoyQR1yqMvwA==
X-Received: by 2002:a17:906:6a21:: with SMTP id qw33mr13450098ejc.90.1635512250836;
        Fri, 29 Oct 2021 05:57:30 -0700 (PDT)
Received: from krava.redhat.com (nat-pool-brq-u.redhat.com. [213.175.37.12])
        by smtp.gmail.com with ESMTPSA id pw8sm1129785ejb.55.2021.10.29.05.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 05:57:30 -0700 (PDT)
From:   Jiri Olsa <jolsa@redhat.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
To:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     kernel test robot <lkp@intel.com>, netdev@vger.kernel.org,
        bpf@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@chromium.org>
Subject: [PATCHv3 bpf-next] kbuild: Unify options for BTF generation for vmlinux and modules
Date:   Fri, 29 Oct 2021 14:57:29 +0200
Message-Id: <20211029125729.70002-1-jolsa@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Using new PAHOLE_FLAGS variable to pass extra arguments to
pahole for both vmlinux and modules BTF data generation.

Adding new scripts/pahole-flags.sh script that detect and
prints pahole options.

[ fixed issues found by kernel test robot ]
Cc: kernel test robot <lkp@intel.com>
Acked-by: Andrii Nakryiko <andrii@kernel.org>
Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
v3 changes:
  - added missing $(srctree) to fix build problems [kernel test robot]

 Makefile                  |  3 +++
 scripts/Makefile.modfinal |  2 +-
 scripts/link-vmlinux.sh   | 11 +----------
 scripts/pahole-flags.sh   | 20 ++++++++++++++++++++
 4 files changed, 25 insertions(+), 11 deletions(-)
 create mode 100755 scripts/pahole-flags.sh

diff --git a/Makefile b/Makefile
index 437ccc66a1c2..8f24bceec62d 100644
--- a/Makefile
+++ b/Makefile
@@ -480,6 +480,8 @@ LZ4		= lz4c
 XZ		= xz
 ZSTD		= zstd
 
+PAHOLE_FLAGS	= $(shell PAHOLE=$(PAHOLE) $(srctree)/scripts/pahole-flags.sh)
+
 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
 		  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
 NOSTDINC_FLAGS :=
@@ -534,6 +536,7 @@ export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
 export KBUILD_AFLAGS AFLAGS_KERNEL AFLAGS_MODULE
 export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_LDFLAGS_MODULE
 export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
+export PAHOLE_FLAGS
 
 # Files to ignore in find ... statements
 
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 1fb45b011e4b..7f39599e9fae 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -40,7 +40,7 @@ quiet_cmd_ld_ko_o = LD [M]  $@
 quiet_cmd_btf_ko = BTF [M] $@
       cmd_btf_ko = 							\
 	if [ -f vmlinux ]; then						\
-		LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J --btf_base vmlinux $@; \
+		LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) --btf_base vmlinux $@; \
 		$(RESOLVE_BTFIDS) -b vmlinux $@; 			\
 	else								\
 		printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index d74cee5c4326..3ea7cece7c97 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -205,7 +205,6 @@ vmlinux_link()
 gen_btf()
 {
 	local pahole_ver
-	local extra_paholeopt=
 
 	if ! [ -x "$(command -v ${PAHOLE})" ]; then
 		echo >&2 "BTF: ${1}: pahole (${PAHOLE}) is not available"
@@ -220,16 +219,8 @@ gen_btf()
 
 	vmlinux_link ${1}
 
-	if [ "${pahole_ver}" -ge "118" ] && [ "${pahole_ver}" -le "121" ]; then
-		# pahole 1.18 through 1.21 can't handle zero-sized per-CPU vars
-		extra_paholeopt="${extra_paholeopt} --skip_encoding_btf_vars"
-	fi
-	if [ "${pahole_ver}" -ge "121" ]; then
-		extra_paholeopt="${extra_paholeopt} --btf_gen_floats"
-	fi
-
 	info "BTF" ${2}
-	LLVM_OBJCOPY="${OBJCOPY}" ${PAHOLE} -J ${extra_paholeopt} ${1}
+	LLVM_OBJCOPY="${OBJCOPY}" ${PAHOLE} -J ${PAHOLE_FLAGS} ${1}
 
 	# Create ${2} which contains just .BTF section but no symbols. Add
 	# SHF_ALLOC because .BTF will be part of the vmlinux image. --strip-all
diff --git a/scripts/pahole-flags.sh b/scripts/pahole-flags.sh
new file mode 100755
index 000000000000..2b99fc77019c
--- /dev/null
+++ b/scripts/pahole-flags.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+extra_paholeopt=
+
+if ! [ -x "$(command -v ${PAHOLE})" ]; then
+	return
+fi
+
+pahole_ver=$(${PAHOLE} --version | sed -E 's/v([0-9]+)\.([0-9]+)/\1\2/')
+
+if [ "${pahole_ver}" -ge "118" ] && [ "${pahole_ver}" -le "121" ]; then
+	# pahole 1.18 through 1.21 can't handle zero-sized per-CPU vars
+	extra_paholeopt="${extra_paholeopt} --skip_encoding_btf_vars"
+fi
+if [ "${pahole_ver}" -ge "121" ]; then
+	extra_paholeopt="${extra_paholeopt} --btf_gen_floats"
+fi
+
+echo ${extra_paholeopt}
-- 
2.32.0

