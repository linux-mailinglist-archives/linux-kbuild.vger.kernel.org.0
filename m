Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5AD6C0276
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Sep 2019 11:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbfI0JhC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Sep 2019 05:37:02 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:33063 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbfI0JhC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 05:37:02 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x8R9a5ua001372;
        Fri, 27 Sep 2019 18:36:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x8R9a5ua001372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1569576966;
        bh=NubrWdGxwILdsgYPKpZXMtIIghZ8qkysvaem1tsWivY=;
        h=From:To:Cc:Subject:Date:From;
        b=eg05f9tMuAuD/pnsUnutQl1cHe5TH453NlcgA89lXELzQXJ4zxi3qMriodWdwHLQX
         HDbvTSaLlEAUUlGykgYRX6hzYQudLwSEUxImwpYlruGJUzLDko/SM5Om0HI1JgDeRo
         YjzdSbQyTLUVMjTIkXr43jFMmN/sOEDJ0iqBd3z+gEni4XgKXCw4/pUelErhX0737B
         VhlGJUW0m0P8KaYVHrZGjzjW+EnWpReAHq4r7gasF7lV1Ux4c3gMB720cFosda1mDR
         Stlgnwo2GpYnef7jQhAg0Ubod+x29d/jNsE4GSQrcRuEupUzTfs50mppy9HDEmdqz1
         1mOaYQoiHu4rg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Matthias Maennich <maennich@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Martijn Coenen <maco@android.com>,
        Will Deacon <will.deacon@arm.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] module: various bug-fixes and clean-ups for module namespace
Date:   Fri, 27 Sep 2019 18:35:56 +0900
Message-Id: <20190927093603.9140-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


I was hit by some problems caused by the module namespace feature
that was merged recently. At least, the breakage of
external module builds is a fatal one. I just took a look at the code
closer, and I noticed some more issues and improvements.

I hope these patches are mostly OK.
The 4th patch might have room for argument since it is a trade-off
of "cleaner implermentation" vs "code size".



Masahiro Yamada (7):
  modpost: fix broken sym->namespace for external module builds
  module: swap the order of symbol.namespace
  module: rename __kstrtab_ns_* to __kstrtabns_* to avoid symbol
    conflict
  module: avoid code duplication in include/linux/export.h
  kbuild: fix build error of 'make nsdeps' in clean tree
  nsdeps: fix hashbang of scripts/nsdeps
  nsdeps: make generated patches independent of locale

 Makefile               |   2 +-
 include/linux/export.h | 104 ++++++++++++++---------------------------
 kernel/module.c        |   2 +-
 scripts/mod/modpost.c  |  20 ++++----
 scripts/nsdeps         |   4 +-
 5 files changed, 47 insertions(+), 85 deletions(-)

-- 
2.17.1

