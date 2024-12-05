Return-Path: <linux-kbuild+bounces-5008-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A9D9E567D
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2024 14:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5AAE2844A0
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2024 13:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254C0218AB5;
	Thu,  5 Dec 2024 13:20:59 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082B5218AB7
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Dec 2024 13:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733404859; cv=none; b=f3dZL32NzRP4feBKvc9Ccz8Ui0ImR+PbXFrBQFSKBnr+T2/sY2c06sp2+Z4r7rcB0G367mLBcDr1d8m40oXxOjmMDD4Y/XeTTThfGZSEmCzhwjdTgUsceuwR2dEJzd+zXbOcMA6eBQg428zZn7AG+1rwHWOY1ym+fv3oIam1Qto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733404859; c=relaxed/simple;
	bh=nysy/3YK1EuPFaum4/TbD/K8B3xCFjoGXHffLldvUOg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ShTGYsoRBO2kOgra2f1nxy4KctUKfD5sMwxW9OZ0Bq2QAqu/A2UPtiAAmzTBDGxCBpqCfqJGir0rjRFfrtqeMnXv9GJK7YfGKn/JfHZp9Q33xgjpeee6d5iFhb+0n7eJfWy9+2LyNb/dnBH5Ur+RwtzBa5cf3swDISGL9g/pbq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b16a:6561:fa1:2b32])
	by laurent.telenet-ops.be with cmsmtp
	id l1Lo2D00E3EEtj2011LoH4; Thu, 05 Dec 2024 14:20:54 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBmh-000LQo-IZ;
	Thu, 05 Dec 2024 14:20:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBmi-00EQdR-B4;
	Thu, 05 Dec 2024 14:20:48 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Oleg Nesterov <oleg@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-arch@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] kbuild: Drop support for include/asm-<arch> in headers_check.pl
Date: Thu,  5 Dec 2024 14:20:43 +0100
Message-Id: <19fb5b49396239d28020015ba2640d77dacdb6c2.1733404444.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733404444.git.geert+renesas@glider.be>
References: <cover.1733404444.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"include/asm-<arch>" was replaced by "arch/<arch>/include/asm" a long
time ago.  All assembler header files are now included using
"#include <asm/*>", so there is no longer a need to rewrite paths.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 usr/include/headers_check.pl | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.pl
index b6aec5e4365f9bf2..7070c891ea294b4d 100755
--- a/usr/include/headers_check.pl
+++ b/usr/include/headers_check.pl
@@ -54,10 +54,6 @@ sub check_include
 		my $inc = $1;
 		my $found;
 		$found = stat($dir . "/" . $inc);
-		if (!$found) {
-			$inc =~ s#asm/#asm-$arch/#;
-			$found = stat($dir . "/" . $inc);
-		}
 		if (!$found) {
 			printf STDERR "$filename:$lineno: included file '$inc' is not exported\n";
 			$ret = 1;
-- 
2.34.1


