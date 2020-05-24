Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D50E1DFFEE
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 17:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbgEXPm4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 11:42:56 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:19155 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgEXPm4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:42:56 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04OFgcUj017561;
        Mon, 25 May 2020 00:42:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04OFgcUj017561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590334958;
        bh=/8O5gZozBx4027fH2ycoE4UNA3AAl1xufS9rhjDgPCA=;
        h=From:To:Cc:Subject:Date:From;
        b=vp2L66Weyox8qNEuWOny1OE5JF7I8DDL8TheHfdLeJmicYkm4tdmX9L8wzHIAcFWL
         /Dlb4zva2GUs7+dWhfIVGaVAf1cAsSIplA9Nhvp+YS6eL4M/YZr4zErD9b4xUC22f5
         4fEIThNXMBUHmfDGe30mzfZTghbx93trE7THimcdk9Avl/TietYQZuPd4bp0gbEsZQ
         PqbkxS/zK6Ik80ZEatT/wl4pOoF68RkoQVRVApisilFWucW9XFRAgnwsK42nL6M4WT
         p6h1hhNOLRcabWgIFTd91QJj0gXkcdYDLJX8F7oMtQhZZze7LOAqWlo3rYsWKy6WNL
         vrdIOTVh6RaDw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/29] modpost: various fixes, cleanups, optimizations
Date:   Mon, 25 May 2020 00:42:06 +0900
Message-Id: <20200524154235.380482-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Masahiro Yamada (29):
  modpost: drop RCS/CVS $Revision handling in MODULE_VERSION()
  modpost: do not call get_modinfo() for vmlinux
  modpost: add read_text_file() and get_line() helpers
  modpost: fix potential mmap'ed file overrun in get_src_version()
  modpost: re-add warning about missing *.mod file
  modpost: avoid false-positive file open error
  modpost: use read_text_file() and get_line() for reading text files
  modpost: remove get_next_text() and make {grab,release_}file static
  kbuild: disallow multi-word in M= or KBUILD_EXTMOD
  modpost: move -T option close to the modpost command
  modpost: pass -N option only for modules modpost
  modpost: move external module options
  modpost: load KBUILD_EXTRA_SYMBOLS files in order
  modpost: track if the symbol origin is a dump file or ELF object
  modpost: allow to pass -i option multiple times remove -e option
  modpost: rename ext_sym_list to dump_list
  modpost: re-add -e to set external_module flag
  modpost: show warning if vmlinux is not found when processing modules
  modpost: show warning if it fails to read symbol dump file
  modpost: generate vmlinux.symvers and reuse it for the second modpost
  modpost: remove -s option
  modpost: remove mod->is_dot_o struct member
  modpost: remove is_vmlinux() call in check_for_{gpl_usage,unused}()
  modpost: add mod->is_vmlinux struct member
  modpost: remove mod->skip struct member
  modpost: set have_vmlinux in new_module()
  modpost: strip .o from modname before calling new_module()
  modpost: remove is_vmlinux() helper
  modpost: change elf_info->size to size_t

 .gitignore               |   1 +
 Makefile                 |  15 +-
 scripts/Makefile.modpost |  29 ++--
 scripts/link-vmlinux.sh  |   2 -
 scripts/mod/modpost.c    | 319 ++++++++++++++++++---------------------
 scripts/mod/modpost.h    |  17 +--
 scripts/mod/sumversion.c | 114 +++-----------
 7 files changed, 205 insertions(+), 292 deletions(-)

-- 
2.25.1

