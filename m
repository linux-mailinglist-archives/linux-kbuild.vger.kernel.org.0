Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF8563B2D
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 20:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729352AbfGISde (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 14:33:34 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:57042 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729351AbfGISde (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 14:33:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=SZVKZKK6tPshpfq3Um1NOr/jf9FqB8MH+0dgJiqT38I=; b=NBzCxU6OvoAy19IonSrHrN7y6
        RYI6Z1d2Ou4N33q2iWJp6YR6ajo5yNAKmZ2o48cq7IDGvDx6TMxzU5UfiDSUK+Bse0RDrmsZjGTnv
        dKsKYE1/WTIFaeP2ap0YFLEWTv6gsWacHyCbhjD/SMhOelDBmt5FURTeMyW6rvGy3InzSmIIKAKlO
        4sP81fyZYfYjLipyDT8Y41jxZpxXwDDb0hck768b2yVMsVOrOz4G1QMDY31E97LkfGzbK2hpsUM2o
        Gf429dGzeG8mfD094XT39bw1TA466hXk6BSyb1t2xGJxqGVHe829ZEHXenH34nvhX5Le7Z17+j0GY
        OpUqGLzDg==;
Received: from 177.43.30.58.dynamic.adsl.gvt.net.br ([177.43.30.58] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hkuvf-0007Az-Bl; Tue, 09 Jul 2019 18:33:27 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hkuvd-0005Ph-2k; Tue, 09 Jul 2019 15:33:25 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Hannes Reinecke <hare@suse.com>, linux-kbuild@vger.kernel.org,
        Jens Axboe <axboe@kernel.dk>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
        linux-doc@vger.kernel.org, Omar Sandoval <osandov@fb.com>
Subject: [PATCH 0/5] PDF output fixes
Date:   Tue,  9 Jul 2019 15:33:18 -0300
Message-Id: <cover.1562696797.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In order to be able to build all PDF books, besides the two patches I
already sent:

    docs: pdf: add all Documentation/*/index.rst to PDF output
    docs: automarkup.py: ignore exceptions when seeking for xrefs

A few others are needed:

- patch 1 removes nested tables for a few files I converted, as 
  Sphinx LaTeX builder doesn't support it;
- Patches 2 to 4 addresses some minor issues on some books,
  usually requiring some blank lines, extra whitespaces or some
  tag replacement;
- Patch 5 is required in order to be able to build the translations
  PDF book, as it adds Asian fonts support to XeLaTeX.

This patch series is at:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=extra_fixes_v1

And it is on the top of the ReST conversions that IMO should be
sent at the end of this merge window.

Mauro Carvalho Chehab (5):
  docs: don't use nested tables
  docs: arm: fix a breakage with pdf output
  docs: block: fix pdf output
  docs: kbuild: fix build with pdf and fix some minor issues
  docs: conf.py: add CJK package needed by translations

 Documentation/admin-guide/laptops/sonypi.rst  | 26 +++++++++----------
 .../admin-guide/laptops/toshiba_haps.rst      |  8 +++---
 Documentation/arm/spear/overview.rst          |  1 +
 Documentation/block/biodoc.rst                |  9 ++++---
 Documentation/conf.py                         |  4 +++
 Documentation/driver-api/nvdimm/btt.rst       |  2 +-
 Documentation/kbuild/issues.rst               | 20 ++++++++------
 Documentation/kbuild/kbuild.rst               |  3 ++-
 Documentation/kbuild/kconfig-language.rst     | 12 +++++++++
 Documentation/kbuild/kconfig.rst              |  8 ++++--
 Documentation/kbuild/makefiles.rst            |  1 +
 Documentation/s390/debugging390.rst           |  2 +-
 12 files changed, 61 insertions(+), 35 deletions(-)

-- 
2.21.0


