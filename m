Return-Path: <linux-kbuild+bounces-2501-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65023930967
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 10:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 212CF281E57
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 08:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE453D3B3;
	Sun, 14 Jul 2024 08:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="Yxeb2wDg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.envs.net (mail.envs.net [5.199.136.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA894D11B;
	Sun, 14 Jul 2024 08:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.199.136.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720947523; cv=none; b=gO/9fGCsGcHsJrVETSROqjrHINe0hxuoXttom8dNEvVQ1Ho5uYiMPyWgjUyybL3DWorROMfyTfLd2zNb0I3FWON1ZOiWtav/QPRM0TQ8KWMip76Jco51akqOn74uaMTbp3TcWjzR/PdOfjXVr/xO3HRy8o87liMH/4VwZ4z1vOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720947523; c=relaxed/simple;
	bh=GZiZoI6e3JvsqnLrL5xGsh92gGaBzJaPJ2zt48adfWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C3EaWj4b2/pQsqymsV/BQ+tpDSBuAl2DXMua8pZZjR7TQtTyGgA1NXoCr1EJ7MYT6uU5anIJoW7uTTXShkaJAxxXpU25ld84zhY5aw45phVKJ9YeI7SlmKP5o6uGoVNEzAUbI8LykPt5yKwWVphwkwo2qiqCbW4yiHPnJlu4Gg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=Yxeb2wDg; arc=none smtp.client-ip=5.199.136.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id 5A89638A39A0;
	Sun, 14 Jul 2024 08:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1720947518; bh=3RXoGcCjW+CB+wVoqLryQrySRvbelditpYUk0T7yTSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yxeb2wDgejzOcVVnBnS/+WSj4hVrhCdfZp86xCr1uxSFHj3oyiRHXJuQZsPOdeFf+
	 QwsdEM4lYdILp7QQ7+gF4JHJFlZzIkglpVaa9Jth2npuU3GtpUq5C/O8U8PqAK52Xg
	 oEzKqdmTsD800zMMcQBsuxIcOHgJK67FM9gXEzAQJM3jOBb6rY8BYA9g5+OkIxMGDX
	 QIv6XcJ6tM0UIt4M1wsqBEgdDPznCePITV6kytVXayXeYGtCChVBzad0OUig9I2LN+
	 jffwEGwCw61rhGknsDSD4FlbN/fOpM27CaiWF5r0f5GsFGjkDUp7biL9Y44N1fMPoy
	 3XBEIBpoWSzO4s6XjJDn11MfzinWfrAohQ2m+mplZK0y+MCyeTdCkYUd2rjLn1Z68k
	 fgp04oFcNAj5XTLrDXxzE222ziQx3tel+Eevr1b2LfjSqZjqzfCutqejV6iG7kQIdv
	 691slFWz8P/RStIunv7yIp2HQOHn89RZubeDi/LphxRFvKTJvJ29yEcfSsgQKH6vsv
	 GPgvcZeAE2MByB8W8r0VKw5DJrKcZjAHQoDBUKKd3JVZrW+vMjLB1+y349YKr3jSkt
	 LdAX4sLLK++K613ZmI/6yp8P+fYm2mLrjNSiIrMcpCKUdQWGevpzh6Iuqpxe87iRws
	 CP0WcrxYs1ADXePPmP/CoQt8=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xu_dqvWydv6f; Sun, 14 Jul 2024 08:58:28 +0000 (UTC)
Received: from xtexx.eu.org (unknown [120.230.214.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sun, 14 Jul 2024 08:58:28 +0000 (UTC)
From: Zhang Bingwu <xtex@envs.net>
To: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Zhang Bingwu <xtexchooser@duck.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: x86@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH 2/2] kbuild: Create INSTALL_PATH directory if it does not exist
Date: Sun, 14 Jul 2024 16:57:51 +0800
Message-ID: <20240714085751.176357-3-xtex@envs.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240714085751.176357-1-xtex@envs.net>
References: <20240714085751.176357-1-xtex@envs.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhang Bingwu <xtexchooser@duck.com>

If INSTALL_PATH is not a valid directory, create it, like what
modules_install and dtbs_install will do in the same situation.

Signed-off-by: Zhang Bingwu <xtexchooser@duck.com>
---
 scripts/install.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/install.sh b/scripts/install.sh
index 9bb0fb44f04a..02b845e7ab33 100755
--- a/scripts/install.sh
+++ b/scripts/install.sh
@@ -20,6 +20,10 @@ do
 	fi
 done
 
+if [ "${INSTALL_PATH}" != "" ] && ! [ -e "${INSTALL_PATH}" ]; then
+	mkdir -p "${INSTALL_PATH}"
+fi
+
 # User/arch may have a custom install script
 for file in "${HOME}/bin/${INSTALLKERNEL}"		\
 	    "/sbin/${INSTALLKERNEL}"			\
-- 
2.43.0


