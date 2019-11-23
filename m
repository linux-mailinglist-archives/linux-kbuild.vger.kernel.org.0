Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13A64107EA2
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 14:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbfKWN26 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 08:28:58 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:39538 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbfKWN17 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 08:27:59 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id xANDRbkZ000733;
        Sat, 23 Nov 2019 22:27:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com xANDRbkZ000733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574515658;
        bh=yHJkiIZAPqvKQqa+UmExDFu6wHnFHcdrF3suxVVV4/Q=;
        h=From:To:Cc:Subject:Date:From;
        b=kawQ5XX6Ie3PkrKpKiCZSWqR6sXLkTMWriPgIQEKnKZPUcFs6VmeZHJj+TWmQSXNd
         mTD4Eb6GLYUehL7+5WxfL6hwwp3DN68PHO5ejc1fHOh5AYNM65+tZ6drdBIVxMzqhh
         IfSmpH2gWDx3fNYGnLxGwFF8A/YxnSbXm6ZSfVC9mCfRfIR9esIm70kmBOxRnhWi9A
         GIGilK6XCYRiORz0p5c0slZhYCQdyuorbaNa/Om/ZHh/8tNL9VhH6HDJ7IBWDxVj97
         GSvxEeDgjJsSthfNWjJI2nnSAwRpAxfmiSuHwjeKKhXQWH7J0dwIGmgIBRK4LoUZrX
         U0KzCkj2CPXMw==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/16] scripts/kallsyms: various cleanups and optimizations
Date:   Sat, 23 Nov 2019 22:27:11 +0900
Message-Id: <20191123132727.30151-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada (16):
  scripts/kallsyms: remove unneeded #ifndef ARRAY_SIZE
  scripts/kallsyms: fix definitely-lost memory leak
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
  scripts/kallsyms: check no valid symbol earlier
  scripts/kallsyms: put check_symbol_range() calls close together
  scripts/kallsyms: remove redundant initializers

 scripts/kallsyms.c | 254 +++++++++++++++++++++------------------------
 1 file changed, 121 insertions(+), 133 deletions(-)

-- 
2.17.1

