Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE031B5621
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2020 09:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbgDWHlg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Apr 2020 03:41:36 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:31862 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726919AbgDWHkf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 03:40:35 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 03N7dV9N000368;
        Thu, 23 Apr 2020 16:39:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 03N7dV9N000368
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587627574;
        bh=LAmTf3avyguNhJLnR/j7TVLMdgz9CQZK990PrBeMhx4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MSs+1vgXqBRAkGhPA8eINQND3Yn3h3DtPWIMZsni9ragUGcGyzFInzKyQzOgPwj++
         t/6Zn74uvLNxz0xoKXv9ZLiRXjPGrpwwJhlHI5R370DTaF/8peZy7BlJt488ShbDKJ
         2iGcIVC943qxlVMRtCZJZX8d2u9Y400/LFJDuj6riX+Pgepq5jThP/0jS+LvL/htcS
         3rBViAksHx4UOAcJhURudlp2ncwDiysmcG6lWfX1ZxPHfU0j88pgC5JZ0hVjpqnIYw
         VsARbonJsLwaja8ArPmH08KXCpu8OiiI0zZyIg1PzYPZGUW6NBioyaVqT3B/Gl/4WX
         wcJns61R/pDpw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     bpf@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/16] Revert "objtool: Skip samples subdirectory"
Date:   Thu, 23 Apr 2020 16:39:15 +0900
Message-Id: <20200423073929.127521-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200423073929.127521-1-masahiroy@kernel.org>
References: <20200423073929.127521-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts commit 8728497895794d1f207a836e02dae762ad175d56.

This directory contains no object.

Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 samples/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/samples/Makefile b/samples/Makefile
index f8f847b4f61f..5ce50ef0f2b2 100644
--- a/samples/Makefile
+++ b/samples/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Linux samples code
-OBJECT_FILES_NON_STANDARD := y
 
 obj-$(CONFIG_SAMPLE_ANDROID_BINDERFS)	+= binderfs/
 obj-$(CONFIG_SAMPLE_CONFIGFS)		+= configfs/
-- 
2.25.1

