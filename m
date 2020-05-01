Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E30F1C20DA
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 May 2020 00:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgEAWnL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 May 2020 18:43:11 -0400
Received: from lists.nic.cz ([217.31.204.67]:36504 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbgEAWnK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 May 2020 18:43:10 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id F3014141CB8;
        Sat,  2 May 2020 00:43:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1588372987; bh=4gBO+dSLx/z3/DVoRkJzWZWGD5PdiGdNb8DyDXbUjsU=;
        h=From:To:Date;
        b=HzAYuZhx6OWSuWAa+fDLVoXaVcH/U3Ta5560w6k+ZPnSnI+NiTcLl7RSFVEXCzTeT
         VrcAsGRLIRp8c1IqpZMHL8ANbM7MqZJsW3ryATIhW34hfOnbLjkomZ1JvY0Ts54c3N
         wxjNP+fFISot+huHyENeiPaz4G1AoQ8odDvGF+XY=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-kbuild@vger.kernel.org
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH kbuild RFC] kbuild: fix modpost throwing away module symvers when linking vmlinux.o
Date:   Sat,  2 May 2020 00:43:00 +0200
Message-Id: <20200501224300.1012-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If vmlinux.o is rebuilt after modules, the current modpost code throws
away the information already stored in Module.symvers. This is due to
commit mentioned in the Fixes tag, which introduced this
backward-incompatible change which may break ceratin build systems (such
as that of OpenWRT).

Add code to look if modules.order is present when doing modpost for
vmlinux.o, and if it is, include it in modpost.

The change introduced here is ugly, therefore this is only a RFC patch.
Please comment whether fixing this backward-incompatibility is
acceptable.

Fixes: a721588d9475 ("kbuild: modpost: do not parse unnecessary ...")
Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
---
 scripts/Makefile.modpost | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 952fff485546..d1eb4923e21b 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -60,7 +60,12 @@ MODPOST = scripts/mod/modpost						\
 ifdef MODPOST_VMLINUX
 
 quiet_cmd_modpost = MODPOST vmlinux.o
+ifeq ($(wildcard $(MODORDER)),)
       cmd_modpost = $(MODPOST) vmlinux.o
+else
+MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T -
+      cmd_modpost = sed 's/ko$$/o/' $(MODORDER) | $(MODPOST) vmlinux.o
+endif
 
 __modpost:
 	$(call cmd,modpost)
-- 
2.24.1

