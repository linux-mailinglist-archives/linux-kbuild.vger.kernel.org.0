Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B79B324E051
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Aug 2020 21:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgHUTC5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 15:02:57 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:62787 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbgHUTCy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 15:02:54 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07LJ23eS027595;
        Sat, 22 Aug 2020 04:02:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07LJ23eS027595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598036524;
        bh=ftGoPv3aGfiGs80AMn9l0nfBRKLTLZIm0W34Sa+JsdY=;
        h=From:To:Cc:Subject:Date:From;
        b=zXThTXB6WglYsn86kbrOCUeZGHuWIFoy2A+TyuiJ4iClm96JDH4uZ1gALfsdd5IZi
         97AedB9OfUuTBRLzKVfZNUv3AX98R/p3hg1U0ieiqjjICuPsCpRUUkK26+4nkinvCc
         zyKbXEct1u2ZenJXYaN7ADaWN/nfN9tF5PUp97Nv8gb01D2gIN+shWECQMOErlUq4K
         ZLFuOokrHH6JbP6nAm0FZMjJ47rXjk9fCwbQ00Y2R1KPjErTchfVSYDIJWQcx4QGQR
         DvDmsYpfImCkhuHERDi1OwZrX1apsfwcHviwAWOjsFX4ubm2rD0YToFOZyvjki9FUZ
         RFnd3MwE+78Jg==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] kbuild: clang-tidy
Date:   Sat, 22 Aug 2020 04:01:50 +0900
Message-Id: <20200821190159.1033740-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I improved gen_compile_commands.py,
then rebased Nathan's v7 [1] on top of them.
To save time, I modified the Makefile part.
No change for run-clang-tools.py

"make clang-tidy" should work in-tree build,
out-of-tree build (O=), and external module build (M=).

This version keeps the previous work-flow.
You can still manually run scripts/gen_compile_commands.json

'make compile_commands.json' or 'make clang-tidy' is handier
for most cases. As Nick noted, there is 3 % loss of the coverage.

If you need the full compilation database that covers all the
compiled C files, please run the script manually.

[1] https://patchwork.kernel.org/patch/11687833/

Masahiro Yamada (8):
  gen_compile_commands: parse only the first line of .*.cmd files
  gen_compile_commands: use choices for --log_levels option
  gen_compile_commands: do not support .cmd files under tools/ directory
  gen_compile_commands: reword the help message of -d option
  gen_compile_commands: make -o option independent of -d option
  gen_compile_commands: move directory walk to a generator function
  gen_compile_commands: support *.o, *.a, modules.order in positional
    argument
  kbuild: wire up the build rule of compile_commands.json to Makefile

Nathan Huckleberry (1):
  Makefile: Add clang-tidy and static analyzer support to makefile

 MAINTAINERS                                 |   1 +
 Makefile                                    |  45 +++-
 scripts/clang-tools/gen_compile_commands.py | 245 ++++++++++++++++++++
 scripts/clang-tools/run-clang-tools.py      |  74 ++++++
 scripts/gen_compile_commands.py             | 151 ------------
 5 files changed, 361 insertions(+), 155 deletions(-)
 create mode 100755 scripts/clang-tools/gen_compile_commands.py
 create mode 100755 scripts/clang-tools/run-clang-tools.py
 delete mode 100755 scripts/gen_compile_commands.py

-- 
2.25.1

