Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A15D7E10CC
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Nov 2023 20:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232339AbjKDTme (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Nov 2023 15:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232233AbjKDTme (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Nov 2023 15:42:34 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2345194
        for <linux-kbuild@vger.kernel.org>; Sat,  4 Nov 2023 12:42:31 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7a6889f33b9so112043439f.0
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Nov 2023 12:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699126951; x=1699731751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDtk6Lut1ZOMIQsv1zjp0Y23IQKARp0A3/De87KmLgY=;
        b=GT/y38S4KK1N3UIzHTx+VBrYwMYcqYpNqYG7BaLfSW+LXyPV0g1z9z9TkTaMRBm5xL
         ZtA6Sf0SDfKWL/WOBPSQSpUQTlqJknXi30K1c/Al4J2mRav9HoWoROJLO8xFiWrFNpJx
         O5Cd55WJmNnCWqPWEOWqOcklHTFqLcKZyKcHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699126951; x=1699731751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDtk6Lut1ZOMIQsv1zjp0Y23IQKARp0A3/De87KmLgY=;
        b=Fs47zNA9HAHZQjNTXvQUdb87usL4V19pl6yQgmaRXDQueIOSwKhmSH5kq9MZwreoU5
         Tq/f8rR3GJntAk9h//z2WeWkoRp43zdXEYguJ+n1qiSWAq7Y4QvEATJu2QieJAFlj3MI
         RA9w+YEhCc8flJZfHfGhntnoAbe075F80M6zDcD4gYrnjbgH4s/a1Ukyy5iwdpkD/eBX
         eICY7Nx9aTl9WlH8oGUfADVnP9oUHLJZ1Xan4j4jQ92OuNN1zpzo/o3Xt1qh0L6PQe3b
         aGbWCOw5FURfAE/XrmsL7689OhzGY2Efz13dpek5SY/E+M1yIF6Uy8L/ke1E7W3aB5du
         dc5A==
X-Gm-Message-State: AOJu0YyW/DST2OQDFeGH5a50dmvuUJIWNwMo/BX9OfXgeT9W5U+zck72
        reX6vNA/7Be70UsEtP7znEcPfQ==
X-Google-Smtp-Source: AGHT+IEkiV/L+zZOUgXKbxHpPIMnh2+xClRjkIjMd/Rr13wzWxBt87VskJ6FsVRSe4kr9OGL6oYpkA==
X-Received: by 2002:a05:6602:2d87:b0:783:4bc6:636e with SMTP id k7-20020a0566022d8700b007834bc6636emr31219991iow.21.1699126951160;
        Sat, 04 Nov 2023 12:42:31 -0700 (PDT)
Received: from sjg1.united_club.lax.united.com (c-73-14-173-85.hsd1.co.comcast.net. [73.14.173.85])
        by smtp.gmail.com with ESMTPSA id o4-20020a6b5a04000000b0079fbb834232sm1293318iob.19.2023.11.04.12.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 12:42:30 -0700 (PDT)
From:   Simon Glass <sjg@chromium.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     U-Boot Mailing List <u-boot@lists.denx.de>,
        Tom Rini <trini@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Simon Glass <sjg@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm: boot: Use double quotes for image name
Date:   Sat,  4 Nov 2023 13:42:03 -0600
Message-ID: <20231104194207.3370542-3-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231104194207.3370542-1-sjg@chromium.org>
References: <20231104194207.3370542-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The use of single quotes in the image name causes them to appear in
the image description when the uImage is created. Use double quotes, to
avoid this.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Split double-quote change out into its own patch

 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 68d0134bdbf9..03e79e319293 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -487,7 +487,7 @@ UIMAGE_OPTS-y ?=
 UIMAGE_TYPE ?= kernel
 UIMAGE_LOADADDR ?= arch_must_set_this
 UIMAGE_ENTRYADDR ?= $(UIMAGE_LOADADDR)
-UIMAGE_NAME ?= 'Linux-$(KERNELRELEASE)'
+UIMAGE_NAME ?= "Linux-$(KERNELRELEASE)"
 
 quiet_cmd_uimage = UIMAGE  $@
       cmd_uimage = $(BASH) $(MKIMAGE) -A $(UIMAGE_ARCH) -O linux \
-- 
2.42.0.869.gea05f2083d-goog

