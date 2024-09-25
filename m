Return-Path: <linux-kbuild+bounces-3803-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D43F59869E5
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 01:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B3CC281208
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 23:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0721AF4D1;
	Wed, 25 Sep 2024 23:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aRV+NzUG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D81B1AED55
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 23:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307616; cv=none; b=giiJV5n9NvlwHAEGJYMWo6e+Shz7tF67n04Gn9VrS2q7NCljdktiYWZWRo4dwkitDsol/NG2eAYn4LXg5GvD3i0M8bzezXsMUydXAE7n62IWjlJEkb7t98lTVj7moK3waxsmtJrZ5TnoAc8f0RIW4fkzoGHEV3O+RDnUyV4bLWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307616; c=relaxed/simple;
	bh=CxcOGYVl0RHNxURp1Y+1xpXbMOZLvm56O9AP4mZATd8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fHTqB59ddl84fCZriN42Km7Mk80h7SWUNx+5NOXvJ9mGVTG+l8dZ4nWTKeq/p+U5vxg0LK35fUNfJ87wDPmrJ6aVsiPU3d1zVTsiItYUiKyloEoXzzU7q2dJMutqE8kj1Onh1lCqz/xadwNTI/TEhG3slt0ZdpkSIiLTuTit0DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aRV+NzUG; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e1159fb161fso624537276.1
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 16:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307614; x=1727912414; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WplRKYGF+6Vdtojy3WxnxZnhza95+GyPbQDFLT+DHQA=;
        b=aRV+NzUGcQL4/ON7uIiCHk8jIbKQL9jQ5QyJkiVpL7vm2kJlCNj8gzPruXe8klTwfl
         Zi+BHkx2vbPtz78f4TDt5anS2Wb6eEdqIdUyvVzVfcbpCj5vW7Ytkrmb0NHShIm4LFif
         mq9PTj2fjOJp25iZVq0OpBa/MHbgZ1+rkgh8eMPwdH+Pl/ucPhCprx30plQsooIQxkTK
         rev4RuTRDiegtTCAXbdUBKvwwXR25AMOo+wD7W/JQYl6j2ObteqKMNwyBCxh9Uddo0yT
         zi+UVJj3nm7Lnk8rCO571Jzwo1xeSNreuGNM47rKJH6Y/gJqnbLPJFnHp298w9R+Hau8
         kKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307614; x=1727912414;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WplRKYGF+6Vdtojy3WxnxZnhza95+GyPbQDFLT+DHQA=;
        b=HWk6GlrQdkwrnEMFynIjpbvbu7RKeXqj63O7P9osNHl6e3N2beWkEvu4TmYeerk5C2
         c44O25Vzf2WMVzR/HR0L+u83fORl5nCLGzP7BMR09rMpT7il95rHp3zlHxEzrw4dPOqi
         /mw0yVU9+KPrj0d6vcvsYFRYfP3z2tbyI//iD6XRJVk9mTenOFdNjtdb5BVrqHjsgqXy
         gk8IBgd5gNr9QNhAyUVj+0dFry5ehxvYckvJfJJ4i6sVVAaB+1ziQtlOjINdDTPYP+wb
         iUjws6EDG/k2JW00K+86OzUlAskIkXQdTvNDjWJWJgc6BO94/CL6uEh3xC7QF3dRQVKQ
         pYnA==
X-Forwarded-Encrypted: i=1; AJvYcCU7RHy/xtIYpklaKkhS4gytOm+vyfyHbJivAvIY30JrGelpJUQO+IiI4zIepPmYpGUXQNkWT7zDoa1UZ/E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Zkf8gNes1CBjISrRwJnkNt+9PPgcihssHatSGVQXi1npM24Z
	6YfM9/WviUPar3KHwE9ZHwWc2EoF6yZVd9PvVqGZaV4elPhi6BjY4COMvRnz0BiDcSvyivH3gcm
	2FzHugw==
X-Google-Smtp-Source: AGHT+IEf40pL03JKKHoArutuPYYFcfXs6+lqlBIsFYP4JGQ4Mtdii+GrGo8PKjLJPO4DM/u/M2ebjWWjQD3t
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:780e:0:b0:e16:6e0a:bb0b with SMTP id
 3f1490d57ef6-e24d44cad51mr4791276.0.1727307613856; Wed, 25 Sep 2024 16:40:13
 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:38:31 +0000
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240925233854.90072-17-mmaurer@google.com>
Subject: [PATCH v5 16/16] export_report: Use new version info format
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Matthew Maurer <mmaurer@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, linux-modules@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
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
2.46.1.824.gd892dcdcdd-goog


