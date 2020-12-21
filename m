Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4ABD2DF968
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Dec 2020 08:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgLUHFH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Dec 2020 02:05:07 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:57593 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbgLUHFH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Dec 2020 02:05:07 -0500
Received: from grover.flets-west.jp (softbank126090214151.bbtec.net [126.90.214.151]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0BL73QIa003747;
        Mon, 21 Dec 2020 16:03:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0BL73QIa003747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608534206;
        bh=fEEvXp8Wcc12ooWYzUUnc13htwwx9AT0UT0HbIHCBzQ=;
        h=From:To:Cc:Subject:Date:From;
        b=IYzBOxavJ2CmtVwTtfVqgrnWwhFiE/PfhO/dvluFfWvfeOlrgkJEzO1wrEbynP6+E
         ZWEpLV+5js7DASI46CA+vpa4SlLX0G3v0AYcmlF8h9onA51cF/KX+tPjcs4on7lgA8
         ChDxP5c0cIVcQxst28E7/MI8esGZ9zKUXvIG/r+/M7s6o5XiwTpH8SEu2Pg/LeIvK9
         lUrBrWo2UWJ0R09XF0tdCZ5ugcfXVKlwWp7YlgSluYAaWCoclyU3gSLJryNSPaw6cw
         jhVhaibs/aEyJwAmQKKBRI8qONBTr8v7xr2iCQtZfApEjqkbIRgEJi+dpjntVEYZ34
         m9PrOXVRplftQ==
X-Nifty-SrcIP: [126.90.214.151]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: doc: fix $(fileno) to $(filename)
Date:   Mon, 21 Dec 2020 16:03:24 +0900
Message-Id: <20201221070324.269334-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is a typo.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kconfig-macro-language.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/kconfig-macro-language.rst b/Documentation/kbuild/kconfig-macro-language.rst
index 8b413ef9603d..6163467f6ae4 100644
--- a/Documentation/kbuild/kconfig-macro-language.rst
+++ b/Documentation/kbuild/kconfig-macro-language.rst
@@ -97,7 +97,7 @@ Like Make, Kconfig provides several built-in functions. Every function takes a
 particular number of arguments.
 
 In Make, every built-in function takes at least one argument. Kconfig allows
-zero argument for built-in functions, such as $(fileno), $(lineno). You could
+zero argument for built-in functions, such as $(filename), $(lineno). You could
 consider those as "built-in variable", but it is just a matter of how we call
 it after all. Let's say "built-in function" here to refer to natively supported
 functionality.
-- 
2.27.0

