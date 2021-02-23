Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D1F323066
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Feb 2021 19:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233845AbhBWSPL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Feb 2021 13:15:11 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:38144 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233821AbhBWSPJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Feb 2021 13:15:09 -0500
Received: by mail-ot1-f53.google.com with SMTP id s3so13350196otg.5;
        Tue, 23 Feb 2021 10:14:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OkVXldj0RZQt+gCAlu5wKTAhvB5CUtWme7iv2atmKcw=;
        b=Rn6D8KQhUUlNuANppqqQAPi/FivIxz+nIys39x/4Ey3kEc86AHj1XELD1fLMiz0Kp8
         4lXfZJrCsEJhK93zQXt4iWtdJOTD/YYm9gTQWYTD3fzvvY2Nax6HX+/DWCqKMsV8TUcX
         VSli6OxkXWkAQJrIPozbBrIk/sDWitffoUJ1LgeDWh0gX0OJB5AGqmmYVFISYlLpUTmi
         eAVVDHTkADtTglBFZU0sUW/+okPbY4oibnrIcGQc05k2Jn7VQ5KxfijPvphRvo5K09hy
         5t7wlg4kgxdYItb76FMeS58FLTun46p/Smfldd9e+DSsCki8z2KO61jOrW+4icI94yp+
         MB4w==
X-Gm-Message-State: AOAM533on1EU/6RS0E0qZh2V2vuu+iS9n7r5sjxbhJRJHQr1Q5hGOyDy
        sSp1WVwKvpryhEX7umVA99FfEYkOjQ==
X-Google-Smtp-Source: ABdhPJzUmK4LFbBi9Q8/Dz0MYS7UWFpnG4hTPpZ0IEVSjh4oDM7W/FVvf4xZN/r+UxvRt2l2fZxRLg==
X-Received: by 2002:a9d:1c86:: with SMTP id l6mr10109319ota.319.1614104068420;
        Tue, 23 Feb 2021 10:14:28 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id b2sm3578113oov.3.2021.02.23.10.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 10:14:27 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] kbuild: Make old-atomics and missing-syscalls phony targets
Date:   Tue, 23 Feb 2021 12:14:23 -0600
Message-Id: <20210223181425.4010665-2-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210223181425.4010665-1-robh@kernel.org>
References: <20210223181425.4010665-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The old-atomics and missing-syscalls targets are not files, so they
should be marked as PHONY.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Kbuild | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Kbuild b/Kbuild
index fa441b98c9f6..032157c3ffd2 100644
--- a/Kbuild
+++ b/Kbuild
@@ -44,6 +44,7 @@ always-y += missing-syscalls
 quiet_cmd_syscalls = CALL    $<
       cmd_syscalls = $(CONFIG_SHELL) $< $(CC) $(c_flags) $(missing_syscalls_flags)
 
+PHONY += missing-syscalls
 missing-syscalls: scripts/checksyscalls.sh $(offsets-file) FORCE
 	$(call cmd,syscalls)
 
@@ -55,5 +56,6 @@ always-y += old-atomics
 quiet_cmd_atomics = CALL    $<
       cmd_atomics = $(CONFIG_SHELL) $<
 
+PHONY += old-atomics
 old-atomics: scripts/atomic/check-atomics.sh FORCE
 	$(call cmd,atomics)
-- 
2.27.0

