Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2930A27A7C1
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Sep 2020 08:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgI1Gmz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Sep 2020 02:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725290AbgI1Gmz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Sep 2020 02:42:55 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26910C0613CE;
        Sun, 27 Sep 2020 23:42:55 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id gx22so6935827ejb.5;
        Sun, 27 Sep 2020 23:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=qN+S61oVmPC+Q3dWpJjCh6WwaRMPQCJpevSG1rLGzow=;
        b=gaAPsr1eQolYUOGe9xSWxntexJqKCVnQSoYWSGe3KJDLR7z09fD1A5fKObl5/9IGKR
         ueMKPiAKANCX0LUiqWxJ6KjyDH6q1JEwC60B/dk03wYJptr83gc+GnjJO3001Me15EEW
         oMvgetsntbd7vqqgDJ8U/mEMEeXdlqNVLWg9D7WM+cC8Aaa6Kk6JCIchYNcRPZodnXsA
         7p8DfJB0m5Ecvk0/y/5daHEP+hJm8zQFrBiGihVE7CtkungkUfFgQsZoJ1HtiejuWdt2
         cSo1DdcXwxIuzAo9M1UIvf4CbNOqwjGdvgLjIM/n8M37oWBR/LSEk2VaAzanqtTExLoD
         PKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qN+S61oVmPC+Q3dWpJjCh6WwaRMPQCJpevSG1rLGzow=;
        b=O+y9w8+J5lWjN3SbP5gM/IRmwml86lY63q9vKG+oLD6eup7aF+wwnsBJacWjiPj9P7
         Opn/HKGvJN7S9sUA37NAjJUo+clmkwNUEHeAhbVeDlz6FJKxAezMM0WyXOIFdGOhw3VM
         x5YTMB+s61dyjxz4VhKn4ZcGTZqXB4PgRfdpK83JbeNzMuHdWre9X0VeaUDVkCsYSNqR
         ihn8sREZQWeCj4vEWVEDkc8pSQyn9Jg0c2ijeNATHj3XRxD1gqwCNIrr5bSlE2zR7ixi
         wDnChiuY3wiS2VCHT1RSc3U6L8P9KSJIxuCK+l0PbE9DbbPIFHKiZToU62tcF/XxDhMs
         7Kjg==
X-Gm-Message-State: AOAM5312PZNbYlG1fv3NRJHfGsmdxPe9nqeCwuEu8cCQ0w2HNUAqjVVR
        figgRZN3a96QbhcowIw/890=
X-Google-Smtp-Source: ABdhPJyoLdeeL5FGFduOYkr7rEhDILDQ4q8oJjqEotR4NwQH3lEnzkjqzfIzQPtc9b6BgiUtc3TNTQ==
X-Received: by 2002:a17:906:2c14:: with SMTP id e20mr244311ejh.205.1601275373814;
        Sun, 27 Sep 2020 23:42:53 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d9d:5000:b971:2536:319e:5b1d])
        by smtp.gmail.com with ESMTPSA id lz22sm9221047ejb.98.2020.09.27.23.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 23:42:52 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH RFC] kbuild: doc: describe proper script invocation
Date:   Mon, 28 Sep 2020 08:42:44 +0200
Message-Id: <20200928064244.29206-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

During an investigation to fix up the execute bits of scripts in the kernel
repository, Andrew Morton and Kees Cook pointed out that the execute bit
should not matter, and that build scripts cannot rely on that. Kees could
not point to any documentation, though.

Provide some basic documentation how the build shall invoke scripts, such
that the execute bits do not matter.

This serves as reference for further clean-up patches in the future.

Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Suggested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20200925 and v5.9-rc7

Kees, Andrew, please ack.

Masahiro-san, please pick this small documentation update into your kbuild tree.

Ujjwal Kumar, a potential future mentee, will follow up with further fixes to
the build scripts.

 Documentation/kbuild/makefiles.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 58d513a0fa95..9d0d198adb7e 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -21,6 +21,7 @@ This document describes the Linux kernel Makefiles.
 	   --- 3.10 Special Rules
 	   --- 3.11 $(CC) support functions
 	   --- 3.12 $(LD) support functions
+	   --- 3.13 Script Invocation
 
 	=== 4 Host Program support
 	   --- 4.1 Simple Host Program
@@ -605,6 +606,23 @@ more details, with real examples.
 		#Makefile
 		LDFLAGS_vmlinux += $(call ld-option, -X)
 
+3.13 Script invocation
+----------------------
+
+	Make rules may invoke scripts to build the kernel. The rules shall
+	always provide the appropriate interpreter to execute the script. They
+	shall not rely on the execute bits being set, and shall not invoke the
+	script directly.
+
+	Kbuild provides variables $(CONFIG_SHELL), $(AWK), $(PERL),
+	$(PYTHON) and $(PYTHON3) to refer to interpreters for the respective
+	scripts.
+
+	Example::
+
+		#Makefile
+		cmd_depmod = $(CONFIG_SHELL) $(srctree)/scripts/depmod.sh $(DEPMOD) \
+			     $(KERNELRELEASE)
 
 4 Host Program support
 ======================
-- 
2.17.1

