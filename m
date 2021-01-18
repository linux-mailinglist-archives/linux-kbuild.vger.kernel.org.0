Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683962F9769
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Jan 2021 02:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730175AbhARBum (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 Jan 2021 20:50:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:44870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728797AbhARBul (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Jan 2021 20:50:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 296D7221EC;
        Mon, 18 Jan 2021 01:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610934601;
        bh=2xY1SDcXwe8h3cNIziDRYHUY8j+9/GBjVqS1Yo971f0=;
        h=From:To:Cc:Subject:Date:From;
        b=tsAxnnon9LaPjxr6X0RLTMXigX/7XztIQ0kS+Hx/icvhUSq5o42FkQE482E+f2iPf
         6Vyab2N841fn8L5aORr/bC7m/Jeiv54gmDLOFERKsJ5T7YbepE08fmOnFu7Mb2iYFR
         y/Lgn4q/9GRSiq4XIMM0SouHigkGgNZOXuzn+z/TLY+j/oWSTk8hiWaVWOyi1stl9h
         tz1Et8rskOJDqC6jG3gZpUlTCYVk784flJpQP5gsCIuPGerI2pb6F/4k7CID+D0fDf
         kogTkzu2hoq46586DeXg6K/YeqQKg5N2qaa1kRe2rJH8cQGUA/PSR2VHba0UNNuIN0
         qZpw+yOEZ0bMQ==
From:   Sasha Levin <sashal@kernel.org>
To:     masahiroy@kernel.org, michal.lkml@markovi.net,
        torvalds@linux-foundation.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, Sasha Levin <sashal@kernel.org>,
        stable@kernel.org
Subject: [PATCH] kbuild: give SUBLEVEL more room in KERNEL_VERSION
Date:   Sun, 17 Jan 2021 20:49:51 -0500
Message-Id: <20210118014951.250815-1-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

SUBLEVEL only has 8 bits of space, which means that we'll overflow it
once it reaches 256.

Few of the stable branches will imminently overflow SUBLEVEL while
there's no risk of overflowing VERSION.

Thus, give SUBLEVEL 8 more bits which will be stolen from VERSION, this
should create a better balance between the different version numbers we
use.

The downside here is that Linus will have 8 bits less to play with, but
given our current release cadence (~10 weeks), the number of Linus's
fingers & toes (20), and the current VERSION (5) we can calculate that
VERSION will overflow in just over 1,000 years, so I'm kicking this can
down the road.

Cc: stable@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9e73f82e0d863..dc2bad7a440d8 100644
--- a/Makefile
+++ b/Makefile
@@ -1252,8 +1252,8 @@ endef
 
 define filechk_version.h
 	echo \#define LINUX_VERSION_CODE $(shell                         \
-	expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 0$(SUBLEVEL)); \
-	echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))'
+	expr $(VERSION) \* 16777216 + 0$(PATCHLEVEL) \* 65536 + 0$(SUBLEVEL)); \
+	echo '#define KERNEL_VERSION(a,b,c) (((a) << 24) + ((b) << 16) + (c))'
 endef
 
 $(version_h): FORCE
-- 
2.27.0

