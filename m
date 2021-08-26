Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2833F81EC
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Aug 2021 07:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238522AbhHZFGD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Aug 2021 01:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238579AbhHZFFv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Aug 2021 01:05:51 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA072C061757
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 22:05:04 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id b9so1073973plx.2
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 22:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wUGiyr3xsPMSx8OhiS6MBjOzSMfwTo6qvLGkcomqylk=;
        b=VuCkHMB1VQYEYHJkzyhB8xdSFi/41FiApesXgYjbGWkDN11tFyPl//j/KRsQQ7Sk/A
         7qZISeIo1JmWTDeeGRc0c7xQ4F6rENPHOMaXiguIndpjAg3ZEpFiOdJHfAyhtE13VA9F
         uykbBIW1K7ZzV+Vhg08owYife8lXusB2Xyu0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wUGiyr3xsPMSx8OhiS6MBjOzSMfwTo6qvLGkcomqylk=;
        b=R9mqr+6CYXqc3yDj9pEo6Rrkpnuki3dOOWAMz0o1ziumW44v3rvPxRS+u6vkFfQLXn
         rwl6o3HEMtPBPRsrlTVbqbKkJ7hnPFnF840sl5r4Rc1+/YSuoKFYarQghj7airAzcG4P
         gr8YlrE8je4G0IZGAkufPGriMVXekUu+hbWvjuYUswMvUQSRkD+m2V27W3cW8i1WkECb
         lbIDaKkAAPdefXWNQCzSCxGEhLhOzXvU+5GjLtq1nT48pcogsuGJjH+8dEeYpaYf9Cyi
         m8gXkWUV0mnvzmavkeG2dvn+insDjGqfXIlrDadbfOmWLm2xOEobS7CzNHBFenEsgfTF
         grYQ==
X-Gm-Message-State: AOAM531t3DlN2jlqMqgUHiri3QTRUdLv2R9qhVE9txvlp0cxfprayGw4
        /z2owAQJb/ZkBKxVcFfxKD5FfA==
X-Google-Smtp-Source: ABdhPJzBMb037AO91ukyk99+KaGE+DKvJN8SONVetu+5nq/tlTK7oez3Nf49eU5yT7wDHnTqacSycw==
X-Received: by 2002:a17:902:c406:b0:12d:d0ff:4be with SMTP id k6-20020a170902c40600b0012dd0ff04bemr1932183plk.24.1629954304465;
        Wed, 25 Aug 2021 22:05:04 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q9sm845318pfs.40.2021.08.25.22.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 22:05:03 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Keith Packard <keithp@keithp.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        clang-built-linux@googlegroups.com, linux-hardening@vger.kernel.org
Subject: [PATCH v2 5/5] Makefile: Enable -Wzero-length-bounds
Date:   Wed, 25 Aug 2021 22:04:58 -0700
Message-Id: <20210826050458.1540622-6-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210826050458.1540622-1-keescook@chromium.org>
References: <20210826050458.1540622-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=996; h=from:subject; bh=/SN5+6T3ztIGtswjzUhGWY/cmKXtgVAB5r1vX4FHhD8=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhJyD54PEFBk7l4lz+prByvaAJlFG/Y2kCmVwrumJm JhcDUiyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYScg+QAKCRCJcvTf3G3AJsC+D/ 49jN/M53yldVraoYc8MXwX+Sk0xVJLw9Qx17Lnyh9r2OXIiB2JEcb93t1wS1OG16kMz8j/GBydQ+8t yIoXHSl8ZlclCCmSIWbUx4Mu253gXAui7dX128Y8CVlfbwqYJ5PyQL3nD8vk0yGXDji83kxE/dnHMU lzqNnMfnVFuKcZsyr9Z0NS9srdSXCB58id7DCCMvWwt74oK1+AgsAoZPEQSXT7x0sprmRw5J2Hc4Fg zKoLkK45i59aCgM2HM54A6v3IAs4bNjFEjJa5r+DpOTsGoi+8DtjNaGkbDIuDyq3sS+HnD7wqtKmSX rjczu/Nqle/MLQxSAph5jo/++DPU/A/ErXjAVcsj1rwJsecCmPHahvOOXkGGv+hepMnLvsgGRteZVp JcS8n23cR/Ho92OmB0kwH+/OEQZKZvvBL2uU//nLIkQYtDPkLC0xxUKNUefJCLbIw/4Hc5OzXfuDMB 603YyvtZg4HOMYIxgo7zLishMKI82OUdqZz88YhSLjz9peg+zryh9o9GBxiDg7+u1LgW+DkjcOeldv GSqhSiLqDG51d3OqPJ0MbEIJZxi97MQDw1muzzZMpLHRo/ohkZ985/qVH6xfSzaHputWj5zGC3X8mL j7O8Hs7TGRrWTI6yhMIMv4EfJ74b04ki//kwBq2+YYc8INF6bGgdW1dHGQsQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With all known internal zero-length accesses fixed, it is possible to
enable -Wzero-length-bounds globally. Since this is included by default
in -Warray-bounds, we just need to stop disabling it.

Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8e7e73a642e2..8e732e875e78 100644
--- a/Makefile
+++ b/Makefile
@@ -994,7 +994,6 @@ KBUILD_CFLAGS += -Wno-pointer-sign
 KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
 
 # We'll want to enable this eventually, but it's not going away for 5.7 at least
-KBUILD_CFLAGS += $(call cc-disable-warning, zero-length-bounds)
 KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
 
 # Another good warning that we'll want to enable eventually
-- 
2.30.2

