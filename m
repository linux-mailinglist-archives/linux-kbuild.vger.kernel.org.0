Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3A6BAD749
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Sep 2019 12:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729371AbfIIKxl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Sep 2019 06:53:41 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:54370 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729369AbfIIKxl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 06:53:41 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x89ArI1L010864;
        Mon, 9 Sep 2019 19:53:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x89ArI1L010864
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568026398;
        bh=JUGLW57UsVm5dqkHawVFsjR557zZIe+tiYuceaDlomE=;
        h=From:To:Cc:Subject:Date:From;
        b=L+wtOVxbYdZtfMGs0sRygO3/+lILWFRY73LurajYu/oIclqGD5LOQ25fvH291Dicm
         amEPS9Bu7gu2bIKTHUQHhxiRH4m9yDcmI/qU8n0sJ9Cv/MbCz+IzYbUNFjicpKlsox
         Dz3616Du+bZSnYOLfc1EvjvLwGk4zbIqy4hPALas5QxXQigQQNamPGQMb25bj7AqPg
         /E4zaVk0oZZCm/EZBLYxrGPrYPskkkTQbW0NrqiWNeDfCjYk3SZN9me8c2nTbrFwU0
         krmIEiz0mRgFPu1yu4yMaEg+64wZkvKoc/9F63DlrflSpw0oLT1zSsmVjldq2DL3Sn
         CEU/nw/QQVMSw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Denis Efremov <efremov@linux.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] export.h: remove defined(__KERNEL__)
Date:   Mon,  9 Sep 2019 19:53:16 +0900
Message-Id: <20190909105317.20473-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This line was touched by commit f235541699bc ("export.h: allow for
per-symbol configurable EXPORT_SYMBOL()"), but the commit log did
not explain why.

CONFIG_TRIM_UNUSED_KSYMS works for me without defined(__KERNEL__).

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/linux/export.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/export.h b/include/linux/export.h
index fd8711ed9ac4..cdd98a0d918c 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -20,7 +20,7 @@ extern struct module __this_module;
 
 #ifdef CONFIG_MODULES
 
-#if defined(__KERNEL__) && !defined(__GENKSYMS__)
+#if !defined(__GENKSYMS__)
 #ifdef CONFIG_MODVERSIONS
 /* Mark the CRC weak since genksyms apparently decides not to
  * generate a checksums for some symbols */
-- 
2.17.1

