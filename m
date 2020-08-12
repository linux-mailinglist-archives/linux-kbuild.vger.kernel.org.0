Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30FD9242E29
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Aug 2020 19:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgHLRl1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Aug 2020 13:41:27 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:55604 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbgHLRl0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Aug 2020 13:41:26 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 07CHeC4C012279;
        Thu, 13 Aug 2020 02:40:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 07CHeC4C012279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1597254013;
        bh=NQienNgF5pVCaPBiUe0b3LOHwFrQR54gPM9kMQxhXJE=;
        h=From:To:Cc:Subject:Date:From;
        b=pcNN+mTtq0vh980cg2L+JsIJhz6rjSDb4G8DERBtAWPtRMp5egxClrstChs3VNARE
         s9fMh0Pd/kdFRTxBton+d4B+EHLf4h4fLFv65/u8hJ6ypQ0+3hZDivG3oCo3Q2l9KD
         Xl36SwheSyanfYSL/sZ/m5ewJOr+yS8/hqr+XxmpiS6OL+odvmGH/MLYYxgZCHue0R
         6hYkUxRpzbvNKF96qSdXgG8fgmOitrm24ddsgUDlgFwSMO3NQ0tLkGBbZRA6dgc+kj
         +KN8bftG/YMuLOORCH9lp0ggitRhL91vsjCFjmhciL9zXKMzRiEZPRfnuetfumStLs
         V+ZFDsQrlI71g==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] kbuild: clang-tidy
Date:   Thu, 13 Aug 2020 02:39:55 +0900
Message-Id: <20200812173958.2307251-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


I improved gen_compile_commands.py in the first two patches,
then rebased Nathan's v7 [1] on top of them.
To save time, I modified the Makefile part.
No change for run-clang-tools.py

I am not sure if the new directory, scripts/clang-tools/,
is worth creating only for 2 files, but I do not have
a strong opinion about it.

"make clang-tidy" should work in-tree build,
out-of-tree build (O=), and external module build (M=).
Tests and reviews are appreciated.

"make clang-tidy" worked for me.

masahiro@oscar:~/workspace/linux-kbuild$ make -j24 CC=clang clang-tidy
  DESCEND  objtool
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  GEN     compile_commands.json
  CHECK   compile_commands.json

But "make clang-analyzer" just sprinkled the following error:

  Error: no checks enabled.
  USAGE: clang-tidy [options] <source0> [... <sourceN>]

I built clang-tidy from the latest source.
I had no idea how to make it work...

[1] https://patchwork.kernel.org/patch/11687833/



Masahiro Yamada (2):
  gen_compile_commands: parse only the first line of .*.cmd files
  gen_compile_commands: wire up build rule to Makefile

Nathan Huckleberry (1):
  Makefile: Add clang-tidy and static analyzer support to makefile

 MAINTAINERS                                 |   1 +
 Makefile                                    |  45 +++++-
 scripts/clang-tools/gen_compile_commands.py | 117 +++++++++++++++
 scripts/clang-tools/run-clang-tools.py      |  74 ++++++++++
 scripts/gen_compile_commands.py             | 151 --------------------
 5 files changed, 233 insertions(+), 155 deletions(-)
 create mode 100755 scripts/clang-tools/gen_compile_commands.py
 create mode 100755 scripts/clang-tools/run-clang-tools.py
 delete mode 100755 scripts/gen_compile_commands.py

-- 
2.25.1

