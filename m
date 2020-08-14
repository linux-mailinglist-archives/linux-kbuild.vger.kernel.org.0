Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F90224446A
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Aug 2020 07:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgHNFCV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 14 Aug 2020 01:02:21 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:62885 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgHNFCT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Aug 2020 01:02:19 -0400
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 07E51xdd001290;
        Fri, 14 Aug 2020 14:02:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 07E51xdd001290
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1597381320;
        bh=x8JxBjoCq979d4tk+W9V8zPD84/UgWP4VgQpYcI1FLw=;
        h=From:Date:Subject:To:Cc:From;
        b=OHYVBTy6kOHn4RmovDTfqnPh1zBhw/WSSYBxT0I17JllXOqHa3xYquMrZPKSfHx2n
         1EXHPTBgYdpkX6b070gbl2DHHJCe48vRL8J5gLsuEzrce+u04ha2tClal33zvKYpzv
         xxIKIBflItUvdPNoKquNFbK4rDMoJ+ccnO6pRbXu9GOufQPIdIge8mzwEnzkdNgVL4
         2iwI2bnsxZWLOhk33G0Xrazn5HdElXXK7HyLcSpuj1rO1S2qbttWbrHSqrGsERyu+g
         ZdJV5nUatSPnWx1Rq8n+lyCeEDaJo2Qt95uAKNKGJoOFbjl7QK7m2fs1OaQlcH8n7p
         YQOPo3UN+i8kA==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id 1so4084755vsl.1;
        Thu, 13 Aug 2020 22:02:00 -0700 (PDT)
X-Gm-Message-State: AOAM5314BAdlYXbEirrPynM0SFuzPkoNzfjHXd4VF0y4PEmVT6bqfBpX
        w1pRxFePJz7F2znyjAtN0RueoXrWrlgOy/byqWY=
X-Google-Smtp-Source: ABdhPJxbcs0ATPwleW8AVtD+hbHq9C9n8oE6NZicY6WCCqyEAuV2j4K05S2ufrqj/pUD03HEVrQuMi+nyRhHYPaL6jI=
X-Received: by 2002:a67:d908:: with SMTP id t8mr442148vsj.215.1597381318892;
 Thu, 13 Aug 2020 22:01:58 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 14 Aug 2020 14:01:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQh7gsicKmSFrLExH=a=spMMeYRDkFGB53Da7gcAUCFDg@mail.gmail.com>
Message-ID: <CAK7LNAQh7gsicKmSFrLExH=a=spMMeYRDkFGB53Da7gcAUCFDg@mail.gmail.com>
Subject: [GIT PULL] Kconfig updates for v5.9-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kconfig updates for v5.9-rc1

Thanks.



The following changes since commit bcf876870b95592b52519ed4aafcf9d95999bc9c:

  Linux 5.8 (2020-08-02 14:21:45 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kconfig-v5.9

for you to fetch changes up to d4bbe8a1b55aeaadfa0fa982b468eaec9b799f1a:

  kconfig: qconf: move setOptionMode() to ConfigList from ConfigView
(2020-08-14 13:47:21 +0900)

----------------------------------------------------------------
Kconfig updates for v5.9

 - remove '---help---' keyword support

 - fix mouse events for 'menuconfig' symbols in search view of qconf

 - code cleanups of qconf

----------------------------------------------------------------
Masahiro Yamada (23):
      kconfig: remove '---help---' support
      Revert "checkpatch: kconfig: prefer 'help' over '---help---'"
      kconfig: constify XPM data
      kconfig: add 'static' to some file-local data
      kconfig: qconf: remove ->addSeparator() to menuBar
      kconfig: qconf: do not use 'menu' variable for (QMenuBar *)
      kconfig: qconf: use 'menu' variable for (QMenu *)
      kconfig: qconf: remove toolBar from ConfigMainWindow members
      kconfig: qconf: overload addToolBar() to create and insert toolbar
      kconfig: qconf: remove unused ConfigList::listView()
      kconfig: qconf: remove name from ConfigSearchWindow constructor
      kconfig: qconf: omit parent to QHBoxLayout()
      kconfig: qconf: remove unused argument from ConfigList::updateList()
      kconfig: qconf: remove unused argument from ConfigView::updateList()
      kconfig: qconf: remove 'parent' from ConfigList::updateMenuList()
      kconfig: qconf: drop more localization code
      kconfig: qconf: remove ConfigItem::pixmap/setPixmap
      kconfig: qconf: remove ConfigList::addColumn/removeColumn
      kconfig: qconf: remove ConfigItem::text/setText
      kconfig: qconf: remove unused voidPix, menuInvPix
      kconfig: qconf: refactor icon setups
      kconfig: qconf: do not limit the pop-up menu to the first row
      kconfig: qconf: move setOptionMode() to ConfigList from ConfigView

Maxime Chretien (1):
      kconfig: qconf: Fix mouse events in search view

 scripts/checkkconfigsymbols.py |   2 +-
 scripts/checkpatch.pl          |   6 +-
 scripts/kconfig/images.c       |  30 +++----
 scripts/kconfig/images.h       |  30 +++----
 scripts/kconfig/lexer.l        |   4 +-
 scripts/kconfig/qconf.cc       | 319
++++++++++++++++++++++++++++++++++----------------------------------
 scripts/kconfig/qconf.h        |  56 +++---------
 scripts/kconfig/symbol.c       |  14 ++-
 8 files changed, 218 insertions(+), 243 deletions(-)

-- 
Best Regards
Masahiro Yamada
