Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E80EB1D6722
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728215AbgEQJuw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:50:52 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:38295 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727777AbgEQJtf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:35 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4Kv018560;
        Sun, 17 May 2020 18:49:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4Kv018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708945;
        bh=MHet8/7ySH22lXgUyLsSSEs0A0BaqCfM8SOp5Lu64PA=;
        h=From:To:Cc:Subject:Date:From;
        b=YaeqLWsFZHCb4xi6RQKNujDOL1m2NTPaAggDKq0PhlkSpZ6JiK0s7CfkTzPjSGS++
         kckOlQCFhwAWVPbBt7Y/WOTQDNr9iOCcKnIPLW7iqhEIrr3WH4B8IMMUw/NpGHFkv6
         X42XmKScecn8+nBhDxGrysoj/h/GuuoPyzb1QflQFQCYnAMHmivCUm3D1QgatuieWT
         t2uWV68u8pXXz1ozgT+c3DmuTDDgFZNa058S8ewDLmVIUJxFGrAHre4PbNeuiVvycQ
         5fxF3r3hC11gTHBVrAApmpDPkujHbqenHrObZQYEvyaWWxBqkNNmPPMjTJlU9OaaBL
         z1Ggc5MLEpJjQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/29] modpost: various fixes, cleanups, optimizations
Date:   Sun, 17 May 2020 18:48:30 +0900
Message-Id: <20200517094859.2376211-1-masahiroy@kernel.org>
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
 scripts/mod/modpost.c    | 309 ++++++++++++++++++---------------------
 scripts/mod/modpost.h    |  17 +--
 scripts/mod/sumversion.c | 114 ++++-----------
 7 files changed, 195 insertions(+), 292 deletions(-)

-- 
2.25.1

