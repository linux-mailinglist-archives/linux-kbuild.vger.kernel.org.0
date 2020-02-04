Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEB681514DC
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2020 05:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgBDEJI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Feb 2020 23:09:08 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:51114 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbgBDEJH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Feb 2020 23:09:07 -0500
Received: from fsav102.sakura.ne.jp (fsav102.sakura.ne.jp [27.133.134.229])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 01448i66013873;
        Tue, 4 Feb 2020 13:08:45 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav102.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav102.sakura.ne.jp);
 Tue, 04 Feb 2020 13:08:44 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav102.sakura.ne.jp)
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 01448ibp013869;
        Tue, 4 Feb 2020 13:08:44 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: (from i-love@localhost)
        by www262.sakura.ne.jp (8.15.2/8.15.2/Submit) id 01448ioc013868;
        Tue, 4 Feb 2020 13:08:44 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Message-Id: <202002040408.01448ioc013868@www262.sakura.ne.jp>
X-Authentication-Warning: www262.sakura.ne.jp: i-love set sender to penguin-kernel@i-love.sakura.ne.jp using -f
Subject: [PATCH] kconfig: Invalidate all symbols after changing to y or m.
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
MIME-Version: 1.0
Date:   Tue, 04 Feb 2020 13:08:44 +0900
References: <ced8ab1c-9c35-c7b0-6b9e-bcee7ffdf469@i-love.sakura.ne.jp> <CAK7LNATNY1oP5XgFH3+fuUU=Z7pEz7Sqz0vKCzvhM4Kem7RkOg@mail.gmail.com>
In-Reply-To: <CAK7LNATNY1oP5XgFH3+fuUU=Z7pEz7Sqz0vKCzvhM4Kem7RkOg@mail.gmail.com>
Content-Type: text/plain; charset="ISO-2022-JP"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit 89b9060987d98833 ("kconfig: Add yes2modconfig and
mod2yesconfig targets.") forgot to clear SYMBOL_VALID bit after
changing to y or m, these targets did not save the changes.
Call sym_clear_all_valid() so that all symbols are revalidated.

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 scripts/kconfig/confdata.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 11f6c72c2eee..aa70360f27c1 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -1331,9 +1331,8 @@ void conf_rewrite_mod_or_yes(enum conf_def_mode mode)
 
 	for_all_symbols(i, sym) {
 		if (sym_get_type(sym) == S_TRISTATE &&
-		    sym->def[S_DEF_USER].tri == old_val) {
+		    sym->def[S_DEF_USER].tri == old_val)
 			sym->def[S_DEF_USER].tri = new_val;
-			sym_add_change_count(1);
-		}
 	}
+	sym_clear_all_valid();
 }
-- 
2.11.0

