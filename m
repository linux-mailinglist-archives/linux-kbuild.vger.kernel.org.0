Return-Path: <linux-kbuild+bounces-3665-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CFE97EB3E
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 14:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13F2DB21B6E
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 12:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870B91991AB;
	Mon, 23 Sep 2024 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="E+SjVTW2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out203-205-221-250.mail.qq.com (out203-205-221-250.mail.qq.com [203.205.221.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4CE1991B0;
	Mon, 23 Sep 2024 12:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727093053; cv=none; b=LusoiHxiYWn4pa226tBPYdzlcPupNEV/adS8Vh2maThwJuh3eBD7Tw34D8CnG1bK6/7wu23peERVd//KJ/K9nXLbcS9ZX/OrSH8/sjyotSUwCQ2GuAhW7vTAMBmjHu8vKhGhzeAPcVO6NY9aBZBO8M9C/FtuHGvi3jKXksN1298=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727093053; c=relaxed/simple;
	bh=Bz+JoqEdBhISyEL8kb6UbsH5aTwo2xp9Osjh4iXv6dc=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=ENh6mBQXsRjfdooK61IST5Kt61DD0stjv9awLGuklpJ8nhd7k+abMd4qLBJMkhatZtFEaLEsYERASy/TcclbrhB95at2kdStwd2B0E97gNKEBR1CWTvoSVsXEf74xs6R0xPBxA0G+p2Q15+N/9gJv9Bxg1nqP4I8fR2sCJF0F8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=E+SjVTW2; arc=none smtp.client-ip=203.205.221.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1727093045; bh=RAoEGBzb6EF/6O1Kptk4wnZ5GVBR/5P7tADOkljER6A=;
	h=From:To:Cc:Subject:Date;
	b=E+SjVTW2XJeLhjcP2740fDrozB4xSqls7hn6zEUuEHijfu+Db9Bp6v3tn1IZd1mje
	 TnPcBaH64dWG1JgXo0ZCQLA4CWZKD6wBfzL+DYRfuo7AFOzdZXpIbIhU6CPc8fVdu1
	 N4ZShvJ9xbTdE3KQM8V8HgKvdU8uu5M9a7Yb5L0s=
Received: from localhost.localdomain ([27.38.127.228])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id E79B1E16; Mon, 23 Sep 2024 19:57:57 +0800
X-QQ-mid: xmsmtpt1727092677t5dim6nla
Message-ID: <tencent_7DE03EC9AEAFF374BDAB9CCCF4C047EF2305@qq.com>
X-QQ-XMAILINFO: NeshAIv1+ONRQKujmtEsiKFxCm/z5qrs1Iyeb0jxAukLBLRT24kCkulOwB5xJJ
	 9wJxEwCdNu0r/YCxSgzRc7OOwH0m9vFlXiLPxmcz8qPV4p2Z1ZY027xVAlhbnCZegGpnH6Z16wV5
	 DCicGiMjizltGZmpYMinfeYPB9TbBXqrilvfyHFGS3mCNLq7sUAN6mrCqcVBUNg7UpdOABjnyW3W
	 Lq0v/v2pdphaeCMY5YgoWEzI0scxTpHaV7BjfaNTKdVTfW2LrKZgLqQm/Yy+193rzre4MCSCPvZw
	 +O3fJI7iYpUL3fsEYS6qEmEVdBmdYA7xcaZp8PuxLseHxFT/1FNHktfkxqdabdKwUDio0EbXJ9kQ
	 xmvl7MrnR7XvGGbZqS8aFKbyZKwAxBR9LDsVBgfodiRvz0EXp96HQDM8JTNu7/Cse5sMLSkF8R1t
	 x9o0VyDoqTvDvlTJPqwGcOZHzaK4CE32W3MOnXOlxERKfNUJ+9VOe02exqbSYQsYSOTLmfg8o10p
	 81Ka+z1bU0jBX3LK+axHEU9f2/sxB8Zf4jRuqehs8UH7tQ6WTVfkGzfaeEB/KWIYepTQZoAh8zrx
	 WkfrkMXcAgazSkZA5kmJwpnTtZMsmxuNykSvikYX9Z+B5Nh8TftMTJqucWXEnq1mdXLcTopvHwVa
	 4jVmwKPIx2MsFeJJt/CzXi6I/+uAzclld0+dp3UGhKhQUWqERCB4dNJ5OnMWD69alCvsctZysH5K
	 2bGsF+PSpiW7SpBRjGdlDVqRdVaHSTBTkmrRGBppeCZyK23qhQAGVmSYjwP4P9QuXZftdMgAqkLF
	 3otefCsle2W0OWejIYWQnGRAPJelaYB7kALlrOL45gmUny47Z6+4i3opc8RFLJG4RAD0h1ECvXIS
	 0zweFby3xoJ928qmQNg64/jT/Jn59Z+enUonlpJ3TOW/CDLI9dm1Mq8giFlzAVtkx2XgeU5bcpx4
	 LHxUzrZ4Z+kCyHEwy7ZUokADWCJ16VWRXZIR3GxFoLWxMKHS/+/pxcqWlrhDPJo04xLzXVf+DRU+
	 KLAslUeZf0XP1M1ycGX7eelQP5gh4zL6hjQnsaBFjbo0g6WNYh
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: 1127955419@qq.com
To: linux@weissschuh.net
Cc: christian@heusel.eu,
	nathan@kernel.org,
	masahiroy@kernel.org,
	nicolas@fjasle.eu,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zachwade.k@gmail.com,
	Li XingYang <1127955419@qq.com>
Subject: [PATCH] kbuild: add package-dbg to pacman packages
Date: Mon, 23 Sep 2024 19:57:09 +0800
X-OQ-MSGID: <20240923115709.136727-1-1127955419@qq.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li XingYang <1127955419@qq.com>

The current pacman package does not include the debuginfo package
add debuginfo package that include vmlinux
vmlinux is very useful when debugging the kernel using crash

Signed-off-by: Li XingYang <1127955419@qq.com>
---
 scripts/package/PKGBUILD | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
index 663ce300dd06..4b5c435e5eaa 100644
--- a/scripts/package/PKGBUILD
+++ b/scripts/package/PKGBUILD
@@ -5,7 +5,7 @@
 pkgbase=${PACMAN_PKGBASE:-linux-upstream}
 pkgname=("${pkgbase}" "${pkgbase}-api-headers")
 if grep -q CONFIG_MODULES=y include/config/auto.conf; then
-	pkgname+=("${pkgbase}-headers")
+	pkgname+=("${pkgbase}-headers" "${pkgbase}-dbg")
 fi
 pkgver="${KERNELRELEASE//-/_}"
 # The PKGBUILD is evaluated multiple times.
@@ -100,6 +100,18 @@ _package-api-headers() {
 	${MAKE} headers_install INSTALL_HDR_PATH="${pkgdir}/usr"
 }
 
+_package-dbg() {
+	pkgdesc="debuginfo for the ${pkgdesc} kernel"
+
+	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
+	cd "${objtree}"
+	local builddir="${pkgdir}/usr/${MODLIB}/build"
+	mkdir -p "${builddir}"
+
+	echo "Installing vmlinux..."
+	cp vmlinux "${builddir}/vmlinux"
+}
+
 for _p in "${pkgname[@]}"; do
 	eval "package_$_p() {
 		$(declare -f "_package${_p#$pkgbase}")
-- 
2.46.1


