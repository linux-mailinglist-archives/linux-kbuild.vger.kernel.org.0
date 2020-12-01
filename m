Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08EA52CA397
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 14:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390840AbgLANTL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 08:19:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387931AbgLANTJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 08:19:09 -0500
Received: from nautica.notk.org (ipv6.notk.org [IPv6:2001:41d0:1:7a93::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A9C2C0613D6
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Dec 2020 05:18:29 -0800 (PST)
Received: by nautica.notk.org (Postfix, from userid 1001)
        id 4F544C009; Tue,  1 Dec 2020 14:17:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
        t=1606828665; bh=fITzHpExu91uhcfVWcxzP50E4edwLr25ewFvtJBm5bs=;
        h=From:To:Cc:Subject:Date:From;
        b=eQMgz0nD+YSPrNTzOhZUBln+D3DKkxBAgKAjxVxQwHLxnzzX+D2Un8qnzCf9bnZIr
         L6g1ri4KLrRQ5UF1Uuu+aJscTINWWSpNVGHyn+GpXv2g9VtJkLzZwKN1e78e4Mj7lI
         8JR9vqdJGB7dPnG4oz+3tAoCUkCwoRzqqmwPMf8h1OZcWYwCKwEPGIgai1hxgDgoy0
         0V1FqT9+9CVKwTg4hTffVjcnezTeb3ZO5pWpiv7Sc8Hgwg1I2y67+Vd0a3vHMU1oel
         8Qij1U/0dUcjvYhZLWdcYy+tgFt1mm1EupzLyrA1/YyPFYMCo4fKRtWOH2W+mwh/qJ
         T3MkEAz6XpJbw==
From:   Dominique Martinet <asmadeus@codewreck.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dominique Martinet <asmadeus@codewreck.org>
Subject: [PATCH 1/2] ld-version: use /usr/bin/env awk for shebank
Date:   Tue,  1 Dec 2020 14:17:29 +0100
Message-Id: <1606828650-29841-1-git-send-email-asmadeus@codewreck.org>
X-Mailer: git-send-email 1.7.10.4
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

/usr/bin/awk is not garanteed to exist (and doesn't on e.g. nixos),
using /usr/bin/env to have it look in PATH is more robust

Signed-off-by: Dominique Martinet <asmadeus@codewreck.org>
---
I've been carrying these two patchs for local kernel development on
nixos for a while, I don't think it'd break anything for anyone so
might as well submit these -- please consider it :)

 scripts/ld-version.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
index f2be0ff9a738..05476b8f8925 100755
--- a/scripts/ld-version.sh
+++ b/scripts/ld-version.sh
@@ -1,4 +1,4 @@
-#!/usr/bin/awk -f
+#!/usr/bin/env -S awk -f
 # SPDX-License-Identifier: GPL-2.0
 # extract linker version number from stdin and turn into single number
 	{
-- 
2.28.0

