Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C7B2A0BEF
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Oct 2020 17:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbgJ3Q4S (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Oct 2020 12:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbgJ3Q4R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Oct 2020 12:56:17 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66BF9C0613CF
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2020 09:56:17 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id v4so7412274edi.0
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2020 09:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bJmUqHliwDf+v+2v8jHmqj+HKvfb00c+QEwMxqXzHHk=;
        b=jL9pPh3gCZ402gpfrWOS7KQMVSqLsQHX9fStIHbXf8OO1B3MtkJ46wAIiZxmTBwd1J
         Dexa0ROJK5lnpOtDz0Ozh8RWPa3CCjeR0cQzwmTKrARoUNi2SUfwFWsGCNUwFYLkoM9e
         RPiMgN6pudoZeGVwBj8ZrXeWkprYzjNCPIGWM9H4SBgzRv3VurywbKxj8eOBI7d8B5fd
         a0j7TOmZqXWzq+JJ287Sn662ObBEXSXfJd4Jt4YqWospi9yePjIbP3RdGZUMsZJyK0Q+
         EQUL8prXVxU6ZbT6zQ1pgsyHh4dSfA4Z3+SBKv1UhBC+rze6Lrq/mIwXkk2p4wTOi1/O
         F1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bJmUqHliwDf+v+2v8jHmqj+HKvfb00c+QEwMxqXzHHk=;
        b=S6WDkW67IRIG/FsdwLUOgHwh3Vzj+BuPYxKosRimuqV7OLTGoMwYpQTGKDPUE9yjM8
         iUUE3Xh9TF+pwk/bgaxV88S1ED2dBLJ3B9rU+E0lAWAAMOC7Y0rCMMeMZXNJn4ns73vC
         HTIIS/Lfu6m74qrPgQeNN2+iKZzQioH6fAROKnrKVI+/4vYB8m4K1TMRXxPox/xzfDV+
         fD4RFjZcGvlUgu7rGmhobJnsezv9WbHVa4yk4ViLoY7X99iwn5ckjdlsMzG4UWL8dN2P
         EjVH8UNAE3ITka0NUGAZFUoXCM66cREmlToSK5StutNQfBFEni/RVdMH1NSQBI0C9N9B
         xlCg==
X-Gm-Message-State: AOAM531GKHus6eTFLi6wbfDt01dMPrkH0kLEMqckYpJoKJCQmGGslunm
        YrFoIjarHyF6/jHkX7efDdUcrJ2ep/7AAw==
X-Google-Smtp-Source: ABdhPJx05bar/zfvFTvExZ8aMchUU3eCj1vNd075yuMbTaTkc0sVxaAwAHUysL+SFvH+LE17i9PxNQ==
X-Received: by 2002:a50:f190:: with SMTP id x16mr3353583edl.292.1604076976019;
        Fri, 30 Oct 2020 09:56:16 -0700 (PDT)
Received: from localhost.localdomain ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id c14sm3290323edy.13.2020.10.30.09.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 09:56:15 -0700 (PDT)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Guillem Jover <guillem@hadrons.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH] builddeb: Fix build on non-Debian/Ubuntu distros
Date:   Fri, 30 Oct 2020 17:56:07 +0100
Message-Id: <20201030165607.290612-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.27.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This fixes make bindeb-pkg for RPM based distros, which don't have
dpkg-dev (and thus not /usr/bin/dpkg-buildpackage), which sets
$DEB_RULES_REQUIRES_ROOT.

Fixes: 3e8541803624 ("builddeb: Enable rootless builds")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

I admit not many people compile kernel with bindeb-pkg on  RPM based
distro, but it'd be nice it were working.

openSUSE has most of other required packages, although there are some
missing dependencies, thus DPKG_FLAGS="-d" is needed.

Kind regards,
Petr

 scripts/package/builddeb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 1b11f8993629..287e4bbd222c 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -37,7 +37,7 @@ create_package() {
 		| xargs -r0 md5sum > DEBIAN/md5sums"
 
 	# Fix ownership and permissions
-	if [ "$DEB_RULES_REQUIRES_ROOT" = "no" ]; then
+	if [ -z "$DEB_RULES_REQUIRES_ROOT" -o "$DEB_RULES_REQUIRES_ROOT" = "no" ]; then
 		dpkg_deb_opts="--root-owner-group"
 	else
 		chown -R root:root "$pdir"
-- 
2.27.0.rc0

