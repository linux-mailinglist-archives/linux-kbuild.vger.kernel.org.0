Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5BAE40D5FE
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Sep 2021 11:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235251AbhIPJWy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 Sep 2021 05:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234268AbhIPJWy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Sep 2021 05:22:54 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66CFC061574
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Sep 2021 02:21:32 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id r13-20020a17090a4dcdb0290176dc35536aso4062058pjl.8
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Sep 2021 02:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=NBtzEZifW27+Bam/6DmcRhJNC9sdME9/8Fw/NQPSKVk=;
        b=Mx8Rk17J6zCTDDsCbOYYNV1aKpkuf0jHe76vl0sYVU2VuyDTRCL03GzwhFo8Vzuqhy
         auOquOFB8zOmUn3KEQHvNO736szVrvQgFRyqy8CRIwN90Qed5RqnJ9yplmni9MXz2FPj
         6hRz4Key95JKk1ZhS5MypTFZJvhQ3PsJbZQmnJKCMMA1C/OT6Sv06C4nhLw2nhqI/FyB
         +T6gansIfaUWiwaweB1OTqGonphQ12dDwMqTF1c7FaQ2gGelKNL9xuEbxatQaU46NQRc
         +6TCCh1aziG42vvByrJzQAMIoiegeUZx+USXI7+//AnPvCNFAn7BCLsQQcOyU8AX2sNH
         cMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=NBtzEZifW27+Bam/6DmcRhJNC9sdME9/8Fw/NQPSKVk=;
        b=rp+wBQ+w92iuHV9p6wYDGxHwsFj+CnSlj52eOqhLcwlTlDIzoGbPqx7TegXbHRYXC7
         G0LncEIeQ492EWCrsSYg1GYlcv49dZgS4T0yTdIwEuPi0jXVKUKchiR1q1pEWNIaVyE2
         fdplRnVGpkxGBp4J6dEjLi6cTs/d8hF2grSJ2nIPeLwZYRyONAtGP0Eg5l+mSIlwekSM
         h8vGCcweCCUPgwoFTk7hLxjRIF2NirVoJwodjzp+6MreZcqJOWkpyiILK/pxyATuabQO
         mdXyH+7htPhIV1NQpn5CBOpVYmO6uTetuyHd0y8T/7js7h3KCYkOR2Lbeh2yF2SErZ+a
         6PPw==
X-Gm-Message-State: AOAM533uf4UG/IgDmVtlOPKW+vNCyUdXEYipxZyWSiIzv/H9FZF1xxGE
        6I+gMAuG3Tf6JHjgEpiTvVfcygvSBgnGWxk=
X-Google-Smtp-Source: ABdhPJwZx5fXzbOcG2AkwKV3Z/3e9x/OUgdUUG1H8fWUva8o/4N3Nmclb5pI0lpdaA1DFJsfEA7zeJEW3tAqBOM=
X-Received: from ramjiyani.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:2edd])
 (user=ramjiyani job=sendgmr) by 2002:a17:90b:1807:: with SMTP id
 lw7mr1251718pjb.217.1631784092357; Thu, 16 Sep 2021 02:21:32 -0700 (PDT)
Date:   Thu, 16 Sep 2021 09:21:22 +0000
Message-Id: <20210916092122.2374583-1-ramjiyani@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH] kbuild: Fix comment typo in scripts/Makefile.modpost
From:   Ramji Jiyani <ramjiyani@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     Ramji Jiyani <ramjiyani@google.com>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Change comment "create one <module>.mod.c file pr. module"
to "create one <module>.mod.c file per module"

Signed-off-by: Ramji Jiyani <ramjiyani@google.com>
---
 scripts/Makefile.modpost | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index eef56d629799..48585c4d04ad 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -13,7 +13,7 @@
 # Stage 2 is handled by this file and does the following
 # 1) Find all modules listed in modules.order
 # 2) modpost is then used to
-# 3)  create one <module>.mod.c file pr. module
+# 3)  create one <module>.mod.c file per module
 # 4)  create one Module.symvers file with CRC for all exported symbols
 
 # Step 3 is used to place certain information in the module's ELF
-- 
2.33.0.309.g3052b89438-goog

