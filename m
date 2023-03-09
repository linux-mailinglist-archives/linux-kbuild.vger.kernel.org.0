Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8470E6B2399
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Mar 2023 13:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjCIMBk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Mar 2023 07:01:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbjCIMBR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Mar 2023 07:01:17 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7EF2E2760
        for <linux-kbuild@vger.kernel.org>; Thu,  9 Mar 2023 04:01:09 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id ec29so5957960edb.6
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Mar 2023 04:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678363268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SPX+WVM6fO0r8iRUHxtF+8WBQu6pJ25zbW8fofW/0Jk=;
        b=cFQrW0FFgLdlQbz93IKeHRoT8KhIl+XYTgBuytsm/Wm/+vFD/6knTVXk09dQWh7XSb
         vpkKuYQ5EJAtZsH+3aaWeRDPSSw2DjC/9akB+D8sAh9Ci4phCL6Lo14G2SW4iPFHJegO
         UfFFKirkYxP3+OKIRQwKred1aQqD5xDdwo5bP/EnzAj76JNzglNBgLgxJd4K1Uc5mgRu
         SGINtEdO/AKydFP6j7qlxKqBcfpSTz6+46/+1fpKxjIgo/cxCdKSMA2QgOTCtY4ysN/r
         cFCI2/JzaF30KTLK1VrcvmDiuovklbu1fDBENcEBIapfFCp+ecwgCKmXHSK5hyv8hbc9
         T3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678363268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPX+WVM6fO0r8iRUHxtF+8WBQu6pJ25zbW8fofW/0Jk=;
        b=2pK9GRXU+a8anUUVX4sUcmegs5algsyiXgeXxAPwBpO8uQQEVRS28fooFh0pOjyW4J
         x8xoUftnInZ+3XiSsFH4QJc1P1Vs4Qb+1Ua+l787oyy3WCx6iKqYlCVbseE3WGBZyWUe
         EY8PdDpAeLlFeur+JbgCsGHfeto7gIYCadX/Dz6OMuVH2a6AZZCpunNO/PZTLGu9fusi
         pI/5/qVPeXqqxarpMa59CJQ2hPlqadUkxW8R87VdSH0J1n3Sdyt/mzRh1RsLh1UOdwg+
         u3RvKKQk0hYSTHIc+odzkVXyLx8Wgb5A/PL7giXhpYBu2KCnpSAZOyJgtPqUuFGHEkty
         SzIw==
X-Gm-Message-State: AO0yUKUMisS9ZJ/16x9D89C7k91EyJkl3cx2L+pW/lEQvp5YnVJpGAKk
        zkbfd/0y1vP4smbW14/KK9oAfZ1h0b559A==
X-Google-Smtp-Source: AK7set+c69coMN5itNa7pnwAdP3iiK4my714JLj2AH7Ge8VI+8K9ChbfRY5Ajzb9y8Jq4A1GJXG9vg==
X-Received: by 2002:a17:907:3e8f:b0:8b1:779c:a8b1 with SMTP id hs15-20020a1709073e8f00b008b1779ca8b1mr27691919ejc.5.1678363267844;
        Thu, 09 Mar 2023 04:01:07 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:5d37:537d:5e25:9ef5:7977:d60c])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm8752727ejb.194.2023.03.09.04.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 04:01:06 -0800 (PST)
From:   Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
To:     linux-kbuild@vger.kernel.org
Cc:     masahiroy@kernel.org,
        Vincenzo Palazzo <vincenzopalazzodev@gmail.com>,
        Roland Kletzing <devzero@web.de>
Subject: [PATCH v2] script: modpost: emit a warning when the description is missing
Date:   Thu,  9 Mar 2023 13:01:03 +0100
Message-Id: <20230309120103.61108-1-vincenzopalazzodev@gmail.com>
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

Emit a warning when the mod description is missed and only
when the W=1 is enabled.

Reported-by: Roland Kletzing <devzero@web.de>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=10770
Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
---
 scripts/mod/modpost.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index efff8078e395..433518dfc472 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1824,6 +1824,10 @@ static void read_symbols(const char *modname)
 		}
 	}
 
+#ifdef WARN
+	if (!get_modinfo(&info, "description"))
+		warn("missing MODULE_DESCRIPTION() in %s\n", modname);
+#endif
 	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
 		symname = remove_dot(info.strtab + sym->st_name);
 
-- 
2.39.2

