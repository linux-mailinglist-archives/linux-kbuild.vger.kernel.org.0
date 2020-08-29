Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 297672565EE
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Aug 2020 10:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbgH2IPi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 Aug 2020 04:15:38 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47602 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbgH2IO6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Aug 2020 04:14:58 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07T8ELfr014307;
        Sat, 29 Aug 2020 17:14:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07T8ELfr014307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598688867;
        bh=DJwawnqNEjOuongm+fSBHgHFb7bZ8vPqaDUmQxjHe+s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eTyFit+u2E1/kXGLPVJ99i12ni1JGLB+5TRkOeCz/W/1hBSRt3Fao5sisYnG9U0ZM
         ATiEVVuVWfNYiSqQOGC4PV+378nStQHKuySjpgRzIJ5+XiVZAZqUJMH6LDu4oMS9I4
         u5jPI4NctKByHCOl+ArfkHtg53KsMu/bh537/4KhmX1/fpCQ+lwuOUDRa7JXIkoBmT
         SB9dtR6CQyclxbBw8vIYg4efdayhKUgx5djnhF+0I9Ig2UeGutL7PK9E9L4rVJ5PBA
         npF0s34njjel/vvat3WCizkENr1ju6mrdhuF6NRqw0MI7V+/TuCWkHK4eQ4eZvVIX6
         0GkHP84Za+A9g==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] kconfig: qconf: create QApplication after option checks
Date:   Sat, 29 Aug 2020 17:14:17 +0900
Message-Id: <20200829081417.725978-11-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200829081417.725978-1-masahiroy@kernel.org>
References: <20200829081417.725978-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

'scripts/kconfig/qconf -h' just calls usage() and exits, with
QApplication unused.

There is no need to construct QApplication so early. Do it after
the parse stage.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 09e98814485a..beaed6d177bb 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1846,7 +1846,6 @@ int main(int ac, char** av)
 	const char *name;
 
 	progname = av[0];
-	configApp = new QApplication(ac, av);
 	if (ac > 1 && av[1][0] == '-') {
 		switch (av[1][1]) {
 		case 's':
@@ -1867,6 +1866,8 @@ int main(int ac, char** av)
 	conf_read(NULL);
 	//zconfdump(stdout);
 
+	configApp = new QApplication(ac, av);
+
 	configSettings = new ConfigSettings();
 	configSettings->beginGroup("/kconfig/qconf");
 	v = new ConfigMainWindow();
-- 
2.25.1

