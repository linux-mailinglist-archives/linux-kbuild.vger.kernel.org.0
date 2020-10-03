Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 657AA282510
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Oct 2020 17:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbgJCPUW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 3 Oct 2020 11:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgJCPUW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 3 Oct 2020 11:20:22 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F8BFC0613D0;
        Sat,  3 Oct 2020 08:20:22 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id nl2so803583pjb.1;
        Sat, 03 Oct 2020 08:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=CxbBf0VRe0OZIyWTwmQLbfkYS+f/I5q5WzqukLpPtqk=;
        b=fCtR6DlnazI9qSvmWO5CT3uqVuXeQBmf20Vfz9o3tHYLhPd/0StGuPQhxHsfc1RCBB
         dv++7Y7psyh6Uy/4JY/1qv6iZJ3Ua4nKFt0xqdwepxekoOXg0YEVtE/V2saQUplEfd87
         P/bjbWinHFpzTfhm+1DELqxO0BYLr8uTDRSrhGYbnbtWbp1kUjVsvJ0VwkQVaHM2kxN8
         N8xTjrw5/08nKtX3OZSRnf2s7PJZ9QT+Cm7za9aShaXMJ8HiM6SWMj8lEo1phVy0mL/5
         GtSU89e7o8EDi/Ml0FqlcOyo4QnYN77P0J7l8/6NMqmSFajV3EhosJbG5pNpw83NZNCU
         l3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=CxbBf0VRe0OZIyWTwmQLbfkYS+f/I5q5WzqukLpPtqk=;
        b=UeRFejdsvq+fXIcrvwW6+VxBPCo8ucetd53DCeyJ+Omvml/u5yA2nbY2k1lTs0Skor
         IsNnWWpnABrTM550NbJr+OEmZyjT06+sD9pcD16L8jsoj0V54Ixyl1cNXk+kAD4652aB
         ijy85X1OTkpn+bkguN6SOJ5boOfA1egCjL9WXLbQgcZjq5Ebtvr99uCCsfjCntE76knW
         wVkJjhJSD94ImRnJoMMwSYjppeR4aXkWEUuFr2uWulWfIr9qWbee4l8PmugiLy12WaCO
         vfurJDQzkKy4rkV9OG+j4bm8p+3jteqASlh1lO0OM7kJajN0Rj6ttxWmC40ISI2nZdbq
         YAMw==
X-Gm-Message-State: AOAM530kJgzHzkgfqcDuZ+vUPrBYjO2dgfg+Bv9nGZrHyRV0aKv1vci+
        r4UTMI5wEr8UyteUZWUKhtg=
X-Google-Smtp-Source: ABdhPJy2Skm/VPVg7z22QJtKKPWXCALWQTMav1tindWxFDZQ8sVDEn9Ongevaa02uR8olRZyamE9IQ==
X-Received: by 2002:a17:90b:140c:: with SMTP id jo12mr8029928pjb.41.1601738421556;
        Sat, 03 Oct 2020 08:20:21 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
        by smtp.gmail.com with ESMTPSA id e13sm5071942pjy.38.2020.10.03.08.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 08:20:20 -0700 (PDT)
From:   Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Subject: [PATCH RFC 1/2] kconfig: use interpreters to invoke scripts
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
Message-ID: <d398ec09-2146-1fef-c594-643a9c868b06@gmail.com>
Date:   Sat, 3 Oct 2020 20:50:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
index 91456ac0ef20..524f6b555945 100644
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
2.26.2

