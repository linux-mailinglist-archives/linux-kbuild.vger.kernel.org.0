Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27263540D55
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jun 2022 20:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353771AbiFGSsZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jun 2022 14:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354449AbiFGSrC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jun 2022 14:47:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96AB1522CD;
        Tue,  7 Jun 2022 11:01:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 33E29618BF;
        Tue,  7 Jun 2022 18:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4537C3411F;
        Tue,  7 Jun 2022 18:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654624877;
        bh=dDemp0i4bzuclYqaTNa4xzi6Eq8uHB7oCI5/N/iW0Mo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ji94AxaRglSrNkIFEPHTGFavuEXyh2owxUr6IS2cv88m2dt4JapVOfqpt77B772mi
         EGWG0Rmh6+TKzwcbz03kxynWnCGq05hO3DPXqWjvKbbtzU30EUfvHX/plwQC79Yt4m
         S25jVDHRE1cLRmslB/xlNOUMWhBDPuNsTOAhwi8Uo6524jWCcxw7KR7tLZa4xq9LT2
         KyhiNbpMbeX1jqbwfLnB51b2OM1ZvwmgS3Wuu454vIhOvzfuMSqBKfqh7WaQL/jCOl
         96/snj3MdOuDF/1+aoxUkvWBjJSlz0PNppdlq3AFVKueIG5NvxtP1ELXMhj1IFV/rR
         ye36lvePaDtwA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sasha Levin <sashal@kernel.org>, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 27/34] modpost: fix undefined behavior of is_arm_mapping_symbol()
Date:   Tue,  7 Jun 2022 14:00:02 -0400
Message-Id: <20220607180011.481266-27-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607180011.481266-1-sashal@kernel.org>
References: <20220607180011.481266-1-sashal@kernel.org>
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
index 13cda6aa2688..a878c79fe95a 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1283,7 +1283,8 @@ static int secref_whitelist(const struct sectioncheck *mismatch,
 
 static inline int is_arm_mapping_symbol(const char *str)
 {
-	return str[0] == '$' && strchr("axtd", str[1])
+	return str[0] == '$' &&
+	       (str[1] == 'a' || str[1] == 'd' || str[1] == 't' || str[1] == 'x')
 	       && (str[2] == '\0' || str[2] == '.');
 }
 
-- 
2.35.1

