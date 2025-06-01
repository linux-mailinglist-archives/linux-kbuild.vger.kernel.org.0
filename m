Return-Path: <linux-kbuild+bounces-7325-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 352A4ACA01B
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Jun 2025 20:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF831172B6B
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Jun 2025 18:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF544185920;
	Sun,  1 Jun 2025 18:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xz7LOnIY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1561342A92
	for <linux-kbuild@vger.kernel.org>; Sun,  1 Jun 2025 18:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748803643; cv=none; b=mW6Vh60nnA8loYB0rTUSQIsKb0K56CDZt7f2BI0biMi/HwUbobT8jEs4O4kHH7JVfT9T6GJuV5zIqLycKe3hGsCBgl9gwE+GoKBO23V2a454aztSzH7Ua1OKvCKQS7bLFQ3HaAfQuxmZ4t/7JA/Teb5zU3zrGqRvN3r2oFBsGxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748803643; c=relaxed/simple;
	bh=xPSerpsFCT9x8PT26DeJYSq4av1gLnmS3ZxaWLPwWR4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MIqMsi2B4ahVygWB+VWcBhmbgvc0HhFlieCPYmVlWjL0tOYsYVsDA8fojv8Db2+nM5WOn7zxY4gs7t4NSvCe1fwsVlruJT/JRhZ5Ynb0RNswf5jCoweZYxyO0bT67fagAIKifX6WWMM7HpKbM6n59myFAmj9Ui3yZm4w1fd52CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xz7LOnIY; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso500900166b.2
        for <linux-kbuild@vger.kernel.org>; Sun, 01 Jun 2025 11:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748803640; x=1749408440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8gigoCN4sG1Mo/EPaXoegUIMQ2MsTldfkfJPlxBA5tI=;
        b=Xz7LOnIY10OWmd6LQ1wO0/hD3oVVjdzCA50SqT/EcEyQXAWo1qNiA5W95VCjGxWYqc
         Ej8j07HHkOzpqvh7tMGfHQ5XTs519FVegunFOxXbc4iw7u54f16PvOKMDbVtlkNyfjfb
         EvBpWvYNJSTWht++YDzzlRz9aQY7kG8AoJXrCnQoM3ED+Oh8ZGvu3Mc7ONgQEY3brOVB
         sIHO9w2d5EsjO96Tq7TVjq8iNJM+NZWk0Khrxt8qB1BxTRMXLLQlDxuumdCvn2kQcee0
         KjD7UNbaLUdaPUb3dkKCtnuyB98kfdqbS0MElCkjijgi/ZKyS27Jspq6KqArOMUzfqw8
         wtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748803640; x=1749408440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8gigoCN4sG1Mo/EPaXoegUIMQ2MsTldfkfJPlxBA5tI=;
        b=c11U/3X/ilFL8eIqxL/JYxhnRwQ2E83GrE6cgCmVcY9hlCj/OMIslrPTY+5s4h2h8j
         uOo/q+JqvqQ33sOEJ52+gWFeN7HKn4aZ6nCdrQwn1cZdFo91GoI0qDnI2GlE6uPXb4v0
         RKaHJLPap8ce7edJpLx+806ABLwjUeL3MAP4v/bIhH+J/EDmRfkEzNrrg7QgPvUKLqTG
         +XR8iNVHItjlKoIumDiBlRMbTdMPXF7Pd+of0hrYN21QtvjmKoFpA2zATqknNFDcKpil
         syoYi6w801vQEXHISKDmV1TjNdcY3A3Zkz0jNIBgnDobWOioIu0MrPxodowzi7Nq01E8
         9U/A==
X-Gm-Message-State: AOJu0YzNYMtXBDymwgn1Z4JUwUpEIy2vWNjY6FBfDNaCCJ6ozpxPirlW
	tulPqGCeSMfr/qGK4cyb13ZjavyLkWO6aSNkMDjr4jUN+g8xsO5OMIkG
X-Gm-Gg: ASbGnctGQXhqdsWmmhoXoqWhkFMVXq9mcK2gSvOhcvHAp8TYZMGblQS5NCX6G1l7uRA
	RNPC136qCb8QgJ11mMsVCodTCInCKD+K+f8UjbstmWlBuvcuaBcOGAgn+cBv0BOZj0FkbkZWhWp
	v9e29f7SizP2QXfWAGRrjVitrHIRh6fChqn7z3StVT8MZJTQkZmJ+WoOKPPeBCXLkbkJyzHEMOP
	A/i+Jb4LdILHurtIl6dQNeZ9sCgRj1Y2aa8YctWeKifzaV8AOIcqqkZJit6Bd272NwWT8d8KHx9
	hDbAE6TDHay4jVdCMuDpq+Aq2tjO9W63iQDDAkCYCZn1cgPCkEcqe0Px2WAAr5kL+WKnNt5WxBJ
	nXauItMPkH8Wrn3+EMrx1OStEBEI=
X-Google-Smtp-Source: AGHT+IGssGs8jyHMoj/PHCxtWzA2Dg0LqLmr5NCh6HP/TXc0esLPjljvYmDI4PlqSYnbJdevz1O8zA==
X-Received: by 2002:a17:907:2da1:b0:ad8:96d2:f3b with SMTP id a640c23a62f3a-adb493f6b47mr624183966b.27.1748803640102;
        Sun, 01 Jun 2025 11:47:20 -0700 (PDT)
Received: from itek.frank67.it. (mob-5-90-139-122.net.vodafone.it. [5.90.139.122])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e80csm677487266b.71.2025.06.01.11.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 11:47:19 -0700 (PDT)
From: Franco Martelli <martellif67@gmail.com>
To: masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	Franco Martelli <martellif67@gmail.com>
Subject: [PATCH 0/1] kconfig: comparison feature between two .config files added to mconf
Date: Sun,  1 Jun 2025 20:40:49 +0200
Message-Id: <20250601184049.368419-1-martellif67@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear Linux hacker,

I've written a patch that allows to compare the tristate value of two
.config files inline, symbol by symbol, in mconf (make menuconfig) only.
It can be useful when customizing the .config file, personally I use it
to compare my .config file with the one provided by the software
distribution.

A screenshot of the new mconf view is available here:
https://i.is.cc/2cpIXxoP.jpg

The patch was originally written on Linux 6.1 amd64 series tested on
6.1.137 kernel version.

The patch has a limitation, it only show the tristate value (Y/N/M) not
differences for symbol with a value (string), but it also marks with a
"#" the symbol missing in the loaded .config, meaning therefore the
symbol as a new feature.

o I've also added support for the more canonical <F1> key to show inline
help window, in addition to <?> and <h> keys.

o By pressing the <F2> key you will get a view with all the symbol
differences listed.

o By pressing the <F4> key you'll save to a file the differences.

o Added help text that it describes the new features.

If you like this patch, it would be nice that other kconfig GUI client
such as nconf, gconf and qconf be patched in order to have compare
capability for them too.
This software is under GPL-2.0 license.

Franco Martelli (1):
  Kconfig: Added compare capabilities for mconf

 scripts/kconfig/confdata.c         | 165 ++++++++++++++++++++++++-
 scripts/kconfig/expr.h             |   9 ++
 scripts/kconfig/lkc.h              |  11 ++
 scripts/kconfig/lkc_proto.h        |   4 +
 scripts/kconfig/lxdialog/menubox.c |  13 +-
 scripts/kconfig/mconf.c            | 192 ++++++++++++++++++++++++++---
 6 files changed, 376 insertions(+), 18 deletions(-)

-- 
2.39.5


