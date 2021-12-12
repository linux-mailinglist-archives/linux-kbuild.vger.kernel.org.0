Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E95AD471C97
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Dec 2021 20:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbhLLTbF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 12 Dec 2021 14:31:05 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:25068 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbhLLTbD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 Dec 2021 14:31:03 -0500
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 1BCJTqAu000552;
        Mon, 13 Dec 2021 04:30:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 1BCJTqAu000552
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1639337401;
        bh=UTYKGj88xYToscrUiygI8mCc6KISWEtozuMy+fS5oOs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KCgeTjseCnfEnf23cAtZpH+SF1PG0fz94Jpmlvqj0rdXjFDYgkDHcMXziM2yJ5H21
         +OYWsJWkMJ187PTnH0UP5p7uAKOYtcKcoerV0vpo0c9t9qUwEbs4rrOkS5rJYG+sYf
         mkKieUCPcYuxbhuxivVDGd+X2o/4hrxMfLJMWwuWuzD7UWHiRiP4Fg9ADWzlYaXOHV
         x/lNyL9ESqR48kcOllow/sxJoe/pOJm7CsPi4al9IU45pr30i+AjJCHoaoWq695NSx
         9yPDuUtXA/f3GK8vm3c6nuDktGb8/IUPNxHXb+AuYFQ+fcr6z/lW50RN/FaDO/b3YE
         CtJ9/RihBpFYQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Michal Simek <michal.simek@xilinx.com>, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 10/10] microblaze: use built-in function to get CPU_{MAJOR,MINOR,REV}
Date:   Mon, 13 Dec 2021 04:29:41 +0900
Message-Id: <20211212192941.1149247-11-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211212192941.1149247-1-masahiroy@kernel.org>
References: <20211212192941.1149247-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use built-in functions instead of shell commands to avoid forking
processes.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/microblaze/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
index a25e76d89e86..1826d9ce4459 100644
--- a/arch/microblaze/Makefile
+++ b/arch/microblaze/Makefile
@@ -6,9 +6,9 @@ UTS_SYSNAME = -DUTS_SYSNAME=\"Linux\"
 # What CPU version are we building for, and crack it open
 # as major.minor.rev
 CPU_VER   := $(CONFIG_XILINX_MICROBLAZE0_HW_VER)
-CPU_MAJOR := $(shell echo $(CPU_VER) | cut -d '.' -f 1)
-CPU_MINOR := $(shell echo $(CPU_VER) | cut -d '.' -f 2)
-CPU_REV   := $(shell echo $(CPU_VER) | cut -d '.' -f 3)
+CPU_MAJOR := $(word 1, $(subst ., , $(CPU_VER)))
+CPU_MINOR := $(word 2, $(subst ., , $(CPU_VER)))
+CPU_REV   := $(word 3, $(subst ., , $(CPU_VER)))
 
 export CPU_VER CPU_MAJOR CPU_MINOR CPU_REV
 
-- 
2.32.0

