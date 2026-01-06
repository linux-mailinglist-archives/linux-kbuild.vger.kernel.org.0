Return-Path: <linux-kbuild+bounces-10426-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D53BCF9585
	for <lists+linux-kbuild@lfdr.de>; Tue, 06 Jan 2026 17:28:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7854A3001FF0
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Jan 2026 16:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C4025CC6C;
	Tue,  6 Jan 2026 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I3qavktw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6559E2EACEE
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Jan 2026 16:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767716882; cv=none; b=dUD+mfrRi+wuq42f4Ew8WmHEVe815dAdMSXQf5RaUk/Y+bs8MAT1W5yXACVKztwVtaA7b2JydqkTvudB7dtgRPklM4daIU00fA68cC6fpgd+9slkVNeZESFFwZZmM8QmUTI5UFz4GYKGJTdR8l6uu3/hZQhUb5deuzEzo/ZSXWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767716882; c=relaxed/simple;
	bh=gRsTO30YL2AR+uzNTkwzde4uf0f8BDd+CDEwV8OOA/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kNcdu//ZDQExvaK565NM1h8uaHSxyoxVMqW6ypHCqJ7MlnICi7mnWPz1fVe1Zclit3RQ0Pt0+jPBrMMAPuBv02ZrtHNsvWnf6ec3IIK+edmOTo5LUJYwQm2p0884wv1PTGjAEgUoFUpH32EbxktqO/U0hnnUgPSlpnvwtEC8ywk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I3qavktw; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7ce229972f1so939084a34.3
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Jan 2026 08:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767716879; x=1768321679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t4rigtaUVzceNduvRfRUzk6xTb5cP2dmlDOzJ8N2oLQ=;
        b=I3qavktwRBQUzSal7tMc6Tx5S80YD2FWRa99mgWTNhS3srd5WKJvJ6AeV5BL/UUE3X
         8r7NlKiCGwTJxdzXtbKmTncD5OyssrlaXVTva4XwQHc1goUGQWY6e9xZt23A/YrvAy4e
         2i4wRah9GqTbKAZ+1Q3kFv/YhBFCtKmnQn44E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767716879; x=1768321679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4rigtaUVzceNduvRfRUzk6xTb5cP2dmlDOzJ8N2oLQ=;
        b=ZhZihEpz9YqrQ3yFmr+dolou57S2R685anJjf8JG5M21ZMPQCtVl3Yed1zNEaBYCBP
         PS6ksriYXGUVhYonuh+ITMbjHnUHcZyFVfjrH5ZzTBZy1pwMNE3sJh5fT0sXIhnXbE2w
         hSI6VkVHt+5gNsILw+hVGKcw+7ekTlTYGhcNsP5fxR+e/2cQ0PXbfZQU2I2f1H80RXgl
         hXwlROYtjLsdXmz4dhqZN50HMY0J9A+8WgWkPdjFyXdZljarOIUg8dA2jRzBTsK08f3L
         DhujMNLdPX1cJ3XTk37404NVn9iYE1kzuVFtrVBZubPXg6wqu92UzrTZvO/VetBf0K9F
         cHCg==
X-Forwarded-Encrypted: i=1; AJvYcCXfOYRvHOgHDT8Q/gb/8Dcold+gymYQaodxpCeFyhV9eajrTFh1Zqu8h7QioKwMDCRJ2hklXdycc/UEuQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZO8VV2mtoZJWZofd05KDl4EoAoFd6duH8CaUXeQsbGrSrK0UF
	Gsx+qQDqw0N+nIxvucvl4ui+WRcNfVjG1Yav8bxrELaBA3Tk74LdEfQueZISW07s+g==
X-Gm-Gg: AY/fxX4tpn26uMJgxjPNHz2BXVf4/yJk+l0ZSoleR6I5cp4PmVM99V1cAA/Peo1Hdu+
	OdUH3bY1EwOTS0H/FNabCbHmj69N65WCof56aNPVEtyvl7e442koohhYcK1wrk06xZvn6h4wb/t
	ar1Ol379qIZypmWBG8hUcApaTPbINEj2Ox72+Wzc2Iiuih4B9LIJlRT+VSe2zzGYIJWbo/iYBAL
	RgDYwyEqwQ2U0zvnV30jQ2tgdMfaoveVlyXiEzubaWJfoyJzE+Y045y/ED95161Ce25Sfvef1lr
	1f+F1NkMEgyTBfFNuRbuLah/yk5Gn45irPq0JRHoyyrzpWnmO2o/wMxWJPS8EajVvMHiyTHtf//
	mjEN8bSIE1hf/hEZhT4YDwivmWrjtSeEI+ulgUwrehEjVthKJ4c/4K3O1QahG2M7pCLJ9GeRtYx
	MB4Or3
X-Google-Smtp-Source: AGHT+IF7S2rg0m1Mda0gZnWPSOfNwohMrdwCkO13UjUZrEBZyn1R34tSjJPAZbTcfxGrtDjxpyXlJA==
X-Received: by 2002:a05:6830:3141:b0:7ca:c9db:5436 with SMTP id 46e09a7af769-7ce4662cc2amr2707815a34.8.1767716877599;
        Tue, 06 Jan 2026 08:27:57 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478af8b2sm1630951a34.15.2026.01.06.08.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:27:56 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
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
	Petr Mladek <pmladek@suse.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/6] scripts/make_fit: Support ramdisks and faster operations
Date: Tue,  6 Jan 2026 09:27:30 -0700
Message-ID: <20260106162738.2605574-1-sjg@chromium.org>
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

Changes in v9:
- Rename the variable to FIT_EXTRA_ARGS

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
  kbuild: Support a FIT_EXTRA_ARGS environment variable
  scripts/make_fit: Support a few more parallel compressors
  scripts/make_fit: Compress dtbs in parallel

 scripts/Makefile.lib |   2 +-
 scripts/make_fit.py  | 179 ++++++++++++++++++++++++++++++++++---------
 2 files changed, 145 insertions(+), 36 deletions(-)

-- 
2.43.0

base-commit: 7f98ab9da046865d57c102fd3ca9669a29845f67
branch: fita9

