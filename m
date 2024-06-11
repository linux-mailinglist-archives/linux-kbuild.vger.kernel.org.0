Return-Path: <linux-kbuild+bounces-2085-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A226904605
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 22:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF510285972
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 20:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9172D1509A7;
	Tue, 11 Jun 2024 20:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PTShDb9P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE3F12E61
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Jun 2024 20:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718139573; cv=none; b=bBG4Czh/ACV8FVDMbaUJhtOCSAMY3tC7qBOqlU5ygltV4JqQf8OP4K3HvxQfCvczTie281absBT+cOwp5cYgbFBDfPNVGHO95KLagCBZP1/DF/kyrWhM8ifxWLjnn2QIX35cz7gIwIHFZwZBNGk9AQsLVwh143b7cE2XVzyoOhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718139573; c=relaxed/simple;
	bh=uPloNiuzxNq5YdU4bbihSB3VIjXRMwp5XwDqgZUS3LM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZZtYLxWrkwqkkF/AWIEeIVHzHGSLXA4jUetWdtia4jxicyKN2+Wqqqh+JWo8k0v+ITrDPqo9+BnlYvRCGQe7bFVaIk1C8Mkjait6wdRYwK7UWhMPQAwHo8VE+0OCEbWRz40Ocb95LChxKMN0WIK2dgci4RRAejZXUsRLMx01lA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PTShDb9P; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ebeefb9a6eso15773611fa.1
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Jun 2024 13:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718139568; x=1718744368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=axkxnr9QwmTcLxLgYqkLrzWvsCW3lX313RLwHm4iieE=;
        b=PTShDb9PqQ61h1jBZAD9bwKpmAnmyOfzDYNHrPr4qmzAWvtPeRyHCJYYdNXCLSytHx
         YWqdiudGg3AVOnQElV0uh6fV6iyBcrG4UtP0MawcYCbdjjvbX8ZAceci2u/FYCIVDL7q
         VgQNWQGbWP/dvFeisEvRsovz5Zd+JsMixBQYeBJEm/6vEitlsWGHHk+u8yB9OKC3N2jn
         jBtZ09uusYn78KixtQHFD34M0j+0xgClXv9/l/PbUn8e8nfabycXpPkxTJLo4XDLyHEo
         KBdeD5OjnYcX8lF4VclkLqIYaM4Jdqen3AzEukrz2iDB8g6Dd7AKpCIEYJDlcehidV+Y
         +AgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718139568; x=1718744368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axkxnr9QwmTcLxLgYqkLrzWvsCW3lX313RLwHm4iieE=;
        b=DhIRCMGf3vivr4k4n/V0gwpOBEg0qUsq1fhdgNiXAwmIO3nezb6pyJJVeWKApWeCku
         hU50lkbEPz7dal1qaKFpTijitauQrpwxSQZM6M19IZj7NgZlYBVo3eoPOZnGklR4fwgl
         1GWTMpJ17YJhbx27TFqZ5TCFBepRH4bca9vaxxptLacR52l8HSm8WfIEZT6Jmbj+ZHCc
         A3jOTs4PH0JkiO+KE/Ch9NcbWgjhltC0qtXCokHnlepGMmi8wyoeSZp9J05St0sEsajn
         OB3D6uyjqEetqQTNTfAAOOo6sXyi2POb0lJ+Ze5kQeEgK0K3C0bw4YMfBChDH3pPfviX
         T/7w==
X-Forwarded-Encrypted: i=1; AJvYcCWVhejSP96LwNRfGjUDNkevXJndAtwgcWDiAJONV/XKxrJJp3hgqjq5biNo5FskvrHR5ZM/2EbLXv1Lq3n0l5kf36lcZSNC/hLriyh5
X-Gm-Message-State: AOJu0Yw1q48bPG+OnL4wi5tpag497uiV1LFivmNeTMispwJKIYHu218Y
	vn3FUvkJtWlbWOhWn6zZ3tyW+RUh0rZDTcumMAUCc65CTwP1ky8V0GqILMCv2Y8=
X-Google-Smtp-Source: AGHT+IHXwlMipg5Zu4b5gbGo/Vp+PbC8BDeqNBBlaaCwUQT+jgYEQ/TSqDOHiMLb029imXgLMihuVA==
X-Received: by 2002:a2e:b894:0:b0:2eb:eb7c:ec17 with SMTP id 38308e7fff4ca-2ebeb7cef92mr45433261fa.4.1718139568318;
        Tue, 11 Jun 2024 13:59:28 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c6aa014c1sm6868604a12.41.2024.06.11.13.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 13:59:27 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH] modpost: Enable section warning from *driver to .exit.text
Date: Tue, 11 Jun 2024 22:59:00 +0200
Message-ID: <20240611205900.2145880-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2023; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=uPloNiuzxNq5YdU4bbihSB3VIjXRMwp5XwDqgZUS3LM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmaLqUjpGQVd1pbBw5rQONgHVu+IBd7NJY6rqZj ku+y/8TiO+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZmi6lAAKCRCPgPtYfRL+ TpocCACZYUfugKVH+wz4b790vjb8CrTwyyGN5aBG1sIwU5rPn2b2Hh8ySISRD1cBkNg3cRlfH2c SZhYvPTN3oqgEWXP1KyUZ0f7s+AsWTpHMii/hU7E6BhccWDgjKlt3o67lw/nx19ql7qUbNMzSyF z3s1wcqGvwwwYk7MnSGL7v5nDj+Nd07V0NeDh+iMv4D9qrBhVP/V2ARPhPdX27AH63Pc6+UY+aK kubfgsNdf7LzwjsgdxgmxaM2kwkyqpxHNmeTWWrYNlHUYrZA0Yq2uWaUJPgV+x/5Hn+AYJj6z/B L1aAKQDU/bWULwU1fVfLwbXuLry/fOtbVBFEflVVl5AaNrkg
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

There used to be several offenders, but now that for all of them patches
were sent and most of them were applied, enable the warning also for
builds without W=1.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

as of v6.10-rc2 there are two known offenders:

 - drivers/virt/coco/sev-guest/sev-guest.c
   patch submitted in March, available at
   https://lore.kernel.org/all/4a81b0e87728a58904283e2d1f18f73abc69c2a1.1711748999.git.u.kleine-koenig@pengutronix.de

 - drivers/parport/parport_amiga.c
   fixed in next (commit 73fedc31fed3 ("parport: amiga: Mark driver
   struct with __refdata to prevent section mismatch"))

I tested this patch using allmodconfig builds for arm64, riscv, s390 and
x86_64 which didn't expose further drivers with this problem.

In my eyes this is good enough to enable the warning for all builds (and
not only with W=1).

Best regards
Uwe

 scripts/mod/modpost.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 937294ff164f..30881d94f00e 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -965,17 +965,6 @@ static int secref_whitelist(const char *fromsec, const char *fromsym,
 	    match(fromsym, PATTERNS("*_ops", "*_probe", "*_console")))
 		return 0;
 
-	/*
-	 * symbols in data sections must not refer to .exit.*, but there are
-	 * quite a few offenders, so hide these unless for W=1 builds until
-	 * these are fixed.
-	 */
-	if (!extra_warn &&
-	    match(fromsec, PATTERNS(DATA_SECTIONS)) &&
-	    match(tosec, PATTERNS(ALL_EXIT_SECTIONS)) &&
-	    match(fromsym, PATTERNS("*driver")))
-		return 0;
-
 	/* Check for pattern 3 */
 	if (strstarts(fromsec, ".head.text") &&
 	    match(tosec, PATTERNS(ALL_INIT_SECTIONS)))

base-commit: c3f38fa61af77b49866b006939479069cd451173
prerequisite-patch-id: 7300dede00db637042647e12d558fe1dd57c20cc
prerequisite-patch-id: 82cfe8597f709f05b9fbbd3e4eca8be35e077e2b
-- 
2.43.0


