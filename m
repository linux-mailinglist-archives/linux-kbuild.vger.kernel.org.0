Return-Path: <linux-kbuild+bounces-10340-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5BDCDFD42
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Dec 2025 15:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B079130050BB
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Dec 2025 14:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C08F23BF83;
	Sat, 27 Dec 2025 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CmNmKGDp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60034227E95
	for <linux-kbuild@vger.kernel.org>; Sat, 27 Dec 2025 14:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766845336; cv=none; b=iou3ryHZEg3BLyk62Ry7wB+yIEv5weIIT0uUme7EV8U/Rbh/1k7yD67rAL4ByBeDaBv5PKD31eBCvLPLSuHOSRR5pxE9fwZVpRf/uvY1b191a6ACtqppJx7UpgoGV0O9qFKNofyG3kX0z3JUQeGVdoVUmQ7ifE/t6Yfoxe0VGNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766845336; c=relaxed/simple;
	bh=wu3RlQRgdSFX5bYJBtfH8Cs7IMNxpIrZFgYU2yJIJxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CWq7nXRI5RfBE4TCPTxkLUECXfPCRJ7U/wiDXoCI/Proxa5Pfhtdh2DDcqdhZaRvUGvL/NsdfLyQtO/AkQdN1AEOzbqqi/n/yEHIljentGARZMc40eMQCdoKYqo5DAd+pkh8kdg1GAhbPUu2XVlxZ9BDepadHsJYxFYtyWhiGnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CmNmKGDp; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c75b829eb6so5002150a34.1
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Dec 2025 06:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766845333; x=1767450133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bmxe0SbWatW9BBBe7yS1jiuJDMZfC/WhN/j+ScxrjJM=;
        b=CmNmKGDpaNVyOZ7JjlZtlG0UVuktqSC9KTUexsNX/VUE61eLRvgtW+N9OS3p2s4drC
         osgkkoFvssa6OHB/Y5dHiWNV55sLELL+3YzJ+btpe7OgTE1ZIxJxS0B5otoDBYhNmtWZ
         Lfudu12MY6HpDwM1lbO0Y/AmLxfHpSEegee2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845333; x=1767450133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmxe0SbWatW9BBBe7yS1jiuJDMZfC/WhN/j+ScxrjJM=;
        b=HmKO1U0GZns/3rkdwSRBiA4r8JavNPrrMkaeHhtk/o5vijBXwKrDmY88rGNx7K8zHJ
         AaPk/AIjtj/UdYcoGDU+sEhXzFPcVB10xRLWOywe2cgLCkSOlw4x6Q7hSMKj3N9NJOyc
         w/qG8cWENi0jXz6wExnaEuImIwACg/khdkQgSXOIo+zAulViby862vG6uvNU1ABKIh6G
         +HdDJffU31VhJ40leVWHUJ6LlAOb0jcBd8++1MXWPxSdPe4ZDdMLT0I1hAXIaEiyxkUH
         fmqtNCUBO/2sKRuDD0X+58uUi5k9ioQmfNou6nQck+80mBXhLVifB/sne4K6EtygTz24
         nnoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKHrT3KfygyddqO8qRgGJ/0CgrOsZZ+HQ8jVnQ7wBDeaaEBQVng6yvsUtXtglHoBRwsDnFuNlVASCHPSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBzfhCmV83lokPuqQpgSjWHnFNy5XP2tCiaihOvHV7gGDtKiWv
	IzzPrH+TmmR3yM/3KJRbdof6Q2cgjZ6//sU05MK3ukb4pYP/bNPa37XTMoF3KfNuIw==
X-Gm-Gg: AY/fxX5k1j6AIraQ/W9IPkCy4s1VYZD38lk3drl7A3NHs417F7wT3VH6f/14KHHHqth
	JjLKp5s9yb8+7RCjvQkqO0kSZ0TSMecHvSmfyw2j6NAVOzI5LwqGg4M7JGmBE+mXj2G0s5srUGD
	Gm7Bqe+0P34UIKXwhhw9Mv2EVkr/kaDbUpy3vm8zYba2GnuLV2ROebaw9QIrdG/s2lAiOiczGcL
	uD9YlH/eRiByxG27FUp/wAdSanvs5v4VA8VNFcerE0y3XqJ6dvkP6oW6ks11ltf3qgXzocrSsBN
	lHS78J8M8BMag4FdYIi9VLqffrXBqA6pWeCIvsXax+f7j9fF+Y8NJTI1or2MRRgGMXB2bqAuLo5
	k03LtSMce9OOCxd77lSzmAuYuEtcOT122nn0XeytNm1JwwKo+EewA7OXO5ng3qUdJlHuBxt4nAZ
	eByKy7
X-Google-Smtp-Source: AGHT+IE+SFSIiJ1N9RC4DDY7sw+zm22c+vatbE6mz3IJ0XimO5ulxxHm/md13n6fjSFDBJMddiHQCQ==
X-Received: by 2002:a05:6830:4990:b0:79d:eccc:96eb with SMTP id 46e09a7af769-7cc66a17d4dmr12194665a34.26.1766845333281;
        Sat, 27 Dec 2025 06:22:13 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc66727e11sm17352660a34.3.2025.12.27.06.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 06:22:11 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	David Sterba <dsterba@suse.com>,
	Ingo Molnar <mingo@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Nicolas Schier <nsc@kernel.org>,
	Oleh Zadorozhnyi <lesorubshayan@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/6] scripts/make_fit: Support ramdisks and faster operations
Date: Sat, 27 Dec 2025 07:21:44 -0700
Message-ID: <20251227142200.2241198-1-sjg@chromium.org>
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
FIT, provided as a parameter.

It also includes a few performance improvement, so that building a FIT
from ~450MB of kernel/module/devicetree files only takes a few seconds
on a modern machine.

For this version I have dropped inclusion of built modules, as there is
still more discussion to happen in that area.

Changes in v8:
- Drop erroneous line 'kbuild: Allow adding modules into the FIT ...'

Changes in v7:
- Add a note about the " -> ' change
- Add a new patch with the MAKE_FIT_FLAGS change
- Mention xz as well, in the commit message
- Drop patch 'scripts/make_fit: Provide a way to add built modules'
- Drop patch 'kbuild: Split out module targets into a variable'
- Drop patch 'kbuild: Allow adding modules into the FIT ramdisk'

Changes in v6:
- Drop the load address for ramdisk, as it is not needed
- Bring back the ramdisk 'compression' property, set to 'none'

Changes in v5:
- Fix 'use' typo

Changes in v4:
- Update the commit message

Changes in v3:
- Move the ramdisk chunk into the correct patch
- Add a comment at the top of the file about the -r option
- Count the ramdisk in the total files
- Update the commit message

Changes in v2:
- Don't compress the ramdisk as it is already compressed

Simon Glass (6):
  scripts/make_fit: Speed up operation
  scripts/make_fit: Support an initial ramdisk
  scripts/make_fit: Move dtb processing into a function
  kbuild: Support a MAKE_FIT_FLAGS environment variable
  scripts/make_fit: Support a few more parallel compressors
  scripts/make_fit: Compress dtbs in parallel

 scripts/Makefile.lib |   2 +-
 scripts/make_fit.py  | 179 ++++++++++++++++++++++++++++++++++---------
 2 files changed, 145 insertions(+), 36 deletions(-)

-- 
2.43.0

base-commit: c53f467229a78287efa5b9f65bd22de64416660f
branch: fita8

