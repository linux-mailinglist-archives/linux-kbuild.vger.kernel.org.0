Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 782B2297C5B
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Oct 2020 14:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1761415AbgJXMkI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 24 Oct 2020 08:40:08 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:60873 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761414AbgJXMkI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Oct 2020 08:40:08 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 09OCdV8A029147;
        Sat, 24 Oct 2020 21:39:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 09OCdV8A029147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1603543173;
        bh=nD3oRwXw1JO8HbibF/MrHZ3hDIdocUT6tgaF058Kczs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GQljCXRQ2Ks2vcz84cS93yDK+voMSaAZ9QQbcEqnvVpbX4zm7tnet2UhUasEYIQrN
         FJeNlJiORHN2Qqv6lRYm0lggg8YOsDAhElIKHBCgSO+lAP3OKkbIA5fhIZwn3k42ZH
         pzF3ip2x/bGjjbQb6ppmCELCXBRbnTIqax54b8F3Ytcz+faz7t2xGsa2+fsmDYQhEK
         plV1AhRQmZRopN4xbn2q7DpD091FuGDxXcR1O6iP9DFFg9BCtmqlUShQaW1tWsqUf1
         6pOuHviW9Y1W2LYcRyZPfNLRVAsZpnedKiLi71evUNpIS7NB/gZHDypqENhBHsRgN1
         wg+6H0RLtmmoQ==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] kconfig: qconf: use a variable to pass packages to pkg-config
Date:   Sat, 24 Oct 2020 21:38:40 +0900
Message-Id: <20201024123841.1201922-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201024123841.1201922-1-masahiroy@kernel.org>
References: <20201024123841.1201922-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The variable, PKG, is defined at the beginning of this script.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf-cfg.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/qconf-cfg.sh b/scripts/kconfig/qconf-cfg.sh
index d1eb2407c35d..fa564cd795b7 100755
--- a/scripts/kconfig/qconf-cfg.sh
+++ b/scripts/kconfig/qconf-cfg.sh
@@ -11,7 +11,7 @@ if [ -z "$(command -v pkg-config)" ]; then
 fi
 
 if pkg-config --exists $PKG; then
-	echo cflags=\"-std=c++11 -fPIC $(pkg-config --cflags Qt5Core Qt5Gui Qt5Widgets)\"
+	echo cflags=\"-std=c++11 -fPIC $(pkg-config --cflags $PKG)\"
 	echo libs=\"$(pkg-config --libs $PKG)\"
 	echo moc=\"$(pkg-config --variable=host_bins Qt5Core)/moc\"
 	exit 0
-- 
2.25.1

