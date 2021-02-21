Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02031320BD4
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Feb 2021 17:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhBUQv1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Feb 2021 11:51:27 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:17202 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhBUQv1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Feb 2021 11:51:27 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 11LGoNfN024737;
        Mon, 22 Feb 2021 01:50:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 11LGoNfN024737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613926223;
        bh=pY33eLWh/bpudqvJsFF3NCW/8K3VEeSuVlNc+mus8M4=;
        h=From:To:Cc:Subject:Date:From;
        b=NI55u8Z1qmJRMljT7KPK9IZpauRBTOBBOD8cbey7DVn72uBrb4iHTIL9xyihbB809
         QsasPSlr12mpJh1fs3X0L623Lp8kI2evch9wiOOOVn5NkSEn/bxt15+5934B6HEO/i
         dDzpgz15TFxWruAUDKUcXM9RNql7RO7/z8WiI0Qge6mufBcNfXJFRBuwLLhmhk4Xct
         b25PBZr2JaeRHU4I0NHAqDsmgnTjjw0d1ErMj4O0/Ctt15XkkFziuF7fP7Ju24AK5z
         Xlx7oavhGLbQPakZpOqSQE575/DzAmev1UNWVQCTK3K7trxKinVUtH3BYLYIMMzLyk
         /mRIykopexk1A==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH] kbuild: reuse this-makefile to define abs_srctree
Date:   Mon, 22 Feb 2021 01:50:19 +0900
Message-Id: <20210221165019.293769-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Move this-makefile up, and reuse it to define abs_srctree.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index ade44ac4cc2f..b127881e6bf0 100644
--- a/Makefile
+++ b/Makefile
@@ -145,7 +145,8 @@ else
 need-sub-make := 1
 endif
 
-abs_srctree := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
+this-makefile := $(lastword $(MAKEFILE_LIST))
+abs_srctree := $(realpath $(dir $(this-makefile)))
 
 ifneq ($(words $(subst :, ,$(abs_srctree))), 1)
 $(error source directory cannot contain spaces or colons)
@@ -160,8 +161,6 @@ MAKEFLAGS += --include-dir=$(abs_srctree)
 need-sub-make := 1
 endif
 
-this-makefile := $(lastword $(MAKEFILE_LIST))
-
 ifneq ($(filter 3.%,$(MAKE_VERSION)),)
 # 'MAKEFLAGS += -rR' does not immediately become effective for GNU Make 3.x
 # We need to invoke sub-make to avoid implicit rules in the top Makefile.
-- 
2.27.0

