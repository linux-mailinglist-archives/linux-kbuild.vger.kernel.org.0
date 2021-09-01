Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD663FDE0F
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Sep 2021 16:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244221AbhIAOx2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Sep 2021 10:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244176AbhIAOx2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Sep 2021 10:53:28 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA05C061575;
        Wed,  1 Sep 2021 07:52:31 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id m9so5006688wrb.1;
        Wed, 01 Sep 2021 07:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YKUsiLrEjEckeebWqhS6BfbDvc5bYqy4ztmYo/I0y4s=;
        b=ZHPsjZfdOqIyKtqI6ty2vp38b46NTXU9YBc/yTjmUuNJPDZNIR+uzQU5DJ0YsPaHlY
         HNYoWx72+MTf03F80iHwxIKopLTNeU90/QZRL0S2ux9qEDkU2WNpbsrEtRghMxe/KDyH
         2DvM9ERjPwv5CYWqoNL+aHtdzLZ0Vawnnq061MuiStqehqudg9G7P/wK3dFx1DEwMnci
         Nbx8VoXlAtWlS2RvUa+K+VSxsbDbWlQ6NtHzD0ES2wVT2q5NtYDU4kFa/q0RVTpgXk5J
         4yyz6UUMe/kbpYax2bQ4IESJMYSzQYwz8lyZLK6gR/CV755mP7ez5y6K8zm6XgVRBC0u
         64qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YKUsiLrEjEckeebWqhS6BfbDvc5bYqy4ztmYo/I0y4s=;
        b=qjDOb9bOIJcRGzh+krxyQsQFh+epfC2Hycoi+FoqtHY7Y/mvbLmsdyhIW9ss5ZHaqQ
         rHWHDVvKxOpMxR9erEHj9ZrhDB33W8ZeDgjFUN3BrNchKW4BnQYhyqorZLbpja8wcZKJ
         hGeMCwPnvvZvzJVNGwwIhOwWWi0DM7Z8oGsyYn320jlN6eMrHc7/rcxdvmkGftYc97zP
         nR2qNtjBglPwddKibGU0TNvg/gFEcGJtPQMBW/hCc7RfqOnKlB1ZXGLQkL+503zgECUt
         h6rq1HIev6hsihnPbXV/LNDttMyQlOqbMLGAgB6zJFytX1d13pUcYYhEXOoG4qyAHakX
         9zfA==
X-Gm-Message-State: AOAM530qeb0Vu+WZyffcRlh02dIz0i/ol7pCzau5JL9UAHpP2TFhsqdH
        7+P/KmBWYTj8pzKYHk7a/2rx0gQvx1DKMw==
X-Google-Smtp-Source: ABdhPJyC+sH/bLl3UMv0/f1SaO382fcA8duFEet0xxGP36LvwydXiZnvMw24pQQRQtiiZ0op6Iw/4A==
X-Received: by 2002:adf:c184:: with SMTP id x4mr23410302wre.266.1630507950168;
        Wed, 01 Sep 2021 07:52:30 -0700 (PDT)
Received: from localhost.localdomain ([147.235.73.50])
        by smtp.googlemail.com with ESMTPSA id o12sm5573131wmr.2.2021.09.01.07.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 07:52:29 -0700 (PDT)
From:   Ariel Marcovitch <arielmarcovitch@gmail.com>
To:     masahiroy@kernel.org, valentinrothberg@gmail.com
Cc:     arielmarcovitch@gmail.com, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: [PATCH v2] checkkconfigsymbols.py: Forbid passing 'HEAD' to --commit
Date:   Wed,  1 Sep 2021 17:52:12 +0300
Message-Id: <20210901145212.478066-1-arielmarcovitch@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As opposed to the --diff option, --commit can get ref names instead of
commit hashes.

When using the --commit option, the script resets the working directory
to the commit before the given ref, by adding '~' to the end of the ref.

However, the 'HEAD' ref is relative, and so when the working directory
is reset to 'HEAD~', 'HEAD' points to what was 'HEAD~'. Then when the
script resets to 'HEAD' it actually stays in the same commit. In this
case, the script won't report any cases because there is no diff between
the cases of the two refs.

Prevent the user from using HEAD refs.

A better solution might be to resolve the refs before doing the
reset, but for now just disallow such refs.

Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---
 scripts/checkkconfigsymbols.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
index b9b0f15e5880..c57c990c3244 100755
--- a/scripts/checkkconfigsymbols.py
+++ b/scripts/checkkconfigsymbols.py
@@ -102,6 +102,9 @@ def parse_options():
                      "continue.")
 
     if args.commit:
+        if args.commit.startswith('HEAD'):
+            sys.exit("The --commit option can't use the HEAD ref")
+
         args.find = False
 
     if args.ignore:

base-commit: 087e856cfb76e9eef9a3a6e000854794f3c36e24
-- 
2.25.1

