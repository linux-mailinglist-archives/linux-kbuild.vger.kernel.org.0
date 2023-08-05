Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDF46770D94
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Aug 2023 05:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjHEDou (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Aug 2023 23:44:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjHEDot (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Aug 2023 23:44:49 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 226BA4ED9;
        Fri,  4 Aug 2023 20:44:48 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-76ca8921c6cso132580985a.1;
        Fri, 04 Aug 2023 20:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691207087; x=1691811887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QpHHyKgMCAEgEusoeicTAqPG0cXTb8asI9xABZxDWHo=;
        b=qACxiPtonrqUWRm2eFHLdHRg0tXll5Y3Dy1wSYZsz/o4AmiJNWP06R7NUzJo6SLPph
         ztaWMGjI2ut+4B0ScqPcUiYnricFCvmNwuTWQxSVD8fxjquWv4eYdocaW1Vdr50I9Xwc
         4hYo6Ia74P4FvAqoN3HwE/i62DYHeCHVGrhLvbARWDGjb/5X6fN+ipBUxajAcEps8jbt
         eOIOKhkBz9F/pPHG6zHBni1BgxkZWI2f0QtBCzjfMj5G00MXchQDKYL9EGyGXrGJGbG0
         aSMBrwt81dnlKZI2+v2joAaCYSDSKddrDRZvbzJEy4X26nYAgqcYhR5klzJVMxJ/k2g+
         VlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691207087; x=1691811887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpHHyKgMCAEgEusoeicTAqPG0cXTb8asI9xABZxDWHo=;
        b=k5dNiI6RdoQ+C5LrjaT+QMm/AuwZxp2opJI6Zq3NIGEAP87EzfrpuZzn8GO1gR1Vjm
         lkOI3DSPlXRxNhBru4dkzOI92K20UWfcLFjQ9gtg6pspvGaVcDItcfH9ndZQ+uCflEU6
         F8EIQ6T6it+4XododmvP2pc4mCqORQaNKTP5R6oiPD9Oh/j70mu/eeUliTqneaOEK9XF
         yLXsRaU6vZ39RJD2tOPaHU4Kw596EnwJTU+8AGQQemothMCM2GWDQdAbqw7tVRU5Ijyw
         raNwL9tcGPpO8Xxmlt++aN5bXNImsK+JPqefqWluBViNI3IGAgh9H48RMcowYqebysNc
         u3kQ==
X-Gm-Message-State: AOJu0Yxx06gVaBypMWoAay6eGAjki22xytrRGJ2bt/3T8uItOakihTAH
        1h5Vpf2fHQL4PfK+SOj+uSiI3MauhQNezg==
X-Google-Smtp-Source: AGHT+IGPkHbx3nmG3dd9vPBM+EilSDI68f1EFftX6p6thmL2pTWLOPo9c+ythEznFMcYkAQinsmFMw==
X-Received: by 2002:a05:620a:2a16:b0:768:3dd2:b6f2 with SMTP id o22-20020a05620a2a1600b007683dd2b6f2mr2188871qkp.8.1691207086955;
        Fri, 04 Aug 2023 20:44:46 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab ([2600:4040:57a3:100:7ccd:e816:6b54:140a])
        by smtp.gmail.com with ESMTPSA id j23-20020ac84f97000000b004033c3948f9sm1099686qtw.42.2023.08.04.20.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 20:44:46 -0700 (PDT)
From:   Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jesse Taube <Mr.Bossman075@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v1] docs: kbuild: Document search jump feature
Date:   Fri,  4 Aug 2023 23:44:45 -0400
Message-Id: <20230805034445.2508362-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Menuconfig has a feature where you can "press the key in the (#) prefix
to jump directly to that location. You will be returned to the current
search results after exiting this new menu."

This feature is poorly documented,
so add it to the kconfig.rst documentation.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 Documentation/kbuild/kconfig.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/kbuild/kconfig.rst b/Documentation/kbuild/kconfig.rst
index 5967c79c3baa..463914a7fdec 100644
--- a/Documentation/kbuild/kconfig.rst
+++ b/Documentation/kbuild/kconfig.rst
@@ -210,6 +210,10 @@ Searching in menuconfig:
 	first (and in alphabetical order), then come all other symbols,
 	sorted in alphabetical order.
 
+	In this menu, pressing the key in the (#) prefix will jump
+	directly to that location. You will be returned to the current
+	search results after exiting this new menu.
+
 ----------------------------------------------------------------------
 
 User interface options for 'menuconfig'
@@ -262,6 +266,10 @@ Searching in nconfig:
 	F8 (SymSearch) searches the configuration symbols for the
 	given string or regular expression (regex).
 
+	In the SymSearch, pressing the key in the (#) prefix will
+	jump directly to that location. You will be returned to the
+	current search results after exiting this new menu.
+
 NCONFIG_MODE
 ------------
 This mode shows all sub-menus in one large tree.
-- 
2.40.0

