Return-Path: <linux-kbuild+bounces-5086-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6A59EE2FB
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 10:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C3B71693FC
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 09:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD2020E6EB;
	Thu, 12 Dec 2024 09:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="aCGkhcMj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8E41D89ED;
	Thu, 12 Dec 2024 09:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995543; cv=none; b=TJI2lccrEO9MgyV7CZV6/U3h6igimUNnyqVe6Xio5X/2DYI+v/3/QWl2f7XWoQWMKJSCThA5CRRxknsOTiN2iVXnFVPaRbiOlOHw1JJ4PR3DmlJXikT+O4eU5zlx8eVlMv8TtJf1L2X9Trq77ounHsD6jDa5iBddEuCscjGE5vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995543; c=relaxed/simple;
	bh=/WPFleMRaz6XFkze61Xn6g7S/ixNgriaPjSFy27wn7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PesUEyLPduoFYe3dPGmx0G99gdaxKydOJKq37AfPv/KWOcksRoENq6GoGE02+Mce1kxEodf+ConWg+r7R4wIKQQE+pS+1JXGY3mwzoyH4bpdof95azHRHoW26U+Cc8t5BRnQq817ppXy+vbOr8h1ylwXTQkPDBgjrDEL2NewQhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=aCGkhcMj; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Sender:Reply-To:Subject:Date:Message-ID:
	To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fbgQZq0gSQQJCZVPop/zN/gMfXXbA+Ii4vYjXcq6OpM=; b=aCGkhcMjOnFAXx2RTt7vUORW7E
	WB+/9NIoI//XHHJ+bckKH9mOHGvDYzzL9WmQ/qgJn6z01lI61OJ6dD2YE7WoM2cPhBqFzzugfHV39
	a/5kR7PKkB557MxgVBu1LGgchRJKvkrVPuhb1jvL4YelKZrded/XpDBxHa7i/FOeSuWbnYxoDPBFt
	SbgrdIs43Cdi3dFBF7BJ8C/sZPS5ZLUjMOJNzxZaer9xNPKeO7oGL6rgTZbq1PZt6HULT60X25xAu
	JP2AVmbmeJjTmyQQrr5JRvzyv5VPUAyemxp5VuOefQ6lPdQReqezu1h7m5Ds8rQww4+TuLjsZ9w+G
	hGT2o80g==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1tLfRi-008xkM-3K;
	Thu, 12 Dec 2024 10:25:22 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
Date: Thu, 12 Dec 2024 10:24:38 +0100
Subject: [PATCH] kbuild: deb-pkg: Do request initrd for user-mode-linux
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-kbuild-deb-pkg-no-initrd-for-um-v1-1-23243b5c7093@fjasle.eu>
X-B4-Tracking: v=1; b=H4sIANarWmcC/x3NQQqDMBBG4avIrPuDGcRir1K6MGZiB9tEJrUUx
 Ls3uPw27+1UxFQK3ZqdTL5aNKcKd2loeo5pFmioJm65c+wYi9/0FRDEY11mpAxN+rGAmA3bG26
 6+mH0HLnvqFZWk6i/83B/HMcfvwG4k3EAAAA=
X-Change-ID: 20241212-kbuild-deb-pkg-no-initrd-for-um-1c7b9ab2f264
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nicolas@fjasle.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2681; i=nicolas@fjasle.eu;
 h=from:subject:message-id; bh=/WPFleMRaz6XFkze61Xn6g7S/ixNgriaPjSFy27wn7Q=;
 b=owEBbQKS/ZANAwAIAQdSCnAWJhJpAcsmYgBnWqv//11SOB//zpvX7vnRqZBU9iQ6ppLNvjf1D
 TmmiPp9jTmJAjMEAAEIAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCZ1qr/wAKCRAHUgpwFiYS
 aSByEACuKX+vOpxVo3ufIpQedx55ditHau+2lZf8vYK423Zot3NFO6ng6smsf5TPiGojBNfeyDd
 yaoEvVarNP+OVvlbW1vwYT5/GCCOX7XU6YwcH5MuGn1eYtDxBTiIf3LbWgY98FWyMhDvEpDLINE
 3OlhSCgqPQe4tAtqugPtKTbyljyYK/BZyJI6/Fa9sWkFLADiGYQ3OtljwZ5htc8gB/deuMhDPlD
 Kscp1ls6+dH+NLmt9tZdQFZ6R9thimZu0PP69PYuIxFw8cqMa2yQgLaA5Njm8j55z1brzyaHnMv
 syP/1ELgKDNlWcxm4XftwScp9RDvWmWa/L9ib6jF9mA2dszMkJxzOJ3A/hVob6LiCr5D8MPu2VT
 iYTBdZ4txUQKTzCV5CMcTIbfkFqcsbpPy79DCdObgYk7QC1bV7A7GX8/Jp7AmfbnEhEO2wsYLx4
 9c6NRPsr2FaJzx940DT7MhGfODtWuRfCy63y3ES9QJsJSZvNsC4jAcFQKrRlYPjbO2N6l2RAx+h
 b47SkaVVcEc055l9UrpcquyAdUJ006Xe+jB+VGZSLXMgxFPNkCc4FikM2dERpbD8PnmzFUGXmPD
 UMOBYI8D2zGCDYJTszd+YMmoX0kU7xgsOGmGJPWwCsiDLgOa+XHReljyOldfw5S5haFLmtHB1lV
 6qUBVCGU7IaQZbw==
X-Developer-Key: i=nicolas@fjasle.eu; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

Do not request initramfs-tools to build an initrd image for
user-mode-linux.

Building and installing a user-mode-linux Debian package with

    make bindeb-pkg ARCH=um
    apt install ./user-mode-linux-*.deb

fails reasonable due to missing kernel config in /boot
(KVER=6.13.0-rc2-00006-g8f2db654f79c):

    update-initramfs: Generating /usr/bin/initrd.img-${KVER}
    grep: /boot/config-${KVER}: No such file or directory
    W: zstd compression (CONFIG_RD_ZSTD) not supported by kernel, using
     gzip
    grep: /boot/config-${KVER}: No such file or directory
    E: gzip compression (CONFIG_RD_GZIP) not supported by kernel
    update-initramfs: failed for /usr/bin/initrd.img-${KVER} with 1.
    run-parts: /etc/kernel/postinst.d/initramfs-tools exited with return
     code 1
    ...
    dpkg: error processing package user-mode-linux-${KVER} (--configure):
     installed user-mode-linux-${KVER} package post-installation script
     subprocess returned error exit status 1
    Errors were encountered while processing:
     user-mode-linux-${KVER}
    E: Sub-process /usr/bin/dpkg returned an error code (1)

There is no need to build initrd for user-mode-linux, so stop requesting
it.

Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
---
 scripts/package/builddeb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index b497b933901013b1b8b82c2c340a88c9257c6193..d88ee487a1f2cfa3365350abe5b2203f48980d36 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -46,10 +46,12 @@ install_linux_image () {
 		cp System.map "${pdir}/usr/lib/uml/modules/${KERNELRELEASE}/System.map"
 		cp ${KCONFIG_CONFIG} "${pdir}/usr/share/doc/${pname}/config"
 		gzip "${pdir}/usr/share/doc/${pname}/config"
+		initrd_wanted=No
 	else
 		mkdir -p "${pdir}/boot"
 		cp System.map "${pdir}/boot/System.map-${KERNELRELEASE}"
 		cp ${KCONFIG_CONFIG} "${pdir}/boot/config-${KERNELRELEASE}"
+		initrd_wanted=$(if_enabled_echo CONFIG_BLK_DEV_INITRD Yes No)
 	fi
 
 	# Not all arches have the same installed path in debian
@@ -82,7 +84,7 @@ install_linux_image () {
 		export DEB_MAINT_PARAMS="\$*"
 
 		# Tell initramfs builder whether it's wanted
-		export INITRD=$(if_enabled_echo CONFIG_BLK_DEV_INITRD Yes No)
+		export INITRD=${initrd_wanted}
 
 		# run-parts will error out if one of its directory arguments does not
 		# exist, so filter the list of hook directories accordingly.

---
base-commit: 8f2db654f79c7fa579c64eda2b5db44553d6e513
change-id: 20241212-kbuild-deb-pkg-no-initrd-for-um-1c7b9ab2f264

Best regards,
-- 
Nicolas


