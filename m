Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 470BD88BFD
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2019 17:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbfHJPyV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Aug 2019 11:54:21 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:34083 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbfHJPyV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 11:54:21 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x7AFrG8u009713;
        Sun, 11 Aug 2019 00:53:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x7AFrG8u009713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565452399;
        bh=Gl/xBYgSeezXWNIArIxqmRVzBsQf63Pbcb4OsjGXeiQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nwshnoz0X4Lf/tevGRCSEgQ6f5YV070QcFdc3CN1MeE4PWsepzIXzw6dKf1dvdSXp
         AE+VdOpPkJ/dGaj3O6+Bm3VpfWMRP6LVwPhwtF6lPLbboDGxRBLCM+B8y8XR01W9z2
         bICyQF2DlJ5E416wf4akNDfnfe6RghVjcJ33oVqLLBqCAjtfCO0O0H0KxoTn6TMKk7
         0LCIduFSShQa767DD9hFDfu55zvG2iYridwbY1dXQyOw4JPPS1iGWyDWsIm+aCdooC
         26J/lv5HETB9TB4OvOhUorkpCSiCPSjVqK7dEkuSwjgz80GxB4IwimvHzpvp8yZKV/
         mC3AEkyaNhYJA==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Christoph Hellwig <hch@lst.de>, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] kbuild: move the Module.symvers check for external module build
Date:   Sun, 11 Aug 2019 00:52:57 +0900
Message-Id: <20190810155307.29322-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190810155307.29322-1-yamada.masahiro@socionext.com>
References: <20190810155307.29322-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

$(objtree)/Module.symvers is not required for descending into
sub-directories. It is needed for the modpost stage.

Move the Module.symvers check to the right place.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 02aff718a11d..24c9ed272b5f 100644
--- a/Makefile
+++ b/Makefile
@@ -1620,10 +1620,10 @@ $(objtree)/Module.symvers:
 
 module-dirs := $(addprefix _module_,$(KBUILD_EXTMOD))
 PHONY += $(module-dirs) modules
-$(module-dirs): prepare $(objtree)/Module.symvers
+$(module-dirs): prepare
 	$(Q)$(MAKE) $(build)=$(patsubst _module_%,%,$@) need-modorder=1
 
-modules: $(module-dirs)
+modules: $(module-dirs) $(objtree)/Module.symvers
 	@$(kecho) '  Building modules, stage 2.';
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
-- 
2.17.1

