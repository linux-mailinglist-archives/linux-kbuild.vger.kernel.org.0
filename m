Return-Path: <linux-kbuild+bounces-2858-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE16949A25
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 23:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A6801C20B60
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 21:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722D2171658;
	Tue,  6 Aug 2024 21:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qxgg0Hu7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F327817166E
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Aug 2024 21:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979321; cv=none; b=JDWxgGCr011ioK/mwfzF8LZPSwTYuNG7Q6oEPSXu0TAA9b11ySS4OOvTLWupIpHMcjb3/I3XcAzhnTYC6mqlIKmd73DoNUDnKkghIuQ8ZUwuCbLfTAmrgHoGxP2B9VY7ucihENL73V0NEl2w+nNGAguCo9AHnsUI/nbb6IDkNIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979321; c=relaxed/simple;
	bh=PeHGueIu6A9NDir1Q16OtEIXpu5W9OAUxaQCN3XQaIQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aAnE9G+rTa1U7xdIOFOXggy4Ntp0uUJSNhJGnjHewfwvMgnmlnyOfDeWnieQDKeCDNYlmW/v2WFqPJ3+yfU0PlLPoofexOzyuJg4Irea4/9K8yyQpC8CfGs6rlEwZINvkmCMKY4eorAE3O8V7qq45/JSuYBasPCxNM1fuT0BQx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qxgg0Hu7; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-66628e9ec89so25188697b3.1
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Aug 2024 14:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979319; x=1723584119; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIxM7MXS5ywuKBbdk2V16TlFyqzq6A34Xp135s0mvWo=;
        b=qxgg0Hu7sCqA3arWhzLzlYxRlNU63s2V1Me+wEanYEvTTp+cAdFIIYhRCWgXn2q/O1
         SEkNhC2NI2tns89LRwhBTNff4/jZ4Ypm4PF549l2sGj0bqHGawQDdVg5+GV0tN+z16WR
         EOeHY2G+L4sGqlGm96q3122AS9U99i3FYBi6J2Mg7QJc1G1HBoflWcYw8Q6P4yuHeHnC
         Ct3fyHeLjK3p2N+pc5C6/eXYTGujISmCJ+mPbO5vK9Ct8lXwQXfIiP4du5w4M1nQ17oE
         UxH5/Wev08Cn6SttKsJAVq8lFGMpzJe9rCeDbufby+/h0IthFl4UPojOlN0GHwkq8jvZ
         y6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979319; x=1723584119;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iIxM7MXS5ywuKBbdk2V16TlFyqzq6A34Xp135s0mvWo=;
        b=PxefJcgKIoo/egUUYJTW3ehAByMzc23rSwtiFCgVvwFAsrp1Bfe+D08tXrZ65QeUlt
         b0wkWnGCgRVqTg/W1wLnlyKERjKTsTdAErIOiwi70W5SEbaYgzjftoSElEf3CkraTSAG
         iXtstId/GtomFL8FkPOa5e0pnN5hIsa3OHCONuQJpMpnErxEPXYA2VEGx0cj2A2FQ5db
         3c7xt4p3bEAF/2aFmW7CKmoUlcuparRjg5zJWy2DioiY4JKSgV8PP6kNNJuwogjd/2qB
         L32WahwD28LRr/KBamp6xCJjWlKamZEcAva4HhNx3Vro/k4urBJ/YLV8eeYrZzu75lOK
         sDGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTM27WO/YmwnVzRsznnkZv6i0zgVehppkLYswVaulSTzDj5YAU4yH46WP3wfGqOHnyobLbfJiYNgm6KqcHi6nvNjlkkm4APlUJOZCa
X-Gm-Message-State: AOJu0Yyv/U4siB4MrRLyQmTCOUaS0bWy6a/yJezHwEoXpAA+tP7UBdM1
	rDUe52TjvRVvT89horFRWWDhjQQTx2YrijyJYg7LcuVVFY0ig4HNzi7NPuMjXPVDX2qsfZ1f3mh
	Yw9LKCg==
X-Google-Smtp-Source: AGHT+IE/dOY4BBF0bOHl2trWuq/uURBgtWdSBnMlFtpxYXnDrUIM7aP+OZNSkdR90xgdGT6ytbLkJI0RlN0q
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:1241:b0:e03:3cfa:1aa7 with SMTP
 id 3f1490d57ef6-e0bde1e9203mr23531276.1.1722979318983; Tue, 06 Aug 2024
 14:21:58 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:42 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-17-mmaurer@google.com>
Subject: [PATCH v3 16/16] export_report: Use new version info format
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Matthew Maurer <mmaurer@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"

The new version info format has a superset of symbols in the old format.
Since this is a tool for in-tree modules, we don't need to parse the old
one with this tool any longer.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/export_report.pl | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/scripts/export_report.pl b/scripts/export_report.pl
index dcef915405f3..6a37df6f947f 100755
--- a/scripts/export_report.pl
+++ b/scripts/export_report.pl
@@ -114,31 +114,29 @@ foreach my $thismod (@allcfiles) {
 	}
 
 	my $state=0;
+	# State map:
+	# 0 - Looking for names
+	# 1 - Scanning names
+	# 2 - Done
 	while ( <$module> ) {
 		chomp;
 		if ($state == 0) {
-			$state = 1 if ($_ =~ /static const struct modversion_info/);
+			$state = 1 if ($_ =~ /__used __section\("__version_ext_names"\)/);
 			next;
 		}
 		if ($state == 1) {
-			$state = 2 if ($_ =~ /__used __section\("__versions"\)/);
-			next;
-		}
-		if ($state == 2) {
-			if ( $_ =~ /};/ ) {
-				$state = 3;
-				next;
-			}
-			if ( $_ !~ /0x[0-9a-f]+,/ ) {
+			if ( $_ =~ /;/ ) {
+				$state = 2;
 				next;
 			}
-			my $sym = (split /([,"])/,)[4];
+			$_ =~ /"(.*)\\0"/;
+			my $sym = $1;
 			my ($module, $value, $symbol, $gpl) = @{$SYMBOL{$sym}};
 			$SYMBOL{ $sym } =  [ $module, $value+1, $symbol, $gpl];
 			push(@{$MODULE{$thismod}} , $sym);
 		}
 	}
-	if ($state != 3) {
+	if ($state != 2) {
 		warn "WARNING:$thismod is not built with CONFIG_MODVERSIONS enabled\n";
 		$modversion_warnings++;
 	}
-- 
2.46.0.rc2.264.g509ed76dc8-goog


