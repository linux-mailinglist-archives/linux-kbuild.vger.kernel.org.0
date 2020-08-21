Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F9B24E059
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Aug 2020 21:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgHUTDT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 15:03:19 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:62808 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbgHUTC4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 15:02:56 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07LJ23eT027595;
        Sat, 22 Aug 2020 04:02:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07LJ23eT027595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598036525;
        bh=DyUxhByC5o5hgSX6EDv5IVyqWsClHjdMK/ZV+YDLY8I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h07vOh/wBtWbLyuCquTttTnX5O1S/Z+7Z0Qkskvxj6Zo7hCiNU4EminTfdrQCCxig
         Vo7ycScQluiIx51DZoCyVCSObbQuWTo4ElCp8RY7FAgb/fEvqNBGIxn7y5shWOAr1g
         mprth8lB/2ANgeUfRYmI/BSGfc4W2SPjGIULAIfI2y90QZFL7I8BMGOqHP64K+1Mke
         2UUeYf+LrFPy8ujCYBVs3mME6h6YA2iKWRCQqRPiHRTb/4Rfwt8K4uQmx0j+6wjJbm
         NmHdFbsdllbz28S9Inrpi+T7wbMgnVxVWYtxu4nY7FLTPW1EJg+4aKz8UQFI/F8Lb+
         ryBpapCh9gEyg==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] gen_compile_commands: parse only the first line of .*.cmd files
Date:   Sat, 22 Aug 2020 04:01:51 +0900
Message-Id: <20200821190159.1033740-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821190159.1033740-1-masahiroy@kernel.org>
References: <20200821190159.1033740-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

After the allmodconfig build, this script takes about 5 sec on my
machine. Most of the run-time is consumed for needless regex matching.

We know the format of .*.cmd file; the first line is the build command.
There is no need to parse the rest.

With this optimization, now it runs 4 times faster.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
---

Changes in v2:
  - Remove the unneeded variable 'line'

 scripts/gen_compile_commands.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
index c458696ef3a7..1bcf33a93cb9 100755
--- a/scripts/gen_compile_commands.py
+++ b/scripts/gen_compile_commands.py
@@ -125,11 +125,8 @@ def main():
             filepath = os.path.join(dirpath, filename)
 
             with open(filepath, 'rt') as f:
-                for line in f:
-                    result = line_matcher.match(line)
-                    if not result:
-                        continue
-
+                result = line_matcher.match(f.readline())
+                if result:
                     try:
                         entry = process_line(directory, dirpath,
                                              result.group(1), result.group(2))
-- 
2.25.1

