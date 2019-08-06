Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72C7A82BCB
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2019 08:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731752AbfHFGkW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Aug 2019 02:40:22 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:39569 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731560AbfHFGkW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 02:40:22 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x766dO7o002982;
        Tue, 6 Aug 2019 15:39:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x766dO7o002982
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565073566;
        bh=JlCMJ6teUrNcdw5nNAsjPH8LD60KsqUoMPPEo50W3xc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o38ZfvGh/J6sdmxHNVHbtsTBc2XwPxzojhdjO4Tpd5Jc6Kzy3Zyr1LlhLCxVY+2f9
         uk76CsF2MDxirJh84AVmMmt6NOth+0HBQPu5zFCIvUBB9oIDLxBAVuAbmyjDh7EzI1
         3DsBEU6VC8lh+rnT/JTp0odTWLocGhmPr6h+S4phlAxrKXp32wW51UWyJkZMsKfTUE
         IlFNSH6XyHBqMuOWmUMKRl7IVl3vH4lNHWSeNApCXuk5fda/N4ooUM9ZJ7jVazWlVq
         JHln5DDcHshnn+BrPkCbnohTiM/CkKCA1sdMz+B2qsu7/29jB2Ov327e/YC8obEZ3K
         JOX12HqWukreA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Jani Nikula <jani.nikula@intel.com>,
        intel-gfx@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] kbuild: treat an object as multi-used when $(foo-) is set
Date:   Tue,  6 Aug 2019 15:39:19 +0900
Message-Id: <20190806063923.1266-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806063923.1266-1-yamada.masahiro@socionext.com>
References: <20190806063923.1266-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, Kbuild treats an object as multi-used when any of
$(foo-objs), $(foo-y), $(foo-m) is set. It makes more sense to
check $(foo-) as well.

In the context of foo-$(CONFIG_FOO_FEATURE1), CONFIG_FOO_FEATURE1
could be unset.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.lib | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 41c50f9461e5..0a540599823e 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -41,9 +41,9 @@ obj-m		:= $(filter-out %/, $(obj-m))
 # Subdirectories we need to descend into
 subdir-ym	:= $(sort $(subdir-y) $(subdir-m))
 
-# if $(foo-objs), $(foo-y), or $(foo-m) exists, foo.o is a composite object
-multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))), $(m))))
-multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))), $(m))))
+# If $(foo-objs), $(foo-y), $(foo-m), or $(foo-) exists, foo.o is a composite object
+multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-))), $(m))))
+multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)) $($(m:.o=-))), $(m))))
 multi-used   := $(multi-used-y) $(multi-used-m)
 
 # $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to
@@ -52,8 +52,8 @@ subdir-obj-y := $(filter %/built-in.a, $(obj-y))
 
 # Replace multi-part objects by their individual parts,
 # including built-in.a from subdirectories
-real-obj-y := $(foreach m, $(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m)))
-real-obj-m := $(foreach m, $(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))),$($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)),$(m)))
+real-obj-y := $(foreach m, $(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m)))
+real-obj-m := $(foreach m, $(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)),$(m)))
 
 # DTB
 # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
-- 
2.17.1

