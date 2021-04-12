Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFA735B7E9
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Apr 2021 03:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236199AbhDLBNO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 11 Apr 2021 21:13:14 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:54770 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236080AbhDLBNO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Apr 2021 21:13:14 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 13C1CVI9003364;
        Mon, 12 Apr 2021 10:12:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 13C1CVI9003364
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618189952;
        bh=MHbukYU/Mw/dGTyf52YaPn0f/afm9xLukFnJUGqtVP4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OZqZQanWqafs3vj3jJwdn2u0efq+tz2LzWqxCWbn6fvhdD19wjv4P71kJHlyFp3nP
         5XSF9AYoHVGMPz+cnahzoc1t6HK5joCGAOOra/EIqML4BIut4pYRzC3Vv63cqYZ2OB
         9B1U3jsoB0LJFA0g4JXeQki4v5dNEt4v2LGzwlqJXA+qrUQMAjsgoSA/DL5b6mKOnQ
         UqNb2v4tGjXskT1pQNz9jKup+0nCO0M4v+Zhec9hlsWkhRj3tj3nttOqoRd8Mmoxzv
         H85aYN3cFvz0kkyMDaDt5aWetAJ70RrE5x7VnNFo3zJH89tYOBNhjdjQffLOv6NR21
         UOONerFgYsEtw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] kconfig: nconf: remove meaningless wattrset() call from show_menu()
Date:   Mon, 12 Apr 2021 10:12:26 +0900
Message-Id: <20210412011227.249534-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210412011227.249534-1-masahiroy@kernel.org>
References: <20210412011227.249534-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This attribute is not used because it will be overridden some lines
below:

  wattrset(main_window, attr_main_menu_box);

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/nconf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index d8a6ab5fb521..5209a18eeacb 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -953,7 +953,6 @@ static void show_menu(const char *prompt, const char *instructions,
 	current_instructions = instructions;
 
 	clear();
-	wattrset(main_window, attr_normal);
 	print_in_middle(stdscr, 1, 0, getmaxx(stdscr),
 			menu_backtitle,
 			attr_main_heading);
-- 
2.27.0

