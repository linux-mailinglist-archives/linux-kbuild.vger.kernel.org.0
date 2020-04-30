Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74DF11C0648
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2020 21:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgD3TZQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Apr 2020 15:25:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:47066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726272AbgD3TZQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Apr 2020 15:25:16 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7D8F52072A;
        Thu, 30 Apr 2020 19:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588274715;
        bh=+7YJ0F1f3t1J9sJB435G2DWcTRqHj08byBs/EBxxpUE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eLexogwtOcM4N+0UYjECMimdHQ1opWtbze6Dopj5VT/8YNtXib+uDpzQ+/j7L1wM7
         gO7qJfjWBGp/EUqclA9T2dFbzn7epFKMoqif+CwAY1rvNnNdS9GaFG/7gci0ZG5mEH
         gP89jPiJs/LD6qCbcNj9srmmHA07LUSjwbSMf6aM=
Date:   Thu, 30 Apr 2020 21:25:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [PATCH RFC] Kbuild: Makefile: warn if auto.conf is obsolete
Message-ID: <20200430212511.2115ed98@coco.lan>
In-Reply-To: <20200430211009.3fef03f3@coco.lan>
References: <20200430131715.32c1a1f6@coco.lan>
        <CAK7LNASmVoZequqaj6MTimeZ0MG0fk7Wb5-9haFhgG03kDBpxg@mail.gmail.com>
        <20200430184948.27191975@coco.lan>
        <CAK7LNASx5qfV_6Wow-MVKsHXUX96m8yYvpeK1QVt+2i46FTMNg@mail.gmail.com>
        <20200430211009.3fef03f3@coco.lan>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

A new behavior on more recent kernels require to always call
"make modules_prepare" after *any* Kconfig changes.

This is not what a poor mortal would be expecting on a building
system, as it should, IMHO, be able to detect and auto-run
whatever is needed to use the newer setup.

Yet, while this is not solved, let's at least stop the build
and produce a warning, to notify the user about that.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

I would still prefer to call "make modules_prepare" directly,
on such cases, but just calling "make -C . modules_prepare" doesn't
work. So, the next best thing would be to at least print a message
and don't try to do a build with a broken auto.conf file.

 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index 70def4907036..492ee2396ab9 100644
--- a/Makefile
+++ b/Makefile
@@ -1632,6 +1632,11 @@ $(objtree)/Module.symvers:
 build-dirs := $(KBUILD_EXTMOD)
 PHONY += modules
 modules: descend $(objtree)/Module.symvers
+	@if [ $(KCONFIG_CONFIG) -nt include/config/auto.conf ]; then \
+		echo "  WARNING: $(KCONFIG_CONFIG) was modified. Need to run:"; \
+		echo "           $(MAKE) modules_prepare"; \
+		exit -1; \
+	fi
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
 PHONY += modules_install
-- 
2.25.4

