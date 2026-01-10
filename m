Return-Path: <linux-kbuild+bounces-10477-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 795AED0D59F
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Jan 2026 12:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46A2C304EF5E
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Jan 2026 11:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5200C3385A7;
	Sat, 10 Jan 2026 11:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arusekk.pl header.i=@arusekk.pl header.b="q0fo+M7c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4694333A71B
	for <linux-kbuild@vger.kernel.org>; Sat, 10 Jan 2026 11:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768045766; cv=none; b=k+q6NiCmmzldpux7I2Gxs8mhg6SwNY9OgHFTIybaPi4vMDYXF9y0fC12McbS87VXEvJtbvgO1Sq013nRI0yUbCy5Q1Ta4MXEGFO/h3NpZGB9vULCfZUHd44eNFxk84BKhFg5/e2FfwTYyvA/cNzBlV5oB0LvcG1tu9tDlPEo9x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768045766; c=relaxed/simple;
	bh=AS1kbON8J/K0pAn72sdt765fqZtBElSqaa/7t73oy+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=he9CQpjKGGoEDSbxFL+hxBtrMVTJCgseH1Vz6Q+gsROdckLiOKWPDUEYjSjK0E+Mo0f6nFFEgJHbNBz2B9XuAPaOwvYRgux+TL6Rr/WdTafwUCI7iytxzre3MX918qGWT273t4a7rH9qe8w68Z/qMIHbXRkcEyXlnt6DSd02UmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arusekk.pl; spf=pass smtp.mailfrom=arusekk.pl; dkim=pass (2048-bit key) header.d=arusekk.pl header.i=@arusekk.pl header.b=q0fo+M7c; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arusekk.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arusekk.pl
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arusekk.pl; s=key1;
	t=1768045760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=77MkBw8R+FGTqrZ9D6sa9OEY5H3LGuv1HNZ69ILyTf8=;
	b=q0fo+M7cZTk5iIVMzsMjiOVInNvawJOckFjDNxD7NyT5QEmGDUNToELz+VJ2rLXHyK4/Nn
	jFmh1LSmpr/BgfFnNGjOIYQbadEHr+njzX93R5BG4DLKNcLP/H18vHB4ybApQqkjiPi2xM
	cEs956Zac+xfF+rwx/JS8tLUWDy0nDvEbGBGKEIjG1ReYn995vEA9Ujv+RaK9RCSljmG0X
	4BS6ArPU+sED2/zTwPJOM3tW7SKhCSWxYSA6dm5UtOycGcESkUSgNmrBpVyC1v6y9kk5KI
	ylNIh7aq59/7gF6fbBHfVXh4fD2nZVksw+WAvJNCLQ0uJ2Ydrrnf33tzNaop3A==
From: Arkadiusz Kozdra <floss@arusekk.pl>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Arkadiusz Kozdra <floss@arusekk.pl>
Subject: [PATCH] kconfig: fix static linking of nconf
Date: Sat, 10 Jan 2026 12:48:08 +0100
Message-ID: <20260110114808.22595-1-floss@arusekk.pl>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

When running make nconfig with a static linking host toolchain,
the libraries are linked in an incorrect order,
resulting in errors similar to the following:

$ MAKEFLAGS='HOSTCC=cc\ -static' make nconfig
/usr/bin/ld: /usr/lib64/gcc/x86_64-unknown-linux-gnu/14.2.1/../../../../lib64/libpanel.a(p_new.o): in function `new_panel':
(.text+0x13): undefined reference to `_nc_panelhook_sp'
/usr/bin/ld: (.text+0x6c): undefined reference to `_nc_panelhook_sp'

Fixes: 1c5af5cf9308 ("kconfig: refactor ncurses package checks for building mconf and nconf")
Signed-off-by: Arusekk <floss@arusekk.pl>
---
 scripts/kconfig/nconf-cfg.sh | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/nconf-cfg.sh b/scripts/kconfig/nconf-cfg.sh
index a20290b1a37d..fedebbd6b2c8 100755
--- a/scripts/kconfig/nconf-cfg.sh
+++ b/scripts/kconfig/nconf-cfg.sh
@@ -6,8 +6,8 @@ set -eu
 cflags=$1
 libs=$2
 
-PKG="ncursesw menuw panelw"
-PKG2="ncurses menu panel"
+PKG="menuw panelw ncursesw"
+PKG2="menu panel ncurses"
 
 if [ -n "$(command -v ${HOSTPKG_CONFIG})" ]; then
 	if ${HOSTPKG_CONFIG} --exists $PKG; then
@@ -28,19 +28,19 @@ fi
 # find ncurses by pkg-config.)
 if [ -f /usr/include/ncursesw/ncurses.h ]; then
 	echo -D_GNU_SOURCE -I/usr/include/ncursesw > ${cflags}
-	echo -lncursesw -lmenuw -lpanelw > ${libs}
+	echo -lmenuw -lpanelw -lncursesw > ${libs}
 	exit 0
 fi
 
 if [ -f /usr/include/ncurses/ncurses.h ]; then
 	echo -D_GNU_SOURCE -I/usr/include/ncurses > ${cflags}
-	echo -lncurses -lmenu -lpanel > ${libs}
+	echo -lmenu -lpanel -lncurses > ${libs}
 	exit 0
 fi
 
 if [ -f /usr/include/ncurses.h ]; then
 	echo -D_GNU_SOURCE > ${cflags}
-	echo -lncurses -lmenu -lpanel > ${libs}
+	echo -lmenu -lpanel -lncurses > ${libs}
 	exit 0
 fi
 
-- 
2.51.2


