Return-Path: <linux-kbuild+bounces-5091-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9A99EE755
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 14:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9F272821F7
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 13:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ADB32139C4;
	Thu, 12 Dec 2024 13:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="JmNCBocB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9A71EEE6;
	Thu, 12 Dec 2024 13:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734008760; cv=none; b=Axo8tWvPNSrgo6eJj4e0nbCGwNnDv9OyGmYitRCM8djOTitB3uLvsIL9MjaCziovZGrchuJR/vSOWUhl+SPWbCb62R73a4JM2D2mOMUN3DNGu86y1pDS1uK/CfFNwnAUyW/ieoqpBlJKKvOMXCaLksPW979nxNO/hFnDhEOn/A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734008760; c=relaxed/simple;
	bh=lhIeY/AnfE+a5ibi1lQxWrYQ/0ow32Y+ac+AdxXWiT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H/bKXXExYPZyEURx/akt/tSIZ5hLDqQiDS764H/Nn+lrrPlldbg8Ti1nVZqlMU6f/jMuBHXPbI14luD9txLTmY+zlGLK9Q1zDp5yfPxrsoPShRPJYgKaITbQ7bjGqp3TGDgUarOEovpekpw/C5S9scdFJ4oVCRilys93UkME1M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=JmNCBocB; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Sender:Reply-To:Subject:Date:Message-ID:
	To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zYScIBXpM93mbTg1/jZSbEQjhWfwkxO0gmyXAYGojQg=; b=JmNCBocBcj8bfBh7n7dW6pHQNj
	sVVohVmh+nFTcZ9AI9HfR0dgfr8K0you0QT2LcDZc/fNdTb3VfFsziFxIe4ElP4LNjh1g2tS9/LQo
	QRpC2LzwCpqMT0vDujZPDBFy7MXS0vXx3LMeI1OGVg4VZkMumlhm5D/piFq9i7dWU1pVzihnDuBa8
	Gks1hgdsBBHncBmyscwMtVyTfvLz02dcUxforOQI2YEhUffWiva9joO5tVQhTe9c0EHnsGGUmB/fo
	DBB12ytKy0mgM3ZbXULnLgN93Zz1A3Fl1QvbORpmUI/8CPRqIF0z+HymxgI/rcml6o9HRwa6youA1
	IEu5L4NQ==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1tLit4-00AcFJ-F6;
	Thu, 12 Dec 2024 14:05:50 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
Date: Thu, 12 Dec 2024 14:05:29 +0100
Subject: [PATCH] kbuild: deb-pkg: Do not install maint scripts for arch
 'um'
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-kbuild-deb-pkg-no-maint-scripts-for-um-v1-1-45db61e3272a@fjasle.eu>
X-B4-Tracking: v=1; b=H4sIAJnfWmcC/x3NwQrCMAyA4VcZORtYowj6KuJhXZMZ5tqSbCKMv
 bvF43f5/x2cTdnh3u1g/FHXkhvCqYPxNeSJUVMzUE+XQIFwjpu+EyaOWOcJc8Fl0Lyij6Z1dZR
 iuC1IdA0iSeKtP0OLVWPR73/0eB7HDwtUh254AAAA
X-Change-ID: 20241212-kbuild-deb-pkg-no-maint-scripts-for-um-2261ffdfb903
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nicolas@fjasle.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563; i=nicolas@fjasle.eu;
 h=from:subject:message-id; bh=lhIeY/AnfE+a5ibi1lQxWrYQ/0ow32Y+ac+AdxXWiT0=;
 b=owEBbQKS/ZANAwAIAQdSCnAWJhJpAcsmYgBnWt+twlVM/Ib9jsU6yep06vSZYWjbtMvtd4Pjs
 PtCTwMlxkeJAjMEAAEIAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCZ1rfrQAKCRAHUgpwFiYS
 ad11D/9WLdPwh8ifMczHggWZopwX/UBVBGyBLfUeVMVWmOfDv9uAWY9cHrMVFL/WvwGt4tNpKsC
 y2sFQLI4q1hJ96NJErmCfK2IttH+tt21Ro+vY68r2FngCuEiCB0y3tu/mZfDad7nY/Pn9plqWQl
 XiJE8t/jI1UjnNYebUGjC9/5u2Ybm+LtDdI56tjTveMMREo5TzcH61n5/ClhGoMs/9EYlnDtbkU
 /lGNH1PX2iEMWdjJOqE64LQLVxkLyKdkko903TRRuWlNUYZE7BDB8ggC0gPhqqdWu2HEMR04zVM
 H0BwmzICQJuKTXN5wjHsPdCFFF5GxoXJ9uPe0aooElBsPfdxIxUTqu0SI1/lMlZVIpyjwqWJ/DZ
 3ycwrY/rNjxezZkGL7pG//glzabT1Qs081PgDwQRpVNtIijag247T0NXf+lBsMg/P/5SeyN6aAt
 FDeFZc0U6xLtGIMQQbhghEiNtXmjwV+5TMLXMLnJEZF3rdWBeY3IW30hEKdBYkc68qQx4nOtLyB
 MMtw6IHg1kwVegSLhbxtPWKHuWPesfYf+7VczV5XrH84c1yPKQVGVMKTs73VdDAKyFTJnvp+7Ys
 BVD68LSD9hYyaNl+XHaMrnXgwx0WLuCMz2aGh7A9p2d77/YcCj583jjZfBM9s1KtFd249n1g94b
 vem6zAOg3dZsuWw==
X-Developer-Key: i=nicolas@fjasle.eu; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

Stop installing Debian maintainer scripts when building a
user-mode-linux Debian package.

Debian maintainer scripts are used for e.g. requesting rebuilds of
initrd, rebuilding DKMS modules and updating of grub configuration.  As
all of this is not relevant for UML but also may lead to failures while
processing the kernel hooks, do no more install maintainer scripts for
the UML package.

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
---
Misleaded predecessor patch:
https://lore.kernel.org/linux-kbuild/20241212-kbuild-deb-pkg-no-initrd-for-um-v1-1-23243b5c7093@fjasle.eu/
---
 scripts/package/builddeb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index b497b933901013b1b8b82c2c340a88c9257c6193..3627ca227e5a5db520958e6eb0128512dca083bc 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -65,6 +65,12 @@ install_linux_image () {
 	esac
 	cp "$(${MAKE} -s -f ${srctree}/Makefile image_name)" "${pdir}/${installed_image_path}"
 
+	if [ "${ARCH}" != um ]; then
+		install_maint_scripts "${pdir}"
+	fi
+}
+
+install_maint_scripts () {
 	# Install the maintainer scripts
 	# Note: hook scripts under /etc/kernel are also executed by official Debian
 	# kernel packages, as well as kernel packages built using make-kpkg.

---
base-commit: 8f2db654f79c7fa579c64eda2b5db44553d6e513
change-id: 20241212-kbuild-deb-pkg-no-maint-scripts-for-um-2261ffdfb903

Best regards,
-- 
Nicolas


