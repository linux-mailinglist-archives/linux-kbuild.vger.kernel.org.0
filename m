Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 641FB1FC467
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2020 05:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgFQDDD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jun 2020 23:03:03 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:28958 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgFQDDC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jun 2020 23:03:02 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 05H32LoY025819;
        Wed, 17 Jun 2020 12:02:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 05H32LoY025819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1592362942;
        bh=n4BOvCL3VxfQ4qh288Bu9Yi/iN3FN1ZloktmANtPxcg=;
        h=From:To:Cc:Subject:Date:From;
        b=OTkXom9v24+IDxdrw1mKTS1+QLOF6LWBfjFL7WvNCL3UNlJc2Z/KQSYkEr4uUaf6Y
         5jQQktEGvRleEj8ei8EqqOxxKOlxCyrT5OiHfY+ptC/T75JQmr6NtZhbCKeZ0BF/Oh
         VXBPil94IHI89FC7UTGpoM/IM15lC2xn8ZzOt+z4A+hpeACDHOpBHOLFAX4vHYfIA0
         K9TfxD8SIzWr6afct6EnJnQ9n4D4j2jFOLv3qN7DLoQtvM+oXVsrnTFwff7dRtsPBT
         FpcLe6fRClZXcmn0b5pv5Mx05NysNfgoGMGITNHtVybDeXwu7ohthArl3MAD4+OoVF
         AcrppUtocqx7w==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kconfig: remove '---help---' support
Date:   Wed, 17 Jun 2020 12:02:19 +0900
Message-Id: <20200617030220.34733-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The conversion is done. No more user of '---help---'.

Cc: Ulf Magnusson <ulfalizer@gmail.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/checkkconfigsymbols.py | 2 +-
 scripts/kconfig/lexer.l        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
index 00a10a293f4f..1548f9ce4682 100755
--- a/scripts/checkkconfigsymbols.py
+++ b/scripts/checkkconfigsymbols.py
@@ -34,7 +34,7 @@ REGEX_SOURCE_SYMBOL = re.compile(SOURCE_SYMBOL)
 REGEX_KCONFIG_DEF = re.compile(DEF)
 REGEX_KCONFIG_EXPR = re.compile(EXPR)
 REGEX_KCONFIG_STMT = re.compile(STMT)
-REGEX_KCONFIG_HELP = re.compile(r"^\s+(help|---help---)\s*$")
+REGEX_KCONFIG_HELP = re.compile(r"^\s+help\s*$")
 REGEX_FILTER_SYMBOLS = re.compile(r"[A-Za-z0-9]$")
 REGEX_NUMERIC = re.compile(r"0[xX][0-9a-fA-F]+|[0-9]+")
 REGEX_QUOTES = re.compile("(\"(.*?)\")")
diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
index 6354c905b006..4b7339ff4c8b 100644
--- a/scripts/kconfig/lexer.l
+++ b/scripts/kconfig/lexer.l
@@ -105,7 +105,7 @@ n	[A-Za-z0-9_-]
 "endchoice"		return T_ENDCHOICE;
 "endif"			return T_ENDIF;
 "endmenu"		return T_ENDMENU;
-"help"|"---help---"	return T_HELP;
+"help"			return T_HELP;
 "hex"			return T_HEX;
 "if"			return T_IF;
 "imply"			return T_IMPLY;
-- 
2.25.1

