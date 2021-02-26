Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A951325D9C
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Feb 2021 07:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhBZGh6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Feb 2021 01:37:58 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:34904 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbhBZGh6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Feb 2021 01:37:58 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 11Q6aLlf015692;
        Fri, 26 Feb 2021 15:36:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 11Q6aLlf015692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614321382;
        bh=3EyAn1oBogvw+4z1UfD+liYPR0MvrLj+uuVZw+YxBuc=;
        h=From:To:Cc:Subject:Date:From;
        b=RX4V98Ps/dlExxulJAZBZvX/sBANN4XTJqJV8OVo/P7z6gp3m+apsAo1ETq4H7XeN
         tHD6T0gi3nIfIro0/mA6R7oSZq0rINNJe/xlxlu83AUf7Xnv/SKAiCcOKgsSYvuXyk
         ocX+meoYZaBKU6jkUSP46xOOJfYK67Ojuc9DjmSDsUx2t1hMNl7YQJZyIIq3fNw+I3
         T4EuOEmCzXb1Jol3swuVsTv1KTaP0GgxtN7keQTX27VpeoZbIXvqStj6TsZ2fmH87E
         yxM+Px5mbb7Oh0pe6LlQ1zecmESdUK6TaoHd5YhFhPIK2+4sVfnVjQEO7Rxfp0XCEW
         qIRIlWBGzz8Ng==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Matthias Maennich <maennich@google.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Quentin Perret <qperret@google.com>
Subject: [PATCH] kbuild: do not include include/config/auto.conf from adjust_autoksyms.sh
Date:   Fri, 26 Feb 2021 15:36:15 +0900
Message-Id: <20210226063615.3335021-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit cd195bc4775a ("kbuild: split adjust_autoksyms.sh in two parts")
split out the code that needs include/config/auto.conf.

This script no longer needs to include include/config/auto.conf.

Fixes: cd195bc4775a ("kbuild: split adjust_autoksyms.sh in two parts")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/adjust_autoksyms.sh | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index 2b366d945ccb..d8f6f9c63043 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -34,9 +34,6 @@ case "$KBUILD_VERBOSE" in
 	;;
 esac
 
-# We need access to CONFIG_ symbols
-. include/config/auto.conf
-
 # Generate a new symbol list file
 $CONFIG_SHELL $srctree/scripts/gen_autoksyms.sh "$new_ksyms_file"
 
-- 
2.27.0

