Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C9833A09F
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Mar 2021 20:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234474AbhCMTtM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Mar 2021 14:49:12 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:39834 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234395AbhCMTtH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Mar 2021 14:49:07 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 12DJmef4018162;
        Sun, 14 Mar 2021 04:48:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 12DJmef4018162
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615664923;
        bh=0WyRvF+OxdlX87UHvZ3BSQZ0z0oncCzT4/4kdL0DNaI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FeDwDYTF98CwAc5tvEHuhlslAxLng40ib3sRv38A1uu6sSI24+V1mnngrKEjZdXXg
         3nYiro6ZQxxwe2sXrbkk1zk+dqljIKapIGHpwRkFfOIkB5PiIqhpFvoTDpL1bZYvuv
         tAKphsDb9j91q7DviPj2KzY1bi/NN2diqTSwsTzAy2p8oyACwG1f/OfpUras9G85e3
         bmcpLVkyT0KhxGEWE68ktk7isgCihGBHR36lq2d3JiB5Z6f6e2RxPX/MT8kwcIqctj
         0W8AGopeJv5lpx3/q+vJ4EFiWN5qwH9iXBXIMC8tvIs4JFJwXmxMlxFD6mvygxR07W
         u8l84ZOpVTtww==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/13] kconfig: remove assignment for Kconfig file
Date:   Sun, 14 Mar 2021 04:48:28 +0900
Message-Id: <20210313194836.372585-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210313194836.372585-1-masahiroy@kernel.org>
References: <20210313194836.372585-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Pass av[optind] to conf_parse() directly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 9ebc1acaf1ae..42d35da86604 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -571,8 +571,7 @@ int main(int ac, char **av)
 		conf_usage(progname);
 		exit(1);
 	}
-	name = av[optind];
-	conf_parse(name);
+	conf_parse(av[optind]);
 	//zconfdump(stdout);
 
 	switch (input_mode) {
-- 
2.27.0

