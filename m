Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB0932350E2
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Aug 2020 09:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgHAHJZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 Aug 2020 03:09:25 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:56485 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728309AbgHAHJY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Aug 2020 03:09:24 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 07178rlC012084;
        Sat, 1 Aug 2020 16:08:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 07178rlC012084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596265734;
        bh=+2ZgBhJsxCygCn3H+/vlqw6qc7+LaVpC5dgg+7LYwbQ=;
        h=From:To:Cc:Subject:Date:From;
        b=UXCTL46OqvcIoei4c4ngpKOL1RpIpGMvhJyHfpjs3K8NSNF5tDr5JplAzxAAUPPvf
         8oO+uZgMIJs/XMh0WjLLZcV/VkoeBrZZD3IPvvjczJtEcJXBR0wMoexJeskiDv0e2l
         y21QGJdFMzTZtAJ2s5Ch9BqbEQzSMUJezLsCdC48AvAewQIO9QG0MF+MjdAQWC1g1o
         kIWplSjPE7Pg9iSGJ1OG6efl1sSN7+NjY2fBqTqYYjLkxU7U1hOHST2rfrfwwUDhAS
         Wg3AEr1R1W/6EVfRQ7/yPajrRTSW43BRL6uFg4izCHrdq+ChoOglSnixYHCOGb/V5D
         2vgrj60z29qgQ==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Revert "kconfig: qconf: don't show goback button on splitMode"
Date:   Sat,  1 Aug 2020 16:08:49 +0900
Message-Id: <20200801070850.484106-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts commit cc1c08edccaf5317d99a17a3231fe06381044e83.

Maxim Levitsky reports 'make xconfig' crashes since that commit
(https://lkml.org/lkml/2020/7/18/411)

Or, the following is simple test code that makes it crash:

    menu "Menu"

    config FOO
            bool "foo"
            default y

    menuconfig BAR
            bool "bar"
            depends on FOO

    endmenu

Select the Split View mode, and double-click "bar" in the right window,
then you will see Segmentation fault.

When 'last' is not set for symbolMode, the following code in
ConfigList::updateList() calls firstChild().

  item = last ? last->nextSibling() : firstChild();

However, ConfigList::firstChild() does not seem to return a (ConfigItem *)
capable pointer, which seems another bug.

Moreover, we should reconsider whether hiding the goback icon is the
right thing to do.

In the following test code, the Split View shows "Menu2" and "Menu3" in
the right window. You can descend into "Menu3", but there is no way to
ascend back to "Menu2" from "Menu3".

    menu "Menu1"

    config FOO
            bool "foo"
            default y

    menu "Menu2"
            depends on FOO

    menu "Menu3"

    config BAZ
            bool "baz"

    endmenu

    endmenu

    endmenu

It is true that the goback button is currently not functional due to yet
another bug, but hiding the problem is not the right way to go.

Anyway, Segmentation fault is rather fatal. Revert the offending commit
for now, and we should find the right solution.

Reported-by:  Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 4a616128a154..75c7b57fd7a9 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -437,10 +437,9 @@ void ConfigList::updateList(ConfigItem* item)
 	if (rootEntry != &rootmenu && (mode == singleMode ||
 	    (mode == symbolMode && rootEntry->parent != &rootmenu))) {
 		item = (ConfigItem *)topLevelItem(0);
-		if (!item && mode != symbolMode) {
+		if (!item)
 			item = new ConfigItem(this, 0, true);
-			last = item;
-		}
+		last = item;
 	}
 	if ((mode == singleMode || (mode == symbolMode && !(rootEntry->flags & MENU_ROOT))) &&
 	    rootEntry->sym && rootEntry->prompt) {
-- 
2.25.1

