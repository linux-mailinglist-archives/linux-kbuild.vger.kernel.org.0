Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70294427339
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Oct 2021 23:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243490AbhJHVxf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 8 Oct 2021 17:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbhJHVxe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Oct 2021 17:53:34 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E741C061570
        for <linux-kbuild@vger.kernel.org>; Fri,  8 Oct 2021 14:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=BOIJaRSfpKY+mhtnrEFxb7cgPtuJ/B0W3GbcwDdP/a0=; b=orB7rxnMC07hrJlTRg9lihqrX4
        QXKeWEwyUeQGtECACD6pePzu8GNSlFHozkBBfbJDNh5vGsdwnof3FOnCloqsO5cUWmouraPvhLTty
        rB4KhM9/x+Zrmb9O2SR86qktqAi1nQlOU61Q8Jx6XXXYVoUOZvkhcncPqbZnqcNpTAWZ5YwHkXQUc
        JKdXcfQtneiSZgHdC1ze5u6+9WG+ZwPBoCNb9F6oD1APx0g4QwrdalRYW59nQzWnLtCVyhYx/nUBk
        Dp2eQtkwTmBsEKqrg/+cAu5cskVbidu4aeu55KBv2Buo0u2a8DISWgTL4OFMBfzBC4YBWOfrc1dYP
        pCufcP7w==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mYxmA-004F0S-B0; Fri, 08 Oct 2021 21:51:34 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um@lists.infradead.org, x86@kernel.org
Subject: [PATCH] um: Add missing "FORCE" target when using if_changed
Date:   Fri,  8 Oct 2021 14:51:33 -0700
Message-Id: <20211008215133.9371-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

'make ARCH=um' says:

../arch/x86/um/Makefile:44: FORCE prerequisite is missing

and adding "FORCE" there makes it be quiet, so do it.  :)

Fixes: e1f86d7b4b2a ("kbuild: warn if FORCE is missing for if_changed(_dep,_rule) and filechk")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kbuild@vger.kernel.org
Cc: Jeff Dike <jdike@addtoit.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: linux-um@lists.infradead.org
Cc: x86@kernel.org
---
 arch/x86/um/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20211007.orig/arch/x86/um/Makefile
+++ linux-next-20211007/arch/x86/um/Makefile
@@ -40,7 +40,7 @@ $(obj)/user-offsets.s: c_flags = -Wp,-MD
 	-Iarch/x86/include/generated
 targets += user-offsets.s
 
-include/generated/user_constants.h: $(obj)/user-offsets.s
+include/generated/user_constants.h: $(obj)/user-offsets.s FORCE
 	$(call filechk,offsets,__USER_CONSTANT_H__)
 
 UNPROFILE_OBJS := stub_segv.o
