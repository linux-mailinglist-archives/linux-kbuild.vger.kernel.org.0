Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4A9425608C
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Aug 2020 20:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgH1SfY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Aug 2020 14:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgH1SfX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Aug 2020 14:35:23 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E421EC061264;
        Fri, 28 Aug 2020 11:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=fRfRVruH5jHX08IIGYa0MUNIexkD4H41MbdVql35umw=; b=NWUBk4HfipgQB8gwCdIYjwZpG5
        1P2SVoMY3d18cqOpOrWrmzKDbJWR+WeOdco4nwQplbyZLaAqN2H5bp5H75OA18Gm2YDoi/sG4uoTW
        vBSKzlhZkKs4N3qsjTa8EIgOnjyg0Jex0J9NbILvxmNCkdrXUeiTTrACof/am7Xv8D0iolYRZaHyQ
        pRpfafOjv1ro1OdbllCCOyGK3iMm3axHBfhYRjplhFkzgMoF5MtdHTgLRCbn1EvfexmXMHp3VALgl
        tPBSsI6som7OtehFztJ8QDaUjhI3/ALaeZUqCtuvBZKALIfwgbTcvRPasxE2lrJRNAKezr3IYIlO/
        2NzvxmBg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kBjDa-0000KB-98; Fri, 28 Aug 2020 18:35:18 +0000
To:     LKML <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Michal Simek <monstr@monstr.eu>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] microblaze: fix kbuild redundant file warning
Message-ID: <21eddfa7-2b7c-00c4-ad5b-40878036f987@infradead.org>
Date:   Fri, 28 Aug 2020 11:35:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix build warning since this file is already listed in
include/asm-generic/Kbuild.

../scripts/Makefile.asm-generic:25: redundant generic-y found in arch/microblaze/include/asm/Kbuild: hw_irq.h

Fixes: 7e8f54cd4e26 ("microblaze: Remove empty headers")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Michal Simek <monstr@monstr.eu>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
---
 arch/microblaze/include/asm/Kbuild |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20200825.orig/arch/microblaze/include/asm/Kbuild
+++ linux-next-20200825/arch/microblaze/include/asm/Kbuild
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 generated-y += syscall_table.h
 generic-y += extable.h
-generic-y += hw_irq.h
 generic-y += kvm_para.h
 generic-y += local64.h
 generic-y += mcs_spinlock.h

