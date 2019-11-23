Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1AC107F4C
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 17:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbfKWQFu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 11:05:50 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49455 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfKWQFB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:01 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xANG4l5H019106;
        Sun, 24 Nov 2019 01:04:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xANG4l5H019106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574525087;
        bh=H2tGAlg1+h2LUBCWdvUI7VC1wx4Pz4ZqLwpwarMDBnM=;
        h=From:To:Cc:Subject:Date:From;
        b=p3KMV9ET1bL7+f4btul4W6Yb2Bt25+Uws5pwgXVILo/j4xfjk6z4NHQ1pUZR0M/jo
         x00FmR+9UYPfD3KLE01mXOu9s1CBEeWGyCSGBQxqm6craegs40DuwJBLp2wdnqlvOb
         cp8vOy2rwjbiiw+DYkkXMMh7p+/1zNhLiPQVtF7pkH4cBEqLTsyY4XNvGhNM+zHoPs
         TlyzBmvA3Y7dhyhlD6ieun7owUTutLBpsKrVymaTPCkUUgi1WX1FV7G5zT1C3YXtEh
         zC6jJ6opkXat8cBVs0Y1eD0t3GkAqVhIwwTDHplSro3jpMQo2pBFHDqP+pKX4UVrwK
         Ncy+yQgb4T+2w==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/16] scripts/kallsyms: various cleanups and optimizations
Date:   Sun, 24 Nov 2019 01:04:28 +0900
Message-Id: <20191123160444.11251-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Changes in v2:
 - Add a new patch that shrinks the table before the sort.

Masahiro Yamada (16):
  scripts/kallsyms: remove unneeded #ifndef ARRAY_SIZE
  scripts/kallsyms: fix definitely-lost memory leak
  scripts/kallsyms: shrink table before sorting it
  scripts/kallsyms: set relative_base more effectively
  scripts/kallsyms: remove redundant is_arm_mapping_symbol()
  scripts/kallsyms: remove unneeded length check for prefix matching
  scripts/kallsyms: add sym_name() to mitigate cast ugliness
  scripts/kallsyms: replace prefix_underscores_count() with strspn()
  scripts/kallsyms: make find_token() return (unsigned char *)
  scripts/kallsyms: add const qualifiers where possible
  scripts/kallsyms: skip ignored symbols very early
  scripts/kallsyms: move more patterns to the ignored_prefixes array
  scripts/kallsyms: move ignored symbol types to is_ignored_symbol()
  scripts/kallsyms: make check_symbol_range() void function
  scripts/kallsyms: put check_symbol_range() calls close together
  scripts/kallsyms: remove redundant initializers

 scripts/kallsyms.c | 287 ++++++++++++++++++++++-----------------------
 1 file changed, 142 insertions(+), 145 deletions(-)

-- 
2.17.1

