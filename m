Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B033139DE4D
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jun 2021 16:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhFGOEo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Jun 2021 10:04:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:33288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230200AbhFGOEo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Jun 2021 10:04:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD8086109F;
        Mon,  7 Jun 2021 14:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623074573;
        bh=aserT3q6jOf57au2hItknEiG7cSh5lnmlXSxZfbqDjc=;
        h=From:To:Cc:Subject:Date:From;
        b=C2fP2pxJipZzf+Hjy327afYMWqdKrPO18x3S02BtVA5hQAVPW092HUTLWsjDHdQd3
         nkuncZEUjslbjLqcqTTRyUnUS/fPfsai+5idp3yGpgPsPOiMeR3ncWDBkndx/cnUX+
         7pIz1pGi/PooYxF5l8deHb6c3G+RhEhu5ZxkhTVTl3/rpCdNHya8/k3cpBaPKN8IWQ
         tmPCHvLjrExAhMf0z39OvRA7EcLH4UiWzeMIe6y+0aYoH3W9XG0DRL/I/xEUbCmaJb
         4lvY0xQSxUmX4m1AKtH/CdquPLlNMa2Rn5Y3vBtAlGMWLaDGtq3X6eV29BuP+pKsYl
         F1XtlMNs1Crjw==
From:   Mark Brown <broonie@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] kbuild: modpost: Explicitly warn about unprototyped symbols
Date:   Mon,  7 Jun 2021 15:02:06 +0100
Message-Id: <20210607140206.38131-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596; h=from:subject; bh=aserT3q6jOf57au2hItknEiG7cSh5lnmlXSxZfbqDjc=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBgvibRPmVHI7SQlUyeFcr/tc/rTe0sU5rnWB/wQteb fzpUTJmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYL4m0QAKCRAk1otyXVSH0EPCB/ 406pSaJOnUQOqTA2jvEEEVW+O/FLuDgSMjb5iJufEdZxn3ZR7Nm/fDe1ayDURiKZn9mLAOLLCJ/bz5 aimkZZK+U9X2tFu95kcbxKbRlGkU1TkHBja0d+QpTOPiOgssnUOMTQXEV9iC5MT+3g2GCttA1RPrIZ WJJsuqLgutvww1jee10dITzBeHqW764q85gajVB3pOK+HnUVa9+DQtjMjnSEw81mPtzr9LRhh9b/oG DiVZB+yJuxqUNEe8dqa4R7EDb+tbVNDd4PxQ9zoOBUYogTMac8X/sXtOCkQSCMyjV85DqxURR/jwY6 lobDxw+1WZVV6PvvG7yq1kpadatDSN
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

One common cause of modpost version generation failures is a failure to
prototype exported assembly functions - the tooling requires this for
exported functions even if they are not and should not be called from C
code in order to do the version mangling for symbols. Unfortunately the
error message is currently rather abstruse, simply saying that "version
generation failed" and even diving into the code doesn't directly show
what's going on since there's several steps between the problem and it
being observed.

Provide an explicit hint as to the likely cause of a version generation
failure to help anyone who runs into this in future more readily diagnose
and fix the problem.

Signed-off-by: Mark Brown <broonie@kernel.org>
---

v2:
 - Reword and reformat error message.
 - Fix duplicated is.

 scripts/mod/modpost.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 3e623ccc020b..270a7df898e2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -660,8 +660,11 @@ static void handle_modversion(const struct module *mod,
 	unsigned int crc;
 
 	if (sym->st_shndx == SHN_UNDEF) {
-		warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n",
-		     symname, mod->name, mod->is_vmlinux ? "" : ".ko");
+		warn("EXPORT symbol \"%s\" [%s%s] version ...\n"
+		     "Is \"%s\" prototyped in <asm/asm-prototypes.h>?\n",
+		     symname, mod->name, mod->is_vmlinux ? "" : ".ko",
+		     symname);
+
 		return;
 	}
 
-- 
2.20.1

