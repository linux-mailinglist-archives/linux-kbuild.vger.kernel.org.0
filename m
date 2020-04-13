Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267C91A68F8
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Apr 2020 17:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728808AbgDMPgE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Apr 2020 11:36:04 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:22932 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728194AbgDMPgE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Apr 2020 11:36:04 -0400
Received: from oscar.flets-west.jp (softbank060142179096.bbtec.net [60.142.179.96]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 03DFZl6i014699;
        Tue, 14 Apr 2020 00:35:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 03DFZl6i014699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1586792148;
        bh=I/IO9cMQMpuzJ0W5BPTg8gDTRyOF5xRFRKZp//cctOg=;
        h=From:To:Cc:Subject:Date:From;
        b=JG8bOQ0Us8rszC44gpthN3SCLP8FYSYtgIhPI8n8r7mP6OV+a6gUf85MExMAgXhOh
         KroUXPzbw+3CDGRIiiXRDbP5+bxdGk7Prz+LSaHXBWb7RPv2ouzGDam2R70vO5AcUL
         Fx0W8CmZ2pwQXZqLGAbdmnjgyeEa/hFE7L2G9x0ndtYU88ZuzzopN6wBec5Ax5sq1v
         278+C2DFjleS1GgSU9ZVyVVf4tUcF3YgbA+/UFnsIfsBibs4w3IUIrTc8zOSOBonGg
         u3VW9ydy3f5Y5kcxdiv9nUb9iosqCH8OjufdbPXQODYeGyodVohzQZk5S4EwlUQS5W
         rPHG0wecqzU7w==
X-Nifty-SrcIP: [60.142.179.96]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: do not assign a variable in the return statement
Date:   Tue, 14 Apr 2020 00:35:42 +0900
Message-Id: <20200413153542.94064-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I am not a big fan of doing assignment in a return statement.
Split it into two lines.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/menu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index e436ba44c9c5..a5fbd6ccc006 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -65,7 +65,8 @@ void menu_add_entry(struct symbol *sym)
 struct menu *menu_add_menu(void)
 {
 	last_entry_ptr = &current_entry->list;
-	return current_menu = current_entry;
+	current_menu = current_entry;
+	return current_menu;
 }
 
 void menu_end_menu(void)
-- 
2.25.1

