Return-Path: <linux-kbuild+bounces-5795-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E927A381E7
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 12:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6C4916F7F3
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 11:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED7F218ACC;
	Mon, 17 Feb 2025 11:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjFE9I6e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A611C194C8B;
	Mon, 17 Feb 2025 11:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739792232; cv=none; b=j3psi8J2uEZ05SdCybNW6vEPZBPFGLN5MIKuNb9A8Ql5gXy7yb5FkQ9XtblHMFrlUrGYMGJ/yTwQDfvTsJSe38F9EtIINNdLNDJU/1B/A+AZMGk1teBRk6iYYbx8INm8+APNLFJQYeepA3+sPTIVoK0I2KGYW9mkAkVZjYXdpyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739792232; c=relaxed/simple;
	bh=Qpf0EDEG+IR+ZUOM9EE8u30ovDhMUqcQBVOID74UywI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pxady2tj23m8w1nUuHbL8bcsOAwzJVuNGz+MWpa/AbVFFt4GaQ2Kt3/poVH22xP22HHvgid6YXnY4wPIfU2xIHsuvPiWUyfgC2Sf6NMPh5yvHco+CzOUSndhn5XPLt5b1M3mbm7PVQ7qmWg5JuEI/J7P0QN7Sm/VI6T4pZiZt2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BjFE9I6e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8F8C4CED1;
	Mon, 17 Feb 2025 11:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739792232;
	bh=Qpf0EDEG+IR+ZUOM9EE8u30ovDhMUqcQBVOID74UywI=;
	h=From:To:Cc:Subject:Date:From;
	b=BjFE9I6etCturVtYGUWpsdB8+RsqMIKm+JaZ13SIwLOtYLQjCMoOAqD36ywCVeFPs
	 0BBl2FUlq5zfeCZmFP/Rs6QkGlVHRdWicFCzzcln97Gp7ublPbOjlr2jXVGCnAAz6y
	 Qbi/XThDxw8tLRp/ZFx0zeoIQ3gqMHA/OTYUqsCq/KG8LItFaV9EAqWxJW3I4NWUYA
	 7XixMr69e3rxfiOTSlxqLJviYY0MBYhs09gz7mHxLkDZugZj9Dpcsd/qF7lAuM2MP0
	 vYrvLrPCMbmDSYR+W+jHN+/eJIstn5cIcG3YlpuHQyc8lDtsSWRk53zOGy+oqM4M3e
	 SguKFl9LnAuWw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: remove KBUILD_ENABLE_EXTRA_GCC_CHECKS support
Date: Mon, 17 Feb 2025 20:36:48 +0900
Message-ID: <20250217113706.1012816-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit e27128db6283 ("kbuild: rename KBUILD_ENABLE_EXTRA_GCC_CHECKS to
KBUILD_EXTRA_WARN") renamed KBUILD_ENABLE_EXTRA_GCC_CHECKS in 2019.
The migration in downstream code should be complete.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Makefile b/Makefile
index 96407c1d6be1..3c1b012a156f 100644
--- a/Makefile
+++ b/Makefile
@@ -151,9 +151,6 @@ endif
 
 export KBUILD_EXTMOD
 
-# backward compatibility
-KBUILD_EXTRA_WARN ?= $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)
-
 ifeq ("$(origin W)", "command line")
   KBUILD_EXTRA_WARN := $(W)
 endif
-- 
2.43.0


