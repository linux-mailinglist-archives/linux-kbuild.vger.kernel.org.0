Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761A31A7083
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2020 03:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390732AbgDNBVl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Apr 2020 21:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728679AbgDNBVl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Apr 2020 21:21:41 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10B3AC0A3BE2
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2020 18:21:40 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id f13so8786212qti.5
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Apr 2020 18:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ucg4luoxBe5p5/9cUQj1RfBcJ3voR9LqlqIX5ioc/8o=;
        b=stA0CpFPzED8+cDmFDlFOPUc9NOX+a+UVO1kgT140a7AuOQYxHz7mttPD82mqFuEwq
         W6S8EKZqQIcIz7gfWoLTX5HQL7saCVNRntogBQD+C/1AVTlxYLmT0ZBLzeinkr5a6qCV
         sUhjkUmFi/hCVurWWSuId2T8rZesUg9lce+xk21coIwuFzF7FiH6svj7C45L2kmkfSQM
         dw8Eo1+or04uZukAobNvXInrGC8xprR+ScPVIwaI6PkvhHo1j62yxQLJ6rt6nVmBqeFM
         R8o0PM0fdOiOw6dgRa9brPEw0U5ZK9zu1C4otfg/4MSSerAj1zvvRc6XvPjVhV6l/V1C
         HFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ucg4luoxBe5p5/9cUQj1RfBcJ3voR9LqlqIX5ioc/8o=;
        b=XykocSeY8UNSS6DmqtdkBCPoQIBrJTFNZRcyb+CxolwfrosBWuuQOqB5pFVnncO/lX
         ILzyqfMlJP0L+5XeJKlXu+4G8iGnh1ODk6MBOl+8tmXnrFLooLTHvkpfzaQNgR6ozTF2
         90S9xQl5QjVxQ4wc/+3rjG10EOEuqz3wx9UwflLfh54tx0tyQZj7r4gt1vRgsWtw2tpQ
         lj29mG1rF4EQ3V5FMoVnn6a2KC7TOCfqDzUgH1K3U1oJ2+rZNlu0WwCltUHqKY3QOzem
         leplGqY/yaITI+idClMcU8LGTpjiBfAZ60HnH92NDUDBiXQzumfs5bDQjC7Qnj29yOse
         Uo+Q==
X-Gm-Message-State: AGi0PuZUJvHSskXDV2ppQ37PA2CM+6wKXjGhqhFCCJSnFLDJpqRHAnSd
        7kNKOmekKYUM6cGbYDh3Wgm0+iEF32+CWw==
X-Google-Smtp-Source: APiQypKUMU9nNqLUSqQ6nEaJqBlYNc1SVRRFUNeid6/LPY7Ts/1eHVhK+OYeZuZdmAr1ZMHR5h92vw==
X-Received: by 2002:ac8:370c:: with SMTP id o12mr13960452qtb.380.1586827298833;
        Mon, 13 Apr 2020 18:21:38 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id b13sm6380638qka.20.2020.04.13.18.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 18:21:38 -0700 (PDT)
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     linux-kbuild@vger.kernel.org
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-kernel@vger.kernel.org, brendanhiggins@google.com,
        skhan@linuxfoundation.org
Subject: [PATCH v2] kbuild: ensure mrproper removes arch/$(SUBARCH)/include/generated/
Date:   Mon, 13 Apr 2020 22:21:32 -0300
Message-Id: <20200414012132.32721-1-vitor@massaru.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In the following use case, when compiling the kernel for the UML
architecture, for example:

 * `make ARCH=um defconfig && make ARCH=um -j8`,

SUBARCH files are generated, however when we run the command:

 * `mrproper ARCH=um`

the files `arch/$(SUBARCH)/include/generated/ aren't cleaned up.

This generates compilation errors by running the following command:

 * `make ARCH=um defconfig O=./build_um && make ARCH=um -j8 O=./build_um`

This PATCH fix that problem.

This makes it possible to compile on different architectures that use the
SUBARCH variable, in different build directories and root directory of the
linux directory. This is important because we can compile without the object
files being overwritten. This reduces the re-compilation time in this use case.

Besides that, in the workflow of developing unit tests, using kunit, and
compiling in different architectures to develop or test a PATCH, this use case
applies.

 * This bug was introduced in this commit a788b2ed81abe

 * Related bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Tested-by: Brendan Higgins <brendanhiggins@google.com>
---
v2:
 * Explains what this PATCH does and the importance as suggested
   by Brendan Higgins.
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 70def4907036..e1a79796032e 100644
--- a/Makefile
+++ b/Makefile
@@ -532,7 +532,8 @@ outputmakefile:
 ifdef building_out_of_srctree
 	$(Q)if [ -f $(srctree)/.config -o \
 		 -d $(srctree)/include/config -o \
-		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
+		 -d $(srctree)/arch/$(SRCARCH)/include/generated -o \
+		 -d $(srctree)/arch/$(SUBARCH)/include/generated ]; then \
 		echo >&2 "***"; \
 		echo >&2 "*** The source tree is not clean, please run 'make$(if $(findstring command line, $(origin ARCH)), ARCH=$(ARCH)) mrproper'"; \
 		echo >&2 "*** in $(abs_srctree)";\
@@ -1388,6 +1389,7 @@ CLEAN_FILES += modules.builtin modules.builtin.modinfo modules.nsdeps
 # Directories & files removed with 'make mrproper'
 MRPROPER_DIRS  += include/config include/generated          \
 		  arch/$(SRCARCH)/include/generated .tmp_objdiff \
+		  arch/$(SUBARCH)/include/generated \
 		  debian/ snap/ tar-install/
 MRPROPER_FILES += .config .config.old .version \
 		  Module.symvers \
-- 
2.25.1

