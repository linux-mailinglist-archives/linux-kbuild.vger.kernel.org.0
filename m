Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8FD514F6E4
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Feb 2020 07:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbgBAGZR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 Feb 2020 01:25:17 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44699 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbgBAGZR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Feb 2020 01:25:17 -0500
Received: by mail-pg1-f195.google.com with SMTP id x7so4751332pgl.11;
        Fri, 31 Jan 2020 22:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0elDyAk2QHwKmLCC06q3VJz6KuygKvsES0+HeH0Qv6U=;
        b=HLw0TTi/bOsFuwiXtn/19ICn6Xee4K2N8/z2jq/UYBlosRw8uSuYIqmkk3gFrOjAS1
         1gKIXS5i6mNiPzy5sjNnII9Mu61R9yt41apnQtaIUcZnC/TD24+GRPVLxVYe11uIGAdz
         1PSqPvk3K38rHTQiifMBB70oQtFG/Hx52OVXvz7OG81EpJsfggMJaerPnrk34W1COmKt
         Tf2zPiyP9E+qAWIVAOd9iMvT6AheSj7REz5tfAm018X4JqCzv7n6VIeY9GPnTJaW4pvP
         wtn9jt6nRLvzTSZ0e2nNdH6B5Vq15XOYCs6F0ZZ+ASo1jgOZAp35UsINzA+RfBf0NdYF
         WG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0elDyAk2QHwKmLCC06q3VJz6KuygKvsES0+HeH0Qv6U=;
        b=IDEYDOMQzwZAvRvjJymJhWsJcXw1beh82IR17xZdWNMZR9EWMwnLx3iBluc14P4bKI
         YGF1ybTrbcmAn/revh5DpZsxelTvGFtNavxg6GjcGc80A/zPxJjpRFL9JZq7H0aFUU1p
         rlg30qyNm1ypjD2viXz0lCFovBge4IIIFlZgBb8hPl6JcpOdoaSw1wRX9gpAO53QmTEg
         ZEO9r1zGbA4kv9Tbpzkt6S+VpEPWStQlJa597KEE3Bw6NquXqmgDf8ORSGibp2VJqiKZ
         YZ4aCtQ6RHoceJZLi1aZo8wsdwWpfJNdqWB1zrkbNbskBFI56VjtDfKPTGFmQCCp1a7n
         W+zA==
X-Gm-Message-State: APjAAAW5cUlHD6HqzZgsz6wSaDkO3ztS4KTg01U5dUIffVm+168CBbrg
        qes+MaakeIWqd73Rk1nxA4U=
X-Google-Smtp-Source: APXvYqzZzHav6veqjxFal1ztB8ZnokDeHBFL1oJ4Ud1DqQhZqa2aClR1ZF1LoYD+C3LNQXGwsboNbw==
X-Received: by 2002:a62:3781:: with SMTP id e123mr14529874pfa.194.1580538316429;
        Fri, 31 Jan 2020 22:25:16 -0800 (PST)
Received: from localhost.localdomain ([149.248.18.167])
        by smtp.gmail.com with ESMTPSA id v4sm13191971pgo.63.2020.01.31.22.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 22:25:15 -0800 (PST)
From:   Changbin Du <changbin.du@gmail.com>
To:     Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc:     Alexander Potapenko <glider@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        hpa@zytor.com, x86@kernel.org, Andy Lutomirski <luto@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Changbin Du <changbin.du@gmail.com>
Subject: [PATCH 1/2] sanitize: Add SANITIZE_xx.o and SANITIZE to disable all sanitizers for specific files
Date:   Sat,  1 Feb 2020 14:24:58 +0800
Message-Id: <20200201062459.7150-2-changbin.du@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200201062459.7150-1-changbin.du@gmail.com>
References: <20200201062459.7150-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch add two new flags to disable all sanitizers (UBSAN and KASAN):
  o SANITIZE_xx.o - disable all sanitizers for a single file.
  o SANITIZE - disable all sanitizers for current directory.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 Documentation/dev-tools/kasan.rst | 12 ++++++++++++
 scripts/Makefile.lib              |  4 ++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index e4d66e7c50de..f59fc5fb2cd8 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -55,6 +55,18 @@ similar to the following to the respective kernel Makefile:
 
     KASAN_SANITIZE := n
 
+Similarly, to disable all sanitizers (KASAN, UBSAN) for specific files or
+directories, add a line similar to the following to the respective kernel
+Makefile:
+
+- For a single file (e.g. main.o)::
+
+    SANITIZE_main.o := n
+
+- For all files in one directory::
+
+    SANITIZE := n
+
 Error reports
 ~~~~~~~~~~~~~
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3fa32f83b2d7..9b7d784e3252 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -122,13 +122,13 @@ endif
 #
 ifeq ($(CONFIG_KASAN),y)
 _c_flags += $(if $(patsubst n%,, \
-		$(KASAN_SANITIZE_$(basetarget).o)$(KASAN_SANITIZE)y), \
+		$(SANITIZE_$(basetarget).o)$(SANITIZE)$(KASAN_SANITIZE_$(basetarget).o)$(KASAN_SANITIZE)y), \
 		$(CFLAGS_KASAN), $(CFLAGS_KASAN_NOSANITIZE))
 endif
 
 ifeq ($(CONFIG_UBSAN),y)
 _c_flags += $(if $(patsubst n%,, \
-		$(UBSAN_SANITIZE_$(basetarget).o)$(UBSAN_SANITIZE)$(CONFIG_UBSAN_SANITIZE_ALL)), \
+		$(SANITIZE_$(basetarget).o)$(SANITIZE)$(UBSAN_SANITIZE_$(basetarget).o)$(UBSAN_SANITIZE)$(CONFIG_UBSAN_SANITIZE_ALL)), \
 		$(CFLAGS_UBSAN))
 endif
 
-- 
2.24.0

