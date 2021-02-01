Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9FB5309FDC
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Feb 2021 02:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhBABKi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 31 Jan 2021 20:10:38 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:47611 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhBABKe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 31 Jan 2021 20:10:34 -0500
Received: from grover.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 11118Msg002624;
        Mon, 1 Feb 2021 10:08:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 11118Msg002624
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1612141703;
        bh=eXbmZVUON4I0dEihsAGwk68LJPotOUe3IiJ7+FBD0Dc=;
        h=From:To:Cc:Subject:Date:From;
        b=1fsNDfi7BthfW44xk0eXORECiU+C2HoMcJRM4QMnsV1gZVopX5SNDRmz9Iu3SKbr/
         wzkNCvwnjAZY6+Tw+YhdsXxTKvMBh5FQJMQ3c5d0fLW2SB3YJv4sM9XBoP9enaAyb9
         eetqDpR9lfx89s6OdLuroV9M02ezWpkAB2geb9n8GyRD5mVdv8ZqQBgiFNKAfaQdtV
         KaeEinu455NYGdOljdBye0JNriRp/mwfJr6MsYHN0IM9rNhUwj6945INc6SbedUv6A
         mPTTEg4ngFRyG6h1TimBkUkB0G1T6RvEZc8B56IvZL0w5uD6yYA8miBrCYabf6Uq55
         sOkOXXZYol1rw==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-doc@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-spdx@vger.kernel.org
Subject: [PATCH] scripts: switch some more scripts explicitly to Python 3
Date:   Mon,  1 Feb 2021 10:08:18 +0900
Message-Id: <20210201010819.655597-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

For the same reason as commit 51839e29cb59 ("scripts: switch explicitly
to Python 3"), switch some more scripts, which I tested and confirmed
working on Python 3.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/clang-tools/gen_compile_commands.py | 2 +-
 scripts/clang-tools/run-clang-tools.py      | 2 +-
 scripts/spdxcheck.py                        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 19963708bcf8..8ddb5d099029 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 #
 # Copyright (C) Google LLC, 2018
diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index fa7655c7cec0..f754415af398 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 #
 # Copyright (C) Google LLC, 2020
diff --git a/scripts/spdxcheck.py b/scripts/spdxcheck.py
index bc87200f9c7c..cbdb5c83c08f 100755
--- a/scripts/spdxcheck.py
+++ b/scripts/spdxcheck.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0
 # Copyright Thomas Gleixner <tglx@linutronix.de>
 
-- 
2.27.0

