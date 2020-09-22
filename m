Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A911B2745E5
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Sep 2020 18:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgIVQAR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Sep 2020 12:00:17 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:53162 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726651AbgIVQAR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Sep 2020 12:00:17 -0400
X-Greylist: delayed 350 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Sep 2020 12:00:16 EDT
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 6546F8EE1C7;
        Tue, 22 Sep 2020 08:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1600790065;
        bh=VqUSJxeMX2TLwu0Kcu6uIuml/FkxBKawirruqps7NM4=;
        h=From:To:Cc:Subject:Date:From;
        b=G/8/Cgs3u9HagTPs+o8TbppdLmcVMz2WwHMlvmhWZCOYtKuPqaKlf/oATGXVbC2Uw
         ieAAL2KjTQmx2zMGVbb5adX4A35PgzQl+rnqdGW45CAY6GgF5PTKjK/1ROkN6x1UH8
         0XIa9uyNtuQ0lNoHKrp3q8IXVdaMVN6DSO3wBFSU=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OrFAjECzZYHA; Tue, 22 Sep 2020 08:54:15 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (jarvis.ext.hansenpartnership.com [153.66.160.226])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 579AD8EE0E0;
        Tue, 22 Sep 2020 08:54:12 -0700 (PDT)
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 0/1] Add explicit error for missing CONFIG_ASN1
Date:   Tue, 22 Sep 2020 08:53:40 -0700
Message-Id: <20200922155341.17906-1-James.Bottomley@HansenPartnership.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I recently ran into this as an error from 0day.  On x86 it's pretty
much impossible to build a configuration where CONFIG_ASN1 isn't set,
so you rarely notice a problem using the ASN.1 compiler because
something else has selected it.  However, this compiler is never built
if CONFIG_ASN1 isn't set and the error you get from kbuild is
particularly unhelpful:

   make[4]: *** No rule to make target 'security/keys/trusted-keys/tpm2key.asn1.o', needed by 'security/keys/trusted-keys/built-in.a'.
   make[4]: *** [scripts/Makefile.build:283: security/keys/trusted-keys/trusted_tpm2.o] Error 1
   make[4]: Target '__build' not remade because of errors.

This patch changes the above error to the much easier to diagnose:

   scripts/Makefile.build:387: *** CONFIG_ASN1 must be defined for the asn1_compiler.  Stop.
   make[3]: *** [scripts/Makefile.build:505: security/keys/trusted-keys] Error 2

James

---

James Bottomley (1):
  Makefile.build: Add an explicit error for missing ASN.1 compiler

 scripts/Makefile.build | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.26.2

