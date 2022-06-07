Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12870540A8F
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jun 2022 20:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349752AbiFGSXK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jun 2022 14:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352556AbiFGSRR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jun 2022 14:17:17 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563F3139AC0;
        Tue,  7 Jun 2022 10:52:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 58187CE2423;
        Tue,  7 Jun 2022 17:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3385C36AFF;
        Tue,  7 Jun 2022 17:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654624338;
        bh=Yz8ufIfO+lrCnC0TpAFFupi8jMM8xv53gh/YApI8yFs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VgoX6fG3qITc8I+nt/RintceIfyGa6isruJsoirK05BolgHk3ySiC93wuObdasrW8
         5Fdcd3Jyc6u5HIW9VT5nDOoddSx07u0VYo6zGpM61Lne9z0RpcGoh5Z/brp/zJtikR
         etcIfcl8Kt4fy+G3oiagOUsMNtfqQ+miVfTpp66fDbakU0cbA7zRP8t72/iT/2HKx/
         HDnjRk3Cv4+awsWKgPzyvKo9no5tZfBdsK6SXQwBv+/m/a1wuf262uLKWUzTzq1/AN
         Px89Wf4SFBMIObNbNCq3ggodcGIuPupwq9ppq7YPGPi2W+qcNPhM4z0jHRjeW8sxXG
         NYMWU8TaDD4uw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sasha Levin <sashal@kernel.org>, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 52/68] modpost: fix undefined behavior of is_arm_mapping_symbol()
Date:   Tue,  7 Jun 2022 13:48:18 -0400
Message-Id: <20220607174846.477972-52-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607174846.477972-1-sashal@kernel.org>
References: <20220607174846.477972-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit d6b732666a1bae0df3c3ae06925043bba34502b1 ]

The return value of is_arm_mapping_symbol() is unpredictable when "$"
is passed in.

strchr(3) says:
  The strchr() and strrchr() functions return a pointer to the matched
  character or NULL if the character is not found. The terminating null
  byte is considered part of the string, so that if c is specified as
  '\0', these functions return a pointer to the terminator.

When str[1] is '\0', strchr("axtd", str[1]) is not NULL, and str[2] is
referenced (i.e. buffer overrun).

Test code
---------

  char str1[] = "abc";
  char str2[] = "ab";

  strcpy(str1, "$");
  strcpy(str2, "$");

  printf("test1: %d\n", is_arm_mapping_symbol(str1));
  printf("test2: %d\n", is_arm_mapping_symbol(str2));

Result
------

  test1: 0
  test2: 1

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/mod/modpost.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index ed9d056d2108..2c5c544ccf61 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1267,7 +1267,8 @@ static int secref_whitelist(const struct sectioncheck *mismatch,
 
 static inline int is_arm_mapping_symbol(const char *str)
 {
-	return str[0] == '$' && strchr("axtd", str[1])
+	return str[0] == '$' &&
+	       (str[1] == 'a' || str[1] == 'd' || str[1] == 't' || str[1] == 'x')
 	       && (str[2] == '\0' || str[2] == '.');
 }
 
-- 
2.35.1

