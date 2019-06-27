Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 224B358AD1
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2019 21:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbfF0TPR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 Jun 2019 15:15:17 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46957 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbfF0TPQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Jun 2019 15:15:16 -0400
Received: by mail-ed1-f65.google.com with SMTP id d4so8100091edr.13;
        Thu, 27 Jun 2019 12:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ObWs36Suz0E8Ix9gwTSGcoL3+1AmZfjVOms9VIy/5H0=;
        b=MGBEXLhzBbtlTYNwX3jL9AXvyDdoSqDyjjZR9ilE9khwGdl9Crs6BKzB/1waq623S3
         28IpBlBKXDcui043CGeLn548r6S4EwKWgatzFj0muaSpcTzoGYdZt4on0PPtMxgJ/AKe
         GN7lbVz8QxpgV7p4d+QTFTZXjVyCv0+V5SfmF4C/dvg55acN5Geh216WIoVseLusG3J4
         wCtKHNIYhzGoR8v+n2TuPvcPaVKeoO0+S1DmJRh51LPK2swij9jR/nQZeFnJ6FECcOq3
         reaPq/WtH0lzJOlp6sBlPns+e3sr/oRo08s5qq9kcLIl20V6tb6R0NAAiabaqRmSQKxy
         p+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ObWs36Suz0E8Ix9gwTSGcoL3+1AmZfjVOms9VIy/5H0=;
        b=q6FDFqvI/OxyGhqC9Lr0/PXs4cluIoiHdP3rxz2iKSvE6Zh48fd8/c1VC9V7NZwybh
         jG6thrSudETHoM9QPsjhJTBJ4iUqvau6frJZg9IpPuHCUkw5G+35usCf8JZGt0d6mCGu
         d+wJvju+Gg72EsFiNw/nrQbd/gXJQRxqLhEtB5AeuZXCfFRaTjQ2UR8Q3faY8ZZa/aE8
         H9zK5m9it38rBH5+EGmJJXGLFHxPDbMVYm1POt4Q4cMceCSVNs2lCSOis8ebn2cZpZhJ
         KcS/A68dQ26nWP8x/YSi3vyF06YQJoIKfp/Jv8t64Ak9eDqijqT7R4B+zE2VYSLRebel
         xwIg==
X-Gm-Message-State: APjAAAWMMEFQwLtmMQUfrWBySoBAfX822U8N3fpHxTIqn5c5V7dLq2pO
        AFpOizj5gP/sOtrOwARC8qI=
X-Google-Smtp-Source: APXvYqxItNgNCiAXitQwi+XxmI7WT9h2Qcgl5SWvDXHUkF6e/ZY01uP4hogbklEeukntbKmxkAYn1A==
X-Received: by 2002:a50:ac12:: with SMTP id v18mr6422438edc.232.1561662914242;
        Thu, 27 Jun 2019 12:15:14 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
        by smtp.gmail.com with ESMTPSA id si13sm589836ejb.82.2019.06.27.12.15.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 12:15:13 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        Dmitry Golovin <dima@golovin.in>
Subject: [PATCH] kbuild: Add ability to test Clang's integrated assembler
Date:   Thu, 27 Jun 2019 12:14:48 -0700
Message-Id: <20190627191448.110756-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There are some people interested in experimenting with Clang's
integrated assembler. To make it easy to do so without source
modification, allow the user to specify 'AS=clang' as part of the
make command to avoid adding '-no-integrated-as' to the {A,C}FLAGS.

Link: https://github.com/ClangBuiltLinux/linux/issues/577
Suggested-by: Dmitry Golovin <dima@golovin.in>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 5102b2bbd224..d77481129339 100644
--- a/Makefile
+++ b/Makefile
@@ -527,7 +527,9 @@ endif
 ifneq ($(GCC_TOOLCHAIN),)
 CLANG_FLAGS	+= --gcc-toolchain=$(GCC_TOOLCHAIN)
 endif
+ifeq ($(shell $(AS) --version 2>&1 | head -n 1 | grep clang),)
 CLANG_FLAGS	+= -no-integrated-as
+endif
 CLANG_FLAGS	+= -Werror=unknown-warning-option
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
 KBUILD_AFLAGS	+= $(CLANG_FLAGS)
-- 
2.22.0

