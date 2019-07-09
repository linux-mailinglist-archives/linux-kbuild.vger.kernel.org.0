Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 807A26337A
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 11:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfGIJc4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 05:32:56 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:53545 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbfGIJc4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 05:32:56 -0400
Received: from orion.localdomain ([95.118.92.226]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MuVOM-1icC9g2yKA-00rZ1p; Tue, 09 Jul 2019 11:32:42 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        info@metux.net, apw@canonical.com, joe@perches.com,
        linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH 3/4] scripts: checkpatch.pl: don't complain that debian/rules is executable
Date:   Tue,  9 Jul 2019 11:32:38 +0200
Message-Id: <1562664759-16009-3-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1562664759-16009-1-git-send-email-info@metux.net>
References: <1562664759-16009-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:HweSVGl0vn7e7vNXNWQVSJQNHHYL075aDXcvaRyc/GMMITZGxnf
 h0hvJ/FmBbQVefDRdkRV1ZD6FkMCg1tQ/T/ixiBUY86tYRGrvBz2s6pg3UawtxGPHRid8YH
 ygjyVh9KfqadSy6bBbra9p9ubbrcZROj6JI9FmZfpjlWxdniMeI6gD8rdYa4rEOaA4QHogj
 pXzHFAnez9yKSY0DUP5vA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MlHMSL1MI5Y=:vl/4VtvQv1xavzSbwRYzlH
 SIW68cUFN8QVBCRz2tj4iswvcWAkPJi2JWAxG6CXekKIeTaz4LrXsSWAWG8iSTQcps/Ic6NY2
 Jc7ZET1i5v+1kmF2zoUgEWB5MYw7wdLUQ9IkBeuTvRDWisJ8lRCiWOEptiIxIlQlyYjjk6O5m
 Hak2fRf7kaeew7WCqGxWN1LDsuvJJXLffnJHxlVSgGV8REUle4DEqlXUm6Oh2Kqrxx0mzQYUL
 FtWosfwQf0A7rlMJuFZNqkydq3ru+w5qJFu68SbPPc2lKBvIeZtEuywByEXkJWIezmbFjdjlq
 NUPTeGeBJa+tDJNUC6NQIVe5lEZN2UePGHGX8ix6wvivfog4Ci8HteTIKU9J6eISN+w6qWkRa
 /Y9uJzWeJiIP3C8gjpTf+xEaioS9awCunw4zxSKyIxuoKvSzIiyGfHOl0iZydIdS/YSXcMM1x
 iqoV9Xmp+6FVl9j1eeeVLhrF0RtjBknXdlsMoz3cmIB//k6New2j6PcHjF+KDvcWMe2756UDr
 1eJ07HRgJUbL6s0B/olSYOzD2LsZdgGiAurU0pQoWv+k6pWze8/tTMn9or6yFRi/vsdenbCze
 eN2AlOadohaGx5PpxZKK/4QX0l1E+vrmgqZIkIPZjRv9xtYDPCG0vGGrOPbfkLDshD5FnDa8+
 a7YoiBt3iOtaaaeibiRzpO35i9BmeOSkVcMVo2V2GB5GR5Yjmezx0CAdfT3BCrnALqVDcDfdV
 LX53yFrzp56nUtHPzdzcQYqGFwBy7Pg2mba+0A==
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

checkpatch.pl complains when adding executable "debian/rules",
obviously a false alarm. Therefore add an exception for that.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 342c7c7..caf0146 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2587,6 +2587,7 @@ sub process {
 		if ($line =~ /^new (file )?mode.*[7531]\d{0,2}$/) {
 			my $permhere = $here . "FILE: $realfile\n";
 			if ($realfile !~ m@scripts/@ &&
+			    $realfile !~ "debian/rules" &&
 			    $realfile !~ /\.(py|pl|awk|sh)$/) {
 				ERROR("EXECUTE_PERMISSIONS",
 				      "do not set execute permissions for source files\n" . $permhere);
-- 
1.9.1

