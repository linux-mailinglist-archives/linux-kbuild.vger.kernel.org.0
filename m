Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6038C323068
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Feb 2021 19:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233858AbhBWSPS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Feb 2021 13:15:18 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:44686 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233108AbhBWSPM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Feb 2021 13:15:12 -0500
Received: by mail-ot1-f54.google.com with SMTP id f33so3259294otf.11;
        Tue, 23 Feb 2021 10:14:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lTYr+diXJVTiSAjQ+/0IAIEJBjYcnrKX6LHvfOe/yD4=;
        b=ScJ/HPfwsfn2uIKmPS+KY7U2ytuUmXJT2WkHXDOp0JgDVCmY1lTKfiD/tVc8CG4rOw
         TpxIgF5GBopenWhBsz1mMHDCW02JFhTb1QKYzNLukKrzZGygv3PKSVYIp7uhrE2qjsOX
         bPrbOcrB99nIiNXxvidItzxwMBIrfd6OmEn41cC9E1pD232iCuYmGL8D1EpaVGvJR8t0
         zUu3dfMZnbJIf2uDb3a9RTTMu3NUCSeZvWtSk98+Qw+QEVO/f5J4jHj7n6ATG4N9UaAB
         UNX3d79/Te0FuTb+QigCWJfsNC4UD+U2wV0SuDq7If6YcLRz57tbQqus5JPravrG5k/y
         I05A==
X-Gm-Message-State: AOAM530Q3Y++Z1pr/Ctt+hBW3RPb4vXBomvHy0NIjb9RWtPnIoMELX/d
        iHo1rLqh2sqdEBMC+0R/kA==
X-Google-Smtp-Source: ABdhPJzgi9RSM9ezqnICcQq+CUwXTtCdUXFaCJNhtfUlypjSQzbMrjUF/XIl3lXvz/eWOlPmhquFYA==
X-Received: by 2002:a9d:3b0:: with SMTP id f45mr21299500otf.62.1614104071627;
        Tue, 23 Feb 2021 10:14:31 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id b2sm3578113oov.3.2021.02.23.10.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 10:14:30 -0800 (PST)
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
Subject: [PATCH 3/3] kbuild: Add a build check for missing gitignore entries
Date:   Tue, 23 Feb 2021 12:14:25 -0600
Message-Id: <20210223181425.4010665-4-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210223181425.4010665-1-robh@kernel.org>
References: <20210223181425.4010665-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Any non-phony targets need to be in gitignore. The normal way to check
this is doing an in-tree build and running git-status which is easy to
miss. Git provides an easy way to check whether a file is ignored with
git-check-ignore. Let's add a build time check using it. If the build is
not in a git tree, the check will silently fail.

This also has the side effect of a sanity check for 'always-y',
'extra-y' and 'targets' entries which are not correctly marked as PHONY
or have the wrong path.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/Makefile.lib | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index b00855b247e0..84ac8b74bbe9 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -103,6 +103,10 @@ real-obj-m	:= $(addprefix $(obj)/,$(real-obj-m))
 multi-used-m	:= $(addprefix $(obj)/,$(multi-used-m))
 subdir-ym	:= $(addprefix $(obj)/,$(subdir-ym))
 
+$(foreach f, $(filter-out $(patsubst %,$(obj)/%,$(PHONY)),$(extra-y) $(always-y) $(targets)), \
+	$(if $(shell git -C $(srctree) check-ignore -q $(f) 2> /dev/null || echo $(f)), \
+		$(warning $(f) is missing gitignore entry)))
+
 # Finds the multi-part object the current object will be linked into.
 # If the object belongs to two or more multi-part objects, list them all.
 modname-multi = $(sort $(foreach m,$(multi-used),\
-- 
2.27.0

