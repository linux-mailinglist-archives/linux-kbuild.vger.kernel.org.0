Return-Path: <linux-kbuild+bounces-9277-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDFBC03B4E
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Oct 2025 00:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A209C34AE3E
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Oct 2025 22:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5707C2BB1D;
	Thu, 23 Oct 2025 22:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXMqv1Fk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBFB184;
	Thu, 23 Oct 2025 22:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761259904; cv=none; b=r/EvcC9IvgPTxLeEPYjew/1dDUF5RSSHutforDGKT1oq0ZziSva5v6Nlkl/qLl3fd/2n0FS73xnA2t/05ea/47S+JC0l9b1O2+opqnbhpYxnmQcxCXmzBfjDub1qY89W0+2aw+jzzsgGk4Uzeem7//4WpBM9Gr1v7kEhjcEVfeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761259904; c=relaxed/simple;
	bh=20G109HBjZ5mQAkyEfmJdKybRxuEHjhm2XjP+Cpfdvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uFxq5moIRW7zcVQqbsHG56FQgJ4AHkc1F+pTXyXD+9uiwxWC2GGMsoTitcp2w7emDQcazu1caf7a4zLze2zrAJbGSCtLODE3lP8XNsjxHmjGx9NZ3yWrhculuZFAox11hcIl9cAXGv/SKA0c3pbbB5pTCjTxpdSioNj841Mcfv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXMqv1Fk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856D4C4CEE7;
	Thu, 23 Oct 2025 22:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761259903;
	bh=20G109HBjZ5mQAkyEfmJdKybRxuEHjhm2XjP+Cpfdvk=;
	h=From:Date:Subject:To:Cc:From;
	b=CXMqv1Fke4oqixcjYFRfPNAwuNss9vg+JXFO0U74vg7R52HkGIsWg9Q6nWbXJ5LAw
	 oWuRiAVXGDud8K5UHyXprE6rohHNb6UEkZaOhPtsiYPYw33IS0X2XIIocLb6Klf2no
	 oew9T/Z7e57Snvv5FS+2R1hnyUvug3UKIkKqFZWousNL01jpCx2rOm+fgjpvKFD75z
	 yJJYLicAwzcfYgu1o6Z60baSHB0kapPLlX40QAzGwfrFe/55XCXV7v3IyIPzRN5j6y
	 E0Y5kq5y4aWBKt1ydwr+OF7Nk3Q3RG8hYSWKPxzMm3Bjh+uMEHd5VToOx7G4aH79QN
	 +FanuJ4r6MKgQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 23 Oct 2025 23:51:29 +0100
Subject: [PATCH] kbuild: uapi: Drop types.h check from headers_check.pl
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-headers-pl-drop-check-sizes-v1-1-18bd21cf8f5e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHCx+mgC/x3MQQrCMBAF0KuUWTuQTKmIVxEXNfkxg9KGGRCx9
 O6GLt/mbeQwhdN12MjwUdd16YingVKdlydYczdJkCkGGblizjDn9uZsa+NUkV7s+oOzpPPlESS
 PsRTqQzMU/R777b7vfw2XSrdtAAAA
X-Change-ID: 20251023-headers-pl-drop-check-sizes-2c68b02d31ff
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2764; i=nathan@kernel.org;
 h=from:subject:message-id; bh=20G109HBjZ5mQAkyEfmJdKybRxuEHjhm2XjP+Cpfdvk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBm/NtYx57Q7m/xbVrItUmqtykGRgJvebY/Wm3rzpmvvC
 lRby/G9o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExE7RLDX7FDCg6hOw1LOSdt
 fRDDx3kiI+LID6v8Zyzf5B1/rjVrVmb47/YjJP3vBXmnCZwMUctZrhY8kn371ttEyfRtkmZByMV
 6HgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Since commit d6fc9fcbaa65 ("kbuild: compile-test exported headers to
ensure they are self-contained"), the UAPI headers are compile tested
standalone with the compiler. This compile testing will catch a missing
include of types.h, making the types.h checking in headers_check.pl
originally added in commit 483b41218fa9 ("kbuild: add checks for include
of linux/types in userspace headers") obsolete.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 usr/include/headers_check.pl | 63 --------------------------------------------
 1 file changed, 63 deletions(-)

diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.pl
index 1fbc8785f96e..af5a513eaa00 100755
--- a/usr/include/headers_check.pl
+++ b/usr/include/headers_check.pl
@@ -39,7 +39,6 @@ foreach my $file (@files) {
 		$lineno++;
 		&check_include();
 		&check_asm_types();
-		&check_sizetypes();
 		&check_declarations();
 		# Dropped for now. Too much noise &check_config();
 	}
@@ -103,65 +102,3 @@ sub check_asm_types
 		$ret = 1;
 	}
 }
-
-my $linux_types;
-my %import_stack = ();
-sub check_include_typesh
-{
-	my $path = $_[0];
-	my $import_path;
-
-	my $fh;
-	my @file_paths = ($path, $dir . "/" .  $path, dirname($filename) . "/" . $path);
-	for my $possible ( @file_paths ) {
-	    if (not $import_stack{$possible} and open($fh, '<', $possible)) {
-		$import_path = $possible;
-		$import_stack{$import_path} = 1;
-		last;
-	    }
-	}
-	if (eof $fh) {
-	    return;
-	}
-
-	my $line;
-	while ($line = <$fh>) {
-		if ($line =~ m/^\s*#\s*include\s+<linux\/types.h>/) {
-			$linux_types = 1;
-			last;
-		}
-		if (my $included = ($line =~ /^\s*#\s*include\s+[<"](\S+)[>"]/)[0]) {
-			check_include_typesh($included);
-		}
-	}
-	close $fh;
-	delete $import_stack{$import_path};
-}
-
-sub check_sizetypes
-{
-	if ($filename =~ /types.h|int-l64.h|int-ll64.h/o) {
-		return;
-	}
-	if ($lineno == 1) {
-		$linux_types = 0;
-	} elsif ($linux_types >= 1) {
-		return;
-	}
-	if ($line =~ m/^\s*#\s*include\s+<linux\/types.h>/) {
-		$linux_types = 1;
-		return;
-	}
-	if (my $included = ($line =~ /^\s*#\s*include\s+[<"](\S+)[>"]/)[0]) {
-		check_include_typesh($included);
-	}
-	# strip single-line comments, as types may be referenced within them
-	$line =~ s@/\*.*?\*/@@;
-	if ($line =~ m/__[us](8|16|32|64)\b/) {
-		printf STDERR "$filename:$lineno: " .
-		              "found __[us]{8,16,32,64} type " .
-		              "without #include <linux/types.h>\n";
-		$linux_types = 2;
-		$ret = 1;
-	}
-}

---
base-commit: ac1280211e1c41704c756fd1bc5512f92010b3f0
change-id: 20251023-headers-pl-drop-check-sizes-2c68b02d31ff

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


