Return-Path: <linux-kbuild+bounces-535-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 890F882C71F
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jan 2024 23:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18C001F22A0F
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jan 2024 22:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B47E17757;
	Fri, 12 Jan 2024 22:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D8IHT6lN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7BE1774E
	for <linux-kbuild@vger.kernel.org>; Fri, 12 Jan 2024 22:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5ee22efe5eeso108159547b3.3
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jan 2024 14:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705097991; x=1705702791; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ksYBhZPLA1Cn7mhQtmBXO13MzYmjYuWLD3WlbMKqULg=;
        b=D8IHT6lNgkyu1IYqrHZryjGx5CpTo/Mg+BadjI7HCKPHhMuXIIWKNWGID49tOArVPN
         cfFAyG3o+psZW22fQUS7grnjv87XVQjOigpOsWA1ZCsfzX/zOQaEdMAVc83aYJ8Gar+5
         sx2bP/fiuMjoh6ll3ONYghFIEEfsr5UBa9TXRtGPDjfze4XfTnAucOqg266r1/bbe2tN
         uuFQ+3mZTrS+VlZoJVjh42lyFXm8JhZtFqA4PlFwlSE66Ww/+jZS6m767ju/efapfuN6
         qKdjlpwvXahcMfu3zS1eNyHrODtsj86cjAlFJeXVslT75XxMwdrweVJimeINUF8iGaHS
         xJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705097991; x=1705702791;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ksYBhZPLA1Cn7mhQtmBXO13MzYmjYuWLD3WlbMKqULg=;
        b=qcLtPkGb2ChY76VrRpClxWYlrO+GjNufF0TnJvUYf+QAVnXXCY1kDHytit6s/vxpH9
         S9bkSdeUcAMmvhmQgxL28Q/hdy8l0NjuDvw1SMGE5jM7kjX0ueJiXHTgNGzI8KTTkgpB
         LB6m0yjWiz7E4uXy+ji84d7roajUbSVyXJqQJMmJcrP1xbjmSuMb8NbL+GvtnhGGY/pr
         b5HTsc9J69vn2JjpAffAA0fcBOmTUn4zhY7k7ZgcLTCXq0T4vZSavXTdTThkGoxr+rQj
         6p+OoHecfdxPS4pcBdwoAcsjCaaiURxogD2kWqT8MfG47ymDQd2E8csekRJwnsllSSMw
         tIbw==
X-Gm-Message-State: AOJu0Yy6mkpcVuVJa8mfNZfKJvjlZZxP1M3ndCJ0mbNqcWp6D5X3Ox9w
	weQ58U2/nEh03yuameYG1nA3973TW2KYrMhWONgjd6qSjw==
X-Google-Smtp-Source: AGHT+IH/3c4nQhHotLjUfqa00qb5zECzcxyLjHW2As94nCL0vyNkw6St2WHe0+KE/ZM+q3+x9yFdh4bUKZLQkufA4D4=
X-Received: from wmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5ebe])
 (user=willmcvicker job=sendgmr) by 2002:a81:7102:0:b0:5fb:914f:207a with SMTP
 id m2-20020a817102000000b005fb914f207amr793886ywc.6.1705097991021; Fri, 12
 Jan 2024 14:19:51 -0800 (PST)
Date: Fri, 12 Jan 2024 14:19:46 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.275.g3460e3d667-goog
Message-ID: <20240112221947.1950503-1-willmcvicker@google.com>
Subject: [PATCH v2] checkpatch: allow build files to reference other build files
From: Will McVicker <willmcvicker@google.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add an exception to the EMBEDDED_FILENAME warning for build files. This
fixes the below warnings where the Kconfig and Makefile files reference
other similarly named build files.

  WARNING:EMBEDDED_FILENAME: It's generally not useful to have the filename in the file
  #24: FILE: Kconfig:34:
  +source "drivers/willmcvicker/Kconfig"

  WARNING:EMBEDDED_FILENAME: It's generally not useful to have the filename in the file
  #36: FILE: Makefile:667:
  +	} > Makefile

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 scripts/checkpatch.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

v2:
- Unwrap commit message lines
- Align and update regex


diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f8343b34a28b..c2869803e545 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3785,7 +3785,8 @@ sub process {
 		}
 
 # check for embedded filenames
-		if ($rawline =~ /^\+.*\b\Q$realfile\E\b/) {
+		if ($rawline =~ /^\+.*\b\Q$realfile\E\b/ &&
+		    $realfile !~ /(?:Kconfig|Makefile)/) {
 			WARN("EMBEDDED_FILENAME",
 			     "It's generally not useful to have the filename in the file\n" . $herecurr);
 		}

base-commit: 70d201a40823acba23899342d62bc2644051ad2e
-- 
2.43.0.275.g3460e3d667-goog


