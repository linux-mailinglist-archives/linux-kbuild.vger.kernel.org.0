Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA66D6FB6
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2019 08:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbfJOGtS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Oct 2019 02:49:18 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55148 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726052AbfJOGtS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Oct 2019 02:49:18 -0400
Received: by mail-wm1-f67.google.com with SMTP id p7so19490955wmp.4;
        Mon, 14 Oct 2019 23:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6YDCkuyIosdTgrS2ggnxlMMsn3BYyoc4OIOo4KBWaVA=;
        b=UiXmmxjiif1MtPfKCiJ2oyzLdSCxArGJiWgAAQNLU0ejy0okCbQ6xXH5ZDxiO0McRa
         RHy/wcKJGK1X6CMDb+JRcxHFFrWbWBgxFZ7k/7aiux3ssfqFk8+aKPpLElgiQ6+0tbNL
         xFMucE3Jt/W9tHJJxSS8JexdYUOx+sIKs9RWJEJNpmFMoZMOZ5F5dAF0VotEoL764mjB
         AxJU/l88oxk1Wywj2Ey5j/3hht8LHcNcy5Nia+oj1Tv/Gv6z/eZ4I8KNIFIF0/gasmh6
         sGBeNq9DeVto4KcJCwF4cDK1isCOPWgLNZ1naiq8vY9uBSwHhBnzSl8wtQbfm2EJx73m
         H99A==
X-Gm-Message-State: APjAAAUS/9FoMufDpnSwsYOR6XCmc9yG0146wZ0oy8mbCOVyvhRzOhCQ
        yw5VxEBK1t+zii9PISdUMA52conL
X-Google-Smtp-Source: APXvYqyS9dFD+ASA8YbqjMADf+YOe/x8nPlIlxr9KJabrdVRRT2WZGAiPUcU8Nm2Og/+3xbbtVUTtA==
X-Received: by 2002:a1c:f714:: with SMTP id v20mr18539612wmh.55.1571122154580;
        Mon, 14 Oct 2019 23:49:14 -0700 (PDT)
Received: from localhost.localdomain (broadband-188-32-48-208.ip.moscow.rt.ru. [188.32.48.208])
        by smtp.googlemail.com with ESMTPSA id z5sm33680364wrs.54.2019.10.14.23.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 23:49:13 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Denis Efremov <efremov@linux.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] modpost: add NOFAIL to strdup call
Date:   Tue, 15 Oct 2019 09:49:06 +0300
Message-Id: <20191015064906.13833-1-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add NOFAIL check for the strdup call, since the function
allocates memory and can return NULL. All strdup calls in
modpost are checked with NOFAIL.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 scripts/mod/modpost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 936d3ad23c83..8e8975065cbc 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -384,7 +384,7 @@ static struct symbol *sym_add_exported(const char *name, const char *namespace,
 		}
 	}
 	free(s->namespace);
-	s->namespace = namespace ? strdup(namespace) : NULL;
+	s->namespace = namespace ? NOFAIL(strdup(namespace)) : NULL;
 	s->preloaded = 0;
 	s->vmlinux   = is_vmlinux(mod->name);
 	s->kernel    = 0;
-- 
2.21.0

