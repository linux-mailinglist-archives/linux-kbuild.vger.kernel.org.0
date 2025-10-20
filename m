Return-Path: <linux-kbuild+bounces-9216-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6B1BF01F4
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Oct 2025 11:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18ABE3BC13E
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Oct 2025 09:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1642F5478;
	Mon, 20 Oct 2025 09:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PS7BR6NX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333C52F5477;
	Mon, 20 Oct 2025 09:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760951785; cv=none; b=WfL3yuK8fmmPzVlc4SF4Ye8R3Y86+gu+xS5a4hNoU5hyARhnQeJkKpgD4KLpjw9y/CE46kZ+0+4vOzZ2gd1LQdXnUQNhWFQjVoek0uHwCm4vuE1vIWZAZr0ZFOHD1K0B/e4qXjs5ThRgWRPTOrXJtiIOOhGY66COw/hLBssEkJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760951785; c=relaxed/simple;
	bh=eea7TGjWmILytppQwQWuyFscpaeat9mDLK8ckK53Yr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WfU6+ijEKBWJpAO5++d9YBNU5ENAWsjSjjjlJMQdzCmq659gm86MB4pZJtaWgOglGUaivYyx4xVzhMMMUQ2WwOHoCIwl91T28WY4IVtC0eak7KjcUraLHU31gt+dXDqYNOBqYUWMjc8mEqNga6uqRIIE8wU9+KqiaaBTPEg3sIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PS7BR6NX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1790C4CEFE;
	Mon, 20 Oct 2025 09:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760951784;
	bh=eea7TGjWmILytppQwQWuyFscpaeat9mDLK8ckK53Yr4=;
	h=From:To:Cc:Subject:Date:From;
	b=PS7BR6NXfYILjDkzGxqe8vVzPppJil0WlSwLnQTdCDaGQzOqju7Zzf4yn9CIz+4R8
	 7p8+iUmYEh15KM1GXgPB3bRwuXgPwAUuseWTti3f7HJp5bEUAP7ppIIX9l0AOXJaO5
	 GhjINUXc7zRZQJHfuc/xB3W1UqeOfC1ZzCFetOwWnV+Doj4P1A2S0ShXyqtkux73tS
	 qGZXGefc5gDTJBmUOMYOFrqxBSs+O6InbZSdszlQ8KZJb3l6YC3PBUelyqTogBGYTA
	 R3JNMG9XJd/tbolFeV2ZSUpAQ+2uN1uuaJcfYABcE/ab3hVDSu3aPc1xTXKUkujwvw
	 ttzLP14Bd6y1Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vAm0C-000000005sE-1Bjx;
	Mon, 20 Oct 2025 11:16:29 +0200
From: Johan Hovold <johan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] modpost: drop '*_probe' from section check whitelist
Date: Mon, 20 Oct 2025 11:16:13 +0200
Message-ID: <20251020091613.22562-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several symbol patterns used to be whitelisted to allow drivers to refer
to functions annotated with __devinit and __devexit, which have since
been removed.

Commit e1dc1bfe5b27 ("modpost: remove more symbol patterns from the
section check whitelist") removed most of these patterns but left
'*_probe' after a reported warning in an irqchip driver.

Turns out that was indeed an incorrect reference which has now been
fixed by commit 9b685058ca93 ("irqchip/qcom-irq-combiner: Fix section
mismatch").

A recently added clocksource driver also relies on this suffix to
suppress another valid warning, and that is being fixed separately. [1]

Note that drivers with valid reasons for suppressing the warnings can
use the __ref macros.

Link: https://lore.kernel.org/lkml/20251017054943.7195-1-johan@kernel.org/ [1]
Signed-off-by: Johan Hovold <johan@kernel.org>
---

As mentioned above there are still two drivers relying on the "_probe"
pattern to suppress valid warnings so perhaps it's best to hold off on
merging this until the corresponding fixes are in mainline (e.g. next
cycle or so unless Thomas can fast-track them).

Johan


 scripts/mod/modpost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 47c8aa2a6939..5c499dace0bb 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -953,7 +953,7 @@ static int secref_whitelist(const char *fromsec, const char *fromsym,
 	/* symbols in data sections that may refer to any init/exit sections */
 	if (match(fromsec, PATTERNS(DATA_SECTIONS)) &&
 	    match(tosec, PATTERNS(ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS)) &&
-	    match(fromsym, PATTERNS("*_ops", "*_probe", "*_console")))
+	    match(fromsym, PATTERNS("*_ops", "*_console")))
 		return 0;
 
 	/* Check for pattern 3 */
-- 
2.49.1


