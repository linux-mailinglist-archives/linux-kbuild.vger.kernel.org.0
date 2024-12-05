Return-Path: <linux-kbuild+bounces-5010-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5CD9E5684
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2024 14:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E6C1188371C
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2024 13:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105CF219A6A;
	Thu,  5 Dec 2024 13:21:04 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AF1218EAE
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Dec 2024 13:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733404863; cv=none; b=MCa5+EXeQQDdQK/L3Dum0sRJTGTQ/bjUrftsptW2gOe8X6IQ57ceJo5m/zhm7tf6/hlC9BZlRXHWOSSdOqExtgIG5X/tro/eVyoQPjPGZNZTfgvTBhGn7jdN7ubBwDYsO6lD1DQOUE8y147hXMao4jpxtnEKsFWjYf3U3TPVJaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733404863; c=relaxed/simple;
	bh=LWGBEeoPaVubAD70KWG41MBjiyDfHkJO3zIb+snQZRs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RJKZQb5JDxVEYOf4f98s3iRfuZBhiNPJPgtnP0+mx+FfY/Uda72fLKc8Y+5nZFw1u48fRN34Ho+fw1IwCJ8NOhhJZPIjNPs096V8VtTrLINVRtNWVkzMBjGBb+gt1giEogfmQWwLNVeC5cKrWG1WPLyeqWQb748/eSsT6Tj+9Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b16a:6561:fa1:2b32])
	by baptiste.telenet-ops.be with cmsmtp
	id l1Lo2D00C3EEtj2011Lol1; Thu, 05 Dec 2024 14:20:53 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBmh-000LQm-Hx;
	Thu, 05 Dec 2024 14:20:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBmi-00EQdO-AH;
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
Subject: [PATCH 1/3] checkpatch: Update reference to include/asm-<arch>
Date: Thu,  5 Dec 2024 14:20:42 +0100
Message-Id: <2c4a75726a976d117055055b68a31c40dcab044e.1733404444.git.geert+renesas@glider.be>
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
time ago.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9eed3683ad76caff..dbb9c3c6fe30f906 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2875,7 +2875,7 @@ sub process {
 
 			if ($realfile =~ m@^include/asm/@) {
 				ERROR("MODIFIED_INCLUDE_ASM",
-				      "do not modify files in include/asm, change architecture specific files in include/asm-<architecture>\n" . "$here$rawline\n");
+				      "do not modify files in include/asm, change architecture specific files in arch/<architecture>/include/asm\n" . "$here$rawline\n");
 			}
 			$found_file = 1;
 		}
-- 
2.34.1


