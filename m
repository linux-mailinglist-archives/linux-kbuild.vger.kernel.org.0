Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE456E3FA
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jul 2019 12:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbfGSKKR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 19 Jul 2019 06:10:17 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:29227 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbfGSKKR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jul 2019 06:10:17 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x6JA93Jd024206;
        Fri, 19 Jul 2019 19:09:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x6JA93Jd024206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563530944;
        bh=a3YovZwajy5jGOBf14Q9c/0gf55f02Iub75GoLKtQIY=;
        h=From:To:Cc:Subject:Date:From;
        b=GSkUvEXip3o937QdMIXgFGg+VCWE+8VZWQ9b9Jj4gfiPnlc9JBOxOietRh9VOev2q
         pYA5dVmLYxjDNcSndl+DG97sD6JyDgVfjVb04Y5mfdQJp93B7fO2AAB+qa1wauBFOk
         slOTTL9ILJUpTvPn+4G0vA4lFeC4sgWSMoQTsXdYi1l/07pXU+PRxfckJKiXKdWtIg
         YewTkXQILglKBCJmUsdkKS7sZ8BSN0xDNnyOelWNexBVpNbxvPBlCQhoHhiaGAWxNd
         cXAAofc9duC1OcI7E6xI8whOg+AmAjmfSHYCoDvz/5ivt857R4LHfuRii3EXZeadt6
         dr/J5lYKOa99w==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>,
        "Darrick J . Wong" <darrick.wong@oracle.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: disable compile-test of kernel headers for now
Date:   Fri, 19 Jul 2019 19:08:59 +0900
Message-Id: <20190719100859.11227-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This compile-test started from the strong belief that (almost) all
headers should be able to be compiled as a standalone unit, but this
requirement seems to be just annoying.

I believe compile-test of exported headers is good. On the other hand,
in-kernel headers are not necessarily supposed to be always compilable.
Actually, some headers are only included under a certain combination
of CONFIG options, and that is definitely fine.

This test is still causing false positive errors in randconfig.
Moreover, newly added headers are compile-tested by default, sometimes
they catch (not fatal) bugs, but often raise false positive errors to
end up with making people upset.

The merge window is closing shortly, so there is not much I can do.
Disable it for now, and take a pause to re-think whether we should
continue this or change the course.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 init/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/init/Kconfig b/init/Kconfig
index 9697c6b5303c..778551a1a13c 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -111,6 +111,7 @@ config HEADER_TEST
 config KERNEL_HEADER_TEST
 	bool "Compile test kernel headers"
 	depends on HEADER_TEST
+	depends on BROKEN	# disabled for now
 	help
 	  Headers in include/ are used to build external moduls.
 	  Compile test them to ensure they are self-contained, i.e.
-- 
2.17.1

