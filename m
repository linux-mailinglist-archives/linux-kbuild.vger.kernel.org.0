Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF9606ACAEB
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Mar 2023 18:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbjCFRn2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Mar 2023 12:43:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjCFRnY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Mar 2023 12:43:24 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A51F36A405
        for <linux-kbuild@vger.kernel.org>; Mon,  6 Mar 2023 09:42:44 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id j11so22499247edq.4
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Mar 2023 09:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678124526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4FRX9KRq7RNgr4E++7wUJD5awkriR+XH1NGMmzEW3NQ=;
        b=oYh6UgqOK+afo9Y+CdpfYv6wkmhWyYBkUeTHM6a86hfYCfCy8O53JEQlm8rSkulaQl
         R1GvcA9vsQQqtbTFZsMfeaG80WuJIO1ixYqGS7VfAgAZjeEVRuxiSbbZlW2heFKutmq3
         lzWRYk35EFZaGieBhMjff+uxnih1Tt7gOeIQAT19kM9rpEV5TvEhbiQamaE4W12CRG6k
         rMg6iI24aibl5JCCRodomYzh7LiuGLBCTqutpqRE2uBTRfUz8ycTGeEGgIMYOfhV3PJh
         /HXre7BuQdO2aDIG60wIQV91i7T7/8QEdjuQ1xuJXxM6VAK66/qWPb4G7hIfUuSyLW4N
         kPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678124526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FRX9KRq7RNgr4E++7wUJD5awkriR+XH1NGMmzEW3NQ=;
        b=hzICMCN8o1mIeL7JzLZya2BQzN5doK6skseBz10IcIxws4Ch7IYZwB/Lw73AW98wqr
         hdRODx6iaS//F5k7jQX/0o4VWW5xyDjUWNkmY72k69u8bCJ6GoYJyxxXzDyJhon2Ld65
         5tHHIvkl5MXoK5kG3fsOhP1v7E31DMFenTYO/6Lcs2R+VjptlkF9x8sz29keZKnuC6wT
         mdxMcTGopOvBhawNUh7ZPrEZj9zKYAfuUcAe/N+gkJvto2Ber7iirpjDeuG7aTLeeJi+
         64L3uzwIK7VL7gK2ukBLn/7gGnpmETLH1gBjF5MLjg03zEa2bOJfZ68pwssYLA7QemiS
         znuw==
X-Gm-Message-State: AO0yUKVx8iTBAl/UTRs11mGoVw103pwsQ7Ez3itEuUZ8wMZ93JukwM8X
        e8ZX44NlK7NqZdP40/nTEb/La/hv+r/U+bmf
X-Google-Smtp-Source: AK7set/kNMaL7/tQ59jAPGARuyffPUPVtSP3YPEwJrghm3Ad9vu/Lw5JZbo3hn66KxikhIiEUO3eLg==
X-Received: by 2002:a17:906:eecc:b0:90b:167e:3050 with SMTP id wu12-20020a170906eecc00b0090b167e3050mr15068751ejb.36.1678124526443;
        Mon, 06 Mar 2023 09:42:06 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:5d37:537d:5e25:9ef5:7977:d60c])
        by smtp.gmail.com with ESMTPSA id h10-20020a170906718a00b008c33ebac259sm4836148ejk.127.2023.03.06.09.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 09:42:06 -0800 (PST)
From:   Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
To:     linux-kbuild@vger.kernel.org
Cc:     masahiroy@kernel.org,
        Vincenzo Palazzo <vincenzopalazzodev@gmail.com>,
        Roland Kletzing <devzero@web.de>
Subject: [PATCH v1 1/1] script: modpost: emit warning when description is missing
Date:   Mon,  6 Mar 2023 18:41:59 +0100
Message-Id: <20230306174159.145224-1-vincenzopalazzodev@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Emit a warning when the mod description is missed.

Reported-by: Roland Kletzing <devzero@web.de>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=10770
Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
---
 scripts/mod/modpost.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index efff8078e395..c63156ba4e5e 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1824,6 +1824,9 @@ static void read_symbols(const char *modname)
 		}
 	}
 
+	if (!get_modinfo(&info, "description"))
+		warn("missing MODULE_DESCRIPTION() in %s\n", modname);
+
 	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
 		symname = remove_dot(info.strtab + sym->st_name);
 
-- 
2.39.2

