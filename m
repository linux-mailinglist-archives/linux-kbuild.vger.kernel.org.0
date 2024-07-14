Return-Path: <linux-kbuild+bounces-2500-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9857930965
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 10:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1CC7B212BF
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 08:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37D23B7A8;
	Sun, 14 Jul 2024 08:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="BX096ylv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.envs.net (mail.envs.net [5.199.136.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801C249659;
	Sun, 14 Jul 2024 08:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.199.136.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720947511; cv=none; b=VOwLoUdMIzaSXUwR0DZq3+Ze4I0e3EMerV/4WoZouLJtFch017VLmZP6cb4rlqlQDXirlk3Ac5CbK5xjjVHktmPrWaSEAvOi1gGIDdcCtMYocDDiGn8Qcy0qjMKubjcCFOoYl2cu6odBCvp0zEs6bZ87aqDe7YZKS3t17BpbEos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720947511; c=relaxed/simple;
	bh=ftAJHSxo5Rsx/0DaR5hsL6pNxlltkkDCUMwyIZ5u780=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JUQfPW8LjByn1/NAgO72DDkYuwHvK98+FNVmjIBVlPHzv1hbxqm5xvqiK2i833xOHgGEVrtmu6eNS5FM6W4CUycLHWBpHxPMg4Fk4M80zR27DvsPsn5Uq3gMG1LnAYV2mv25PsLzCmatAzjc1SYvkQgKnUYkqMxugntLAXf2ezc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=BX096ylv; arc=none smtp.client-ip=5.199.136.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id CEA8038A399F;
	Sun, 14 Jul 2024 08:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1720947501; bh=yyUazkvkRh10ZbEGZX7/MXwA6mkniL0Aqt6WS89cGkk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BX096ylvPXeYrwWxZLty8ghuITn9TBNUlXRIqKxN+XshUOIFiMHVkGUd3M1TCwpdF
	 cRrFXlBajCA2QRwXaxHfz/LsIQftwAqqONaCO5bNb7P/K2scRD8mdcQIq/NrYYXBe8
	 FS19q6QjODirpRtBtetibQpu0xC59ex3C4KRg7b60GUyzRsYPpdB+6TzJSxesmUY84
	 CoSH/YCUPea038A6D17yPZwULk86CHmRQ2w4TkUN+H8iST31M7BDpGEyuIs2MqVLpO
	 d0yvtBxEIWMJ7mODw14gN6Qd6UvyYI+N1KLcUQ2ii4egWCHcB+9srYosrjMgrLiURC
	 7lhJQnt+QrPQPwNKHChdHpvYzr5iN9eqXx33CdncsejIxnH/1LV3P6K1uZwKNfHjtY
	 ClOnQlX5FsC6uq50sIJ8LnPf6e/haVGUp6Opr2IKu/vb6wNc4uDridsOAMHqND3GYu
	 IMG6aA7Sk8PzP5T/ETm6CwNaAdJo4ClbtFZuN3BzvLkKNvwm61RYC/eCDyHnF8IJMF
	 pojLYS9Pe16lhyqu56OWfjPld0TWD739HoGYkOv5XxSsYSjpqzdOyJ8miviKd2OmbR
	 a48tzEXKLNrrk2ZJLwEt0aTLZKbjbVKef7eMJHN9gOf453lE5hSF5ZucKdPK0owt5f
	 y+sUAWIiuuxzx990L62vMwAs=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GYBywokYmGiX; Sun, 14 Jul 2024 08:58:11 +0000 (UTC)
Received: from xtexx.eu.org (unknown [120.230.214.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sun, 14 Jul 2024 08:58:11 +0000 (UTC)
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
Subject: [PATCH 1/2] kbuild: Abort make on install failures
Date: Sun, 14 Jul 2024 16:57:50 +0800
Message-ID: <20240714085751.176357-2-xtex@envs.net>
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

Setting '-e' flag tells shells to exit with error exit code immediately
after any of commands fails, and causes make(1) to regard recipes as
failed.

Before this, make will still continue to succeed even after the
installation failed, for example, for insufficient permission or
directory does not exist.

Signed-off-by: Zhang Bingwu <xtexchooser@duck.com>
---
 arch/arm/boot/install.sh   | 2 ++
 arch/arm64/boot/install.sh | 2 ++
 arch/m68k/install.sh       | 2 ++
 arch/nios2/boot/install.sh | 2 ++
 arch/parisc/install.sh     | 2 ++
 arch/riscv/boot/install.sh | 2 ++
 arch/s390/boot/install.sh  | 2 ++
 arch/sparc/boot/install.sh | 2 ++
 arch/x86/boot/install.sh   | 2 ++
 9 files changed, 18 insertions(+)

diff --git a/arch/arm/boot/install.sh b/arch/arm/boot/install.sh
index 9ec11fac7d8d..34e2c6e31fd1 100755
--- a/arch/arm/boot/install.sh
+++ b/arch/arm/boot/install.sh
@@ -17,6 +17,8 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
+set -e
+
 if [ "$(basename $2)" = "zImage" ]; then
 # Compressed install
   echo "Installing compressed kernel"
diff --git a/arch/arm64/boot/install.sh b/arch/arm64/boot/install.sh
index 9b7a09808a3d..cc2f4ccca6c0 100755
--- a/arch/arm64/boot/install.sh
+++ b/arch/arm64/boot/install.sh
@@ -17,6 +17,8 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
+set -e
+
 if [ "$(basename $2)" = "Image.gz" ] || [ "$(basename $2)" = "vmlinuz.efi" ]
 then
 # Compressed install
diff --git a/arch/m68k/install.sh b/arch/m68k/install.sh
index af65e16e5147..b6829b3942b3 100755
--- a/arch/m68k/install.sh
+++ b/arch/m68k/install.sh
@@ -16,6 +16,8 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
+set -e
+
 if [ -f $4/vmlinuz ]; then
 	mv $4/vmlinuz $4/vmlinuz.old
 fi
diff --git a/arch/nios2/boot/install.sh b/arch/nios2/boot/install.sh
index 34a2feec42c8..1161f2bf59ec 100755
--- a/arch/nios2/boot/install.sh
+++ b/arch/nios2/boot/install.sh
@@ -16,6 +16,8 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
+set -e
+
 if [ -f $4/vmlinuz ]; then
 	mv $4/vmlinuz $4/vmlinuz.old
 fi
diff --git a/arch/parisc/install.sh b/arch/parisc/install.sh
index 933d031c249a..664c2d77f776 100755
--- a/arch/parisc/install.sh
+++ b/arch/parisc/install.sh
@@ -16,6 +16,8 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
+set -e
+
 if [ "$(basename $2)" = "vmlinuz" ]; then
 # Compressed install
   echo "Installing compressed kernel"
diff --git a/arch/riscv/boot/install.sh b/arch/riscv/boot/install.sh
index 4c63f3f0643d..a59639dff64f 100755
--- a/arch/riscv/boot/install.sh
+++ b/arch/riscv/boot/install.sh
@@ -17,6 +17,8 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
+set -e
+
 if [ "$(basename $2)" = "Image.gz" ]; then
 # Compressed install
   echo "Installing compressed kernel"
diff --git a/arch/s390/boot/install.sh b/arch/s390/boot/install.sh
index a13dd2f2aa1c..fa41486258ee 100755
--- a/arch/s390/boot/install.sh
+++ b/arch/s390/boot/install.sh
@@ -15,6 +15,8 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
+set -e
+
 echo "Warning: '${INSTALLKERNEL}' command not available - additional " \
      "bootloader config required" >&2
 if [ -f "$4/vmlinuz-$1" ]; then mv -- "$4/vmlinuz-$1" "$4/vmlinuz-$1.old"; fi
diff --git a/arch/sparc/boot/install.sh b/arch/sparc/boot/install.sh
index 4f130f3f30d6..68de67c5621e 100755
--- a/arch/sparc/boot/install.sh
+++ b/arch/sparc/boot/install.sh
@@ -16,6 +16,8 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
+set -e
+
 if [ -f $4/vmlinuz ]; then
 	mv $4/vmlinuz $4/vmlinuz.old
 fi
diff --git a/arch/x86/boot/install.sh b/arch/x86/boot/install.sh
index 0849f4b42745..93784abcd66d 100755
--- a/arch/x86/boot/install.sh
+++ b/arch/x86/boot/install.sh
@@ -16,6 +16,8 @@
 #   $3 - kernel map file
 #   $4 - default install path (blank if root directory)
 
+set -e
+
 if [ -f $4/vmlinuz ]; then
 	mv $4/vmlinuz $4/vmlinuz.old
 fi
-- 
2.43.0


