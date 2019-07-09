Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 425496324A
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 09:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfGIHn6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 03:43:58 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:48996 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbfGIHn6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 03:43:58 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-02.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hkkn3-0004JL-JR from Cedric_Hombourger@mentor.com ; Tue, 09 Jul 2019 00:43:53 -0700
Received: from FRG-W10-HOMBOUR.world.mentorg.com (137.202.0.90) by
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Tue, 9 Jul 2019 08:43:48 +0100
From:   Cedric Hombourger <Cedric_Hombourger@mentor.com>
To:     <yamada.masahiro@socionext.com>
CC:     <ben@decadent.org.uk>, <isar-users@googlegroups.com>,
        <michal.lkml@markovi.net>, <linux-kbuild@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <riku.voipio@linaro.org>,
        Cedric Hombourger <Cedric_Hombourger@mentor.com>
Subject: [PATCH v4 0/1] builddeb: generate multi-arch friendly linux-libc-dev
Date:   Tue, 9 Jul 2019 09:43:34 +0200
Message-ID: <1562658215-186-1-git-send-email-Cedric_Hombourger@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAK7LNARgFmSm+kCngidevQ3HnNjqKDKfGzYXrFPzhgBRHmccXw@mail.gmail.com>
References: <CAK7LNARgFmSm+kCngidevQ3HnNjqKDKfGzYXrFPzhgBRHmccXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Changes in v4 (address comments from Masahiro Yamada)

 - Use arch from debian/arch and no longer forward it from mkdebian to
   builddep since it may be found there
 
Changes in v3 (address comments from Ben Hutchings)

 - add Multi-Arch: same to debian/control for linux-libc-dev
 - forward debarch from mkdebian to sub-processes (builddeb in particular)

Changes in v2 (address comments from Ben Hutchings)

 - forward $debarch from mkdebian to builddeb
 - use dpkg-architecture -qDEB_HOST_MULTIARCH instead of $CC -dumpmachine

Cedric Hombourger (1):
  builddeb: generate multi-arch friendly linux-libc-dev package

 scripts/package/builddeb | 8 ++++++++
 scripts/package/mkdebian | 5 +++--
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.11.0

