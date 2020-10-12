Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3160428BEC4
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Oct 2020 19:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403943AbgJLRIw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Oct 2020 13:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404092AbgJLRIn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Oct 2020 13:08:43 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE2D5C0613D0;
        Mon, 12 Oct 2020 10:08:43 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id c20so3463007pfr.8;
        Mon, 12 Oct 2020 10:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wsnME6USK8j5YcCHUpqMkEeN66nLTFH7nMQRb2b+NL8=;
        b=sYwWJWtrSzNNatq8kTgKH9qAJm8g4zJ2gr+fhqFxxTwy8BPj/o4EdxF+uOx1HCthsX
         HxBPdjIWyjk6V09CV8nL0w0po9NVR7eHe96spU6rSgx5VtGfTW+GZI1/1KhyZO7RHktv
         vZLqqfTo8ed7ww2MPU1y4jdtXkYRtDtPzpMpBQE59viFxd8fhgRmF8mxZYY7Y0bX5vdA
         jKHRZJLEtUBMjvc+D5eA8Jchh6psDfOrnQpM2w51BCNfmWduexX88F9t9qmbmpE0s6fp
         hrf/cvygPVStwMWqY83EnHcf9dsbHLn3411lD8TOypmYhg3SbKMwYVjnApBXmiqYhNoF
         ZPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wsnME6USK8j5YcCHUpqMkEeN66nLTFH7nMQRb2b+NL8=;
        b=XQnDUlKVUu3A5qj1Qt0HhxnjfCPvAHYkKY1ou31Fdbs98NkyWTzVKOcVPByySySQPL
         A8lqD41MAwspk6Hglet5By4lK5P6NtlZDGzl+p19/kqrsdpvJ7cr8i5GQXFeUrKadxwj
         EpwfWvUB+Lh68IDPMRkaPLrX27849HEVKK+v6p3bNZEx/ZqRTBIY0Uk6CXbpLL5gyZSh
         qMEYGg7jXCBaP5zyos2ey6rObPQaOixH8n6EuSgyBg87ltT3e+6SvwnHIcw38IhXxMmg
         Wbk/VAYb5SaVDr0YXRAuUfLIjImZoMm0jDodHj2vUoNheP0QaUVQmvap3zD/HgJA+zUb
         plmw==
X-Gm-Message-State: AOAM532tireuorXj3E7Ja5KVLa7uy+T/jWtpUUFs2qx40p7S82jlqwWb
        o2LUGkYfz13WWxZfqqUbosY=
X-Google-Smtp-Source: ABdhPJzd8Wui8YhBWfujtQREMLc/96ivHGWZU7aziyeHwUx62Sg/W/mvT1KqB57h+7T5DZdifN2LRg==
X-Received: by 2002:a17:90b:50a:: with SMTP id r10mr20953225pjz.231.1602522522731;
        Mon, 12 Oct 2020 10:08:42 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
        by smtp.gmail.com with ESMTPSA id x16sm20494337pff.14.2020.10.12.10.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 10:08:42 -0700 (PDT)
From:   Ujjwal Kumar <ujjwalkumar0501@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2 1/2] kconfig: use interpreters to invoke scripts
Date:   Mon, 12 Oct 2020 22:36:30 +0530
Message-Id: <20201012170631.1241502-2-ujjwalkumar0501@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012170631.1241502-1-ujjwalkumar0501@gmail.com>
References: <20201012170631.1241502-1-ujjwalkumar0501@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We cannot rely on execute bits to be set on files in the repository.
The build script should use the explicit interpreter when invoking any
script from the repository.

Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Suggested-by: Kees Cook <keescook@chromium.org>
Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
---
 init/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index c9446911cf41..8adf3194d26f 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -30,12 +30,12 @@ config CC_IS_GCC

 config GCC_VERSION
 	int
-	default $(shell,$(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
+	default $(shell,$(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
 	default 0

 config LD_VERSION
 	int
-	default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
+	default $(shell,$(LD) --version | $(AWK) -f $(srctree)/scripts/ld-version.sh)

 config CC_IS_CLANG
 	def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
@@ -45,20 +45,20 @@ config LD_IS_LLD

 config CLANG_VERSION
 	int
-	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
+	default $(shell,$(CONFIG_SHELL) $(srctree)/scripts/clang-version.sh $(CC))

 config CC_CAN_LINK
 	bool
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
+	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
+	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))

 config CC_CAN_LINK_STATIC
 	bool
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
+	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
+	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)

 config CC_HAS_ASM_GOTO
-	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
+	def_bool $(success,$(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC))

 config CC_HAS_ASM_GOTO_OUTPUT
 	depends on CC_HAS_ASM_GOTO
--
2.25.1

