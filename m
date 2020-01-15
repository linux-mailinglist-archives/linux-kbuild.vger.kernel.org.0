Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6F8913BEDD
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2020 12:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730099AbgAOLxE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 Jan 2020 06:53:04 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33105 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730090AbgAOLxD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Jan 2020 06:53:03 -0500
Received: by mail-wm1-f65.google.com with SMTP id d139so4587288wmd.0
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Jan 2020 03:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=KFINdIH2BFTnue1c5f07ttlZtI0htAbsz+tmwPpLYq4=;
        b=KbBDvSiz07/Zkuq0Hh0XhSPiEhLsNyJiIsapXe0w7TJ21orj8OEfOCudnQpn47ra5c
         y9bmetG9jTwlXdSqhsRmheZRzPs8hRs8JJCMH1w9a3V46otJZ6KC62rhuwQ4y9zrqSqP
         v20qKxUEbtg2GdLbsb7ds3fX8oRTH/OGdfdRPA8GdOS+9JKICz+gad+GS2y5zHIbLk6C
         g6f8NIRoKxz/KU9swc6bXckodmysWVASuOJPZz2nAGXuk6qBEKupC7GwbkdM8CtYaSVU
         ppaVQScBg+jVAw+97SVTwgJaKBpOqcvDS9NS167/KVWDT0Ztv/8Ja+QMiEBaL36LcNIs
         0XAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KFINdIH2BFTnue1c5f07ttlZtI0htAbsz+tmwPpLYq4=;
        b=nf1shjyaBu+xL/uYkTtw17aTazpBqeY9isdt4KDQ8DYPQzNmQu63Arj8au+ceS9V4S
         ylaXKmJNzAAuhHDyE75rGmNzkTgXMJEUNhgrbJm1v2DW3MTzLUq+Ip3/7HHJdFLnKrGs
         9LZMo7Co1qqFWWR6qY6yvpKJWHhaITGFadtzc4FLMAcrtpUHR1cf8N6Wpm2VWFGN9OK4
         8GvpY2cmInUN+nMnd/UpmzZyQs+88JYgPJUPGaE3NBKnyQnG/WDs7lKoD52Sro5haWkf
         YB2jdnK2yc5wV9JsSjNLf7PLSXBHkEKJDLaMVkh73aue6HYi4rMDid7+SVwWLK0862fl
         X+UQ==
X-Gm-Message-State: APjAAAWJny0DsbUqit6rYcu07HZUiXhXIU/johXM6NMVxFsYyOJcgo+h
        Lh5tV345v0nULtwUbU1mMuan3E/VSz5a1w==
X-Google-Smtp-Source: APXvYqzugc3m1rp7JaoUOHeNLz9Uy7XFjYzBLXhC17IhVHnsO7N2E3Y890kbPbG0i+OfoMuLV2eSAA==
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr33171479wma.62.1579089181383;
        Wed, 15 Jan 2020 03:53:01 -0800 (PST)
Received: from localhost.localdomain ([2a02:a58:8166:7500:34f4:3149:a617:3dd])
        by smtp.gmail.com with ESMTPSA id w8sm4107799wmd.2.2020.01.15.03.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 03:53:00 -0800 (PST)
From:   Ilie Halip <ilie.halip@gmail.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        clang-built-linux@googlegroups.com,
        Ilie Halip <ilie.halip@gmail.com>
Subject: [RFC PATCH] lib: move memcat_p.o to obj-y
Date:   Wed, 15 Jan 2020 13:52:49 +0200
Message-Id: <20200115115249.27774-1-ilie.halip@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The semantics of `--undefined` differ between ld.bfd and ld.lld:
    $ echo | gcc -x c -c - -o a.o
    $ echo "EXTERN(test)" > a.lds
    $ ld.bfd a.o -t a.lds -o - 2>/dev/null && objdump -t | grep test
    0000000000000000         *UND*      0000000000000000 test
    $ ld.lld a.o -t a.lds -o - 2>/dev/null && objdump -t | grep test
    $

When building with CONFIG_STM=m, there are no in-kernel users of memcat_p()
and ld.lld discards this symbol because it's linked in via --no-whole-archive.
It's marked as undefined by a linker script but ld.lld discards it anyway (as
seen in the above snippet).

Work around the ld.lld behavior by moving the object file to obj-y.

Signed-off-by: Ilie Halip <ilie.halip@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/515
---
 lib/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/Makefile b/lib/Makefile
index 93217d44237f..eac343b81f77 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -30,7 +30,7 @@ lib-y := ctype.o string.o vsprintf.o cmdline.o \
 	 flex_proportions.o ratelimit.o show_mem.o \
 	 is_single_threaded.o plist.o decompress.o kobject_uevent.o \
 	 earlycpio.o seq_buf.o siphash.o dec_and_lock.o \
-	 nmi_backtrace.o nodemask.o win_minmax.o memcat_p.o
+	 nmi_backtrace.o nodemask.o win_minmax.o
 
 lib-$(CONFIG_PRINTK) += dump_stack.o
 lib-$(CONFIG_MMU) += ioremap.o
@@ -45,7 +45,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
 	 bsearch.o find_bit.o llist.o memweight.o kfifo.o \
 	 percpu-refcount.o rhashtable.o \
 	 once.o refcount.o usercopy.o errseq.o bucket_locks.o \
-	 generic-radix-tree.o
+	 generic-radix-tree.o memcat_p.o
 obj-$(CONFIG_STRING_SELFTEST) += test_string.o
 obj-y += string_helpers.o
 obj-$(CONFIG_TEST_STRING_HELPERS) += test-string_helpers.o

base-commit: ee02f9544ebd8d38900dfe955710897b99483686
-- 
2.17.1

