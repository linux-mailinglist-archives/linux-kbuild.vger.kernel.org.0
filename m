Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDC93783A33
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Aug 2023 08:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233120AbjHVGyP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Aug 2023 02:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233125AbjHVGyN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Aug 2023 02:54:13 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA85D1A2
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Aug 2023 23:54:10 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bdbf10333bso32550645ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Aug 2023 23:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692687250; x=1693292050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ve676d4JygpyiEcrPI+SQ2vixWRAfUQkdAIluX+ykhQ=;
        b=ebGYjVszLeF1umCyRN8bue0FD0Em8Za2f27t/3K0loeow5Jr/tJ/vfHVqXCOxPas/i
         zK0DIDUsshJfYNZKsHiE6XhuT2GvkXFW01Ah4Jgkh5gxu9taufca8BsoEnZSxNwRjMPo
         DKDA98HbHpWgAYP2Heckvb4ngKpcFbgYrr+FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692687250; x=1693292050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ve676d4JygpyiEcrPI+SQ2vixWRAfUQkdAIluX+ykhQ=;
        b=FtVq/ElckHvFP9riqvNBkiJnAvR8XRsiB8m30GfhBqS9aAYncPjtGHkcZv5lfLwfty
         m7rlxm1cgRoDfXWz5n17ECuGgdeDHRkTUZh6bGXLtutF9Nxd4KjTs3H7zq4K34DFnZNW
         DzDRFb/iCmDNiHf230Ol96EOru5w6mvIL88EZksaAmgzJYUMLEvvxh+uFxQ5gdTOhlGp
         SmRqniRchl8qnUEeJce6Z8FytDUYspndjEt+sEcfdBfDM1YRukERlNM1c0t9k8W6fcxZ
         kNAMMWW+ajOLUyoDwHLxpZB67e1nv8dUR/61byALiaVKsV4NOQl/Eh0vGQRGkZAI8Cj9
         m2rg==
X-Gm-Message-State: AOJu0Yw4iBq44dgePEHmT3ivdOKOZRRlMIouyw3tDqehR6FO+We8clsE
        LJzu7B6folhudgAyJK0GTKAxEUuIyHbPbyUjFz8=
X-Google-Smtp-Source: AGHT+IHyoDY2eU7axzNzBSKrXJY9J7Jjb+Z+v7SE8quHZ+O9dYs3Fz6aKcjheAS9j0V1v5qFdeJknQ==
X-Received: by 2002:a17:903:44c:b0:1b9:e81f:fb08 with SMTP id iw12-20020a170903044c00b001b9e81ffb08mr8315927plb.55.1692687249792;
        Mon, 21 Aug 2023 23:54:09 -0700 (PDT)
Received: from localhost ([2620:15c:2d3:205:c79b:9f4c:f1d8:4659])
        by smtp.gmail.com with UTF8SMTPSA id u7-20020a170902e80700b001bdd512df9csm8219663plg.74.2023.08.21.23.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 23:54:09 -0700 (PDT)
From:   Denis Nikitin <denik@chromium.org>
To:     linux-kbuild@vger.kernel.org
Cc:     denik@chromium.org, Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH] modpost: Skip .llvm.call-graph-profile section check
Date:   Mon, 21 Aug 2023 23:52:55 -0700
Message-ID: <20230822065256.163660-1-denik@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

.llvm.call-graph-profile section is added when the kernel is built with
profiles (e.g. -fprofile-sample-use=<llvm.profile>). The section holds
metadata for symbols beloning to other sections and hence doesn't need
modpost checks.

This change fixes the kernel build with sample profiles which fails
with:
"FATAL: modpost: Please add code to calculate addend for this architecture"

Signed-off-by: Denis Nikitin <denik@chromium.org>
---
 scripts/mod/modpost.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index b29b29707f10..64bd13f7199c 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -761,6 +761,7 @@ static const char *const section_white_list[] =
 	".fmt_slot*",			/* EZchip */
 	".gnu.lto*",
 	".discard.*",
+	".llvm.call-graph-profile",	/* call graph */
 	NULL
 };
 
-- 
2.42.0.rc1.204.g551eb34607-goog

