Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73C2B550C3D
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Jun 2022 19:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236467AbiFSRDr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 19 Jun 2022 13:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232771AbiFSRDr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Jun 2022 13:03:47 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB9921B;
        Sun, 19 Jun 2022 10:03:45 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id t3-20020a17090a510300b001ea87ef9a3dso8200494pjh.4;
        Sun, 19 Jun 2022 10:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=QaLfF3l2oeMP3+PtS1dJ0Bs3YKBV4FDntFBKrrRE75A=;
        b=R1e7zOhGxVQp+OCVGRyEExgt40Frj8suO3u+oYNnK86sPynv88KmJraD8fO+pZEAVI
         86NN1YouHsXHuNx+HdmEVuTnH5dAuzzf3n3tulualQzgEtC4zlNJ/BnOdFr/xwS9v2yX
         Smixi6ye38/DNL5GRrrbR493xQfCffBcd/5ZO1WIFEDt+rTwiryISSIumKT0sKW0Zx0e
         ginYzWcdXkaOLqBCYD+NOeq3kmppnqvPmqfupxU1OA64fU74fEf6D67aZ5+Vr7IZ0Cfw
         wA6f0qkmh+YkHZ/tbv8rlcm2UkCO7IkJoygBXZQhjOM/Dk1twXHIoMNcybxi/FP22XTA
         81Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QaLfF3l2oeMP3+PtS1dJ0Bs3YKBV4FDntFBKrrRE75A=;
        b=XAIiPs+atx8bKCXmor1hHAn0ROQTT56ex5NfuPFJSs5cAfbucXZ7ywvULVlb3YVi0n
         o0zhOOSHqASCLLQx4bW9MtoVo+lo0Upa1rlvjuXUFCtsbY++e23mxoEq4aXwxxFdOeSF
         sdI+EgbGlmHd55uQCPY4mmVHghyVCuVkbzhDIKHmhBbf3A4i4/jSfYCkGkkpUgSIVK3Z
         j06ir3Cban7NkJMpjo75whpuIuYPaoZxhCRsZbhnH29eZZ8f5fKhlnz6uSF5WZloq7lN
         4KukXlysHXwFc3tdCfrXG+KEcTzFf6zBHFZ5QYheNzuSCfbmPDSs6DKV/rbbCDeJ8jT+
         7gTQ==
X-Gm-Message-State: AJIora8Rl2591yz9+3wrM0+wGAt/8l1rGf2COZwBsoAKeF7ozMkOU48U
        4ucel06rRc7O09dfPsoHWdNRlg0yXZ5O1LLM8p0xYA==
X-Google-Smtp-Source: AGRyM1tDsCE9DEFOPn2yRF7soyGZMOlTcwGicNt94OFeLnlrdCgAls3byT0cMojnij53Q1QxY3lVUw==
X-Received: by 2002:a17:90a:5ae1:b0:1db:d0a4:30a4 with SMTP id n88-20020a17090a5ae100b001dbd0a430a4mr22441826pji.128.1655658224772;
        Sun, 19 Jun 2022 10:03:44 -0700 (PDT)
Received: from DESKTOP-KIID4IP.localdomain ([119.136.91.123])
        by smtp.gmail.com with ESMTPSA id v21-20020aa78095000000b0050dc7628171sm7262684pff.75.2022.06.19.10.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 10:03:44 -0700 (PDT)
From:   SangYuhiter <sangyu.code@gmail.com>
To:     linux-kbuild@vger.kernel.org
Cc:     masahiroy@kernel.org, linux-doc@vger.kernel.org,
        SangYuhiter <sangyu.code@gmail.com>
Subject: [PATCH] Documentation: kbuild: fix typo in kconfig-language.rst
Date:   Mon, 20 Jun 2022 01:03:37 +0800
Message-Id: <20220619170337.24743-1-sangyu.code@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

change "default y/m" to "default y/n"
add " should be "default y" " in default section d)

Signed-off-by: SangYuhiter <sangyu.code@gmail.com>
---
 Documentation/kbuild/kconfig-language.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index a7173843a294..ae3add11d5e7 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -92,7 +92,7 @@ applicable everywhere (see syntax).
  release to release.
 
  Note:
-	Things that merit "default y/m" include:
+	Things that merit "default y/n" include:
 
 	a) A new Kconfig option for something that used to always be built
 	   should be "default y".
@@ -105,7 +105,7 @@ applicable everywhere (see syntax).
 	   "default n". This allows you to provide sane defaults.
 
 	d) Hardware or infrastructure that everybody expects, such as CONFIG_NET
-	   or CONFIG_BLOCK. These are rare exceptions.
+	   or CONFIG_BLOCK, should be "default y". These are rare exceptions.
 
 - type definition + default value::
 
-- 
2.17.1

