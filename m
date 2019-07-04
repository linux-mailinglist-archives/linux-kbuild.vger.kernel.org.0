Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 576B35FDEB
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2019 22:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbfGDUuv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Jul 2019 16:50:51 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:63204 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbfGDUuv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jul 2019 16:50:51 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-02.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hj8gq-0006IQ-4N from Cedric_Hombourger@mentor.com ; Thu, 04 Jul 2019 13:50:48 -0700
Received: from FRG-W10-HOMBOUR.world.mentorg.com (137.202.0.90) by
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Thu, 4 Jul 2019 21:50:43 +0100
From:   Cedric Hombourger <Cedric_Hombourger@mentor.com>
To:     <ben@decadent.org.uk>
CC:     <yamada.masahiro@socionext.com>, <isar-users@googlegroups.com>,
        <michal.lkml@markovi.net>, <linux-kbuild@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <riku.voipio@linaro.org>,
        Cedric Hombourger <Cedric_Hombourger@mentor.com>
Subject: [PATCH v3 0/1] builddeb: generate multi-arch friendly linux-libc-dev
Date:   Thu, 4 Jul 2019 22:50:26 +0200
Message-ID: <1562273427-204-1-git-send-email-Cedric_Hombourger@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <432e997617a0669886cd9ea5ceac7c1a2173044b.camel@decadent.org.uk>
References: <432e997617a0669886cd9ea5ceac7c1a2173044b.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Changes in v3:

 - add Multi-Arch: same to debian/control for linux-libc-dev

Changes in v2:

 - forward $debarch from mkdebian to builddeb
 - use dpkg-architecture -qDEB_HOST_MULTIARCH instead of $CC -dumpmachine

Cedric Hombourger (1):
  builddeb: generate multi-arch friendly linux-libc-dev package

 scripts/package/builddeb | 8 ++++++++
 scripts/package/mkdebian | 5 +++--
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.11.0

