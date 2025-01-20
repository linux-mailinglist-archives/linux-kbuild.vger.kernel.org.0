Return-Path: <linux-kbuild+bounces-5502-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD166A167CC
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Jan 2025 08:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1F393A3C39
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Jan 2025 07:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF72F1917EB;
	Mon, 20 Jan 2025 07:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uM4JXPQN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D63190679;
	Mon, 20 Jan 2025 07:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737359962; cv=none; b=RPpWYsfRiKQDXGFYeacd3sd7S2dz0NHg4MXodY0Ykvu5uI/OC/Ev5Bz5wy/xoGj5Py9s0kFhjJu2Yz79vdBXsJzs+KN7mP00DYyMFI1lnBSDpd9xmQMQ6ElQ4ASAumEQ1U2F7xeoyOvQh+xqjwTGpiNvgdUh4owVxkp5X/xWDVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737359962; c=relaxed/simple;
	bh=7bewgcQeKkQUnQxwGb8ZQZJbzpjIKmZy+tvlNCKdMhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lNlZrDSvYfmT78Mhqs8L0vyOc7FzzwxSFS9kdM5LJwRzv8OC09RUx9AL1WYw+vyi4ZZy2mUAeJaxVQc751aNHPdGGgsbFyRsJ0OM7hFZqfGu8qcoXV30lksK7XNpbGFm/dyftOt7Cs7dD5iZC/Q2TgI5Dvw9lYUGlxJcvfq/wQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uM4JXPQN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E4AC4CEDD;
	Mon, 20 Jan 2025 07:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737359962;
	bh=7bewgcQeKkQUnQxwGb8ZQZJbzpjIKmZy+tvlNCKdMhg=;
	h=From:To:Cc:Subject:Date:From;
	b=uM4JXPQNM6r4k4A7nM2SIBXrLtxcWWzKwEvIfeeYnTVHUbRQMMtgQYk/3cyV0wCwg
	 hwmwC2Ky43TmfaarT8F7ZaT06radRKuePdNeQDz3YGMg5SV2bZRFPvG0TVe9reoDS3
	 /ytqLhJXHJuci3CCHQmS7zO8bqX9wHa5Obwuw5eby+sB9aFfGugzVjsuaaCHKTK37r
	 KyKy4l7J4ZMo/zzXf/++hCKTzuyhbEAD/9+f4yUQ9UtpmvJw7PzCuADMgJGvhJ86QM
	 fRrD5XlFDpnhUvWQ/U/DODGyKQppb4jySOOA3tnRW23cIOUrY4Oau3pwPil3+V5lyz
	 Ic60vEH93R1Pg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: fix file name in warnings when loading KCONFIG_DEFCONFIG_LIST
Date: Mon, 20 Jan 2025 16:59:14 +0900
Message-ID: <20250120075917.26059-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most 'make *config' commands use .config as the base configuration file.

When .config does not exist, Kconfig tries to load a file listed in
KCONFIG_DEFCONFIG_LIST instead.

However, since commit b75b0a819af9 ("kconfig: change defconfig_list
option to environment variable"), warning messages have displayed an
incorrect file name in such cases.

Below is a demonstration using Debian Trixie. While loading
/boot/config-6.12.9-amd64, the warning messages incorrectly show .config
as the file name.

With this commit, the correct file name is displayed in warnings.

[Before]

  $ rm -f .config
  $ make config
  #
  # using defaults found in /boot/config-6.12.9-amd64
  #
  .config:6804:warning: symbol value 'm' invalid for FB_BACKLIGHT
  .config:9895:warning: symbol value 'm' invalid for ANDROID_BINDER_IPC

[After]

  $ rm -f .config
  $ make config
  #
  # using defaults found in /boot/config-6.12.9-amd64
  #
  /boot/config-6.12.9-amd64:6804:warning: symbol value 'm' invalid for FB_BACKLIGHT
  /boot/config-6.12.9-amd64:9895:warning: symbol value 'm' invalid for ANDROID_BINDER_IPC

Fixes: b75b0a819af9 ("kconfig: change defconfig_list option to environment variable")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 4286d5e7f95d..3b55e7a4131d 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -360,10 +360,12 @@ int conf_read_simple(const char *name, int def)
 
 			*p = '\0';
 
-			in = zconf_fopen(env);
+			name = env;
+
+			in = zconf_fopen(name);
 			if (in) {
 				conf_message("using defaults found in %s",
-					     env);
+					     name);
 				goto load;
 			}
 
-- 
2.43.0


