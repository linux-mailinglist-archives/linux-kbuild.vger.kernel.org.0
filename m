Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5903FC3DC
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 10:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240071AbhHaHlv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 03:41:51 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:16667 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240062AbhHaHlt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 03:41:49 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 17V7e8ER031407;
        Tue, 31 Aug 2021 16:40:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 17V7e8ER031407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630395609;
        bh=vyreOE+xhPd0lfrmBa1SolU1TBZULzHRHFaBsxypS0U=;
        h=From:To:Cc:Subject:Date:From;
        b=pqo3s6ny45Ut+UXr4PyDxmQ5PfFaG4W2gOuwXumtfiUCt/83iB3Tv368Cdw5frJ9h
         PRORd40EQGpdyh3FhH6mHYGFYma7qkxROmmpamrax+Y23rfk4Z2kCXiuhxj/M84/Pf
         bNBPTEBrT2+6dfX52Vc2iA287lseOviKzf8/bvjXS+xtsnZP3kblmX+OnhhJxqcIMn
         nKP6qqB2Gncy/ZenNAaH/BpYq3qwFNh8LmkS175smdhY5dxwKnY4BOTOED4+0quDxb
         p6A6svmCilYOZAx0lIsLuWgoCdwVd2FvM4p4VKrbvsZW7QEUG2WBtp1KOGhzdQAe7D
         tbssP6KW5EI6g==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/13] kbuild: second round of Clang LTO refactoring
Date:   Tue, 31 Aug 2021 16:39:51 +0900
Message-Id: <20210831074004.3195284-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Masahiro Yamada (13):
  kbuild: move objtool_args back to scripts/Makefile.build
  kbuild: rename __objtool_obj to objtool
  kbuild: store the objtool command in *.cmd files
  kbuild: factor out OBJECT_FILES_NON_STANDARD check into a macro
  kbuild: detect objtool update without using .SECONDEXPANSION
  kbuild: reuse $(cmd_objtool) for cmd_cc_lto_link_modules
  kbuild: do not create built-in.a.symversions or lib.a.symversions
  kbuild: build modules in the same way with/without Clang LTO
  kbuild: add cmd_and_savecmd macro
  kbuild: rebuild modules when objtool is updated for CONFIG_LTO_CLANG
  kbuild: always postpone CRC links for module versioning
  kbuild: merge cmd_modversions_c and cmd_modversions_S
  kbuild: merge cmd_ar_builtin and cmd_ar_module

 scripts/Kbuild.include    |   6 +-
 scripts/Makefile.build    | 207 ++++++++++++++++----------------------
 scripts/Makefile.lib      |  27 ++---
 scripts/Makefile.modfinal |   4 +-
 scripts/Makefile.modpost  |   7 +-
 scripts/link-vmlinux.sh   |  31 +++---
 scripts/merge-symvers.pl  |  52 ++++++++++
 scripts/mod/modpost.c     |   6 +-
 8 files changed, 175 insertions(+), 165 deletions(-)
 create mode 100644 scripts/merge-symvers.pl

-- 
2.30.2

