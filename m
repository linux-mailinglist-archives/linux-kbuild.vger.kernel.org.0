Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEF1F1A205
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2019 18:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbfEJQ4S (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 May 2019 12:56:18 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:55003 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbfEJQ4S (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 12:56:18 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x4AGu96I012443;
        Sat, 11 May 2019 01:56:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x4AGu96I012443
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557507369;
        bh=vV6AZLFWCpm5ofhYbSPY345ZhBfp1+z8iHNyDEEWI+M=;
        h=From:To:Cc:Subject:Date:From;
        b=P/BIaBimtCs7VjFAcmU0akw0CAvgVKPYU3j3/Q/qGjJtqNN6lOj3FW6uasKpsI7Ta
         lokvICLw6gZXjPIXF6tP7pCf5Juwl5n+3JZh6PpTjjc4Sta1oyrmD682igq6Da6Xyo
         X0kmrcg2cQ71sp4EZB8pA6SzgEurGvPOTuM2lFIRwrtk9rYlReFqkcPLBhA1QM2jTk
         gxEVHRmfboWs/r+iORKk9nxnpkXEy2WbJu/tvepUVvphcK7bQVO3vcIAX0cBnVLdIh
         izwAt5sBCV3RECayN8xjm5TFEz6qysSv5NipN72xnHnCklPM6cv4bQ4uKLc+tqeTLk
         2wqT++JW2U0Bg==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: make parent directories for the saved .config as needed
Date:   Sat, 11 May 2019 01:56:01 +0900
Message-Id: <1557507361-7418-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With menuconfig / nconfig, users can input any file path from the
"Save" menu, but it fails if the parent directory does not exist.

Why not create the parent directory automatically. I think this is
a user-friendly behavior.

I changed the error messages in menuconfig / nconfig.

"Nonexistent directory" is no longer the most likely reason of the
failure. Perhaps, the user specified the existing directory, or
attempted to write to the location without write permission.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/confdata.c | 3 +++
 scripts/kconfig/mconf.c    | 2 +-
 scripts/kconfig/nconf.c    | 3 +--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 431b805..b7bdd96 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -881,6 +881,9 @@ int conf_write(const char *name)
 		return -1;
 	}
 
+	if (make_parent_dir(name))
+		return -1;
+
 	env = getenv("KCONFIG_OVERWRITECONFIG");
 	if (env && *env) {
 		*tmpname = 0;
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 5f8c82a..694091f 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -936,7 +936,7 @@ static void conf_save(void)
 				set_config_filename(dialog_input_result);
 				return;
 			}
-			show_textbox(NULL, "Can't create file!  Probably a nonexistent directory.", 5, 60);
+			show_textbox(NULL, "Can't create file!", 5, 60);
 			break;
 		case 1:
 			show_helptext("Save Alternate Configuration", save_config_help);
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index ac92c0d..cbafe3b 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -1438,8 +1438,7 @@ static void conf_save(void)
 				set_config_filename(dialog_input_result);
 				return;
 			}
-			btn_dialog(main_window, "Can't create file! "
-				"Probably a nonexistent directory.",
+			btn_dialog(main_window, "Can't create file!",
 				1, "<OK>");
 			break;
 		case 1:
-- 
2.7.4

