Return-Path: <linux-kbuild+bounces-4141-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE2099FC58
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 01:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFE261C24414
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 23:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100A91FDF95;
	Tue, 15 Oct 2024 23:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N1dO/cYJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F3A1FC7D1
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Oct 2024 23:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729034398; cv=none; b=a2k7he0jgv2j2vOOG7wN4jWaiQXQbIEd7ydKuaTDCMwav/tnKsT1Aghk85fxTMDkZjZuMV8QmIHAjCg3kvQq6i3NJDxcEug5/EGXhmTh8NaXgRB9ypmFT0K/KlyMSFn0uOh2HAh/tdKDfB2sJ2C2vTDX3cLdYWTCeVPfpUw+tek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729034398; c=relaxed/simple;
	bh=b/Bd5hNVwONQMAMAKZObOat4jqHFnL5FtBWQng4HuQc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uOUTGSFkANOVu0VXocsQftHdHU8Ikk6vzhI87zeLaPTe/MfjEVRmGeTe5665q2ObcN3/7NfGuP8Ttoq75yLHihuYcRKTB3TyOFRxYNyT2+EMlezJ6ejhMolnGgpTJLIyumE8gs72MTViB6+4Dq4BGs6hjporzffSQAI2dT7YBfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N1dO/cYJ; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e2904d0cad0so9007135276.1
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Oct 2024 16:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729034396; x=1729639196; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GMeFuBGaCaHx7HaM28eyKlSyRMkG/ZUOc3U36euZD88=;
        b=N1dO/cYJgyXeHSEkWZ8PHaXrwa/kRuKQYlwroncJFvpb+qGuZlcqMJw7yzLeY03SXD
         Tf3MIpwjEaL7rtuiH2HoEPdISP63RqtNsmBauP0fjZ2ytZWbuvDpD+XpeuwdZb7Vel4m
         rwDhDnugNGydsQ1jb9+y0lEiDpgyAVIil/SrHktcGNRXQXh9H2ygeeMx7bECNdUZQcIj
         Z7/PWE5YWKimlu0XXydjHhLEDV8BRzdbczjknmDR/oFRbo29BvVQpWyMRCP1FD/p+JoX
         38hchTAzzXjhve1pzxwljmTVZxAabLdBO5rZo8/VNAbjcLY+ffYEL/sMO1vvBnP7+C1y
         Krjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729034396; x=1729639196;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMeFuBGaCaHx7HaM28eyKlSyRMkG/ZUOc3U36euZD88=;
        b=EUxOx+tdi2MtrI57sw6xblc+e9dO8ECieVbfuUJMVXfIWpv4MKcdaAqxReD9aaNX1N
         mgazImI4Cfz5pUiD5R+FK/qZ4Xal5bPg5vp/JG/Gfr7fPkUR5KthnfD/Ghli1gQptoA1
         NEzghCD5O1MdjO4BvaBaNUI4sByqaIg6Ik04Qu0jQxZ0o5Y/2z894rewMGGzXONWNG1M
         DyU9QpRFX1FcSN+KswFskuOpFAJRPuN2BpLF2mSxMUWyqeQ2XzZ8PctDCTkDswDQLbKW
         dzilTnIPOEoJdlg8e4x552PHNL7+jA4HezVjmiRfiwvi25CLDBrHGgHvq6Odsi7p6q71
         qm+w==
X-Forwarded-Encrypted: i=1; AJvYcCV0E0FCIb0G7PdWGvXt6e3GwuDrdw+a+a+gjw8l7DivPlfb+sfAR5aV4meC6t1lHKSe4fzsUvux8I0s8Cw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkG6JodibC4oKEUrs81Qg4FOiclyOV6BAqmrp/o8hqwfF/d3Nx
	PjVWsEykCb3XyKUGLjg0SmlIpX0/wKcgEvQPHorvhIl29Vk/Br9Je1ISQTCZGbbelDqodM6QIr9
	CGjF+Kw==
X-Google-Smtp-Source: AGHT+IHJ/PD4IZdXpfLT+phmwcv6QqIW8I80B2uJZiw7eFoWOINWL5PmPprPbPx3sBWJLPoXxBjkxCvK2VhZ
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a5b:341:0:b0:e29:68a9:8612 with SMTP id
 3f1490d57ef6-e29782f4017mr1762276.4.1729034396326; Tue, 15 Oct 2024 16:19:56
 -0700 (PDT)
Date: Tue, 15 Oct 2024 23:18:58 +0000
In-Reply-To: <20241015231925.3854230-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241015231925.3854230-1-mmaurer@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241015231925.3854230-4-mmaurer@google.com>
Subject: [PATCH v6 3/5] export_report: Tolerate additional `.mod.c` content
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, linux-modules@vger.kernel.org, samitolvanen@google.com, 
	Matthew Maurer <mmaurer@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"

Currently, `export_report.pl` will error out if it sees a hex number not
in the context of the original `__versions` array. This adds a
"finished" state so that it does not attempt to parse content past the
end of the array, and requires the array to be terminated.

This is prepwork for the subsequent extended modversions information,
which would not be parseable otherwise.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/export_report.pl | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/export_report.pl b/scripts/export_report.pl
index 30b5f7819086..dcef915405f3 100755
--- a/scripts/export_report.pl
+++ b/scripts/export_report.pl
@@ -125,6 +125,10 @@ foreach my $thismod (@allcfiles) {
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
@@ -134,7 +138,7 @@ foreach my $thismod (@allcfiles) {
 			push(@{$MODULE{$thismod}} , $sym);
 		}
 	}
-	if ($state != 2) {
+	if ($state != 3) {
 		warn "WARNING:$thismod is not built with CONFIG_MODVERSIONS enabled\n";
 		$modversion_warnings++;
 	}
-- 
2.47.0.rc1.288.g06298d1525-goog


