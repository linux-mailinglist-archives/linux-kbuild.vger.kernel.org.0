Return-Path: <linux-kbuild+bounces-4491-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFB19BA576
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Nov 2024 13:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A77A01C20E9B
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Nov 2024 12:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6425158DC0;
	Sun,  3 Nov 2024 12:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSKTFmd6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B984B166F06;
	Sun,  3 Nov 2024 12:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730638394; cv=none; b=H7Gb1g0aZWjW0zBzZI0OItjHFB1EEjLOVLeQy8sesbhH9PlbVR+XatJIT3+oWoHah/RmSjK1W3zOvJvWxxnzy4v3R3lnHKMgQiT6pqZMn6dyweVpv+V5VyJUsUrndiTTed0qG3uwM1tsLB91BJzbgh9t3apjdn+HOZYCRKcDf24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730638394; c=relaxed/simple;
	bh=ibT3pOslxzWnWXb0vn7xqhT33ppCQMYriOWgnTXF6z0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P5eVTA0qSf6qfwNc9+Rb4saybcbvw4ud1rzo57As5Jm7tq8+KHi/A2mhqFqrxCR2BWOtZftpVy0p1F+Bm1Ns1kJjA9A6qZODLaIVjfLYvWGlCSNX31+zpj6cXvHgbwJRDg8F3V2OHcVilllc3UegKnF9zFx92xQz75jvpqSQroA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSKTFmd6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87103C4CECD;
	Sun,  3 Nov 2024 12:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730638394;
	bh=ibT3pOslxzWnWXb0vn7xqhT33ppCQMYriOWgnTXF6z0=;
	h=From:To:Cc:Subject:Date:From;
	b=RSKTFmd6Ot7too7smOIY8Sh0iTR+jd62qfSyhWcIl/4qGZpb4kD6BCeqaBx7+r/yA
	 2L509XBRGAa5vJjQdh9C8oREFBI6E8x6D1rG4QBbIQrUT1yuWdIaYPPO9eCGaNJ7Ku
	 J+AGo7/kGsk8R0+eQhmbOWbf27IDsBLTvkvKzWHMsjCTulaLdx7LIV/UIhZScQMJOM
	 uH3HqAy7nQpn43otLer+tlx28U2/Cz+PAB3BsyZnYpO7jBZ1zgiQRHbm8ABA37TgSc
	 Uz7Rv6OfQDNThKfkLwO9M4WnG8OaOjIQbJpVeEwY7ncBpHjW1o1fSmrI/Eqf4xUOSq
	 GgdR2YsWV9qLw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Greg Kroah-Hartman <gregkh@suse.de>,
	Hans de Goede <j.w.r.degoede@hhs.nl>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Rusty Russell <rusty@rustcorp.com.au>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] modpost: fix input MODULE_DEVICE_TABLE() built for 64-bit on 32-bit host
Date: Sun,  3 Nov 2024 21:52:57 +0900
Message-ID: <20241103125259.944399-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building a 64-bit kernel on a 32-bit build host, incorrect
input MODULE_ALIAS() entries may be generated.

For example, when compiling a 64-bit kernel with CONFIG_INPUT_MOUSEDEV=m
on a 64-bit build machine, you will get the correct output:

  $ grep MODULE_ALIAS drivers/input/mousedev.mod.c
  MODULE_ALIAS("input:b*v*p*e*-e*1,*2,*k*110,*r*0,*1,*a*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*1,*2,*k*r*8,*a*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*1,*3,*k*14A,*r*a*0,*1,*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*1,*3,*k*145,*r*a*0,*1,*18,*1C,*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*1,*3,*k*110,*r*a*0,*1,*m*l*s*f*w*");

However, building the same kernel on a 32-bit machine results in
incorrect output:

  $ grep MODULE_ALIAS drivers/input/mousedev.mod.c
  MODULE_ALIAS("input:b*v*p*e*-e*1,*2,*k*110,*130,*r*0,*1,*a*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*1,*2,*k*r*8,*a*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*1,*3,*k*14A,*16A,*r*a*0,*1,*20,*21,*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*1,*3,*k*145,*165,*r*a*0,*1,*18,*1C,*20,*21,*38,*3C,*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*1,*3,*k*110,*130,*r*a*0,*1,*20,*21,*m*l*s*f*w*");

A similar issue occurs with CONFIG_INPUT_JOYDEV=m. On a 64-bit build
machine, the output is:

  $ grep MODULE_ALIAS drivers/input/joydev.mod.c
  MODULE_ALIAS("input:b*v*p*e*-e*3,*k*r*a*0,*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*3,*k*r*a*2,*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*3,*k*r*a*8,*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*3,*k*r*a*6,*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*1,*k*120,*r*a*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*1,*k*130,*r*a*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*1,*k*2C0,*r*a*m*l*s*f*w*");

However, on a 32-bit machine, the output is incorrect:

  $ grep MODULE_ALIAS drivers/input/joydev.mod.c
  MODULE_ALIAS("input:b*v*p*e*-e*3,*k*r*a*0,*20,*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*3,*k*r*a*2,*22,*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*3,*k*r*a*8,*28,*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*3,*k*r*a*6,*26,*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*1,*k*11F,*13F,*r*a*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*1,*k*11F,*13F,*r*a*m*l*s*f*w*");
  MODULE_ALIAS("input:b*v*p*e*-e*1,*k*2C0,*2E0,*r*a*m*l*s*f*w*");

When building a 64-bit kernel, BITS_PER_LONG is defined as 64. However,
on a 32-bit build machine, the constant, 1L, has a 32-bit width.
Left-shifting this constant beyond 32 bits causes wraparound.

The fix in commit e0e92632715f ("[PATCH] PATCH: 1 line 2.6.18 bugfix:
modpost-64bit-fix.patch") is incorrect; it only addresses cases where
a 64-bit kernel is built on a 64-bit build machine, overlooking cases
on a 32-bit build machine.

Using 1ULL ensures a 64-bit width on both 32-bit and 64-bit machines,
avoiding the wraparound issue.

Fixes: e0e92632715f ("[PATCH] PATCH: 1 line 2.6.18 bugfix: modpost-64bit-fix.patch")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 16154449dde1..c4cc11aa558f 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -743,7 +743,7 @@ static void do_input(char *alias,
 	for (i = min / BITS_PER_LONG; i < max / BITS_PER_LONG + 1; i++)
 		arr[i] = TO_NATIVE(arr[i]);
 	for (i = min; i < max; i++)
-		if (arr[i / BITS_PER_LONG] & (1L << (i%BITS_PER_LONG)))
+		if (arr[i / BITS_PER_LONG] & (1ULL << (i%BITS_PER_LONG)))
 			sprintf(alias + strlen(alias), "%X,*", i);
 }
 
-- 
2.43.0


