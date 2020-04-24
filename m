Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9481B6D7A
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Apr 2020 07:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgDXFuG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Apr 2020 01:50:06 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:58088 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgDXFuG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Apr 2020 01:50:06 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 03O5nYpa003914;
        Fri, 24 Apr 2020 14:49:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 03O5nYpa003914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587707375;
        bh=ly7ncAkOwNhudqWgq4kpvUp1J/j0jCzsqD3ZoL348ns=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SAvHAcEstDx8bpN+Crcf489pPo97faJQ/15vfJgbqdy4sD/kSRUDdpy8/IaijAsfc
         H8T8Vx/RXKduOrVKCoVFDCJQLZlfNKbt7VkTAxkCYcaUl2GKZt/DC1kVjMEiNZI3ce
         6IuE6caDUrnuAglFmYAKhkeJ/m+CiF1xxDqz5dPfocHbsn9Ebl1cPYdzJPTLz2Zf1L
         XDNDjwnvHQ9gYeqq4h0waUu7jkAUhHeRHc4NUZ75XhMNGMYTD0Akz3aUgIkAfaKvtk
         UsF97tEJuRRnAJOBcNW1tY93jZyECpeJsB32jXLtszTOa71aX+vN9P+6jsBol5nfgQ
         H5I/dgCZUAhDQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ulf Magnusson <ulfalizer@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kconfig: allow only 'config', 'comment', and 'if' statements inside choice
Date:   Fri, 24 Apr 2020 14:49:29 +0900
Message-Id: <20200424054929.502485-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200424054929.502485-1-masahiroy@kernel.org>
References: <20200424054929.502485-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The statement block surrounded by 'if' ... 'endif' is reduced into
if_stmt, which is accepted in the choice context. Therefore, you can
do anything within a choice block by wrapping 'if y' ... 'end'.

For example, you can create a menu inside a choice.

[Test Code]

---------------->8----------------
  choice
          prompt "choice"

  config A
          bool "A"

  config B
          bool "B"

  if y

  menu "strange menu"

  config C
          bool "C"

  endmenu

  endif

  endchoice
---------------->8----------------

I want to make such a weird structure a syntax error.

In fact, the USB gadget Kconfig file used nested choice for no good
reason until commit df8df5e4bc37 ("usb: get rid of 'choice' for
legacy gadget drivers") killed it.

I think the 'source' statement inside choice is on the fence. It is
at least gramatically sensible as long as the included file contains
only bool/tristate config statements. However, it makes the code
unreadable, and in the end, people forget the fact that the file is
included from the choice block. Commit 10e5e6c24963 ("usb: gadget: move
choice ... endchoice to legacy/Kconfig") got rid of the only user.

Going forward, you can only use 'config', 'comment', and 'if' inside
choice blocks. This also recursively applies to 'if' blocks inside
choice blocks.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/parser.y | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 708b6c4b13ca..190f1117f35a 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -119,20 +119,24 @@ mainmenu_stmt: T_MAINMENU T_WORD_QUOTE T_EOL
 
 stmt_list:
 	  /* empty */
-	| stmt_list common_stmt
+	| stmt_list assignment_stmt
 	| stmt_list choice_stmt
+	| stmt_list comment_stmt
+	| stmt_list config_stmt
+	| stmt_list if_stmt
 	| stmt_list menu_stmt
+	| stmt_list menuconfig_stmt
+	| stmt_list source_stmt
 	| stmt_list T_WORD error T_EOL	{ zconf_error("unknown statement \"%s\"", $2); }
 	| stmt_list error T_EOL		{ zconf_error("invalid statement"); }
 ;
 
-common_stmt:
-	  if_stmt
-	| comment_stmt
-	| config_stmt
-	| menuconfig_stmt
-	| source_stmt
-	| assignment_stmt
+stmt_list_in_choice:
+	  /* empty */
+	| stmt_list_in_choice comment_stmt
+	| stmt_list_in_choice config_stmt
+	| stmt_list_in_choice if_stmt_in_choice
+	| stmt_list_in_choice error T_EOL	{ zconf_error("invalid statement"); }
 ;
 
 /* config/menuconfig entry */
@@ -254,7 +258,7 @@ choice_end: end
 	}
 };
 
-choice_stmt: choice_entry choice_block choice_end
+choice_stmt: choice_entry stmt_list_in_choice choice_end
 ;
 
 choice_option_list:
@@ -305,11 +309,6 @@ default:
 	| T_DEF_BOOL		{ $$ = S_BOOLEAN; }
 	| T_DEF_TRISTATE	{ $$ = S_TRISTATE; }
 
-choice_block:
-	  /* empty */
-	| choice_block common_stmt
-;
-
 /* if entry */
 
 if_entry: T_IF expr T_EOL
@@ -331,6 +330,9 @@ if_end: end
 if_stmt: if_entry stmt_list if_end
 ;
 
+if_stmt_in_choice: if_entry stmt_list_in_choice if_end
+;
+
 /* menu entry */
 
 menu: T_MENU T_WORD_QUOTE T_EOL
-- 
2.25.1

