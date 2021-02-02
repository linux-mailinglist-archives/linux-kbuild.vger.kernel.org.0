Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 663B630B7A4
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Feb 2021 07:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232020AbhBBGHs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Feb 2021 01:07:48 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:65380 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231912AbhBBGHr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Feb 2021 01:07:47 -0500
Received: from grover.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 112669xh016430;
        Tue, 2 Feb 2021 15:06:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 112669xh016430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1612245970;
        bh=p254OQ8uI5RbNpSjZoC/v3UG4wb9pzgiLWVA55BEZlE=;
        h=From:To:Cc:Subject:Date:From;
        b=j8GSxflQfO68g+Sr/kVthmXoFu7vYQKZR/lJiDFbjsAw71xjNoCitRL/HB4hn5jWC
         ZUrx+0MOnsUbZ/9kgKhHHjYGHXDU0OaLT2GbIil/mLQAEQKMGWBRRLdEQPjelTiGko
         xS50AB5BiTpG0auJQjPYU7fOsWnhimqKkVD7Wu5oz/rLGU6yP9mEsAIPaXVXj3pBBY
         rGBuppQdM5EY7r4ZkKrIzFJ3T1XURZCYbOXp9D952rr585AA8KhIx+7QL1BhdJtcf4
         E1v9RoViKWt3XCkFwCo0abtM3TafKDVpCRfNw5F8mC+MJu6uTEheDkV5qzo9zN55Ms
         trqX4TixOBbaQ==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2] scripts/clang-tools: switch explicitly to Python 3
Date:   Tue,  2 Feb 2021 15:06:04 +0900
Message-Id: <20210202060604.711160-1-masahiroy@kernel.org>
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
Acked-by: Nathan Chancellor <nathan@kernel.org>
---

Changes in v2:
 - Drop the spdxcheck.py change. The same fix exists in linux-next.

 scripts/clang-tools/gen_compile_commands.py | 2 +-
 scripts/clang-tools/run-clang-tools.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
-- 
2.27.0

