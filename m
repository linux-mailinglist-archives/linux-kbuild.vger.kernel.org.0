Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48E528B1A8
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Oct 2020 11:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729436AbgJLJgb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Oct 2020 05:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgJLJga (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Oct 2020 05:36:30 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A379C0613CE
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2020 02:36:27 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id c21so16259131ljn.13
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2020 02:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=Zj5mMUtLNYo6oAEdM0gEHJSI5IliC+fkGXCu4CaHdAY=;
        b=xFQVbgMlMheXwcgkBRO4AUEotBNvO6aghBndfe/QC2hUoGDcYBmALVlU5fudd+qi9Q
         EN5ev7Ul0Vsipj0qPIHIFH7i9XQJbSxDgd5xqmUhSEO3n/W73cJXFKc6YdSX3Z99QzCe
         I9KqOln2kiaJPL5FmdBMk+cprHLdfbtigSsTBUYOxGg+bpf8VT4qNOcjRi18wFIPf0ko
         35JfHeFfRWP5tN25YaHfXE6JDw0M/kV4jGwxdFW+nzvXOelgW8B/wAgpVO71I6XjAT2b
         yu/NPLkbJIj3X9TjZbb6JJOHARb+THs9BqrKdGcgEG+gAmxX8e3dGozlpA4EzsZTBzIc
         LnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Zj5mMUtLNYo6oAEdM0gEHJSI5IliC+fkGXCu4CaHdAY=;
        b=MwIK9vK069Do/TaMdS1SdAykSV4eiPJEll5Ods8m51WA66D5k20lkNKJqjQgMinK3/
         2oRX4ZjiQBKtrKK7ln48uza0Ziw62J/aPfyvd7os1/AISDfcAAE3/d4tuUFt4hXdmqLX
         NsJ3tON7xR7akSm86oJGmMrEw+wkJ99ee6oks4vYLWi6qkdJhig9pr7DSKmkfZeVM1S8
         ht6VaiIbtVXljxQZqTKI2pHzJlxrV4o9MdIARnFLNHr0KgT15F6ji7fFuJzntKicYBgh
         K3OQg5NxZnHeZbXOqsPEf1QJxuzmSlVzU70A9lY0lssICPafkd0/a2WttrezLC2Sg8FG
         UNDw==
X-Gm-Message-State: AOAM530NcIrrVvtcVZQ5MI3+MYaI5g772pfmH2M1J6LqnKSfl7X4Eah4
        zjHkrtm9N19dzISbJrUqaMDR6g==
X-Google-Smtp-Source: ABdhPJwTr3UpgMO12GTqbOpxI38civjCg5KJi70qaTHruvA2YNKjuiYVr9n04EcQv2AnkSeTB2RGhw==
X-Received: by 2002:a2e:50d:: with SMTP id 13mr9492263ljf.195.1602495385226;
        Mon, 12 Oct 2020 02:36:25 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.gmail.com with ESMTPSA id f10sm3826846ljn.87.2020.10.12.02.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 02:36:24 -0700 (PDT)
From:   jouni.hogander@unikie.com
To:     linux-doc@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org, corbet@lwn.net, masahiroy@kernel.org,
        dvyukov@google.com, Jouni Hogander <jouni.hogander@unikie.com>
Subject: [PATCH] Documentation: kbuild: Add initramfs into reproducible builds document
Date:   Mon, 12 Oct 2020 12:35:30 +0300
Message-Id: <20201012093530.10690-1-jouni.hogander@unikie.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Jouni Hogander <jouni.hogander@unikie.com>

Initramfs configuration has impact on build being reproducible

Signed-off-by: Jouni Hogander <jouni.hogander@unikie.com>
---
 Documentation/kbuild/reproducible-builds.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
index 3b25655e441b..559700531a48 100644
--- a/Documentation/kbuild/reproducible-builds.rst
+++ b/Documentation/kbuild/reproducible-builds.rst
@@ -119,6 +119,14 @@ To avoid this, you can make the vDSO different for different
 kernel versions by including an arbitrary string of "salt" in it.
 This is specified by the Kconfig symbol ``CONFIG_BUILD_SALT``.
 
+Initial RAM Filesystem
+----------------------
+
+If ``CONFIG_BLK_DEV_INITRD`` is enabled and ``CONFIG_INITRAMFS_SOURCE``
+doesn't contain gzipped cpio archive, an initramfs is generated during
+build. To avoid this provide gzipped cpio archive via
+``CONFIG_INITRAMFS_SOURCE``
+
 .. _KBUILD_BUILD_TIMESTAMP: kbuild.html#kbuild-build-timestamp
 .. _KBUILD_BUILD_USER and KBUILD_BUILD_HOST: kbuild.html#kbuild-build-user-kbuild-build-host
 .. _KCFLAGS: kbuild.html#kcflags
-- 
2.17.1

