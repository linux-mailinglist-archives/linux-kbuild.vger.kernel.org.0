Return-Path: <linux-kbuild+bounces-10070-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7975CB6230
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Dec 2025 15:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF5FD3010CF3
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Dec 2025 14:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2964B2C21C1;
	Thu, 11 Dec 2025 14:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FjRA+/6z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9941531F9
	for <linux-kbuild@vger.kernel.org>; Thu, 11 Dec 2025 14:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765461821; cv=none; b=dlJUIv93cjmGo35Vz2QKSTTrJbq9zjy/X0sqvhS1dF2FGcXRx0HUACNXcgEYx//KSXzdcy1SqppuY4baKM4mpbyo6CgagCWXxDE1GU/uE+q8s2m1fz4mVpjJZgLhmunN+ZdAOnFWgRWClLY5/o5kic8mayUbAJKafKFah19s7HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765461821; c=relaxed/simple;
	bh=1h6/OMpOo6Mhv7SA4AsoL+iKeNV/Y9FtNNSNar8aEhM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C5qhSVakTe2I88j70NIk0RJbLCofjLcH1t3QVhLTrYHIfhPETc+2vLTDz0WAWAcPy3sUXezcl7Ny9gSdaFp/cnRAi+jAiKaspCWT9JQwWKi09sNtvgcUHTgu4G91hke+Z3N3hj9ce+C+hOOWvmVj3xDvA4ROsPgD5UavB1EedxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FjRA+/6z; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-450c65f3510so50367b6e.2
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Dec 2025 06:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765461818; x=1766066618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pI2y6BFvW1TWHJx+6LPqMMaL607vPHNU2vdbH+Al0/Q=;
        b=FjRA+/6zw/fl3KxKKTC2T/NbIHGlR84N7zQD350r8F1BViketWAW6Y3OhZL6ukm7kc
         kvViB/AqT5N2k1ICylgMrrK2upPs5jvHPmYK9gbff60djAh/ymJmTFu8KDcZTaYJXLlI
         PRz50ByoCA+1mi5PBk/tQZsMV+TmKvy+DeIJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461818; x=1766066618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pI2y6BFvW1TWHJx+6LPqMMaL607vPHNU2vdbH+Al0/Q=;
        b=kJedS1FKPgE28vrpMPQzy7oiSQ1S46MG4TYYV8iq7eNIDdZt7Wf3EIHthx3oOWvvZC
         bdnvwk5UndlM9stSjeLA4RmELvnZTn3IuN8eUaDorTU8AAVZj7gxTtDB+L6KE7x5VFsi
         7vbZd9vbgk+dQ6BRReCb/IamtMUqLy2V1NpxeiP26Xg9fm/hH3KCjdbm2VHwmpasBOkD
         UmSib8lbmPzWvSRI0mutdRbjsgGBp3OfgDTZcRmcV13NNjLJdFkDj6FXwUMXvHgMqxz6
         DmfwnzcGIhfCuwi47IqSJM57NCMLVhh2U0RTE95aM/pxO2G5NIkRfwPP4LzRX3wsst4W
         xJCA==
X-Forwarded-Encrypted: i=1; AJvYcCVdNBNM5ckfXEfSYk18KJCL2jKKHe0EvpV84ySaMFKxauI1QjyUbXG9c+vMFL70wA1v+95V+D98p20C+FQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9g1W0v61r1cF/Xeig54YOl3/IzaoLhDflNI+OBDnfbt7wSHsV
	sjnHPLBQt/08iFQpLa3QYt6F0V4mbprrajofIK1vAId+I5zyZf2395wFo2ZUKCH7IA==
X-Gm-Gg: AY/fxX7CawnBaGvKQAByrX5gIWJFS5chdKeh0zZKxLlRg/33YLT7OZPI0mHUE0EivOU
	QsTfDA3kzojYUCYKwx3FkB/DTESidOI+sSxyfy1kYFdHHrCouXmLSEbGt6tsxTFuo+/iYDNhY7s
	q+QOPO9nMOom0v1ztDW8J78qHaD3BdEO0lt5rqJxpDIdPJyhhzrY2517cKaQ6UdVK7/i2GbcGDm
	s6m5DCjW9xBbk1T+bfBaADjb7vFauyVScFj/P3hOq5pRPhN/8LftWbVUR38gqjI0BhrDKzED4/V
	cNuzjZvKNrZdltpQr3pMGN3mt7HUWLsXoxfvPnLk7/7QmPqdnf5FwJfmmQ52jkr8kKzdAnRPU8W
	/YhW3FlQV23CmDWXTP1ZwwisgJPEy7F4t6ys32DpaUfyrCeaQ6cS64hLO0hEyDrAMcN6qZAPmKD
	9uBW8T
X-Google-Smtp-Source: AGHT+IEeqf2BDvpVvHHiEISJZWNNPZ46TDprBL7FKkRqM2MxlxWb4MUQ6LUmRZU+HB32yfA2vvselA==
X-Received: by 2002:a05:6808:308b:b0:450:3b8b:b472 with SMTP id 5614622812f47-4558696ffe7mr3083529b6e.63.1765461818240;
        Thu, 11 Dec 2025 06:03:38 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45598d6e789sm1130030b6e.22.2025.12.11.06.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 06:03:36 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	David Sterba <dsterba@suse.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Nicolas Schier <nsc@kernel.org>,
	Oleh Zadorozhnyi <lesorubshayan@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/6] scripts/make_fit: Support ramdisks and faster operations
Date: Thu, 11 Dec 2025 07:02:57 -0700
Message-ID: <20251211140309.1910613-1-sjg@chromium.org>
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

base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
branch: fita7

