Return-Path: <linux-kbuild+bounces-3720-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A789A984CCD
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 23:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D19D6B2388F
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 21:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01851448DF;
	Tue, 24 Sep 2024 21:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qoGnC8ng"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1CC1AED25
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 21:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212867; cv=none; b=aRVCme/DezyBiOU/3BLF6gRW/mdBOU8emxIFkWfwSUaiep1f+ARDQiVWqd2Ia++SN/grVxApQME1mI6eMy7tfdV2QhYxJYx4wkL0uPICY97bSzK1bSAc9DVnUd/YLWiM3a4pw7QZPHjGu7VtFlSJNUnItjs9Ti8aTbjGvesxqcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212867; c=relaxed/simple;
	bh=KqzbIRZaiTcASB5/z7j1pBJp9u/nLEzrmBQfqdwdS+0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AOZe4YzQ7ysdVkl0UP7S34sjgKRTlX5Hz/2wt/FBvv/kA9EuAEVrM684CMmNfawZzv2xJDsXRJlNhpfLJRMb6jwHDQY4umXeLl19WHCWDOndywwru7nDiS7wqftn66J5CxqarwCmwQ9EKpkupzd2/CL2HLHY9wIm7jYBc/NLBpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qoGnC8ng; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6ddbaec823eso94469527b3.0
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2024 14:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212865; x=1727817665; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c9tQH+085gbT8g6utnUHSGPzzhaq/BvRPx+qqG98o3U=;
        b=qoGnC8ngC6T5fklRKNMnULbcMCSV7BuD5hQB5aftyNpZVEAqMaG3Fgy7Y2Hce6JUKu
         G+wzXdJaju3FEe8fpNZnV8IzXRPchj5Jkb62FKab0HN0Xss9n7+9NBIlwGo7gLr51ifV
         JxGcK2IIZbnxWn4CH+44diWjhi5Nj/+fqQLm0eWEuM6aZU/mFYPFwfW8ROv+CEgulgy1
         1WdsEMytXy0KiG3kWmesVlpnwknyNlYLQhF4CDtPFK/p6esOporkfg1AElemhVqlBpx2
         Qnpw1bOvZMTKcosFmycjgXB4pFuISa3h6Sm2prilOYW+fkK+OSxYUUX040nMWULY1D/d
         ecDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212865; x=1727817665;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9tQH+085gbT8g6utnUHSGPzzhaq/BvRPx+qqG98o3U=;
        b=QSMrtwkYoMHVNaegwdEYkHorUeeYiI1se1T3J7h4NlsB9rZf9QyGTI/SP44UsaRwt5
         VW8EIUhU/32MGPc3sw8C52wIT6SeFjVr+HlAjbqWT2G/Ls7ZG8gBZKgbZqi/3vPpobAm
         ivBtX7pkduStRgTwZ+YTzdcibvWlKrSWWfafzpv+n0wiati9WiA2qDu4SXIKqoZCQqwN
         I4olmrYLgiygZalf10tjZ3TfhG8a9Sr2/scmiOAFpGnia3vryfnjfzEMLC9/A9mLekxO
         UjVkJkVSFyroZ2BlTl+xdylOk6SP3aovAeO/MvNUvkpGMUt6zkbhmQs7kwr5cOeo6Ozt
         C6NQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4o1BGQQ9Brq2duSiqrK+QdEfblGzOy2inrdcpY7vgA8zKq9pfbrlPQNea4RGh4QxYGsEN0D2cxhRU5TQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7OsC4BFtEaV3qTFmPAo0nLFvrx4pibkfkfBw+meSD0ACbaa09
	PLj4xTKJskIkbLtKFze5KGkQkwYioCWBrImY5HCwW/fnVCUWmZeyqxyEPyWwvMTSoao0YvBIhvx
	Sj2N6qQ==
X-Google-Smtp-Source: AGHT+IHVnzAXCet0HeOGXyzTpRkqqhqz8oT95KqCyO+CI/8Szzd/g/rRue34womob+6zkpJak8wASq+DT+Pz
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:2a93:b0:6dc:7288:a90a with SMTP
 id 00721157ae682-6e21da5cb80mr44307b3.3.1727212865126; Tue, 24 Sep 2024
 14:21:05 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:55 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-14-mmaurer@google.com>
Subject: [PATCH v4 13/16] export_report: Rehabilitate script
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Matthew Maurer <mmaurer@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"

* modules.order has .o files when in a build dir, support this
* .mod.c source layout has changed, update regexes to match
* Add a stage 3, to be more robust against additional .mod.c content

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/export_report.pl | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/export_report.pl b/scripts/export_report.pl
index feb3d5542a62..dcef915405f3 100755
--- a/scripts/export_report.pl
+++ b/scripts/export_report.pl
@@ -55,6 +55,7 @@ sub collectcfiles {
     open my $fh, '< modules.order' or die "cannot open modules.order: $!\n";
     while (<$fh>) {
 	s/\.ko$/.mod.c/;
+	s/\.o$/.mod.c/;
 	push (@file, $_)
     }
     close($fh);
@@ -120,10 +121,14 @@ foreach my $thismod (@allcfiles) {
 			next;
 		}
 		if ($state == 1) {
-			$state = 2 if ($_ =~ /__attribute__\(\(section\("__versions"\)\)\)/);
+			$state = 2 if ($_ =~ /__used __section\("__versions"\)/);
 			next;
 		}
 		if ($state == 2) {
+			if ( $_ =~ /};/ ) {
+				$state = 3;
+				next;
+			}
 			if ( $_ !~ /0x[0-9a-f]+,/ ) {
 				next;
 			}
@@ -133,7 +138,7 @@ foreach my $thismod (@allcfiles) {
 			push(@{$MODULE{$thismod}} , $sym);
 		}
 	}
-	if ($state != 2) {
+	if ($state != 3) {
 		warn "WARNING:$thismod is not built with CONFIG_MODVERSIONS enabled\n";
 		$modversion_warnings++;
 	}
-- 
2.46.1.824.gd892dcdcdd-goog


