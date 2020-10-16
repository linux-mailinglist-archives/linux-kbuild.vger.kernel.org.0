Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED632905A0
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Oct 2020 14:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395411AbgJPM7Q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Oct 2020 08:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395342AbgJPM7Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Oct 2020 08:59:16 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0BEBC0613D3
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Oct 2020 05:59:15 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z2so2778270lfr.1
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Oct 2020 05:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QskU2jKYuIV2PkAqqrC1eswLmoY8gP4EeJ4XVgA384U=;
        b=ZpEn7SMYQ0e9QC6e95fu3NR7MthennBKxsk3Fl0+ciAfQXNuTv8fy4zehey7SOQgKP
         WYopCS+rp8JhNMtzs0AooHaPVsCuE93euAmm2sPCI8YVI0bhl7GBSjRrppIQD7saDx0/
         VPtlAxJQfvY4jBAVqxRlna9cbFcTAXaSkjN50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QskU2jKYuIV2PkAqqrC1eswLmoY8gP4EeJ4XVgA384U=;
        b=ZDHfK2o8DSzw3R6d93OvjjLyhwHEcooRxHaJXTDqYlmqo+RJybD8hgVzLZ2jv9IYTM
         H7YTW4bA4rWe5D8EZ99Kt7pPbyG9AGHvv/FNtatCxP40i2v0LJG8mFqch/+r+lEW6Srl
         fDJjDS9xOPYwa18b3LerPa5vdFk5AjP5PbfpY2/fz2DQgSKAFIJthVqDyYuyCGsV/z9O
         v4Q4l4Tve9a8JvBdE5XwLvQJA9AUSIKaTXBMD91wP1DPK/JUUWl7lEwvCZEz/x3Ndn5i
         V/ub/36B8rpIwMWTOWiQl+8AgAH5HeTBArJfx4+M1pjjeW+RzygkBk4DlvRB2Ju17gct
         5wnA==
X-Gm-Message-State: AOAM5332vVE5tqpE0d4rbPUt7eq+I+aviKlwNeG2vICBHbYxs6LK/ksi
        7KhSlIZMYsH+Tonpp8YSe6ToRKoOShq51uRV4Bw=
X-Google-Smtp-Source: ABdhPJwPL4sxJoqOIIX6rp6HWa59jbRSOvCsoIA9bVDjugS20ljvbzOaZ+HGlVq2ZgN5Et3xkspxXQ==
X-Received: by 2002:ac2:4dad:: with SMTP id h13mr1344981lfe.351.1602853154334;
        Fri, 16 Oct 2020 05:59:14 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id v4sm802467lfn.6.2020.10.16.05.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 05:59:13 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Kbuild.include: remove leftover comment for filechk utility
Date:   Fri, 16 Oct 2020 14:58:46 +0200
Message-Id: <20201016125846.8156-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

After commit 43fee2b23895 ("kbuild: do not redirect the first
prerequisite for filechk"), the rule is no longer automatically passed
$< as stdin, so remove the stale comment.

Fixes: 43fee2b23895 ("kbuild: do not redirect the first prerequisite for filechk")
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 scripts/Kbuild.include | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 83a1637417e5..08e011175b4c 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -56,8 +56,6 @@ kecho := $($(quiet)kecho)
 # - If no file exist it is created
 # - If the content differ the new file is used
 # - If they are equal no change, and no timestamp update
-# - stdin is piped in from the first prerequisite ($<) so one has
-#   to specify a valid file as first prerequisite (often the kbuild file)
 define filechk
 	$(Q)set -e;						\
 	mkdir -p $(dir $@);					\
-- 
2.23.0

