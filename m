Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED3B390CA3
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 May 2021 01:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbhEYXD6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 May 2021 19:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232088AbhEYXD5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 May 2021 19:03:57 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D21FEC06175F
        for <linux-kbuild@vger.kernel.org>; Tue, 25 May 2021 16:02:26 -0700 (PDT)
From:   bage@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1621983744;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G7e0Q+5dF3OHIGid4Aab2rVzbUa2cJN+n3ka6i1AOc4=;
        b=nQy7RrpBPBHjWsVu6pL8dbF5kkJBnH+svtGw+Ncd9Taa3tYxGciMdkJpr4s7WW49HFWWta
        33RkLEzmvBTm4S+gBgN9MmJRszs/lJnwvf4XcE9pOddVWkz18zuFiDZDaL7BDAEamQeOEP
        OxzJARSOYRD95dSjilkVhwca7kTYvSXaukKBgBM3CfU35uf3nkH8lCODEWdtb7HoiE++wi
        AMHfVrVn/fHU3jOT4yXNPDDpbtcTpBNaJ7LUnp8clU6B7GCngu6smLYyo4v2s7sVKki2a/
        /ilHAOQhV4MuUkpuxpPoEcdDuqVgrca/mutCIMRcY3dVKlPCzQG1qt4Rpuallw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1621983744;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G7e0Q+5dF3OHIGid4Aab2rVzbUa2cJN+n3ka6i1AOc4=;
        b=eTVri8UVT5tgwUwBuHPhf13fhjEhseYuaSKmM5EI++UoIh3gfQAtpj9R3lr5zUaC0qXCxW
        EGCBjrXEK/Rm/NBA==
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Bastian Germann <bage@linutronix.de>, linux-kbuild@vger.kernel.org,
        tglx@linutronix.de
Subject: [PATCH v2 3/5] builddeb: clean generated package content
Date:   Wed, 26 May 2021 01:01:37 +0200
Message-Id: <20210525230139.6165-4-bage@linutronix.de>
In-Reply-To: <20210525230139.6165-1-bage@linutronix.de>
References: <20210525230139.6165-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Bastian Germann <bage@linutronix.de>

For each binary Debian package, a directory with the package name is
created in the debian directory. Correct the generated file matches in the
package's clean target, which were renamed without adjusting the target.

Fixes: 1694e94e4f46 ("builddeb: match temporary directory name to the package name")
Signed-off-by: Bastian Germann <bage@linutronix.de>
---
 scripts/package/mkdebian | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 449e284a449c..9470581d8c75 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -246,7 +246,7 @@ binary-arch: build-arch
 	KBUILD_BUILD_VERSION=${revision} -f \$(srctree)/Makefile intdeb-pkg
 
 clean:
-	rm -rf debian/*tmp debian/files
+	rm -rf debian/files debian/linux-*
 	\$(MAKE) clean
 
 binary: binary-arch
-- 
2.30.2

