Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDC062F8D
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 06:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbfGIEZx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 00:25:53 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:42461 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727454AbfGIEZw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 00:25:52 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x694OqVj009969;
        Tue, 9 Jul 2019 13:24:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x694OqVj009969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562646294;
        bh=4ZrbChqp9XlDbu2jnXmxXGqVpaJBsEdyTZt35TheD7k=;
        h=From:To:Cc:Subject:Date:From;
        b=h/yr3UD8r29twM9ZfD0rvCb5/Opp9qq5QZkleLNk2AI81UAh2X00lSLE5z86mpfLN
         pdrjTHpIGoKjDA9TFenfXZ0+xzGmVBl/DCMSPi36hrtgq/Pvt4m4ffHERWOQR8DTB4
         mPHDsDQGLsB81EZRttpzi5oBObO8MXyqY76LW+SuMM5Xh9J5pj7abreOl/bZ1rtzoP
         f8CokcSxN6a8mc5iJ3/jX0/vLcViH2nWnbbO4V6TsWlfy2xWjWwpMBG0c4aqnfqRrP
         lbnhIw7tQZAdcJAC4K6tXzG7hkUK02jGToWNTo7ZOYLRbwQNAzTLc+mtaj8kOQGRB+
         K7taoDasQ497Q==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Nicolas Pitre <nico@fluxnic.net>, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-scsi@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>
Subject: [PATCH 00/11] kbuild: create *.mod with directory path and remove MODVERDIR
Date:   Tue,  9 Jul 2019 13:24:04 +0900
Message-Id: <20190709042416.27554-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


This series kills the long standing MODVERDIR.

Since MODVERDIR has a flat structure, it cannot avoid a race
condition when somebody introduces a module name conflict.

Kbuild now reads modules.order to get the list of all modules.

The post-processing/installation stages will be more robust
and simpler.



Masahiro Yamada (11):
  kbuild: do not create empty modules.order in the prepare stage
  kbuild: get rid of kernel/ prefix from in-tree modules.{order,builtin}
  kbuild: remove duplication from modules.order in sub-directories
  scsi: remove pointless $(MODVERDIR)/$(obj)/53c700.ver
  kbuild: modinst: read modules.order instead of $(MODVERDIR)/*.mod
  kbuild: modsign: read modules.order instead of $(MODVERDIR)/*.mod
  kbuild: modpost: read modules.order instead of $(MODVERDIR)/*.mod
  kbuild: create *.mod with full directory path and remove MODVERDIR
  kbuild: remove the first line of *.mod files
  kbuild: remove 'prepare1' target
  kbuild: split out *.mod out of {single,multi}-used-m rules

 .gitignore                  |  1 +
 Documentation/dontdiff      |  1 +
 Makefile                    | 33 +++++++++------------------------
 drivers/scsi/Makefile       |  2 +-
 scripts/Makefile.build      | 33 ++++++++++++++++-----------------
 scripts/Makefile.modbuiltin |  2 +-
 scripts/Makefile.modinst    |  5 +----
 scripts/Makefile.modpost    | 17 +++++++++--------
 scripts/Makefile.modsign    |  3 +--
 scripts/adjust_autoksyms.sh | 11 ++++-------
 scripts/mod/sumversion.c    | 23 ++++-------------------
 scripts/modules-check.sh    |  2 +-
 scripts/package/mkspec      |  2 +-
 13 files changed, 50 insertions(+), 85 deletions(-)

-- 
2.17.1

