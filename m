Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 331F3608E8
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jul 2019 17:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbfGEPOu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Jul 2019 11:14:50 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:45679 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727326AbfGEPOu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Jul 2019 11:14:50 -0400
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x65FEYog003506;
        Sat, 6 Jul 2019 00:14:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x65FEYog003506
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562339676;
        bh=TLZp6iyBNM3/w4lOLTuX+yiGDhFcOXm7Hmg3zSZQpk4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OtnOwgUYJo9CUGi6k7HB+N9s2s1/CvRxNZMLAP2+o3n7nWrOu+Zn7muQG3Teq4zfK
         ADZ9cKRY1dG1ab5VZWR9oL4bBO23y28pe0jGeiT9qQ7j9X5SyLmCeEyVLHT3+1kG41
         9SV7y2B2ctOl8KuhnedRk0c3sHQTI9CoEgGL7OHhNPTHdu8K6hNA3drmtQFINL6d7O
         Dl4qaNXOabOXFRfhCxvWj2dvWMVfEcy8wYO1dfS4zS1JstpTx8FoV6woR1EFJnAjHG
         9D//mAhoBsF592n/8wrEosTsGruqSecBq+gW9df6yDACgwNhLE1m0OYUSZOO9gX8mi
         kpDzR+MuagwCQ==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] scripts/tags.sh: remove unused environment variables from comments
Date:   Sat,  6 Jul 2019 00:14:31 +0900
Message-Id: <20190705151431.29122-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190705151431.29122-1-yamada.masahiro@socionext.com>
References: <20190705151431.29122-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This script has no reference to ${ARCH}, ${src}, ${obj}.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/tags.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index f56edeb08739..684db72a8386 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -6,7 +6,7 @@
 # mode may be any of: tags, TAGS, cscope
 #
 # Uses the following environment variables:
-# ARCH, SUBARCH, SRCARCH, srctree, src, obj
+# SUBARCH, SRCARCH, srctree
 
 if [ "$KBUILD_VERBOSE" = "1" ]; then
 	set -x
@@ -35,7 +35,7 @@ elif [ "${ALLSOURCE_ARCHS}" = "all" ]; then
 	ALLSOURCE_ARCHS=$(find ${tree}arch/ -mindepth 1 -maxdepth 1 -type d -printf '%f ')
 fi
 
-# find sources in arch/$ARCH
+# find sources in arch/$1
 find_arch_sources()
 {
 	for i in $archincludedir; do
-- 
2.17.1

