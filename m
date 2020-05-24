Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161731DFFF0
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 17:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728614AbgEXPnX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 11:43:23 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:19686 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04OFgcUo017561;
        Mon, 25 May 2020 00:42:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04OFgcUo017561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590334961;
        bh=pjza9M8WOQBDiUJV7jfPxvr7RzldsPu+Hk6Gd8IUgSU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uf4crRtdBAjvncgpRcxydLPDhtqz6FrKkXKfsbsbzOjpW0AJ5GrfVkw3/l5VDXcP0
         o4/VbZcxMwBJHUpzsojIfIRvCeiicnhqmN/WApjXXjThWjXxXNflZ89i24FILW5xzo
         V8//ZspMmtS203VJj5rGwgTSiMn/561cXHoR3x0+rCvJde6fPyumQC+++oPknnWAyf
         HOSlOf0mw+PFsGEHD1NlC4aWpIa5+oZCudqtVUGhIkAavRxVO46QKyy65Q6mmkyuqu
         Inh++ewLCm+az5A9mQ8IWMgPCJXYmwpahbAMC02BLJI19QAsAoMvnraVeD+LViStfv
         77UrqEl7Z89cw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/29] modpost: re-add warning about missing *.mod file
Date:   Mon, 25 May 2020 00:42:11 +0900
Message-Id: <20200524154235.380482-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts 4be40e22233c ("kbuild: do not emit src version warning for
non-modules").

I do not fully understand what that commit addressed, but commit
91341d4b2c19 ("kbuild: introduce new option to enhance section mismatch
analysis") introduced partial section checks by using modpost. built-in.o
was parsed by modpost. Even modules had a problem because *.mod files
were created after the modpost check.

Commit b7dca6dd1e59 ("kbuild: create *.mod with full directory path and
remove MODVERDIR") stopped doing that. Now that modpost is only invoked
after the directory descend, *.mod files should always exist at the
modpost stage. If not, something went wrong, which should be warned.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/mod/sumversion.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index f9aa532d93cf..f9df0b1863f1 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -402,9 +402,11 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen)
 		 (int)strlen(modname) - 1, modname);
 
 	buf = read_text_file(filelist);
-	if (!buf)
-		/* not a module or .mod file missing - ignore */
+	if (!buf) {
+		warn("failed to open %s. cannot calculate checksum\n",
+		     filelist);
 		return;
+	}
 
 	pos = buf;
 	firstline = get_line(&pos);
-- 
2.25.1

