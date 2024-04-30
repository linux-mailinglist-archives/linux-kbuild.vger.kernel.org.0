Return-Path: <linux-kbuild+bounces-1719-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A028B8170
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Apr 2024 22:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E38E5282532
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Apr 2024 20:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25773190660;
	Tue, 30 Apr 2024 20:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyQqcERP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F22174EC9;
	Tue, 30 Apr 2024 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714509054; cv=none; b=I1mWthVfWLI5zLLul9YThIrKHLz8f39XFsQISYURxRoChbvHa4zvSonSXL9g0rFYSFvg/FA6K3AUWq2SGjY+zWJneQf6laJxyC5UW44If7VKeYbhQFGKfJX0lMCKASkRNWq7AAfiDX4hXIaZPHW29lHCa8PC3D7xxn4UKxNi71E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714509054; c=relaxed/simple;
	bh=MvOH2ZvxP5GZZg7KiE+tUNHewOywF+KGFNGXauPbL2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cu/jNivj59/OD2JwhJSe1yg+myMBseQAqnIX3XXmMjHNWd+j6E+0H7LX3qCxHu+0eEXUaIHr6OxtaIaeK9Vx2SzOtOSlhPzWZKx1z3V8M3rM+BqnAMq1tWTdfB1pjYXpO+4Ngzro2lYeZzffe7oUFbAEvGg2eXNbiKX/tFjApyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyQqcERP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3804BC2BBFC;
	Tue, 30 Apr 2024 20:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714509053;
	bh=MvOH2ZvxP5GZZg7KiE+tUNHewOywF+KGFNGXauPbL2Y=;
	h=From:To:Cc:Subject:Date:From;
	b=fyQqcERPrr65wiXVj57nP5CqvmwFcQG8mVzwuu58sOnl/JzTwCR/fHXRtxG5BYcJy
	 kwEB/0IkAPLkP2KzgmH3zeEk7oLbMfnHeiE2edfiwT0zrRHkYIbdabdad6o7+9i0nQ
	 /HVM9nzFxrPcqi9ifLeY5mncpIi+9IhUUWZfx8IfWKxyyAL4RHhDICYSGVt9skBjCh
	 rKwCS5F8ms2leL5J0S8WpoYPKTCNXfobz2jMQgYmuZa0Fvlh+GqssS0Y8OJURMU13i
	 /GO/k6R7kG7TIHIRIKbjkg6SzhNB1vYk9FQToyspUAQN6JoEMksXnlVEISMnBtJrRF
	 cKJP7MYUmoArg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: kbuild: Fix dt_binding_check for arch without dts directory
Date: Tue, 30 Apr 2024 15:29:29 -0500
Message-ID: <20240430202928.1143802-3-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 1d06c77d93da ("dt-bindings: kbuild: Add separate
target/dependency for processed-schema.json") placed setting CHECK_DTBS
for 'dt_binding_check' target within the section that depends on having
arch/$ARCH/boot/dts/ which x86 doesn't have for example. That results in
the schema checks not running for the examples. Move setting it back out
of the conditional section as it was (CHECK_DT_BINDING is still
replaced).

Fixes: 1d06c77d93da ("dt-bindings: kbuild: Add separate target/dependency for processed-schema.json")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Cc: devicetree@vger.kernel.org

Masahiro, Please take this as the above commit is in your tree.

 Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f4fe5b0ea931..43a2a630436a 100644
--- a/Makefile
+++ b/Makefile
@@ -1403,7 +1403,7 @@ dtbs: dtbs_prepare
 # dtbs_install depend on it as dtbs_install may run as root.
 dtbs_prepare: include/config/kernel.release scripts_dtc
 
-ifneq ($(filter dt_binding_check dtbs_check, $(MAKECMDGOALS)),)
+ifneq ($(filter dtbs_check, $(MAKECMDGOALS)),)
 export CHECK_DTBS=y
 endif
 
@@ -1422,6 +1422,10 @@ endif
 
 endif
 
+ifneq ($(filter dt_binding_check, $(MAKECMDGOALS)),)
+export CHECK_DTBS=y
+endif
+
 PHONY += scripts_dtc
 scripts_dtc: scripts_basic
 	$(Q)$(MAKE) $(build)=scripts/dtc
-- 
2.43.0


