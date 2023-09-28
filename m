Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB627B2699
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Sep 2023 22:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232073AbjI1U27 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Sep 2023 16:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231921AbjI1U26 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Sep 2023 16:28:58 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7661B193
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Sep 2023 13:28:56 -0700 (PDT)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 85AC53F680
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Sep 2023 20:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1695932934;
        bh=7xQRdBmdPioaCE6Y0cUzIFa4ZRXA7QMyWN8JXJlqY0k=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=IU1sndbXzhQuElisghSCaPrXdD+TukyzSWHutJC6yGWTTe7iKGqmeqhp81CmbMlE1
         8/oqlH7IpFXM/dQbgG8dSbeRK/M9BNxDk9O+39Qkzr7FvJPvMXvdvkGJyNcW9zda1v
         7UQFnMgl4BzAKU5UKod7fX5l2PoivyMz7IjbEosEn06NZzmBuZejB1/BCK5jFgxuCJ
         9oKOsA58CMex6MwV5d9GAEFNyVUn8AfDC513XM4i09HbNtYI5qAnpsSIgOn0HQw4Kq
         llkimaCqX2xi5VcDOjxo1SABiXgeECxoHAaKImp+RA04O9SwMNcypoI5ra5w8WpxqU
         1yPVpQFWbJsoQ==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1c60dcc3d9eso134935235ad.0
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Sep 2023 13:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695932931; x=1696537731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xQRdBmdPioaCE6Y0cUzIFa4ZRXA7QMyWN8JXJlqY0k=;
        b=I+/QSCVhCuRRTJDh76y8jDHxup8RyRORfxjNe2cVfcFUr9TzNdWFWVCHnQ3skFPeOn
         97rsvutcJjjquCQ3iV2LLtZdVcdx8At5h+1iKwsPYFEZWiUkFZCzK+HBFcoVHwjuttbt
         kHMXiJBQDhO15tSAxsiKdVpU6nsNtZmCJqEgEgPGNTc1cVZlWX1raKRXpnNzjAO3fGYq
         xR4Fc3r2N9jK95wd+hbs0a3ei9a+ZdPp9Kkc150qykNrjDiCm3dLEqq/H0Jsm8OWh7D0
         EVc4JMlq+PW4jiyEtSTJLFpvEL4EhjbFHLH0jqznvcwslmDTQvaQmkvxB1zMZEKQGIoG
         u2mw==
X-Gm-Message-State: AOJu0YwXHEx/uc6Is/DetgHnqTQRTSt0pHX6fwWos0zKBAqGx6gOd3gj
        U+3f1SF4CiNQMaaqj9frihYtaAQ2JRv4WTacQodZ9qEYHqi7sLf4sVkNTnul9tJXi1uD2Lk6A5j
        9Os5wNU2tnyLdHIG0yJBOPgooEDO/6tj5X7j9tqSZWXMCvf6y0Q==
X-Received: by 2002:a17:902:ed0b:b0:1c5:b4a1:ff3 with SMTP id b11-20020a170902ed0b00b001c5b4a10ff3mr2209608pld.40.1695932931242;
        Thu, 28 Sep 2023 13:28:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH62Ke8m+X7tAwVnv7nzGCzuW5lvpgntUhF7e6f4Y27d9BIM1XUjvpdgYrMkzWeYqSvBRozIQ==
X-Received: by 2002:a17:902:ed0b:b0:1c5:b4a1:ff3 with SMTP id b11-20020a170902ed0b00b001c5b4a10ff3mr2209598pld.40.1695932930967;
        Thu, 28 Sep 2023 13:28:50 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4e1:8296:9e26:1210:1ad:7450])
        by smtp.gmail.com with ESMTPSA id a7-20020a170902ecc700b001b87bedcc6fsm15357937plh.93.2023.09.28.13.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 13:28:50 -0700 (PDT)
From:   Mauricio Faria de Oliveira <mfo@canonical.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] modpost: add missing else to the "of" check
Date:   Thu, 28 Sep 2023 17:28:07 -0300
Message-Id: <20230928202807.1765918-1-mfo@canonical.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Without this 'else' statement, an "usb" name goes into two handlers:
the first/previous 'if' statement _AND_ the for-loop over 'devtable',
but the latter is useless as it has no 'usb' device_id entry anyway.

Tested with allmodconfig before/after patch; no changes to *.mod.c:

    git checkout v6.6-rc3
    make -j$(nproc) allmodconfig
    make -j$(nproc) olddefconfig

    make -j$(nproc)
    find . -name '*.mod.c' | cpio -pd /tmp/before

    # apply patch

    make -j$(nproc)
    find . -name '*.mod.c' | cpio -pd /tmp/after

    diff -r /tmp/before/ /tmp/after/
    # no difference

Fixes: acbef7b76629 ("modpost: fix module autoloading for OF devices with generic compatible property")
Signed-off-by: Mauricio Faria de Oliveira <mfo@canonical.com>
---
 scripts/mod/file2alias.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 38120f932b0d..7056751c29b1 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1604,7 +1604,7 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 	/* First handle the "special" cases */
 	if (sym_is(name, namelen, "usb"))
 		do_usb_table(symval, sym->st_size, mod);
-	if (sym_is(name, namelen, "of"))
+	else if (sym_is(name, namelen, "of"))
 		do_of_table(symval, sym->st_size, mod);
 	else if (sym_is(name, namelen, "pnp"))
 		do_pnp_device_entry(symval, sym->st_size, mod);
-- 
2.39.2

