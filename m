Return-Path: <linux-kbuild+bounces-9632-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE9FC5DA5B
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 15:43:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D2BB34F348F
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 14:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D07D325493;
	Fri, 14 Nov 2025 14:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G0ypR099"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B969732549C
	for <linux-kbuild@vger.kernel.org>; Fri, 14 Nov 2025 14:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130483; cv=none; b=gAzcDF9Dsd/65i/+vmHVAxiMC8QQBoQCDzYwDx2mGfstohv+SPlr8AXtJhNfGDHJLhTEMcuTCIm/u3vuv7aJzjlf5W2gt38dPoVIz3lDs38ygxKrUc6nkxXDc+xXnwgc0+aakmIbKOA00fa2XmjEdhI3cinr6xf9OoUJ+8lXpZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130483; c=relaxed/simple;
	bh=BklQGKunSWSC90jjl2C7ggGLVd/hWGKHl6qwpD07aVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=emwo+So9gvZFOY8XpKf7AT+lR9uMNIOjwQ/oToR7n+nJqo9ATfrgq4BtFF/rC1fL/ogDuQgoVccWVBImFbebQvxSIaW2XilExlXUuTCgx/oAW9R8Ylajthple6uERH0DAeFq4dItdvmhCXIpDlnsuOctsyQZxWe847m2X3Aq/w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G0ypR099; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-9486354dcb2so86650739f.3
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Nov 2025 06:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763130481; x=1763735281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LaRuk9UO1iAqBvlrA4UzPK6vezrUTGPRno5ObeOs0zk=;
        b=G0ypR0999C24qi2OWdGrf/H9r2CylqsJJIbO9IHWcmLG6LARlSL06Wmo15L5x1i0ti
         hSdZgTrFeDIrhgxMr1qgkDI1ng1SX5wiY/TxJUMhBNsf4PFAAZ9kYh1sgnQR4RcUzK1T
         ezTSLtbM7ey/xWCToOx8cCh8PifWMQsCAwEeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130481; x=1763735281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaRuk9UO1iAqBvlrA4UzPK6vezrUTGPRno5ObeOs0zk=;
        b=YFC6WKLiz7zSdJFLQt25OtS7ZAsRP+sbavlNW9WUPZsVG9a2fi5UIs3qgZThqQB5DR
         GM1HeZyF3JNPMVe9GsBXI07C2XbJYOmjTx+rLxO6YrqGoqR4aqhKfbnbqYJGNd285cIZ
         0zRC+jOPJ0+TEi8/j0fUBlHa7zamP5E+6NT2+Xi9sYI0rDOlxt6wjoKm/zEFKgPD9M4j
         mixj8yA3f6tuq2n8v6obc5KxOP/Otzkdefn5G35vIaD640PwJAMHwNzNxkM9SOJZOA9I
         OWBRZE+t6WnK0xtFFAOxGH9zPhogsghaIyoXtjy7fM0KS7Yzo7iAetNvT9UV4sLAplvI
         9Kug==
X-Forwarded-Encrypted: i=1; AJvYcCVbFrwv/bJv019yleS3SR7rpwhtALbmYQo411dDfP2loiLM3W9HasMQNnjwFCgt26goyQQxpQLf1z/jH9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzNSd7l2akhiv+nO/iX7mB01ahjVC2CzRigL/IkEjx760DhEZO
	jMyXR5qgD90h4nKQsnfTROVEsTA/MvpVT0ANTlmna6CGmDKBTROpzlm81xoY7a5jPg==
X-Gm-Gg: ASbGncvykQPJiLwhX5UGcg+bm8/1zaEr4/a9HJcFMjC/0MWf4WefZ1A17avysQRkBEq
	Z0NqpZRpNTnVsCmClaP9LyuGYmAGDsh7VDp5K222tRQiAfbhYzQ3ZUUqAanghQZyImC23q1J1+d
	gIkP9C2iNTEh9EdNJlpmwKA0kxpxQhyPoaETO59T+GoByH9svAmyfoM+GCIXYqj0K/3xZicwLCV
	7ufIaNVtK1ymnngGxitszRIpPlY3gkXYnnQt8k9w1iFjvqHC+MiN0DR9B9lwVzo9r1+Spa2Es18
	iWS5SrGlvJQ9COGPmZuANO2T/qaYBQx4eBL8agrVs6ktlEz4h0HExd9Uag4uDb42siARZDBsjcE
	9/CAhtEr1wG3LeyLCFyhJzHHnktYY3GY8DSLgL03KrHDqn+SumRsctZPRrYbPdcQLfoV1YxysOl
	VzhBKC
X-Google-Smtp-Source: AGHT+IEELYloZwlPDfzBUS2CIFoqpVbdAlJTEoxSRiFLxI6XsjRz4z61w7km+eDQVxqihK9V+Z/gwA==
X-Received: by 2002:a05:6e02:3812:b0:433:7b22:c2cd with SMTP id e9e14a558f8ab-4348c8be2b8mr48366475ab.8.1763130480703;
        Fri, 14 Nov 2025 06:28:00 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839cdb10sm27500205ab.32.2025.11.14.06.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:28:00 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Simon Glass <sjg@chromium.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Sterba <dsterba@suse.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Nick Terrell <terrelln@fb.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	Rong Xu <xur@google.com>,
	Tamir Duberstein <tamird@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 0/8] scripts/make_fit: Support ramdisks and faster operations
Date: Fri, 14 Nov 2025 07:27:26 -0700
Message-ID: <20251114142741.1919072-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series updates 'make image.fit' to support adding a ramdisk to the
FIT, either one provided as a parameter or one created from all the
kernel modules.

It also includes a few performance improvement, so that building a FIT
from ~450MB of kernel/module/devicetree files only takes a few seconds
on a modern machine.

Changes in v5:
- Fix 'use' typo
- Add a new patch to split out module targets into a variable
- Build modules automatically if needed (fix from Nicolas Schier)

Changes in v4:
- Update the commit message
- Provide the list of modules from the Makefile
- Reduce verbosity (don't print every module filename)
- Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
- Use an empty FIT_MODULES to disable the feature, instead of '0'
- Make use of the 'modules' dependency to ensure modules are built
- Pass the list of modules to the script

Changes in v3:
- Move the ramdisk chunk into the correct patch
- Add a comment at the top of the file about the -r option
- Count the ramdisk in the total files
- Update the commit message
- Add a way to add built modules into the FIT

Changes in v2:
- Don't compress the ramdisk as it is already compressed

Simon Glass (8):
  scripts/make_fit: Speed up operation
  scripts/make_fit: Support an initial ramdisk
  scripts/make_fit: Move dtb processing into a function
  scripts/make_fit: Provide a way to add built modules
  kbuild: Split out module targets into a variable
  kbuild: Allow adding modules into the FIT ramdisk
  scripts/make_fit: Support a few more parallel compressors
  scripts/make_fit: Compress dtbs in parallel

 Makefile             |   8 +-
 arch/arm64/Makefile  |   1 +
 scripts/Makefile.lib |  10 +-
 scripts/make_fit.py  | 264 +++++++++++++++++++++++++++++++++++++------
 4 files changed, 243 insertions(+), 40 deletions(-)

-- 
2.43.0

base-commit: 4a71531471926e3c391665ee9c42f4e0295a4585
branch: fita5

