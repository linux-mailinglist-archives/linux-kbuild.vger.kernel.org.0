Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1192F75CD5
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2019 04:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbfGZCRo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jul 2019 22:17:44 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:25839 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbfGZCRo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 22:17:44 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x6Q2HevN004335;
        Fri, 26 Jul 2019 11:17:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x6Q2HevN004335
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564107460;
        bh=6bHD7bwBuq14HT8OqTr/oNHl219WxknX0kwiJlKXRrI=;
        h=From:To:Cc:Subject:Date:From;
        b=aL3oLq/r/qsmtVGZHEyopbkIFALO7SHEZaBsJS7eAlWAAN22IKWlGbXh15qnA78cx
         S9wqJotyerqLVFT1dWoSXdnzim452eVvvWOIjKID2aqwq9+N9Ssj8Nda83D4ZH/I3r
         xWeN2bO0OLgeTXxUHLTpoVCjkBlNkCS+NMgRyWc6xNECIJ5qik6BNnzrbJlH+nnY9r
         IX+oE1GGIh1yi67NHqc6D7wXeC5zrdwdrQuSnxJPTAEhT3xSVt6o1JdIXro51mkTke
         BvfhqTIeXRjXqXscuNb6yVYS3obkaGlMy7jqnDdnMD7sWgg078ayeoRI7CMFCMDxCU
         M5yTzMP8a6mzw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove unused single-used-m
Date:   Fri, 26 Jul 2019 11:17:38 +0900
Message-Id: <20190726021738.4935-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is unused since commit 9f69a496f100 ("kbuild: split out *.mod out
of {single,multi}-used-m rules").

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.lib | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 5241d0751eb0..41c50f9461e5 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -45,7 +45,6 @@ subdir-ym	:= $(sort $(subdir-y) $(subdir-m))
 multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))), $(m))))
 multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))), $(m))))
 multi-used   := $(multi-used-y) $(multi-used-m)
-single-used-m := $(sort $(filter-out $(multi-used-m),$(obj-m)))
 
 # $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to
 # tell kbuild to descend
@@ -91,7 +90,6 @@ lib-y		:= $(addprefix $(obj)/,$(lib-y))
 subdir-obj-y	:= $(addprefix $(obj)/,$(subdir-obj-y))
 real-obj-y	:= $(addprefix $(obj)/,$(real-obj-y))
 real-obj-m	:= $(addprefix $(obj)/,$(real-obj-m))
-single-used-m	:= $(addprefix $(obj)/,$(single-used-m))
 multi-used-m	:= $(addprefix $(obj)/,$(multi-used-m))
 subdir-ym	:= $(addprefix $(obj)/,$(subdir-ym))
 
-- 
2.17.1

