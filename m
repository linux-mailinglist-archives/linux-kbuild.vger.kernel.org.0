Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 677332BC66
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2019 01:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfE0Xzh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 May 2019 19:55:37 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46137 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbfE0Xzh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 May 2019 19:55:37 -0400
Received: by mail-pl1-f194.google.com with SMTP id r18so7518223pls.13;
        Mon, 27 May 2019 16:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=82t6M/uD3A67ufeqDPKTyHrgrqZA1HoGYZ3TYI3ACUc=;
        b=jIXfTQ+8qco4zFCsIbUQ3Kfl0ZNS3jmReFtzz6HVKESw/muvow13WtfwD9SlVCSm+A
         amr4JTxTzulzmko/EuWtVUeXTje0Vfr1SApVF1LItRW2ph1/ka0ViEjO/OeM/aYEpeoJ
         Uc013VN0ZXu7+i79AcC/cxj6Kapf45Ohzq5oLvdag68aNd61+moZpruyv0Ih+qobN7+T
         kIgVPOpQ94nqJBdwO4by+OFGAHePXhdAY+MEo+BO/1B8e4R1EO+gjHPG6tpuUnKJu7jc
         3kTrwLMBkYEnlwnrenAy+4W10+gLFJq2CMeLDh0fDRnHFRhXbYyjwbhik5JzOGZo8CLe
         q79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=82t6M/uD3A67ufeqDPKTyHrgrqZA1HoGYZ3TYI3ACUc=;
        b=tkP8jfqZ5U+vBjBNE3tx/7QYTdvMKhfcZR5qJjHmo5AD66CPXhiYZxfLkMQmTlxWvb
         m0XRqG3L4c+X8lhy+tRJr6Hg+ROZeDAwzQut2dftyhQTsQ3rgvpM2r8P6fqH4GY5i1DF
         oOXNdO+36pVVIJsrszA55u6/laHE+4QGCsg9s/Z1JGtPqlZ735qsQLGxZuEzY9EB+pwG
         Iv14hH5ZR/0ND/Jt6dKctPw4ei+gJfEE5UyeBY+H7mXcsOwT0tMJ99Q8FD4mpqO8P0Vx
         A23TZyY3lcHrZt5R2ZqRuqVxXX34yIlrrE2J/GSiUQaYCt2SRLUwcBxTScsVyXBVbJ/Z
         E3Zg==
X-Gm-Message-State: APjAAAXvVVuwD1NOGJnp6j3kX8ZmyEg5PKaTDlJPtgiLsvm7VhGj2F3M
        F8fXxfpfndLlEwfBvQktSYE=
X-Google-Smtp-Source: APXvYqyje6mL3IT4KEsItJowoI5CFSPl7K1MkEKi3r4ZainsLGwuHVG97dF7I7YG+6axDjvbqDQJmg==
X-Received: by 2002:a17:902:9f83:: with SMTP id g3mr115148001plq.330.1559001336833;
        Mon, 27 May 2019 16:55:36 -0700 (PDT)
Received: from bourget-gt.lan (c-98-234-52-230.hsd1.ca.comcast.net. [98.234.52.230])
        by smtp.gmail.com with ESMTPSA id e5sm5337350pgg.65.2019.05.27.16.55.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 16:55:36 -0700 (PDT)
From:   Trevor Bourget <tgb.kernel@gmail.com>
To:     yamada.masahiro@socionext.com
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: tar-pkg: enable communication with jobserver
Date:   Mon, 27 May 2019 16:54:23 -0700
Message-Id: <20190527235423.153853-1-tgb.kernel@gmail.com>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The buildtar script might want to invoke a make, so tell the parent
make to pass the jobserver token pipe to the subcommand by prefixing
the command with a +.

This addresses the issue seen here:

	/bin/sh ../scripts/package/buildtar tar-pkg
	make[3]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.

See https://www.gnu.org/software/make/manual/html_node/Job-Slots.html
for more information.

Signed-off-by: Trevor Bourget <tgb.kernel@gmail.com>
---
 scripts/package/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 27b42d5b6c4f..ca7f46b562a4 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -104,7 +104,7 @@ clean-dirs += $(objtree)/snap/
 # ---------------------------------------------------------------------------
 tar%pkg: FORCE
 	$(MAKE) -f $(srctree)/Makefile
-	$(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
+	+$(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
 
 clean-dirs += $(objtree)/tar-install/
 
-- 
2.22.0.rc1.257.g3120a18244-goog

