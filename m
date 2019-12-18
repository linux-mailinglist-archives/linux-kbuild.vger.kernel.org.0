Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 524F7124C72
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2019 17:05:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfLRQFZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Dec 2019 11:05:25 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:58511 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbfLRQFZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 11:05:25 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id xBIG5G85012778;
        Thu, 19 Dec 2019 01:05:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com xBIG5G85012778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576685117;
        bh=XrkgTceMdTMZIA8b6RjoQ0zRm2jj2UWUD7J1SCrikgA=;
        h=From:To:Cc:Subject:Date:From;
        b=zWlZwmo/tyoQg0BXA5fF/PKnJl8PDDgMOOZOyK+Wus7yaWZEX8aKK6zkfCnrVBrHR
         J92p3QowD9zzKcWmnCjKxum/ZMeMZqqFEy8LcZ+QOdldB6TjqBcLaMMCBuhW1LuWj+
         bPO2yVBgia/KZWVybAla4UL62h8/1MrDG+0eb5/PmPTt2WtxQIljXMigLDW/gt09SN
         7pumjvPix9+2qHIFkZziXxoksqg/z1tFP9X5U1o2zAWzw8Ggt4KVLZ7mLdq/uyEz4o
         CXwPJ2Wm77oX2bw5AahUAJvcaMqF9CIBizXF0VGI4LufStxJuko4CYTfIvhBIyAJHS
         EKj/2aGLEHLzA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: use pattern rule for building built-in.a in sub-directories
Date:   Thu, 19 Dec 2019 01:05:14 +0900
Message-Id: <20191218160514.28124-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The built-in.a in a sub-directory is created by descending into that
directory. It does not depend on the other sub-directories. Loosen
the dependency.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index e46b4ee9a120..a562d695f0fa 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -372,7 +372,7 @@ $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
 # ---------------------------------------------------------------------------
 
 # To build objects in subdirs, we need to descend into the directories
-$(sort $(subdir-obj-y)): $(subdir-ym) ;
+$(obj)/%/built-in.a: $(obj)/% ;
 
 #
 # Rule to compile a set of .o files into one .a file (without symbol table)
-- 
2.17.1

