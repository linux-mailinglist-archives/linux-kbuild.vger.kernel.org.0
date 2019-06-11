Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C23C3D5AD
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2019 20:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392000AbfFKSnv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 Jun 2019 14:43:51 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40286 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391882AbfFKSnv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Jun 2019 14:43:51 -0400
Received: by mail-ed1-f67.google.com with SMTP id k8so6940357eds.7;
        Tue, 11 Jun 2019 11:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RkW+TrHoMG2ACLTVQx14ALq5DNyJPU7JtUOARQub7ow=;
        b=Aqb8jxeeTalOYxcoObFAxshJng3bG/u1TjlA3V1ub6wE1ngHcFuZhAoR/7eAqaietQ
         XYT2fr0+fi2rScY8JFxESIUhczR3eVQk0AcjthrN9vJ8lKX8VAwcBuFRf4V37Au4OQaN
         WSKUxq+Ofq42TYVdnfq2GyUJBx12hiVuhj05+FvMUUJqIEw1iuU4Z9XU3+RQuBeN0Nia
         DWBdo8DVCIgXmAhTkCIxNaW1j5RupHjyZ+De245rqTSR4iYNoPTcdJPLNgn+XcU3gaDJ
         RiYKfbiiZgyHhKUMfU7bVtaPH02FRiuioNE2L+6CRTxdLZrxOYQ5uxUICnd0N2MIYZbn
         DXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RkW+TrHoMG2ACLTVQx14ALq5DNyJPU7JtUOARQub7ow=;
        b=sx+CDexiV5qVwXsiQorq16YCinfQgovlX62fKasuGaWhFeCccsxgtA7vINub6qbhvC
         gwP3lwvX/ceH4Qij1WoyylC4P5buIakQ0crZjmmZJi77bvK7XOU8W7VjwaN8oPFYtftm
         s3Vrw0m8SIKj5JX/R5EPDiw0okjDQ1gPodiT9fT5lV0wyTnQzRmoxqQzX6dz9aZCs8dv
         FVo7cl+0Y+Hv0x7lGdurA6m23lJ04Qnvsl0a2gTPGzdirhRqd+/zIvGkYaAhH1tfhq50
         GONpQQ0rx0K/FdZYqYYUEhN3t3O2Ml6+z6IZ62gpegLn2a65CHAmEWgIjiZouxNxprZ2
         BAOQ==
X-Gm-Message-State: APjAAAUlFchm1Rig4T6hbGeULv+OEvK6uw7A1pNxHE2Dcj/P4jEFmlAF
        J6uNgBv14283PHfzSP17+Ps=
X-Google-Smtp-Source: APXvYqwIvESw8dZXyDXr7dm9ktgGZSWxq/z1C3l26jRr2Otx3abfHNZmpjkMXIKmVxMAy1BGYBWPlg==
X-Received: by 2002:a05:6402:550:: with SMTP id i16mr83163599edx.212.1560278628551;
        Tue, 11 Jun 2019 11:43:48 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
        by smtp.gmail.com with ESMTPSA id l2sm1753785edn.59.2019.06.11.11.43.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 11:43:48 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Peter Smith <peter.smith@linaro.org>
Subject: [PATCH] kbuild: Add -Werror=unknown-warning-option to CLANG_FLAGS
Date:   Tue, 11 Jun 2019 11:43:31 -0700
Message-Id: <20190611184331.44242-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In commit ebcc5928c5d9 ("arm64: Silence gcc warnings about arch ABI
drift"), the arm64 Makefile added -Wno-psabi to KBUILD_CFLAGS, which is
a GCC only option so clang rightfully complains:

warning: unknown warning option '-Wno-psabi' [-Wunknown-warning-option]

https://clang.llvm.org/docs/DiagnosticsReference.html#wunknown-warning-option

However, by default, this is merely a warning so the build happily goes
on with a slew of these warnings in the process.

Commit c3f0d0bc5b01 ("kbuild, LLVMLinux: Add -Werror to cc-option to
support clang") worked around this behavior in cc-option by adding
-Werror so that unknown flags cause an error. However, this all happens
silently and when an unknown flag is added to the build unconditionally
like -Wno-psabi, cc-option will always fail because there is always an
unknown flag in the list of flags. This manifested as link time failures
in the arm64 libstub because -fno-stack-protector didn't get added to
KBUILD_CFLAGS.

To avoid these weird cryptic failures in the future, make clang behave
like gcc and immediately error when it encounters an unknown flag by
adding -Werror=unknown-warning-option to CLANG_FLAGS. This can be added
unconditionally for clang because it is supported by at least 3.0.0,
according to godbolt [1] and 4.0.0, according to its documentation [2],
which is far earlier than we typically support.

[1]: https://godbolt.org/z/7F7rm3
[2]: https://releases.llvm.org/4.0.0/tools/clang/docs/DiagnosticsReference.html#wunknown-warning-option

Link: https://github.com/ClangBuiltLinux/linux/issues/511
Link: https://github.com/ClangBuiltLinux/linux/issues/517
Suggested-by: Peter Smith <peter.smith@linaro.org>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index b81e17261250..5f9d09bd2252 100644
--- a/Makefile
+++ b/Makefile
@@ -528,6 +528,7 @@ ifneq ($(GCC_TOOLCHAIN),)
 CLANG_FLAGS	+= --gcc-toolchain=$(GCC_TOOLCHAIN)
 endif
 CLANG_FLAGS	+= -no-integrated-as
+CLANG_FLAGS	+= -Werror=unknown-warning-option
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
 KBUILD_AFLAGS	+= $(CLANG_FLAGS)
 export CLANG_FLAGS
-- 
2.22.0

