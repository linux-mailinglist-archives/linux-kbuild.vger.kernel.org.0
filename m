Return-Path: <linux-kbuild+bounces-2564-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1903F933D1C
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 14:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 549B91C234DA
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 12:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFD641C63;
	Wed, 17 Jul 2024 12:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uA1Yv5yo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E482517E8E2;
	Wed, 17 Jul 2024 12:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721220201; cv=none; b=G2acvMK3lJw6HCkvvtN/UDfN3sD2xoy6cpNxperTn4+12giUzAinaW/sO5K8B2Tme34j+pX0rr12M8wdVsWO/MClXHFHk9ioojSDimbu0NLe3EScrmYkbuiIX3AgjzwQq7UZ9qH3t1dB5cefY3L+ZFtrttVBX9rLGTYSEGCUEn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721220201; c=relaxed/simple;
	bh=n71oolAmKfoaIOxjKUMGa6aVrF6KI/Baq9WOrJi1kI4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HZsmlBK+4NfnnbDCVKb5miwwUZbTuZxgFatK052x0xR4s3XfF5D4zuqg9QjDJKcZaV/9mq649TG+eHD6R3GRN4MwUC5vmEIU3YEfPFw2jCpQ2pVQOId0/HBmi6zBnnV6cQWqcKzUhUcfiZ8NWSKpINoHOUohEz2CRznKdwTZ+u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uA1Yv5yo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD64CC4AF0F;
	Wed, 17 Jul 2024 12:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721220200;
	bh=n71oolAmKfoaIOxjKUMGa6aVrF6KI/Baq9WOrJi1kI4=;
	h=From:To:Cc:Subject:Date:From;
	b=uA1Yv5yo7GmVHBeKumdIuEVVeJOu14+qIuNHUNKmj/XEnXnWwLc/tIad0rBU3Zb9K
	 iv9zrK4rASYkD2ZvS7/SaeHqfCq4hv8EBiNMexemeLUp1PS3Nb6IuwCwAwEbMfgoLg
	 BI3Xilck0al+aqW1HLkq8D0p4IKV7TDDiA+JsBr5cf/UhkDyHQhYp8diXY53KBG0KD
	 9tb5TnMlOc4VmmLUBfBnDVxoX8Sx2UZRUyMCINJ8vwqN+0RhCO7UKhBFwj6oZ96gHz
	 sSGwJRSjTmQCr4Gb/6ZKVg0pG1tw4LnmjL////45XBciFX5SffkV9G0tnSfsfbpRBP
	 F2C6dSkGEUOVQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-kbuild@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: mark "FORCE" target as secondary
Date: Wed, 17 Jul 2024 14:42:44 +0200
Message-Id: <20240717124253.2275084-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Starting with make-4.4.1, Kbuild uses the special .NOTINTERMEDIATE
target to mark all targets as not intermediate, which slightly changes
the behavior compared to older versions of make.

This causes a build regression with my change to the system call table
scripts now in scripts/Makefile.asm-headers, forcing a rebuild of the
generated files with every make invocation and effectively breaking
incremental builds.

I have narrowed down the change in behavior to the way that the
'FORCE' target is treated: If this is marked as not intermediate,
the $(if_changed) macro always evaluates it as a missing prerequisite,
but if it is marked as .SECONDARY, it works like before.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Fixes: 875ef1a57f32 ("kbuild: use .NOTINTERMEDIATE for future GNU Make versions")
Fixes: fbb5c0606fa4 ("kbuild: add syscall table generation to scripts/Makefile.asm-headers")
Closes: https://lore.kernel.org/lkml/91b10591-1554-4860-8843-01c6cfd7de13@app.fastmail.com/T/#m4c979c42d0c086f616e41b4ca76f2873902b8a25
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
----
I'm still a bit confused by the way this works in detail, hopefully
Masahiro Yamada can either confirm that this is a correct fix or provide
a better one.
---
 scripts/Kbuild.include | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index faf37bafa3f8..aa1ffaeb8fc0 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -267,6 +267,7 @@ endif
 # deleted files.
 ifneq ($(and $(filter notintermediate, $(.FEATURES)),$(filter-out 4.4,$(MAKE_VERSION))),)
 .NOTINTERMEDIATE:
+.SECONDARY: FORCE
 else
 .SECONDARY:
 endif
-- 
2.39.2


