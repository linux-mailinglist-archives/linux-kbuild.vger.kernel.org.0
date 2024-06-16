Return-Path: <linux-kbuild+bounces-2135-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 706B9909BA9
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2024 07:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 957081C2120E
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2024 05:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C33163AA7;
	Sun, 16 Jun 2024 05:34:58 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7270049631;
	Sun, 16 Jun 2024 05:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718516098; cv=none; b=fJaWRJP2XmecLjhBwYieoDa61PUMZpcbMwRwNJsBYSxvdtd+XQv8IxnQbI75Bz+Gaa32eSEumiQd2pY8TDm8BGiIn3zibXCvKu7Y0bcH+J+OCauvQm2Xwi+bfv2ZXDPUihhK7kvUx6otCIRwU6upUC+iJJKa0N19+LDoJRW9h3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718516098; c=relaxed/simple;
	bh=6T7Zgs2Fb67kihkAIlmvUw1gsgq+mHyGb3Rak3gAOyI=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=LjuqL40l5ZCsX1P6GymyQ1W7xQIOckG72+I5roT6VpsLugTot7T3pbtxFL0yWU8OkcCB5Xsw0OsfSbhZwP++NJTg1x5R+cLoB2dBc5/lO5/UesPCEHE7tav2hOBez+7RZh6ZVfkq7diSFc99MsprA1/OEyDS1Iw5l4DPJaiTV8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mastodonlabs.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mastodonlabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dfa4876a5bbso3241711276.2;
        Sat, 15 Jun 2024 22:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718516096; x=1719120896;
        h=mime-version:user-agent:content-transfer-encoding:organization:date
         :cc:to:reply-to:from:subject:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/cswm2yqJ1Kkti5O0nuSfxvJCa/xjaasneoTc7kKdlw=;
        b=lq2fxUzFrSulEWQcSK9wmzb7lJnxVSHsHeB/K3h8YBgBLqj5LXp2YmT3BMxTs26pcU
         QmNvgYLQGbiymLfvG62L7iBCQ2CNcFgZIQ03Iyw7d3+Xse2wc9o1XMfEBIuA8rKZfUyq
         tFGhN7nFj5RTBYZc00CZmnpSJ8qB73jXdu5oTOeWR3LlgjyRiQTI4AuRiMdX4ef53uBc
         8gkEYcDQyDbcniLjBEtHJbyj+2gRghtNN9mRYv8nZtbGyyAajXdFBUBipyp7SnCCcSMv
         7vXzB9ggQJcAPX8aiq+7zcDWZ+H9bkHujhMjlxjzkqniHkHXZy4vr5QIR30e1Fpjjjjz
         dUkg==
X-Gm-Message-State: AOJu0YwLBGWpgDxwW6kc+qWHn58r+xvb152yT9MLftgwtPEN1R0NuSUj
	By86UiGrcKaDprBfKx/rUYHe4uMx5PLS/tZC8FptpVIo6njFGs984FnBCtpm
X-Google-Smtp-Source: AGHT+IEp17NN7j/z+01rvYtnkV6zhMHBcrhUbaxSJw3YMw/487jlYLJR/itYO/F8vijq3mhTyZWPVw==
X-Received: by 2002:a25:c50c:0:b0:df4:8847:7876 with SMTP id 3f1490d57ef6-dff153cd047mr6394928276.31.1718516095715;
        Sat, 15 Jun 2024 22:34:55 -0700 (PDT)
Received: from ?IPv6:2601:681:c00:66f::1500? ([2601:681:c00:66f::1500])
        by smtp.googlemail.com with ESMTPSA id 3f1490d57ef6-dff04a4dc39sm1234560276.45.2024.06.15.22.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 22:34:55 -0700 (PDT)
Message-ID: <9811ea10d647ff687e140976ec50c5ebbe5ecbe5.camel@mastodonlabs.com>
Subject: [PATCH 1/1] kbuild: Fix build target deb-pkg: ln: failed to create
 hard link
From: Thayne Harbaugh <thayne@mastodonlabs.com>
Reply-To: thayne@mastodonlabs.com
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Jun 2024 23:34:54 -0600
Organization: Mastodon Labs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2-2 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

From: Thayne Harbaugh <thayne@mastodonlabs.com>

The make deb-pkg target calls debian-orig which attempts to either
hard link the source .tar to the build-output location or copy the
source .tar to the build-output location.  The test to determine
whether to ln or cp is incorrectly expanded by Make and consequently
always attempts to ln the source .tar.  This fix corrects the escaping
of '$' so that the test is expanded by the shell rather than by Make
and appropriately selects between ln and cp.

Signed-off-by: Thayne Harbaugh <thayne@mastodonlabs.com>
---
 scripts/Makefile.package | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 38653f3e8108..bf016af8bf8a 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -103,7 +103,7 @@ debian-orig: private version =3D $(shell dpkg-parsechan=
gelog -S Version | sed 's/-
 debian-orig: private orig-name =3D $(source)_$(version).orig.tar$(debian-o=
rig-suffix)
 debian-orig: mkdebian-opts =3D --need-source
 debian-orig: linux.tar$(debian-orig-suffix) debian
-	$(Q)if [ "$(df  --output=3Dtarget .. 2>/dev/null)" =3D "$(df --output=3Dt=
arget $< 2>/dev/null)" ]; then \
+	$(Q)if [ "$$(df  --output=3Dtarget .. 2>/dev/null)" =3D "$$(df --output=
=3Dtarget $< 2>/dev/null)" ]; then \
 		ln -f $< ../$(orig-name); \
 	else \
 		cp $< ../$(orig-name); \
--=20
2.43.0



