Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD2733A2A6
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Mar 2021 05:34:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbhCNEdo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Mar 2021 23:33:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhCNEdP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Mar 2021 23:33:15 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57878C061574;
        Sat, 13 Mar 2021 20:33:14 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id b130so28588669qkc.10;
        Sat, 13 Mar 2021 20:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GSDyMIHvfICnzMowC3kdAgz3ihnvPdnoV84yIK3Yoig=;
        b=FlFPiML708pbhmfkgDJv6E+VVKxyqP9FmDznY1d5kfsDbRvxLDs4FDvuhOPnIXWENv
         0OOS9io335+d8tW0i1S+rJDxs7zLpa6oQcxuQhhxSPed81JRER7/Ztx1D1x8iEMqAu5d
         C4zkS7rmV5pY0AfIXTj8smY3G7ArPa3yd6ZUKL1rWCq4d6rnp34xJMxmOMLsKbH/3BTj
         nCE7EEGG1gaq2r28YIfUcwEd+PVYpbLV7JehdiMRtuF8xyC3h4pH4E+TKn69u8jArmqf
         ezusogsTeAf1BkaYIju47G4hytNAwtrDPKkjY8m4IPcGKblNFKxNnbW1wXR6DcbsN39N
         b/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GSDyMIHvfICnzMowC3kdAgz3ihnvPdnoV84yIK3Yoig=;
        b=DoKrnvdob7BYn7jzAm90+jns7jLngcK9u6I4Whm3R59S6Y9EW5j48FDPWJloHqLs9M
         ZfFJHZlXRSCQtzkLmyeV3xznPVpFCkgt1oXX/N+AnhttHGY7nUmS7p4u3Z9XNjYI7LFM
         Nyeo6ISD1vKO4SIr3EmiH5WMQqtpioA+E2jrvaRzRBn77/W568rIuhhvR0QzlE8bupS/
         dAxlT2+g3Vm6NvRaMU9J1tZpiOSFiSEKEUUYaAB2GG8H5a0z4AvEnKhRjmqHNhOpzhOB
         JkKz/v/m6z05fQ4BrnY8rrRxyOIc7Y0WNo+GqYSffTmLgRemvdu4lQJC6wRhvhCKIBjV
         ZoLA==
X-Gm-Message-State: AOAM532swn7r3bLiFrCPHnwLaNlwJENdZG1eMiLtDtsBjGTb8EjBDyCb
        Y1g2OC7alLaIyZgaHKCWh4g=
X-Google-Smtp-Source: ABdhPJyjsi6FJ+CFAbUneWRYN6gBrSJqx5rJqtEjXn7nnlZ3wV0wRhSwzBTDiMigKyzqSXCVLMLpzQ==
X-Received: by 2002:a05:620a:10a7:: with SMTP id h7mr19008403qkk.402.1615696393404;
        Sat, 13 Mar 2021 20:33:13 -0800 (PST)
Received: from localhost.localdomain ([37.19.198.30])
        by smtp.gmail.com with ESMTPSA id a14sm7397459qtw.80.2021.03.13.20.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 20:33:12 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     masahiroy@kernel.org, michal.lkml@markovi.net, corbet@lwn.net,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] docs: kbuild: Fix a typo in the file Kconfig.recursion-issue-02
Date:   Sun, 14 Mar 2021 10:00:44 +0530
Message-Id: <20210314043044.15926-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


s/sematics/semantics/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/kbuild/Kconfig.recursion-issue-02 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/Kconfig.recursion-issue-02 b/Documentation/kbuild/Kconfig.recursion-issue-02
index df245fd7670d..0034eb494d11 100644
--- a/Documentation/kbuild/Kconfig.recursion-issue-02
+++ b/Documentation/kbuild/Kconfig.recursion-issue-02
@@ -6,7 +6,7 @@
 # make KBUILD_KCONFIG=Documentation/kbuild/Kconfig.recursion-issue-02 allnoconfig
 #
 # The recursive limitations with Kconfig has some non intuitive implications on
-# kconfig sematics which are documented here. One known practical implication
+# kconfig semantics which are documented here. One known practical implication
 # of the recursive limitation is that drivers cannot negate features from other
 # drivers if they share a common core requirement and use disjoint semantics to
 # annotate those requirements, ie, some drivers use "depends on" while others
--
2.26.2

