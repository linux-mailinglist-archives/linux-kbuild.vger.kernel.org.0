Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31C8020A397
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jun 2020 19:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406576AbgFYRFM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jun 2020 13:05:12 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:51072 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406413AbgFYRFM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jun 2020 13:05:12 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 05PH4apF005239;
        Fri, 26 Jun 2020 02:04:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 05PH4apF005239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593104677;
        bh=nRGp11E9+TGPA/vFfv5nOdt3IyfYXfdO0vNH3A47FpM=;
        h=From:To:Cc:Subject:Date:From;
        b=NkAI115ErUxhGKy2OjZpq/dlWccsA+60/iifHUCZl42BKKUsU6g29pLdvnLSUOa8/
         OjAGdFs4jsqU2ZkTRhEH4jFnR06QrKnkInpx3Xyt0HU3uNlMOr7m2I59oSvbbWssnI
         exPWKYCVu5evhG58Iex0P3xfT6QH+yFrDm10KnzzcW8Oqrwk7DMZyamhi7nJPi8Qam
         7j8MYm14pvsVZ4lL7P9QjcwrB+SOv+FUaEdpTcOGBy9S0KOY5WvAus3EYhXjj5X6cr
         XcCX35YftpCkAlmSJ2rZRiIQB+MbIFnMBnoa/fTESZzTJ7kPpVBRxMHQLFVTm+vhiV
         5ArZhCynh8HYw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Frank Rowand <frowand.list@gmail.com>,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] dt-bindings: fix 'make clean' and improve dt-schema check rules
Date:   Fri, 26 Jun 2020 02:04:30 +0900
Message-Id: <20200625170434.635114-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org




Masahiro Yamada (4):
  dt-bindings: fix error in 'make clean' after 'make dt_binding_check'
  dt-bindings: do not build processed-schema.yaml for 'make
    dt_binding_check'
  dt-bindings: copy process-schema-examples.yaml to process-schema.yaml
  dt-bindings: split DT schema check rules

 .gitignore                                 |  1 +
 Documentation/devicetree/bindings/Makefile | 35 ++++++++++++++++------
 Makefile                                   |  2 +-
 scripts/Makefile.build                     |  2 ++
 scripts/Makefile.lib                       | 27 +++++++++--------
 5 files changed, 44 insertions(+), 23 deletions(-)

-- 
2.25.1

