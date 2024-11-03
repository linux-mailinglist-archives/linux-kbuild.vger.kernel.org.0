Return-Path: <linux-kbuild+bounces-4496-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 704CF9BA674
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Nov 2024 16:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD73DB21234
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Nov 2024 15:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652311632FE;
	Sun,  3 Nov 2024 15:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ECRrgRdZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FB74A1D;
	Sun,  3 Nov 2024 15:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730649006; cv=none; b=r9dLK0axsE3AXp3TW/wyMVWKqPNe3HilTY2I+oL2XIbqWQ+kSukbOKLdQlO2JCsf38FtbXTxc8W4c+7PbhOE3fXh6MK9jgBYeaCUATCCqCB3+JVtkUpmxI3+DONhlW8dfyPGD0gizSA09O0VPIPp8io6FI+kwo5uFtyGuupvimQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730649006; c=relaxed/simple;
	bh=AW4Knij9ewvLsBxLY6FtOGeMfl29M21+rl9tqeA6PmA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=i7nNvfGjwv9YGH0qDe7oVqTxFZ26jVBCJYQ4o4yQZ8x9EYxlOaD2vyy8G/MQCgpWL6mpsd1fE5mBj9yj6PzCSdBxg0RKEn9rms8LBHo3vfz2i+CrXZA0qI8fDJZTlPBWejWJSyvnMW8lIK6M+MOXYyfJaQF9lfQZXKKI8gO7f+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ECRrgRdZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6AC5C4CECD;
	Sun,  3 Nov 2024 15:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730649005;
	bh=AW4Knij9ewvLsBxLY6FtOGeMfl29M21+rl9tqeA6PmA=;
	h=From:Date:Subject:To:Cc:From;
	b=ECRrgRdZjGN9hwJkC+gxWigdsnMdhm79OZPLc9sixVG0wTk69PWJHhLfpRIz7kJ0S
	 iAzE9QAeFCoCbJ+sjInyxz940QRxuMVZ1TJOyfR67ALFEulh3PHX95BOO2X34qv8T0
	 fB/lZwb5NiNWr+1LCR4tzhQPOH10Cm31wl4wBYPDuUwsWEnm/yXxRJ5+ndUy39L1FS
	 +A6IcEg9Qvv53hcvf2nXPQfHLT/oScFfjFas+2nUQsSaZs3+gZtYGngSLsxNwWvNbw
	 CsOjm9aoxfKlGrEacncB2GPkQBEKabeTLR6p9jNKJXOsjyPmrYYiRt6GFkav/TW87s
	 tS9Oq3TFPLZkQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb559b0b00so27777581fa.0;
        Sun, 03 Nov 2024 07:50:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWGPXIW1iztAz7B+qC8peEnu3VDxqquWCtdBO7N2hRLn5POayB8Lv5IgStptkNJHyNf0Vpd9+HXg6muUo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWTI7tfIWat4iq72PqWzxMQcKTAYNrvMyNz+PT2RRBetmIrQ1X
	9wxq6sOtKLji6o+CoZc8/7kU6qeSq7TYDZ91xbbJTN1PGl8U3SydD5YlTMudJs7Jj9jX5btf8T5
	ecqV2b1gXzikiwb/AN6FTyT47kVU=
X-Google-Smtp-Source: AGHT+IEH6qS/+D0U6lTqkeMJhdBXb7uQc9Gm7F9sLTblHGebkuwIQvuzqlWHPiphvFNAaJ8jCKCS9akdi6AUDlH9nyE=
X-Received: by 2002:a2e:a80b:0:b0:2fa:d4c1:3b71 with SMTP id
 38308e7fff4ca-2fedb7c817cmr46315621fa.19.1730649004405; Sun, 03 Nov 2024
 07:50:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 4 Nov 2024 00:49:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNARe1AnzxumbfOD7y2CpRXSa59RvsEDTw5YAjCTim9-5GQ@mail.gmail.com>
Message-ID: <CAK7LNARe1AnzxumbfOD7y2CpRXSa59RvsEDTw5YAjCTim9-5GQ@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.12-rc6
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Linus,

Please pull some Kbuild fixes.

Thank you.



The following changes since commit 42f7652d3eb527d03665b09edac47f85fb600924:

  Linux 6.12-rc4 (2024-10-20 15:19:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.12-2

for you to fetch changes up to 77dc55a978e69625f9718460012e5ef0172dc4de:

  modpost: fix input MODULE_DEVICE_TABLE() built for 64-bit on 32-bit
host (2024-11-03 23:58:56 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.12 (2nd)

 - Fix a memory leak in modpost

 - Resolve build issues when cross-compiling RPM and Debian packages

 - Fix another regression in Kconfig

 - Fix incorrect MODULE_ALIAS() output in modpost

----------------------------------------------------------------
Elena Salomatkina (1):
      sumversion: Fix a memory leak in get_src_version()

Masahiro Yamada (6):
      kbuild: rpm-pkg: disable kernel-devel package when cross-compiling
      kbuild: deb-pkg: add pkg.linux-upstream.nokernelheaders build profile
      kbuild: deb-pkg: add pkg.linux-upstream.nokerneldbg build profile
      kconfig: show sub-menu entries even if the prompt is hidden
      modpost: fix acpi MODULE_DEVICE_TABLE built with mismatched endianness
      modpost: fix input MODULE_DEVICE_TABLE() built for 64-bit on 32-bit host

 scripts/Makefile.package             |  7 ++++++-
 scripts/kconfig/menu.c               | 13 ++++++++++++-
 scripts/mod/file2alias.c             | 12 ++++++------
 scripts/mod/sumversion.c             |  5 +++--
 scripts/package/builddeb             |  2 +-
 scripts/package/install-extmod-build |  6 ++----
 scripts/package/mkdebian             | 10 +++++++++-
 7 files changed, 39 insertions(+), 16 deletions(-)

-- 
Best Regards
Masahiro Yamada

