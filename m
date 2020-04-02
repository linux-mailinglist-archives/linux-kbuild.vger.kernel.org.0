Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1F319C82E
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2020 19:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389093AbgDBRiu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Apr 2020 13:38:50 -0400
Received: from mail-pg1-f201.google.com ([209.85.215.201]:51054 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388677AbgDBRit (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 13:38:49 -0400
Received: by mail-pg1-f201.google.com with SMTP id d69so3586115pga.17
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2020 10:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=NI0Kiq/sBep8uH+bGoMdp+/XVSJu96oWCrFI/ppsJuU=;
        b=XymilC0+8zjoS6aqUQvbDKpbxG1xuxlcy5XK1oX8f86l5HbkEmItujb3V3DieUwDsS
         6F6hPVDf7oSlFi+YtCIgpd6I96IGdaQM1ZCYhokBEAKJOYwltiqJa0ffhCx04UqnxMFO
         Uw70OqmKkpPbMqlQxgpysWe9N7BAz71tYLeHhZxlhBvmrl+Gq/J277bG3lILRQkz1cBh
         dngvfNsA3HPxtUIXDCGGnW+r6bTsyXhYiXpQDboV+OlckctH17+fRoWTEjpNVQeK9iqN
         xt7hMa2CY+DCQvDbGhGimiLE6tED+OzmOzwfM68A8JGwdcxM449sZQuv1g42RXXO5bU+
         vGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=NI0Kiq/sBep8uH+bGoMdp+/XVSJu96oWCrFI/ppsJuU=;
        b=Rzz6NNvdgagYcQsblq96LIxurg6sm8VFgaSJauP3hNZ0ADDn5LeFo/CSEzhNsdkwIG
         l5tjrlsttHRIb7+Cc4yjpsBo8GD1SYuJvm6yhWbds6K66rXlslw1K5Push+OJWedtWh0
         NnUz/dJtNuacfjSrybLiipKlA/+aA0nR9ejoFMRSpOP3Xzvx0nBodvWKp5WiaA77Vofa
         G77K3n9TF5wIJOU0tUbe3gB8QaQbOhZ42Fhvrw/ILoHzEofJzvGDsJQrm8yCQWoq4Oit
         FcuAVKutZmzGG6NyEePIdqrIJlx9HPJIBCj2anHhhrJfu6jfa4KQxZd8KiLjhjtHoWwP
         xszA==
X-Gm-Message-State: AGi0PuZk/UNfKHhMgUL7b+mHM3ubXImTWNRTT+wxiLz0aTOAqX6lrF3g
        wqvo2dUxiLmU4fV/ifRu5/IQkNWotCJH
X-Google-Smtp-Source: APiQypJ1XJpXWlwo1vDKom37brStxOJ9dfhZWzCVQIEnxK21Q6WUr6jX8FGkVEAoDrUEJjPjFmJEdIktzwfj
X-Received: by 2002:a17:90a:8085:: with SMTP id c5mr4557030pjn.186.1585849126457;
 Thu, 02 Apr 2020 10:38:46 -0700 (PDT)
Date:   Thu,  2 Apr 2020 10:38:42 -0700
Message-Id: <20200402173842.96013-1-maskray@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH] Documentation/llvm: fix the name of llvm-size
From:   Fangrui Song <maskray@google.com>
To:     corbet@lwn.net, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The tool is called llvm-size, not llvm-objsize.

Fixes: fcf1b6a35c16 ("Documentation/llvm: add documentation on building w/ Clang/LLVM")
Signed-off-by: Fangrui Song <maskray@google.com>
---
 Documentation/kbuild/llvm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index d6c79eb4e23e..eefbdfa3e4d9 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -51,7 +51,7 @@ LLVM has substitutes for GNU binutils utilities. These can be invoked as
 additional parameters to `make`.
 
 	make CC=clang AS=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
-	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-objsize \\
+	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-size \\
 	  READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
 	  HOSTLD=ld.lld
 
-- 
2.26.0.rc2.310.g2932bb562d-goog

