Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C86274620
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Sep 2020 18:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgIVQFU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Sep 2020 12:05:20 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:53286 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726709AbgIVQFU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Sep 2020 12:05:20 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id A0C7B8EE1CB;
        Tue, 22 Sep 2020 08:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1600790154;
        bh=onSSkyHXeiC7G+ragyMOoMevMlY5DZ6Croa+2J3cFZk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jEbgnEmk21LGtU3N91Oq0gH98slwfaQcOaEy3CfHmiyrldddl1arJcMGoI9X4rAHE
         lkLRqAwY4EVu7Kcer32qW5H/vNuYATbhFcyTdBn03l3omyqKwxfe7WTw1NBJQKrmYV
         DSD0wtuMb/q0WrB62C4tG8XZt/dq3jze8CQXcE48=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3RVzxqZL35BJ; Tue, 22 Sep 2020 08:55:54 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (jarvis.ext.hansenpartnership.com [153.66.160.226])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 350518EE1C8;
        Tue, 22 Sep 2020 08:55:53 -0700 (PDT)
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/1] Makefile.build: Add an explicit error for missing ASN.1 compiler
Date:   Tue, 22 Sep 2020 08:53:41 -0700
Message-Id: <20200922155341.17906-2-James.Bottomley@HansenPartnership.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200922155341.17906-1-James.Bottomley@HansenPartnership.com>
References: <20200922155341.17906-1-James.Bottomley@HansenPartnership.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The current dependency rules mean that the build breaks if the ASN.1
compiler is required but CONFIG_ASN1 isn't set.  However, it isn't
obvious from the error message about missing files what the actual
problem is, so make the build system give an explicit error.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 scripts/Makefile.build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a467b9323442..bca7003beac8 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -382,6 +382,11 @@ quiet_cmd_asn1_compiler = ASN.1   $(basename $@).[ch]
       cmd_asn1_compiler = $(objtree)/scripts/asn1_compiler $< \
 				$(basename $@).c $(basename $@).h
 
+ifndef CONFIG_ASN1
+$(objtree)/scripts/asn1_compiler:
+	$(error CONFIG_ASN1 must be defined for the asn1_compiler)
+endif
+
 $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
 	$(call cmd,asn1_compiler)
 
-- 
2.26.2

