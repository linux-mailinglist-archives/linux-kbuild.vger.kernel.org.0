Return-Path: <linux-kbuild+bounces-1230-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 852E587B360
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Mar 2024 22:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39D3F1F24F8E
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Mar 2024 21:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC07D1A38DB;
	Wed, 13 Mar 2024 21:20:05 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2AF54735
	for <linux-kbuild@vger.kernel.org>; Wed, 13 Mar 2024 21:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710364805; cv=none; b=fyzFSTD9kRAq+CnUcpsa1D8uDy5QPAeAkdULoUmHTCSej2AvW1ZVVpJB708BXudAhfe2AxCrNdiIn8ZSrDZCGPZa4kR8A2vz7xOWvFv3odynvufMc+zTpcaXk0MWH+mNa5eMwA+V6t5s/pacKgOvhUfuSjzebKdricVCTRF7HR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710364805; c=relaxed/simple;
	bh=4qn7eSAfjsV1EzkrCEj4rzVTWbR4k8GOK6ohHb3Wwe8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jG4rIyWdPx5rke/tWLlzsJ93Dap22e3EdheLDIsB5a8TuP8wBThgu38kxX3ALwgTVgevu5ugd4B2Oc4pUZy2XLxxOlnarZhUYKbG08gaKBktTooUr0IvtpY+kcgBhodyQvs3js6G8b2AvMIIHgpBpI7OPpvJQWdYcwy6KFBuN3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rkW12-00074e-CM; Wed, 13 Mar 2024 22:20:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rkW11-006Bfi-Kg; Wed, 13 Mar 2024 22:19:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rkW11-005g0M-1n;
	Wed, 13 Mar 2024 22:19:59 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	kernel@pengutronix.de,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] lib/build_OID_registry: Don't mention the full path of the script in output
Date: Wed, 13 Mar 2024 22:19:56 +0100
Message-ID: <20240313211957.884561-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=4qn7eSAfjsV1EzkrCEj4rzVTWbR4k8GOK6ohHb3Wwe8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl8hh9xTSSm4BMuL5+UkJ+u9CTm1Zh3jTBiImnp vw03SWLrJ+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZfIYfQAKCRCPgPtYfRL+ TlEuCACEOrbQ3FvkaU4OxNnchuCyMVc1c14oNRP/Lqc051/0AipaO90Gd/OoU/+QmjtUBdRExP1 hCDGmXYEb5HcNRDenADJOGZf2vqQO6EpMYeiQ0zOtFKMOjj++1WXCIK/ZdeNT54VhcfLGn03dxJ swBZ1A4QY7fjxKcAr/uz/MzNm4LAiE5IU9//fxIg10GKSeg1oxdD5ZmmQuX1Sp775yWPdO7faCp eH1r+GG8xxZYYZ03DiZblIrk/e352HK305croMqvVkoPsxXXOo0+L7XtbHJ9qzjKWyxAw/svZlw XBWcEJ36omeiuom2cCrRf+cCb82QBqM0PailXYWJG0QsefB9
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

This change strips the full path of the script generating
lib/oid_registry_data.c to just lib/build_OID_registry. The motivation
for this change is Yocto emitting a build warning

	File /usr/src/debug/linux-lxatac/6.7-r0/lib/oid_registry_data.c in package linux-lxatac-src contains reference to TMPDIR [buildpaths]

So this change brings us one step closer to make the build result
reproducible independent of the build path.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Changes since (implicit) v1, archived at
https://lore.kernel.org/lkml/20240311110121.459581-2-u.kleine-koenig@pengutronix.de:

 - Handle abs_srctree not being exported any more

The v1 patch made it into next but im combination with commit e2bad142bb3d
("kbuild: unexport abs_srctree and abs_objtree") resulted in a build warning
about $ENV{"abs_srctree"} being uninitialized which required this respin.

Best regards
Uwe

 lib/build_OID_registry | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/build_OID_registry b/lib/build_OID_registry
index d7fc32ea8ac2..56d8bafeb848 100755
--- a/lib/build_OID_registry
+++ b/lib/build_OID_registry
@@ -8,6 +8,7 @@
 #
 
 use strict;
+use Cwd qw(abs_path);
 
 my @names = ();
 my @oids = ();
@@ -17,6 +18,8 @@ if ($#ARGV != 1) {
     exit(2);
 }
 
+my $abs_srctree = abs_path($ENV{'srctree'});
+
 #
 # Open the file to read from
 #
@@ -35,7 +38,7 @@ close IN_FILE || die;
 #
 open C_FILE, ">$ARGV[1]" or die;
 print C_FILE "/*\n";
-print C_FILE " * Automatically generated by ", $0, ".  Do not edit\n";
+print C_FILE " * Automatically generated by ", $0 =~ s#^\Q$abs_srctree/\E##r, ".  Do not edit\n";
 print C_FILE " */\n";
 
 #

base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
-- 
2.43.0


