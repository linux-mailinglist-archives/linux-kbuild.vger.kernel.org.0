Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD373382CE
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 01:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbhCLAuQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 19:50:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbhCLAtn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 19:49:43 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F790C061762
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 16:49:43 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id b18so3030076qte.21
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 16:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Mjpx22b6GuQLoGn4NzDCeA9C1v5eOn+//WEZjXFxGag=;
        b=p1YJgca/l7E3iFpL3NEl23p9rq3uH3cCDpSNLobzpaRdN94bWmg2TLWliG4OTlDgNF
         b20mw7m0miBH3TC5NiTSrjOvpsxd/EdcZEMNofKjul69T290228EfMRqi263sZ7ZcaJy
         z2WDWEy/jTh6Vd9HVohxsoV9lhuJlYgs7JX6zxyvJVOc46TYiMufhQFP5HjsfNJNllhZ
         x42Xb3kCdRnLN7XJ1Ai7S9r8k9w7c9TnY3ZIZBGaRP2A6WNp1d5UesIsRKD8bTflljM+
         ApPAV1OH/Bn5BUKlPk/oyAren6W77UIuvmnx4NkfwgRZxTrZ2vrS8diyGNcOaxyVNLg4
         QIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Mjpx22b6GuQLoGn4NzDCeA9C1v5eOn+//WEZjXFxGag=;
        b=J0TquO+FDU83/i+yQKOUbxRvjp+E9bRLYwimd9+dXkfR6lu96AGS56ks3VQoTB5ZEM
         eUWBKcY6K6lv+LaYr4UUO1KaTrIOi86GXrjQCd/3IPALwwEGVwylwIrBCq5aHxNJDsGQ
         4607Qe+eGcL1kwtdXBpCdoJR7nuUfCkrusFMBCNgdFxtO9hbQHVRkWEpHzMhNyQR1U6w
         ZAiZfk/OOGbZaEuXaZvY+C6aLQQsSXoqrktWKlGS/cxW26d6ZTerQcw3G55sj4H6bMdC
         lhS1xMpEjInUU47+9yqr5zc9AZTGGN1LbrJlNWNyspo5MNaLDHJgkwZf0cM+h2bEi0x/
         /jSw==
X-Gm-Message-State: AOAM533igkMt5M26A6/mIt4DbLCpsh/btuELwiNSkT5f+bmPyAV2H7N8
        F6JYozmSLmTt7EH2QO8uLHN6KhB4T6MDZPt67k4=
X-Google-Smtp-Source: ABdhPJwmy8g4J1Glwh+9/Qdeqiq2sG1+WJpaNKE+Qhd9e3mgm3N1f00E1AniVKdzTbmiO2hHWYG9eMucONFWzKoR1oM=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:c86b:8269:af92:55a])
 (user=samitolvanen job=sendgmr) by 2002:ad4:4745:: with SMTP id
 c5mr10451143qvx.39.1615510182313; Thu, 11 Mar 2021 16:49:42 -0800 (PST)
Date:   Thu, 11 Mar 2021 16:49:13 -0800
In-Reply-To: <20210312004919.669614-1-samitolvanen@google.com>
Message-Id: <20210312004919.669614-12-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210312004919.669614-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH 11/17] psci: use __pa_function for cpu_resume
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        bpf@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kbuild@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With CONFIG_CFI_CLANG, the compiler replaces function pointers with
jump table addresses, which results in __pa_symbol returning the
physical address of the jump table entry. As the jump table contains
an immediate jump to an EL1 virtual address, this typically won't
work as intended. Use __pa_function instead to get the address to
cpu_resume.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 drivers/firmware/psci/psci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index f5fc429cae3f..facd3cce3244 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -326,7 +326,7 @@ static int psci_suspend_finisher(unsigned long state)
 {
 	u32 power_state = state;
 
-	return psci_ops.cpu_suspend(power_state, __pa_symbol(cpu_resume));
+	return psci_ops.cpu_suspend(power_state, __pa_function(cpu_resume));
 }
 
 int psci_cpu_suspend_enter(u32 state)
@@ -345,7 +345,7 @@ int psci_cpu_suspend_enter(u32 state)
 static int psci_system_suspend(unsigned long unused)
 {
 	return invoke_psci_fn(PSCI_FN_NATIVE(1_0, SYSTEM_SUSPEND),
-			      __pa_symbol(cpu_resume), 0, 0);
+			      __pa_function(cpu_resume), 0, 0);
 }
 
 static int psci_system_suspend_enter(suspend_state_t state)
-- 
2.31.0.rc2.261.g7f71774620-goog

