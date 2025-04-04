Return-Path: <linux-kbuild+bounces-6425-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B83B3A7BEA0
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 16:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19E777A7B28
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 14:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F22C1F1300;
	Fri,  4 Apr 2025 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LGqibLi/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA70DF49;
	Fri,  4 Apr 2025 14:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743775433; cv=none; b=dYK8yHkDDYVfRBPtnUKddnbOSWkJY4CYt9VfduKsVIHGIswMREVa88E8YQx43pdDU6KMk919NeXM/wCUSQScECrz0NgsR9dZt+x8+z4lF+5Bk5dPvpn+M4xRp0tJqa7q5LRzDUjIPsRGaVML0x/8/gIdVqXHer2Pb7Dc+yQVh2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743775433; c=relaxed/simple;
	bh=TqwwUlGJo+0IFmvijoaIMD8k72gCHDtkR7S50jckuYc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NwEu7mBOQI+ldt1zZye66nVqW3b94X5hID1D4zyqOoTQDS2qT2PTp7AfHKdsdmH1pYy+Oqi0vl0oI+JXlC64eW31/1Qp/z1vZl8GOQp9rwZwTGnDltfa016R3vPy00LLI0RlQjjJZ/TwjVBlMmusmh4Mj4/7NFEr6uSF8LxV2qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LGqibLi/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743775429;
	bh=TqwwUlGJo+0IFmvijoaIMD8k72gCHDtkR7S50jckuYc=;
	h=From:Subject:Date:To:Cc:From;
	b=LGqibLi/c1HQmBIncxypZGBAuyFl4N7bzhAep4mrikI2oPczyW7TFzdZFI51wwxem
	 v9rerf5ZnAnDlXsAaL/ZHq+qGhUE0WqptgOnCG9eYww6V+jb6HZP9RgPnU2ZOHeEp9
	 +MBbyXFDI248v+GNr8jfc97a9NI6zqLTYCC2lGiRGWh+EQjHob5CYbONR1o5S8x3/1
	 R+wyprpDImEgjCNkWauHEmM24sQEm83SjME7KG0VBuQc70P8GTEVzQbT3/xsenEPq9
	 ew13CJFNmrJzEePzTFkYFe9eZyqZGODvA/bBbWcDUTGVv/X69l5YSjZ/wLEVjDE5qM
	 d9zaE4ze32Q9g==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 27DD917E0865;
	Fri,  4 Apr 2025 16:03:47 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH RFC 0/2] Add Kconfig pages and cross-references to
 Documentation
Date: Fri, 04 Apr 2025 10:02:51 -0400
Message-Id: <20250404-kconfig-docs-v1-0-4c3155d4ba44@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIvm72cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwNj3ezk/Ly0zHTdlPzkYl1DyxRLg6REIzOzlBQloJaCotS0zAqwcdF
 KQW7OSrG1tQDuYCvoYwAAAA==
X-Change-ID: 20250403-kconfig-docs-19d90ba266dd
To: Jonathan Corbet <corbet@lwn.net>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

This series adds Kconfig pages (patch 1) to the Documentation, and
automarkups CONFIG_* text as cross-references to those pages (patch 2).

There is a huge change in build time with this series, so we'd either
have to so some optimization and/or put this behind a flag in make so it
is only generated when desired (for instance for the online
documentation):

  (On an XPS 13 9300)
  
  Before:
  
  real	6m43.576s
  user	23m32.611s
  sys	1m48.220s
  
  After:
  
  real	11m56.845s
  user	47m40.528s
  sys	2m27.382s

There are also some issues that were solved in ad-hoc ways (eg the
sphinx warnings due to repeated Kconfigs, by embedding the list of
repeated configs in the script). Hence the RFC.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Nícolas F. R. A. Prado (2):
      docs: Add documentation generation for Kconfig symbols
      docs: automarkup: Cross-reference CONFIG_ symbols

 Documentation/.gitignore           |   2 +
 Documentation/Config/index.rst     |  17 ++
 Documentation/Makefile             |  12 +-
 Documentation/kbuild/index.rst     |   2 +
 Documentation/sphinx/automarkup.py |  36 +++-
 scripts/kconfig2rst.py             | 336 +++++++++++++++++++++++++++++++++++++
 6 files changed, 403 insertions(+), 2 deletions(-)
---
base-commit: 405e2241def89c88f008dcb899eb5b6d4be8b43c
change-id: 20250403-kconfig-docs-19d90ba266dd

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


