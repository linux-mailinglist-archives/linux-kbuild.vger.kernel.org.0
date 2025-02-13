Return-Path: <linux-kbuild+bounces-5735-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B94A337EE
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 07:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD0F4188C78D
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 06:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B3A207DE7;
	Thu, 13 Feb 2025 06:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OW2/DGyo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CEB207A3F;
	Thu, 13 Feb 2025 06:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739428012; cv=none; b=GQWM7W0H1/Um7mMGRjaoc55VIE/eJKutfHbeaEBPrYgc1PwzJVSEdBq4H4kmMQwMhyrwUOESZoal0KMzAx5bTOw7Wu1pBVtt/DR9vVVzZS8Sc+Hg6qH0mgHM7bo1lh7E7UbCuyEU6sphPfIXU9ByhzszzxvMIdSL+gNIF3qYRYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739428012; c=relaxed/simple;
	bh=kXz3qHMtguzSoyIY4/7zhLjHxD6wsHB2x+WHD9jui/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ox0USENqUDB0NsAy+gXN9CTXMtz+0hYDn3YbX1kTJHmhwrXZlQx0P2YSG1XEzLaDhXNImXwToxke6dpb4mWtuZ2Iia6/oUSrvrSCgpcUgW3rtP2VoS4Zum8uyK63rO7suZgoQ1MPzxORt9vyOzWmfg/5OlPV7xUxEHGaHJgyysA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OW2/DGyo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9922C4CED1;
	Thu, 13 Feb 2025 06:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739428012;
	bh=kXz3qHMtguzSoyIY4/7zhLjHxD6wsHB2x+WHD9jui/M=;
	h=From:To:Cc:Subject:Date:From;
	b=OW2/DGyoNvXsVBVHhTEFHaIZ2bDIFngIU+FNwQ+GkXTWU0XP2g6BrAa0jneAkUUwz
	 yUIGJ1ngvWv96lk0KdoptEzcqE0d0+5MQjQs0o9+AMT2JCyL29Rtyh56fY5beBFqH9
	 KcDQbSpUfyKhFQfgLSFXE/SkhG1SMiYkjmjsh59gn8RSfoZf+5JPoHPfOFqCqsqAJW
	 aPkQ0rrJjNRpDJ4nLesiuFilE0r6VQgox23PPkzZBWD+DqzHnold7zWtRbQwJ6aDZs
	 ZGGPpXD0dIWzD/hdga36xuj5u3vGzgL4wfY8OYmkuGHiHCqXjmifGQh2+OLj69zAqN
	 pe7bykVjZAqEQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2] kbuild: fix linux-headers package build when $(CC) cannot link userspace
Date: Thu, 13 Feb 2025 15:26:44 +0900
Message-ID: <20250213062645.325632-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 5f73e7d0386d ("kbuild: refactor cross-compiling
linux-headers package"), the linux-headers Debian package fails to
build when $(CC) cannot build userspace applications, for example,
when using toolchains installed by the 0day bot.

The host programs in the linux-headers package should be rebuilt using
the disto's cross-compiler, ${DEB_HOST_GNU_TYPE}-gcc instead of $(CC).
Hence, the variable 'CC' must be expanded in this shell script instead
of in the top-level Makefile.

Commit f354fc88a72a ("kbuild: install-extmod-build: add missing
quotation marks for CC variable") was not a correct fix because
CC="ccache gcc" should be unrelated when rebuilding userspace tools.

Fixes: 5f73e7d0386d ("kbuild: refactor cross-compiling linux-headers package")
Reported-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Closes: https://lore.kernel.org/linux-kbuild/CAK7LNARb3xO3ptBWOMpwKcyf3=zkfhMey5H2KnB1dOmUwM79dA@mail.gmail.com/T/#t
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
 - Fix the comment line because 'CC' needs expanding in this script

 scripts/package/install-extmod-build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index b724626ea0ca..2966473b4660 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -62,8 +62,8 @@ if [ "${CC}" != "${HOSTCC}" ]; then
 	#
 	# Clear VPATH and srcroot because the source files reside in the output
 	# directory.
-	# shellcheck disable=SC2016 # $(MAKE), $(CC), and $(build) will be expanded by Make
-	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC="$(CC)" VPATH= srcroot=. $(build)='"${destdir}"/scripts
+	# shellcheck disable=SC2016 # $(MAKE) and $(build) will be expanded by Make
+	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC='"${CC}"' VPATH= srcroot=. $(build)='"${destdir}"/scripts
 
 	rm -f "${destdir}/scripts/Kbuild"
 fi
-- 
2.43.0


