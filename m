Return-Path: <linux-kbuild+bounces-2246-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A5E91684C
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Jun 2024 14:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AC2C1C22763
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Jun 2024 12:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38CC14A619;
	Tue, 25 Jun 2024 12:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="Lb1eXWNr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787D31474D9;
	Tue, 25 Jun 2024 12:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719319573; cv=none; b=F/78UyMViPBd0LwIWn72YugUSQjL30zZtt89zxYxq0E4kSxUXG7b5kN9zjp4toxxYbxE4Zgl6SymG7mlE77kXZrRhROL/vpc+iSieaOQw3rrwnAmXgu23FIF+AGlkwETWh+Yhpq86Gh1q8sSRJBFGgO6smv45UzezkwCaHrFK4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719319573; c=relaxed/simple;
	bh=UgG6zuDj3mUNroT4Pq2RquviOSsBcsYsmr8LcPCX3w0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LJ08i49+KPS0W6NNv3U29Yv1A27cG+oNogdq+qaS9zj7AmGCsUeCLcOFRgps9qI2SqBgibnLE36hIxAdMB9QEZgjySdHUNvzYumsyUZKGrtkuHdfH5cnpfTURrRXv2E/1/qyRP4dlZJD11WmDydaATaAlOybFO/vqqVlVt6/+lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=Lb1eXWNr; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1719319560; bh=UgG6zuDj3mUNroT4Pq2RquviOSsBcsYsmr8LcPCX3w0=;
	h=From:Date:Subject:To:Cc:From;
	b=Lb1eXWNrC5nlBPB+FrSOYuEmAITnVcywyMkDrfQ7Fzfn6j9K6I1gDE90CrOwJzxUV
	 +S0gJ1F/B2+SEWpOFmwXp5CIy3Fuk+Y6UXqBtzpKHm/YHCfsEFK1hrrGqT68WjXUZ/
	 Vy3NL16vvYXI06n0QsK8AQwtrViC3ZxAArITK/uw=
Received: from mail-auth.avm.de (unknown [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 25 Jun 2024 14:46:00 +0200 (CEST)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id C7196806FE;
	Tue, 25 Jun 2024 14:46:01 +0200 (CEST)
Received: from l-nschier-z2.ads.avm.de (unknown [IPv6:fde4:4c1b:acd5:7792::1])
	by buildd.core.avm.de (Postfix) with ESMTP id BAE41182BC8;
	Tue, 25 Jun 2024 14:46:01 +0200 (CEST)
From: Nicolas Schier <n.schier@avm.de>
Date: Tue, 25 Jun 2024 14:45:56 +0200
Subject: [PATCH] kbuild: deb-dpkg: Check optional env variables before use
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-mkdebian-check-if-optional-vars-are-defined-v1-1-53f196b9f83a@avm.de>
X-B4-Tracking: v=1; b=H4sIAAS8emYC/x2NQQqDMBBFryKz7kAaoguvUrqYJj862EaZFBHEu
 zd0+fi8/06qMEWlsTvJsGvVtTS43zqKs5QJrKkxeeeDG3zPnyXhpVI4zogLa+Z1+zZJ3ryLVRY
 DJ2QtSCxhiNn1PiCA2uNmbTj+tcfzun4tOKtOfQAAAA==
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <n.schier@avm.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2109; i=n.schier@avm.de;
 h=from:subject:message-id; bh=UgG6zuDj3mUNroT4Pq2RquviOSsBcsYsmr8LcPCX3w0=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBmerwJO7xJurk4fkB+K10WVnzGKfGgRf6yPL2gQ
 gEjiGsp2J6JAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCZnq8CQAKCRCIxryciJpt
 uK2lD/4jow1qnRsjeB/9Ju8ZFzp8i8M0vJzrLCrYugXTOoVmaBrtxZnJyhWJcbxokz7ZDko8mgu
 zTYY9pnHjro+G84Qk5BZf3s3rf6X1ItSYVora3Z9TbP6H/BeGt5LSv6LFKVRHXuPN8SKxW85ApS
 i3Ppv45wkiPQRnL+jcvKX0pqcssdPZZ9DjL/1EYq+AV0fy3/Z3VgHZtKPOAjqNigEhj3+Ng+t2m
 KWvJAfWFPi8u/zXnBRJL+J4QBKXH4qmAPL1Y05kWgF03n3iP7MJbOiwxC5hicemSU50w0T5Tepx
 uktzPZcEPDGCfRctWj5bcfsVWxczRmQ12lT8KiTAOdclm43YqW/jyQCsxgPdJDJ2xcfy6CkJlES
 BioFVWsZHIEAbGzKh75XA7tTPRs/x8YoGVaHxGpcsLOlItEte12ZziZFU3+Np/kV6XnFNqVDw7K
 75AfUF+OXtY5zwaa3wapDtnRDPKifFWLOt4atctwX95COKit9qyX6XEBw+JVAMbFD+Zr4fHv2G+
 hZw9q8t0vaw0is7TFt0/l3OLRYXq+2S4HFkW/C2D4ypSUd6XyuZ96ZkIpzd/UpJCzilZkqud89O
 GD8XrooXTNfbHqfjDntZ4YQvrVtuJrFxA5ynqbUez5to4tbyueldoEWwtJAXtsxoSEtlFqJISrz
 AZWv8qv4XlBzGmA==
X-Developer-Key: i=n.schier@avm.de; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1719319560-40F0C4F2-F9180F22/0/0
X-purgate-type: clean
X-purgate-size: 2111
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

Add checks to mkdebian for undefined optional environment variables
before evaluating them.

Some variables used by scripts/package/mkdebian are fully optional and
not set by kbuild.  In order to allow enabling 'set -u' (shell script
exits on dereference of undefined variables), introduce the explicit
checking.

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nicolas Schier <n.schier@avm.de>
---
This allows application of the original patch
   [PATCH 1/2] kconfig: add -e and -u options to *conf-cfg.sh scripts
   [PATCH 2/2] kbuild: package: add -e and -u options to shell scripts
as sent https://lore.kernel.org/linux-kbuild/20240611160938.3511096-1-masahiroy@kernel.org/
---
 scripts/package/mkdebian | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index b9a5b789c655..2a7bb05c7f60 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -19,7 +19,7 @@ if_enabled_echo() {
 }
 
 set_debarch() {
-	if [ -n "$KBUILD_DEBARCH" ] ; then
+	if [ "${KBUILD_DEBARCH:+set}" ] ; then
 		debarch="$KBUILD_DEBARCH"
 		return
 	fi
@@ -147,7 +147,7 @@ fi
 
 # Some variables and settings used throughout the script
 version=$KERNELRELEASE
-if [ -n "$KDEB_PKGVERSION" ]; then
+if [ "${KDEB_PKGVERSION:+set}" ]; then
 	packageversion=$KDEB_PKGVERSION
 else
 	packageversion=$(${srctree}/scripts/setlocalversion --no-local ${srctree})-$($srctree/scripts/build-version)
@@ -164,7 +164,7 @@ debarch=
 set_debarch
 
 # Try to determine distribution
-if [ -n "$KDEB_CHANGELOG_DIST" ]; then
+if [ "${KDEB_CHANGELOG_DIST:+set}" ]; then
         distribution=$KDEB_CHANGELOG_DIST
 # In some cases lsb_release returns the codename as n/a, which breaks dpkg-parsechangelog
 elif distribution=$(lsb_release -cs 2>/dev/null) && [ -n "$distribution" ] && [ "$distribution" != "n/a" ]; then

---
base-commit: 3893a22a160edd1c15b483deb3dee36b36ee4226
change-id: 20240625-mkdebian-check-if-optional-vars-are-defined-a46cf0524e4e

Best regards,
-- 
Nicolas Schier


