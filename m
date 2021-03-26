Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E432034A162
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Mar 2021 07:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbhCZGEC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Mar 2021 02:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbhCZGDi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Mar 2021 02:03:38 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BBDFC0613AA;
        Thu, 25 Mar 2021 23:03:38 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id dc12so2427253qvb.4;
        Thu, 25 Mar 2021 23:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2sfr4hExZy4cx0ouCeLlyomeO4M216nQVgJEvZeOzss=;
        b=CgU+XOHWDoktbsPsp/AmFOyF3xoWeSqD4QaK1J6aQsbBrL9BpBezStUi2Z4ZLVTAKm
         HuDSi4qNxj5pVxKUXT7pG+yaITG6JbOKXCdkE+a66+khENAWOgTYDhauuazl5SE3RbQ5
         5kT8d319RB+fr5QVSPhaxlt09Bc0vJtPhk2542+ItkBVTmotj17XeSKLz8Mi7tsqUsls
         neBNOYKw1UJMbPGhgAD/rRcK2EkapV3mfvD4HMe7H12hLucyhRDQLvBUixBoZwP12xMT
         WZHM9haSht1lhwqWUu8oSwUodHiZTFZUkuB0kRSyN/T9hUzWEpntTpzypgrLgnIpaCcp
         pAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2sfr4hExZy4cx0ouCeLlyomeO4M216nQVgJEvZeOzss=;
        b=CJu1NUfU2ue+39GZISg/q4Ldz8buB8NxiA/xjU3fa2Fp1xoM3sGtorK0tj/ltv4LEm
         /bVTbfY8lHdjfFe0DGKfrWeLMtsFavBzcAOgnTVpt8TuymYF5hc7XjI4MwePx5pyRi3c
         x3pqucuoL49eiwsR0ypxF5/0LH/8cqVb+t5t6OX3/pV3Rrb6Agb6mTO32USCoEAcgLj3
         bRVHDGqZBpyzXB7ISL6q+gkLg4aKNVjKf/7RcUY90E/c8MGbl5YWQybzhPm6yGWop6JI
         Fxh2bMMIWYiTdkRF9res8mPaay/gzZq/9HfoS3b6bhygqiZCjoe10WBDlM+pXcnUwmjk
         fm1g==
X-Gm-Message-State: AOAM533aJFvGRZsW2HPAC95Z/RdXET9IaMq7BlGwXcWCj6A3GeclaKAz
        nFNUerfth1SVctQ8Bu6573o=
X-Google-Smtp-Source: ABdhPJyEhFy5GsWvC0J2rFuMSrT7IiqbNzDcGpB3psJZ8ZKQBTq2XGCgtOsIv5RVCXnWUocXOeF9Zg==
X-Received: by 2002:a05:6214:18d2:: with SMTP id cy18mr11912179qvb.50.1616738617423;
        Thu, 25 Mar 2021 23:03:37 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.107])
        by smtp.gmail.com with ESMTPSA id c5sm6074096qkg.105.2021.03.25.23.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 23:03:36 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     masahiroy@kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] kconfig: streamline_config.pl: Couple of typo fixes
Date:   Fri, 26 Mar 2021 11:31:22 +0530
Message-Id: <20210326060122.25277-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


s/configuraton/configuration/
s/orignal/original/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/kconfig/streamline_config.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 1c78ba49ca99..911c72a2dbc4 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -21,7 +21,7 @@
 #  1. Boot up the kernel that you want to stream line the config on.
 #  2. Change directory to the directory holding the source of the
 #       kernel that you just booted.
-#  3. Copy the configuraton file to this directory as .config
+#  3. Copy the configuration file to this directory as .config
 #  4. Have all your devices that you need modules for connected and
 #      operational (make sure that their corresponding modules are loaded)
 #  5. Run this script redirecting the output to some other file
@@ -481,7 +481,7 @@ sub parse_config_depends
 # The idea is we look at all the configs that select it. If one
 # is already in our list of configs to enable, then there's nothing
 # else to do. If there isn't, we pick the first config that was
-# enabled in the orignal config and use that.
+# enabled in the original config and use that.
 sub parse_config_selects
 {
     my ($config, $p) = @_;
--
2.26.2

