Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C33C3EDE8A
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Aug 2021 22:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbhHPUV5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 16:21:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:53882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231203AbhHPUV4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 16:21:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91D4C60EE4;
        Mon, 16 Aug 2021 20:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629145284;
        bh=qGJV1Mh6XW8/olRerNEsJb0Qw8ULXjJ4v5IofuIlKRc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KmgZBT6a4HERZoWyIfVQh+jv8irgAQxJ0ZYRAybbunCV30rLZjHhjhqm2HOhxZ6T0
         bRYyR440M7Vs+zQz3gtZ0sbLuxJtSOic4pYXq/jrjZmrpMMAWQloAZAQ68N+z13b78
         8TCW8sn08i4iTWjzJtBi6TJInEYBIDjp7Fi/LoAhjovP+Rt3AHxv5Nu3OV+xETcMI4
         BsUJKt6DSSc/GrKyMk2mi7Ddw9IXNZOhWMU5rkWDfJgOS4LYLjjIwHoyO+klbC5G4N
         kyiWd2PuX7nbkle9B1zR0Q7mp0ROYl1sbZyxUS6ZhgCqoJuR7Rl+y3b4kDX+e/5FWw
         u3Dlj0u7gMq/A==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 2/3] kbuild: Add a comment above -Wno-gnu
Date:   Mon, 16 Aug 2021 13:20:55 -0700
Message-Id: <20210816202056.4586-2-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.rc2
In-Reply-To: <20210816202056.4586-1-nathan@kernel.org>
References: <20210816202056.4586-1-nathan@kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Whenever a warning is disabled, it is helpful for future travelers to
understand why the warning is disabled and why it is acceptable to do
so. Add a comment for -Wno-gnu so that people understand why it is
disabled.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 3900f5824721..07b76274396e 100644
--- a/Makefile
+++ b/Makefile
@@ -777,6 +777,7 @@ KBUILD_CFLAGS += $(stackp-flags-y)
 
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CPPFLAGS += -Qunused-arguments
+# The kernel builds with '-std=gnu89' so use of GNU extensions is acceptable.
 KBUILD_CFLAGS += -Wno-gnu
 # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
 # source of a reference will be _MergedGlobals and not on of the whitelisted names.
-- 
2.33.0.rc2

