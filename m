Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 432953A4F37
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jun 2021 16:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhFLOUu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 12 Jun 2021 10:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbhFLOUu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Jun 2021 10:20:50 -0400
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D1EC061767
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Jun 2021 07:18:50 -0700 (PDT)
Received: by mail-ed1-x549.google.com with SMTP id y16-20020a0564024410b0290394293f6816so299eda.20
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Jun 2021 07:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=xb2QAx7zepAh/lQE/CJVc+d/CGuwmfQ6M6AYYspdx1I=;
        b=Pn1g/j4Q/Ps8hO/Wv4OvCFaicBjrttTarkv+9pOFkNnWNh42V8bddGeTBrO7Vlw5cg
         4Re/hLQOA9OFtL8OPulFNerctA3fi6rLZzfhwueqHLWuSSMio0KiWvt527JC1LgSqsb2
         0BGa8BtMC9LNQROvUh4K4i3i8r4C1wLe3tGLLQZbGZvaVLEyjSIUSe0t+qtRBffeeF7d
         kfctmL+xofvpBMsrn7fJkFCk7I4CIOn2L3ofNk9TRXWSYNS8is69W9dcKsEkIRQAK7FU
         5Nr9P35dYmK7LOYSRj8fb1RokC30zVaHTZQ5vy0hjLOghItjI4u9ECqBDv2AxmgW5+3h
         +T0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=xb2QAx7zepAh/lQE/CJVc+d/CGuwmfQ6M6AYYspdx1I=;
        b=KQ120h8ffN+9NKpNuFRRiay5E0yLj1FUdro6JCxRR7LmnIcKx1ODfQBBjOSesMJ4mo
         QcazvZDwocP0Ma/wgZYjGw6zl7WIsKOyFbQ4MlYwG56mfskhRxCosCfP+/+ez5CoKLFu
         /Ads6ez3k+p2X6GxhlwXWzUXfJPaZNFb+jmnHB6HuL1zDPF1hEEmKN9pyg0lWZv3W5ao
         2WJG4AV16dcDpWuk+Ml5DUIvLk+nXgXlBWntbl1dBXPu2gjU+7ytXEUyVn5IVH3O28gW
         djnwBug97OEK+vgwk9id+HtQtqII8UDB2SMpBP4K5UKxcsDb3GtGje+KpHMH525QKHCS
         fu2Q==
X-Gm-Message-State: AOAM5305+tBGoGaWd3yRd4DLmTPE6s7/tOYEoFDF6VBy+yPDaEi3XW8F
        g61D8hOAhBT/xj0kW/ba4yFk1pwthx0tqg==
X-Google-Smtp-Source: ABdhPJxV4Tljny9btCWJBH1v2SI+ztKhUT2tTQK+HNQFAwxoBsiqTJfeNy9EcbO/TEDFQfbxpoi5va0A06egsA==
X-Received: from lux.lon.corp.google.com ([2a00:79e0:d:210:f276:1917:882e:b90d])
 (user=maennich job=sendgmr) by 2002:a05:6402:1458:: with SMTP id
 d24mr8742698edx.85.1623507525727; Sat, 12 Jun 2021 07:18:45 -0700 (PDT)
Date:   Sat, 12 Jun 2021 15:18:38 +0100
Message-Id: <20210612141838.1073085-1-maennich@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
Subject: [PATCH] kbuild: mkcompile_h: consider timestamp if
 KBUILD_BUILD_TIMESTAMP is set
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

To avoid unnecessary recompilations, mkcompile_h does not regenerate
compile.h if just the timestamp changed.
Though, if KBUILD_BUILD_TIMESTAMP is set, an explicit timestamp for the
build was requested, in which case we should not ignore it.

If a user follows the documentation for reproducible builds [1] and
defines KBUILD_BUILD_TIMESTAMP as the git commit timestamp, a clean
build will have the correct timestamp. A subsequent cherry-pick (or
amend) changes the commit timestamp and if an incremental build is done
with a different KBUILD_BUILD_TIMESTAMP now, that new value is not taken
into consideration. But it should for reproducibility.

Hence, whenever KBUILD_BUILD_TIMESTAMP is explicitly set, do not ignore
UTS_VERSION when making a decision about whether the regenerated version
of compile.h should be moved into place.

[1] https://www.kernel.org/doc/html/latest/kbuild/reproducible-builds.html

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 scripts/mkcompile_h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index 4ae735039daf..a72b154de7b0 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -70,15 +70,23 @@ UTS_VERSION="$(echo $UTS_VERSION $CONFIG_FLAGS $TIMESTAMP | cut -b -$UTS_LEN)"
 # Only replace the real compile.h if the new one is different,
 # in order to preserve the timestamp and avoid unnecessary
 # recompilations.
-# We don't consider the file changed if only the date/time changed.
+# We don't consider the file changed if only the date/time changed,
+# unless KBUILD_BUILD_TIMESTAMP was explicitly set (e.g. for
+# reproducible builds with that value referring to a commit timestamp).
 # A kernel config change will increase the generation number, thus
 # causing compile.h to be updated (including date/time) due to the
 # changed comment in the
 # first line.
 
+if [ -z "$KBUILD_BUILD_TIMESTAMP" ]; then
+   IGNORE_PATTERN="UTS_VERSION"
+else
+   IGNORE_PATTERN="NOT_A_PATTERN_TO_BE_MATCHED"
+fi
+
 if [ -r $TARGET ] && \
-      grep -v 'UTS_VERSION' $TARGET > .tmpver.1 && \
-      grep -v 'UTS_VERSION' .tmpcompile > .tmpver.2 && \
+      grep -v $IGNORE_PATTERN $TARGET > .tmpver.1 && \
+      grep -v $IGNORE_PATTERN .tmpcompile > .tmpver.2 && \
       cmp -s .tmpver.1 .tmpver.2; then
    rm -f .tmpcompile
 else
-- 
2.32.0.272.g935e593368-goog

