Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57AA77880DC
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Aug 2023 09:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232557AbjHYH20 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Aug 2023 03:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbjHYH16 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Aug 2023 03:27:58 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA371BEF
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Aug 2023 00:27:53 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c06f6f98c0so5767835ad.3
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Aug 2023 00:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692948473; x=1693553273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlXlLHBoW4dTZ8FthLBS8Kn5SzBMbKV4fH/qmyBs2dA=;
        b=GuK8FTdQFStQBrc/+UrZlObuHDLb/Z8HolfK7+I4/Rz8Cj9OtCekENJ7pG3OpGAlIb
         IRPgrHuLapXBWD0Rems1twDE6slppU1VDXMdMgWBeASnEeZXpzW1NrCUckmmp2WNmos9
         JaJRtKhaR554bCf3Cpx+Jfml+7fx91n2y3TAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692948473; x=1693553273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MlXlLHBoW4dTZ8FthLBS8Kn5SzBMbKV4fH/qmyBs2dA=;
        b=D/7lhl3pGZlRjzbt7VkBXE4rh694SrKfQyMSrj5NNENIJv2aLptmrhwS2sleaCKrJj
         HfmWEfHil4VCHv9MG750aEpnLN+q/vA02n6DkiiZPS3BZl2HiSOtjKkRZdetK7UodPxh
         5sAJ7c0EQCefja3sOKXv6Ps1Gcvd92rt3IXJ7DDV3QS6B3Kd0WG1Wx/KHMGTXd+y2lFv
         eNQfXkdWwhVtOqUoPgt64EBKUj/fBoR5wDCE9frgoR1+EMRsdDy/TJFVboJMW2sQVD8P
         PTxfRVlIulPFJBIvaY5czlW9Ybk+iD5wypqc1Zgk8aQj7EXIk93TM/pTYbYq4l2lGdQx
         040A==
X-Gm-Message-State: AOJu0YxeDfHk/hjgZsiMflFNIqv6o6k/cgk8/KWFaH46hXbQN/pWFAwp
        usuk0n31wL2jS2cVj229rkt3Ef0q2H1N2/mkPTU=
X-Google-Smtp-Source: AGHT+IHDwVITh4CP16FgpTedCa7AJLG3VbgEE5V/d8qOuRFFHo7iLtE66cCg3HNHXSdYwFnDkZi6VQ==
X-Received: by 2002:a17:902:a587:b0:1c0:9abb:4873 with SMTP id az7-20020a170902a58700b001c09abb4873mr7736874plb.64.1692948472928;
        Fri, 25 Aug 2023 00:27:52 -0700 (PDT)
Received: from localhost ([2620:15c:2d3:205:b8fe:79ca:c6d4:645f])
        by smtp.gmail.com with UTF8SMTPSA id t8-20020a1709027fc800b001bdcafcf8d3sm948242plb.69.2023.08.25.00.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 00:27:52 -0700 (PDT)
From:   Denis Nikitin <denik@chromium.org>
To:     linux-kbuild@vger.kernel.org
Cc:     denik@chromium.org, Fangrui Song <maskray@google.com>,
        Douglas Anderson <dianders@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH v3] modpost: Skip .llvm.call-graph-profile section check
Date:   Fri, 25 Aug 2023 00:27:43 -0700
Message-ID: <20230825072744.1322656-1-denik@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230822065256.163660-1-denik@chromium.org>
References: <20230822065256.163660-1-denik@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

.llvm.call-graph-profile section is added by clang when the kernel is
built with profiles (e.g. -fprofile-sample-use= or -fprofile-use=).
Note that .llvm.call-graph-profile intentionally uses REL relocations
to decrease the object size, for more details see
https://reviews.llvm.org/D104080.

The section contains edge information derived from text sections,
so .llvm.call-graph-profile itself doesn't need more analysis as
the text sections have been analyzed.

This change fixes the kernel build with clang and a sample profile
which currently fails with:

"FATAL: modpost: Please add code to calculate addend for this architecture"

Signed-off-by: Denis Nikitin <denik@chromium.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Fangrui Song <maskray@google.com>
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

