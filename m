Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 660A26518B
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2019 07:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728182AbfGKFqO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Jul 2019 01:46:14 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:59981 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728147AbfGKFqL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 01:46:11 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x6B5ip8K031345;
        Thu, 11 Jul 2019 14:44:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x6B5ip8K031345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562823892;
        bh=dURe8OXsJ3VqMwo+bDGqg5UHB/JeoagK5A52yE/eJIQ=;
        h=From:To:Cc:Subject:Date:From;
        b=o8B7IsVTM7O8ebdGZ8tXaasbQBj5NmkLDOc3iIhjP9359znVcnQTuUdOK6UC6mmXE
         45Zgwg/FsLQbgWRTlt/cU4aJJN8/PTsL9ZG999cPSmXIOI7U3JpBnqRIntmkQU7Qcy
         ndcdt66nJrGMd6XGsEI3b7RUskh67AzBy420AzW8vMIpKeodw3IM5blZI2k7ftRXMZ
         kj/VXexLQ8POkXfh58JLCoFBvE4fR4AzvMNOB/oxL5n78EgsV11LNlNYsIUoV7O+9a
         40u4AMEut6WnHxXuzOoxbEO/QqBnE1/vLBWaqQaHOa6mgs8heu+mi8jCXRawzjhtj9
         6IUAcLtXUswvA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-scsi@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>
Subject: [PATCH v2 00/11] kbuild: create *.mod with directory path and remove MODVERDIR
Date:   Thu, 11 Jul 2019 14:44:23 +0900
Message-Id: <20190711054434.1177-1-yamada.masahiro@socionext.com>
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
 Makefile                    | 36 ++++++++++--------------------------
 drivers/scsi/Makefile       |  2 +-
 scripts/Makefile.build      | 33 +++++++++++++++------------------
 scripts/Makefile.modbuiltin |  2 +-
 scripts/Makefile.modinst    |  5 +----
 scripts/Makefile.modpost    | 17 +++++++++--------
 scripts/Makefile.modsign    |  3 +--
 scripts/adjust_autoksyms.sh | 11 ++++-------
 scripts/mod/sumversion.c    | 23 ++++-------------------
 scripts/modules-check.sh    |  2 +-
 scripts/package/mkspec      |  2 +-
 13 files changed, 50 insertions(+), 88 deletions(-)

-- 
2.17.1

