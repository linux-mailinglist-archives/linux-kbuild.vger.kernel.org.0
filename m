Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39AA914F681
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Feb 2020 06:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbgBAFD0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 Feb 2020 00:03:26 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:36221 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgBAFD0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Feb 2020 00:03:26 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 01153HoH028636;
        Sat, 1 Feb 2020 14:03:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 01153HoH028636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1580533398;
        bh=qGUUVshMVh9d1llaEZryqE3FluaegiUy9Od5z/IhnL4=;
        h=From:To:Cc:Subject:Date:From;
        b=aIxQlS8NkZK/eDJ8r+51JbbsN61DKvOdyxHuREHLkRCpur/f8BPyoDLHwk7+g5o61
         OXVvITf97ap00+wb895boFxg2ALvOP3DeElyGP1OWecAJaU8RDu7Voo+49te+eyRCc
         AZPlJoqB1WMSqieAV0jzNa9rk0j7+3goRmbABAS38KvbJZd2I+E382tTqmBYFl3phE
         53ndntcI6Gtmglji5bsiqHSs4/36bHDFdrwEzjqPcaKcxbY2gYSNeRNoWRw5rvZZ8D
         smc7b+5KOVIuBqFhQsFM99QhibBcNvb5HetmqRJ6bJHW9iBjOR3Kwll4PfcJjpSZe/
         Xu26US/iIppUA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: fix broken dependency in randconfig-generated .config
Date:   Sat,  1 Feb 2020 14:03:11 +0900
Message-Id: <20200201050311.3458-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Running randconfig on arm64 using KCONFIG_SEED=0x40C5E904 (e.g. on v5.5)
produces the .config with CONFIG_EFI=y and CONFIG_CPU_BIG_ENDIAN=y,
which does not meet the !CONFIG_CPU_BIG_ENDIAN dependency.

This is because the user choice for CONFIG_CPU_LITTLE_ENDIAN vs
CONFIG_CPU_BIG_ENDIAN is set by randomize_choice_values() after the
value of CONFIG_EFI is calculated.

When this happens, the has_changed flag should be set.

Currently, it takes the result from the last iteration. It should
accumulate all the results of the loop.

Reported-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 99f2418baa6c..eb1efa3abdee 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -1353,7 +1353,7 @@ bool conf_set_all_new_symbols(enum conf_def_mode mode)
 
 		sym_calc_value(csym);
 		if (mode == def_random)
-			has_changed = randomize_choice_values(csym);
+			has_changed |= randomize_choice_values(csym);
 		else {
 			set_all_choice_values(csym);
 			has_changed = true;
-- 
2.17.1

