Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B80A9C995C
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2019 09:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728102AbfJCH7R (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Oct 2019 03:59:17 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:59233 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728180AbfJCH7R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 03:59:17 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x937wTkS007720;
        Thu, 3 Oct 2019 16:58:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x937wTkS007720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570089510;
        bh=TZoLwyjxs1rXiGeMqo09vs0+qyomHTfJ9kkNpI3atWE=;
        h=From:To:Cc:Subject:Date:From;
        b=QTOhXzxRFqojlugFQQXkgfK4eY6knGqfGmtO+3jaw+JSuwQDEa2SKu21G8D3y0BIH
         1MIfmAu3r31cxSB2CZ+D/O+6hxCr6km6uWH+pZRyWdpZcDJlpuTSLjhJIJSZC+2pab
         tM0cLk5fkB57hHNG7OmMqrHVPlhiEBsOnxC80vLEEElwzX+CMs/3K/6+aEi+eT9H3h
         WiqSmw9j1bGYjXZB6hHgjwQPZ6qfbccFOeT/WejV6VIL9+ZRuCzG9tIwkM9DBCIGtn
         aK6BVO2MOQHM56OtL6krvb31yCSJSKvk7/Cf8HV2j0lm/vcId9zmc2kh+pzKWQlnV6
         P5F0MA4MZ9VdA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Matthias Maennich <maennich@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shaun Ruffell <sruffell@sruffell.net>,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Martijn Coenen <maco@android.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] module: various bug-fixes and clean-ups for module namespace
Date:   Thu,  3 Oct 2019 16:58:20 +0900
Message-Id: <20191003075826.7478-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


I was hit by some problems caused by the module namespace feature
that was merged recently. At least, the breakage of
external module builds is a fatal one. I just took a look at the code
closer, and I noticed some more issues (some are nit-picking).

V2:
 - I dropped "module: avoid code duplication in include/linux/export.h"
   because Matthias offered to refactor the code by himself.

 - V1 missed the problem when a symbol is preloaded before
  sym_add_exported() is called.  I fixed it too.



Masahiro Yamada (6):
  module: swap the order of symbol.namespace
  modpost: fix broken sym->namespace for external module builds
  module: rename __kstrtab_ns_* to __kstrtabns_* to avoid symbol
    conflict
  kbuild: fix build error of 'make nsdeps' in clean tree
  nsdeps: fix hashbang of scripts/nsdeps
  nsdeps: make generated patches independent of locale

 Makefile               |  2 +-
 include/linux/export.h | 10 +++++-----
 scripts/mod/modpost.c  | 29 +++++++++++++++--------------
 scripts/nsdeps         |  4 ++--
 4 files changed, 23 insertions(+), 22 deletions(-)

-- 
2.17.1

