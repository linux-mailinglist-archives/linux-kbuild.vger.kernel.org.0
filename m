Return-Path: <linux-kbuild+bounces-1901-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D57658C9D96
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 14:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E4391F22240
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 12:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F426A332;
	Mon, 20 May 2024 12:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxbAJIqp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C164960EC4;
	Mon, 20 May 2024 12:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716208949; cv=none; b=eKIbXg0cZ4kCv3ER7DKBabqvOsF3caz6xf8emSS2HvNt9lXhUpx/PY+r+SudoXTcA5ZORyLDYazAOYzJJlcSnGlyKvoWpf4c+qR1bQ2mDAB5d16wGA11oJG7QWf7M0CNovlVamhRG+Bxa90XLk3PH647ODA5a1JNreZzqkKcajQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716208949; c=relaxed/simple;
	bh=TxFPGBAJwk5Wb8NrApnx3ozpKy0fGdYVURZX3jvxjMA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tSCx7Y93gB7WhIz2BXayzVhC76mpWzDIbuaV/CVomXFF0o8248yZvvdc+Crx1onawTPMHWYVZUZAVDOuyttE8wsGOHK+5AQmsqlNI0l5HP7UX2Jzsfc9bkz1gNvLShqTGYyJp47A5KnAXGcfsLCi5dIeJEAca02b5q293g+ZzyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxbAJIqp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE4FC4AF0C;
	Mon, 20 May 2024 12:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716208949;
	bh=TxFPGBAJwk5Wb8NrApnx3ozpKy0fGdYVURZX3jvxjMA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jxbAJIqpjjxAzP5cfKjuNqJtGsxPZQJ0dPYnkNbHAq3qZYJZm7Ecou/bT8u/upHcM
	 Ylk5vXeBWs9U+E1kLzBetKzMNneBOuqSr8/PfcDG60EE47XB04ienKn7jmO95TVu5Q
	 eleSkLfFyo80fx+JgaJ1AP3N3F/Rf8hxB6R0OvMC5Tqs8G39xMsWICKQhikdkfaJpc
	 gMLcYj3NnDA9lIajVmeFgN09R+cX80WNXDnI6voM94xbB1MXT0t9Dh8fkhOAH3Odwc
	 6VeVBFW/2W1RqpxvUeC//ljlEaRlSbdPClQtgtoJlNL8AGLbtSGFlaBfOru3rWjN9o
	 etKnC7G9CiMUQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 3/4] kbuild: fix shortlog for AS in link-vmlinux.sh
Date: Mon, 20 May 2024 21:42:11 +0900
Message-Id: <20240520124212.2351033-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240520124212.2351033-1-masahiroy@kernel.org>
References: <20240520124212.2351033-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In convention, the short log prints the output file, not the input file.

Change the suffix for 'AS' since it assembles *.S into *.o.

[Before]

  LD      .tmp_vmlinux.kallsyms1
  NM      .tmp_vmlinux.kallsyms1.syms
  KSYMS   .tmp_vmlinux.kallsyms1.S
  AS      .tmp_vmlinux.kallsyms1.S
  LD      .tmp_vmlinux.kallsyms2
  NM      .tmp_vmlinux.kallsyms2.syms
  KSYMS   .tmp_vmlinux.kallsyms2.S
  AS      .tmp_vmlinux.kallsyms2.S
  LD      vmlinux

[After]

  LD      .tmp_vmlinux.kallsyms1
  NM      .tmp_vmlinux.kallsyms1.syms
  KSYMS   .tmp_vmlinux.kallsyms1.S
  AS      .tmp_vmlinux.kallsyms1.o
  LD      .tmp_vmlinux.kallsyms2
  NM      .tmp_vmlinux.kallsyms2.syms
  KSYMS   .tmp_vmlinux.kallsyms2.S
  AS      .tmp_vmlinux.kallsyms2.o
  LD      vmlinux

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/link-vmlinux.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index c22a213ea6a9..7aca51b24e9f 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -182,7 +182,7 @@ kallsyms_step()
 	mksysmap ${kallsyms_vmlinux} ${kallsyms_vmlinux}.syms
 	kallsyms ${kallsyms_vmlinux}.syms ${kallsyms_S}
 
-	info AS ${kallsyms_S}
+	info AS ${kallsymso}
 	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
 	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} \
 	      -c -o ${kallsymso} ${kallsyms_S}
-- 
2.40.1


