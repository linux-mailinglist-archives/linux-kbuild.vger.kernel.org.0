Return-Path: <linux-kbuild+bounces-4138-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E3899FC51
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 01:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B15741C2435B
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 23:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6966B1D63FB;
	Tue, 15 Oct 2024 23:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HudI9Ysc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00E41F76C1
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Oct 2024 23:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729034383; cv=none; b=Tdk16jZQjf6nB3RIyMqpZOXdnzQXwz4z1IU+0mRZTzx0MQYEfXg25EKoe0gxRCSoCoQHeNIttLmeJuHjBvio4unyDRId9ui2l/+RC6UdVzrwk2ZV+jBL+LddpyHD972yY3AgoIvPLThtSy53I5OtPTp+zxk0EYJeS28+6TjGgtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729034383; c=relaxed/simple;
	bh=eBJG2rXeVYA/XEzcQYJAZKaNWGCWFxTaGo2H2wh3ljw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dz536u0rF9njK9d4qCSbffBFVRpC1wMJlhNSsNgdFq4XkMkf44DpMWxj4K1/72DEs2fem8TSkZ/E2ibI39xleteO2wz1roYNIlOTKTPi55zGXjIFfnQAAH00luUtrevbHrnHhxBa+/QMgDjpNeRjnDYojMXGg3bzS3PvcJh9oE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HudI9Ysc; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e2605ce4276so10733276276.3
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Oct 2024 16:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729034381; x=1729639181; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kcWYIAwP9b7jjsyrsKEHRrU+6v789OznTVm7Ys3lY5Q=;
        b=HudI9YscA6FvaCounyUY/VU0lVXBbLKqsQFSi32mPopNM7pInijLK3EUXckBqR0o97
         x7kD1rbA+ULIYTt1fjL1YX/l4/Xn3LAY6XT7Kx0sUjSEVBmjiei/4/BlBAKRDUKbp0RB
         coWHQemMeFQzc9vaUz8QcWmZPsgwg62jEuTr5cVx1bBwPHi3E2D7rmug+2lJ/9dJJkQz
         XcFZf4Eo6RfI74L88bd7GeUCZF4Vh8Rs3DUlZjW917ZkxbRiIN0ps7wAC5auDZ9cRocN
         jBGOhuF4T5FoWFhdqraIhqXy5phuyc1FfjdriSLf5I6LGBPGB10/2lpxWYOSVPAhfjhj
         oGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729034381; x=1729639181;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kcWYIAwP9b7jjsyrsKEHRrU+6v789OznTVm7Ys3lY5Q=;
        b=BQDOtzR3HBZt8lxTbPp9/lNn592eu6Riw/wtIPH3jskrXu/4wU0DqFFxonYNAEOsQj
         gGyB+E9lXxNa4RdJmWSLXuhE9Yf4cHQKF45ZXkhgMZZ3q637MuBD5bH3Br4rDMmrf21O
         NXddB+13RS3Vce+XnQRtfTgzh6QJ7ni0wmMlUxrSlRhhFAyOzI78xjuZKjFMNHgMAzXS
         mLiraqmsmWfBbNCQIz1EJgd972lZQVbDlp3ewzlIOr0OHX6HuGp7yAgOO9QKeoYfb5GS
         G6Sin6lce3dnDSO31NPbVNtGzGXcdndnI4MDNPPxSHlFoxDxsg6XCzeBtpUBRsLFrK08
         OH3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaWeaNHMflpod/iSZNgdzdtqJlVID98Mg+T0JJ+t1f1q1kUrtxW6kKfY5qU1HvXoy9VaDyD38Z9q7NtBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCb0dHGDFA6o9TvIy9kkmZACziV9CRxBrxjP+l0bWXsOE+7VkB
	mg8822raJuISS0XvtInRIMQY0lMSGV1BqDJH7Dhxb6XO8GJVJp2CfrDAXINeT6uDN5Iq1ya7PXK
	/v1dTCg==
X-Google-Smtp-Source: AGHT+IFGh7T9/sOWrOvku3a83TcqKp+gmz3hSjkGEL/6gT3UKoDIzg6hQ4IXpJdp72DC6zOThRZlztPzdbc9
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:1c3:b0:e28:ee84:e4d8 with SMTP id
 3f1490d57ef6-e29783006b4mr1193276.3.1729034380759; Tue, 15 Oct 2024 16:19:40
 -0700 (PDT)
Date: Tue, 15 Oct 2024 23:18:56 +0000
In-Reply-To: <20241015231925.3854230-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241015231925.3854230-1-mmaurer@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241015231925.3854230-2-mmaurer@google.com>
Subject: [PATCH v6 1/5] export_report: Rehabilitate script
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

The `export_report.pl` script was broken [1] a while back due to a code
cleanup causing the regex to no longer match. Additionally, it assumes a
`modules.order` file containing `.ko` in a build directory with `.mod.c`
files. I cannot find when this would have been the case in the history,
as normally `.ko` files only appear in `modules.order` in installed
modules directories, and those do not contain `.mod.c` files.
This patch makes it able to report symbol usage counts for a build tree
with modules and MODVERSIONS.

Since the rest of this series will change the format of `.mod.c`, this
change fixes the script to work correctly against a current build tree.
Given that the regex no longer matches the format used in `.mod.c`, it
cannot have worked since 2019, so updating this script is purely out of
an abundance of caution. I am unsure who uses this script or for what
purpose.

* modules.order in a build directory uses .o, not .ko files. Allow .o
  files when parsing modules.order.
* The .mod.c format changed [1] how it expressed the section attribute,
  leading to a regex mismatch. Update it to match modpost.c

[1]: https://lore.kernel.org/all/20190909113423.2289-2-yamada.masahiro@socionext.com/

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/export_report.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/export_report.pl b/scripts/export_report.pl
index feb3d5542a62..30b5f7819086 100755
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
@@ -120,7 +121,7 @@ foreach my $thismod (@allcfiles) {
 			next;
 		}
 		if ($state == 1) {
-			$state = 2 if ($_ =~ /__attribute__\(\(section\("__versions"\)\)\)/);
+			$state = 2 if ($_ =~ /__used __section\("__versions"\)/);
 			next;
 		}
 		if ($state == 2) {
-- 
2.47.0.rc1.288.g06298d1525-goog


