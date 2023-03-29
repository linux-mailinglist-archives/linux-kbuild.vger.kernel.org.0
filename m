Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD35D6CD158
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Mar 2023 06:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjC2E6o (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Mar 2023 00:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjC2E6n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Mar 2023 00:58:43 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C77F19AB
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Mar 2023 21:58:40 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id j24so14365919wrd.0
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Mar 2023 21:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680065919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSs9kTLEr3gcw2nAKoZU9JNtCpmjcd0KenqM1ZfQgo4=;
        b=lO1y4yq1PwBxe+8AJb6u6BDoMPFaCMy/BL0GvwPGmyd2EIze0IcibTOK/QPflRVmnA
         hFY/Ukba0Dp3YB+iOiOOfTTbrDUDqxk57w8qLlZaBwAVPw6orKn+jDfJTUabT0vjO0Gs
         MfPreJqaqCjbjpaep9XRh3Fz1bImQeDyizQ6Au5kaxkj2sVzhTrc2F4yTwlM9Y6JNti6
         3AGBBA0b/J0E8pFGlRtm4995Qb3cbWvFO5oIp26KsHCaNh2+toBq9Ct/1yIrbic4HaBy
         WkA3LLbqfJ8UkkYCF0H5KXjY5f/NBPGG0LChQRG7/6oYxj54WKXo7p7eTNs+mi7QSLNx
         xG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680065919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSs9kTLEr3gcw2nAKoZU9JNtCpmjcd0KenqM1ZfQgo4=;
        b=buE7G9V7VGzpzzawuoaoW9T9BrMP7G/oZGHGkUzVxmznpKfzde3P/JWTDbF8RsjQBV
         bFka/F+z3kYUKupQCInzW4+hIaWDBUCBvCGXLmEaSTZxgVAebfRpk6XbUILXbtT7BEcm
         rXRFYpsEY+oZWk/nm4tkjDQ/DYlWi2VU4e2S8vIjXjhv3sxLqJDmMwUCvdsg6JO/dfv8
         JCwTjOrVsABlJwBb+W8w5aHOdBM9fLBL44ojSE3DjamTCkDG1zYlY4Njh2lKZVLoYnkh
         vKuWtGFRG3wtoSzKDirvhXV9b2Xc9tFC0Mwozx9h3jbOa4hfbGD3LarYWdbD5lM9T8hH
         wP1Q==
X-Gm-Message-State: AAQBX9f7WXD737V4hK8joV6DQV4OpmwNuGOooZRvvrjQLAKTJ6VxIwks
        K6EEZG5wiAdcytDp+HbTg7Gclw==
X-Google-Smtp-Source: AKy350Z51j1bBKrXk97y5JX1wSgTTowVMS1BaZOjNaHlHomGdJnrKLmbOfwk1rsbLBsYnb7mc20NEQ==
X-Received: by 2002:adf:eace:0:b0:2cf:e3d0:2a43 with SMTP id o14-20020adfeace000000b002cfe3d02a43mr16161943wrn.4.1680065919124;
        Tue, 28 Mar 2023 21:58:39 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p12-20020a5d48cc000000b002d431f61b18sm27284287wrs.103.2023.03.28.21.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 21:58:38 -0700 (PDT)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Nick Desaulniers <ndesaulniers@google.com>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
Cc:     Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>
Subject: [PATCH v9 5/6] riscv: Check relocations at compile time
Date:   Wed, 29 Mar 2023 06:53:28 +0200
Message-Id: <20230329045329.64565-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
References: <20230329045329.64565-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Alexandre Ghiti <alex@ghiti.fr>

Relocating kernel at runtime is done very early in the boot process, so
it is not convenient to check for relocations there and react in case a
relocation was not expected.

There exists a script in scripts/ that extracts the relocations from
vmlinux that is then used at postlink to check the relocations.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/Makefile.postlink     | 36 ++++++++++++++++++++++++++++++++
 arch/riscv/tools/relocs_check.sh | 26 +++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 arch/riscv/Makefile.postlink
 create mode 100755 arch/riscv/tools/relocs_check.sh

diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
new file mode 100644
index 000000000000..d5de8d520d3e
--- /dev/null
+++ b/arch/riscv/Makefile.postlink
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0
+# ===========================================================================
+# Post-link riscv pass
+# ===========================================================================
+#
+# Check that vmlinux relocations look sane
+
+PHONY := __archpost
+__archpost:
+
+-include include/config/auto.conf
+include $(srctree)/scripts/Kbuild.include
+
+quiet_cmd_relocs_check = CHKREL  $@
+cmd_relocs_check = 							\
+	$(CONFIG_SHELL) $(srctree)/arch/riscv/tools/relocs_check.sh "$(OBJDUMP)" "$(NM)" "$@"
+
+# `@true` prevents complaint when there is nothing to be done
+
+vmlinux: FORCE
+	@true
+ifdef CONFIG_RELOCATABLE
+	$(call if_changed,relocs_check)
+endif
+
+%.ko: FORCE
+	@true
+
+clean:
+	@true
+
+PHONY += FORCE clean
+
+FORCE:
+
+.PHONY: $(PHONY)
diff --git a/arch/riscv/tools/relocs_check.sh b/arch/riscv/tools/relocs_check.sh
new file mode 100755
index 000000000000..baeb2e7b2290
--- /dev/null
+++ b/arch/riscv/tools/relocs_check.sh
@@ -0,0 +1,26 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Based on powerpc relocs_check.sh
+
+# This script checks the relocations of a vmlinux for "suspicious"
+# relocations.
+
+if [ $# -lt 3 ]; then
+        echo "$0 [path to objdump] [path to nm] [path to vmlinux]" 1>&2
+        exit 1
+fi
+
+bad_relocs=$(
+${srctree}/scripts/relocs_check.sh "$@" |
+	# These relocations are okay
+	#	R_RISCV_RELATIVE
+	grep -F -w -v 'R_RISCV_RELATIVE'
+)
+
+if [ -z "$bad_relocs" ]; then
+	exit 0
+fi
+
+num_bad=$(echo "$bad_relocs" | wc -l)
+echo "WARNING: $num_bad bad relocations"
+echo "$bad_relocs"
-- 
2.37.2

