Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D37F62338C0
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jul 2020 21:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730517AbgG3TLr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Jul 2020 15:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730444AbgG3TLj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jul 2020 15:11:39 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10CBEC061574;
        Thu, 30 Jul 2020 12:11:39 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id g19so2463370plq.0;
        Thu, 30 Jul 2020 12:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=033/koxi8tBQP0JLIdsncSOzrcGFA+WfwhEA16y7708=;
        b=VOJH1I3/2EUXK2+wuA1Qck7sGAXLG+sr+IPGIjUgVGyQ8D8d3YnpK09z6N6KE7fG2Y
         cu1nLPOjj4U3vJ1cNHVd1qhL17ZzhCjjMEXqwgiNg/hTEZvxwMR7uXhbXO7+YcFnDR+X
         jgfOWzGjbtrV+R41GOlTRCKS/cOUwYDrBwVLuMjtiKY5OFa/4xSELAsl9dET4AA/X/UR
         lPraacU5i7lhcurzr/uZs1ax0zi7JPXwEn+vGnfvXgoHWd0NPxnys6vyAPkm5YCeD1lH
         kBoRnAvnjbjQeC9Ucqy04omLCjYOZZ/shrpY+PLLPIil4Xz0CZN4vpvlW0hqFja2Muyl
         D5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=033/koxi8tBQP0JLIdsncSOzrcGFA+WfwhEA16y7708=;
        b=N8mkWXX3K7eOymuHAPkfrK7ibmb81qGZsDMHubEpGMmdbsYbcsUE41w0kiqg+0uEcv
         l4pzUGVshty3HTox/gBAIcnC+OsHsjeqRMRXzP2qVsnNi66QPNfQHKnUJh3hPzxNPT2i
         +dRvUQa/wrJ70AZszUu+tTB9307rFAvxiUkeWhc9K/VW9fd5pEND4tZP2AuQYFOQaGT2
         IccWZo61f8LsKo7F9lxw2w3lBBvqDtIG02V0PVes4+7sKL1SccTO+xgoYJ0RUSndtcpH
         wk7FugNeqyyd4QRanlLKuNDNvsA9q+asITuPDdPvr/ocjHKb2jiuXKlku6tB/zBoD1p5
         JDfQ==
X-Gm-Message-State: AOAM53208XR29xsrkHw3YVZvhBFU7+KOhqfsZe1Z2AGgI5YZ5q6mL8AG
        3F2tNfobZ1rMmlqqOispgBI=
X-Google-Smtp-Source: ABdhPJzhH1KCDavhn1SyTstAYmZDkp0/vMIpOz8PMPIheimgqMBK62Ia4E0QQnxqNbKZdMMQAwxB3g==
X-Received: by 2002:a17:902:b7c2:: with SMTP id v2mr623822plz.34.1596136298588;
        Thu, 30 Jul 2020 12:11:38 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id o22sm8644976pfu.206.2020.07.30.12.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 12:11:37 -0700 (PDT)
From:   Nick Terrell <nickrterrell@gmail.com>
To:     Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Terrell <terrelln@fb.com>
Subject: [PATCH v10 7/8] .gitignore: add ZSTD-compressed files
Date:   Thu, 30 Jul 2020 12:08:40 -0700
Message-Id: <20200730190841.2071656-8-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730190841.2071656-1-nickrterrell@gmail.com>
References: <20200730190841.2071656-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Adam Borowski <kilobyte@angband.pl>

For now, that's arch/x86/boot/compressed/vmlinux.bin.zst but probably more
will come, thus let's be consistent with all other compressors.

Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Nick Terrell <terrelln@fb.com>
Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index d5f4804ed07c..162bd2b67bdf 100644
--- a/.gitignore
+++ b/.gitignore
@@ -44,6 +44,7 @@
 *.tab.[ch]
 *.tar
 *.xz
+*.zst
 Module.symvers
 modules.builtin
 modules.order
-- 
2.27.0

