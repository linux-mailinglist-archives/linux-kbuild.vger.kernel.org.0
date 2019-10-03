Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C445AC995A
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2019 09:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728199AbfJCH7Q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Oct 2019 03:59:16 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:59231 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728102AbfJCH7Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 03:59:16 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x937wTkX007720;
        Thu, 3 Oct 2019 16:58:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x937wTkX007720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570089514;
        bh=wNrxE/R+8BhtQOYFz0ZDJvyWIepl6P4okkyZb4m/C9k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jy193E1EhUdZpsYspNUk778eRK2ZGfe0ME/1rRNgBRezcpO6k88unUAKpy7f1GY7i
         GofB+lD9HSnLmCQqPbH+DSTWMl6v/f/p40yUxZCy9JcTpvQYUaojPr79q+0mzpnFlH
         UTzuaUtsmoiNLXt3SdW39VfHe5s4EbG+XxYALWvSsj07/GIuxq9/mSqaqtkCK96JRX
         0M2qJH0kQyi46sU7ckLgvfjN482vKdWx6z/cDl9CnshicUug6PIlz/vt/f9g0uroyd
         d5OT0nZXC3nyXygQZPvhYRdUAvT3EAV/oRODmR0+Rr2vn9wHwe0ugZHgz3coWA0J0x
         lE4hmOcVz6PqA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Matthias Maennich <maennich@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shaun Ruffell <sruffell@sruffell.net>,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] nsdeps: fix hashbang of scripts/nsdeps
Date:   Thu,  3 Oct 2019 16:58:25 +0900
Message-Id: <20191003075826.7478-6-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003075826.7478-1-yamada.masahiro@socionext.com>
References: <20191003075826.7478-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This script does not use bash-extension. I am guessing this hashbang
was copied from scripts/coccicheck, which really uses bash-extension.

/bin/sh is enough for this script.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Matthias Maennich <maennich@google.com>
---

Changes in v2: None

 scripts/nsdeps | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/nsdeps b/scripts/nsdeps
index ac2b6031dd13..964b7fb8c546 100644
--- a/scripts/nsdeps
+++ b/scripts/nsdeps
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 # Linux kernel symbol namespace import generator
 #
-- 
2.17.1

