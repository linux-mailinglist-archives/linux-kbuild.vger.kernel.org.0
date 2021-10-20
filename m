Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC67435166
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 19:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbhJTRiP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 13:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbhJTRiL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 13:38:11 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08816C061760
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 10:35:57 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id i5so10412256pla.5
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 10:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZU0CzHjZqgy6QBSitXFMa80Tv4uRu9MQakGYwJwWt/U=;
        b=c6/cMfcgmDu7wrlCQvkpDnTEMcB3eyHmy62eHknNhqrmqzlwOZwdWcXSX9tRwwE3op
         fP2y06G96MaP2Ka2jb/Rn6u9NmzO7uLEN6qF27gCbesZmxDI2NHrgFQBks3jAUr/nZAu
         JK4SGunKgL1rU6EcSiEGGAJZlSsVfQLBQ/tWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZU0CzHjZqgy6QBSitXFMa80Tv4uRu9MQakGYwJwWt/U=;
        b=pcd+Xsri30WtweiUV2mXWmqeE9vFeDUNzhBdZQOZamNzGrslPq845oc2NAbSCFeSf3
         3F60Bz8605hLBi3gz5G8Rns1tVLFUWNBpntWvP3WdzeBQqWMexjQ6I8Ms1uGatofjI7V
         LDQXsv8JmlAkzuL4/7EaLjMCONDODzm5pStAzhgWQ00OVJRcHLgmqQ1YXVR9xqUSNdIy
         z3nstpev6S2oPEqc+TeuPpKcWrRW1jyX+NFsYDEuqEExFBjjf7sDIjPFXO06N7BJg6it
         sEKCTYLFAwtlbeplnoyiPtur7He3EykKUMroZW36xsQUTGAOMxbMKPD1SCeGUSioFURK
         k8Hw==
X-Gm-Message-State: AOAM531Kxaj+dD2K4PqBa3rFGgj/wJGXzPKhM9a+Plmzr0Syh9qj5MYe
        +dwSZRkyokZiyRlqk+vEZsJZCw==
X-Google-Smtp-Source: ABdhPJwxjmhxwtVVhnG5Cb8sIy1txSJ6l+QOFPga02mOtLur2dPGRmtusTkXH+R+HEi53dWe8AXdEg==
X-Received: by 2002:a17:90b:193:: with SMTP id t19mr379663pjs.95.1634751356548;
        Wed, 20 Oct 2021 10:35:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id np17sm7409475pjb.7.2021.10.20.10.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 10:35:56 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Dan Li <ashimida@linux.alibaba.com>, ardb@kernel.org,
        ojeda@kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-security-module@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH 0/2] gcc-plugins: Explicitly document purpose and deprecation schedule
Date:   Wed, 20 Oct 2021 10:35:52 -0700
Message-Id: <20211020173554.38122-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; h=from:subject; bh=rdx4CuMikFQKdDYacNmYRAtQ562gbZptpLcWVVcwDAE=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhcFN5/5kSB2NJMC2aEHhmi3yPJdBz+zDw+3m8KEeg m983EFKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYXBTeQAKCRCJcvTf3G3AJqwKD/ 9khEyOKqNaPmZpfVsYUuLt2y7ALxocah3HA2haUyFnlB81apI0SsajBZi6tgC082BM5qHGYqI8afAm Bg81+ba4xE49vEKcGRspCo6Ij9jeh3qQ6FcVd7dntdxA7LL0ekxsNoUAlA35Z3+OxIMf7TdJpJABf3 vFXZT7+1t+dLVniAlFofflTQm/XHHrtCQNR5fPXf2SODdkIf/x96d7bpN8i41dEskVhxkr5Kdv1qyZ tvn13GszbxhF2LXKCaMrFOR26zL+U10R3KIM/jJ6BeWrEXL9pnmJKwFubiRrM8KtcUZaE8w3er6AMe +Nh8V6KZYhrG1oDWiInARmtvNqXaxeegCVWj8OmwNgqAONjNd6W1hsb+8NFdpbA2zYplorO411l8rI 7HWi0FOrNKWCM1n3Y+JlXltxyhouc1ylTtAo0gWndrpaUnpBrkCato8gNL+9AQ602oIJGLhxLTfJwc tIq41BEDdUjXHnUp8r4mAl4H+GaEA5ob/aoZ0Eina3L58wnCbb4yKe8OmaF0y1qXxrxXUXKM89Hc6G cewD2LImYRLJ/oCcFEBnIRCu1GFnbcdlq5RY9gnCNfIQNQeutoZkLO7iYI2cB5sh/cBkGi99+RaxQ4 y76eOiibdFC6dmg0NuvgbQ1lLPH/6o/hseGJ49cqX6tC25gQpPQJawR5i2fA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

GCC plugins should only exist when some compiler feature needs to be
proven but does not exist in either GCC nor Clang. For example, if a
desired feature is already in Clang, it should be added to GCC upstream.
Document this explicitly.

I'll put this in -next unless there are objections. :)

Thanks!

-Kees


Kees Cook (2):
  gcc-plugins: Explicitly document purpose and deprecation schedule
  gcc-plugins: Remove cyc_complexity

 Documentation/kbuild/gcc-plugins.rst        | 28 ++++++++-
 scripts/Makefile.gcc-plugins                |  2 -
 scripts/gcc-plugins/Kconfig                 | 20 +-----
 scripts/gcc-plugins/cyc_complexity_plugin.c | 69 ---------------------
 security/Kconfig.hardening                  |  9 ++-
 5 files changed, 34 insertions(+), 94 deletions(-)
 delete mode 100644 scripts/gcc-plugins/cyc_complexity_plugin.c

-- 
2.30.2

