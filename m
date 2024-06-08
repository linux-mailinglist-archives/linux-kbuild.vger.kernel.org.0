Return-Path: <linux-kbuild+bounces-2033-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 231A89012EB
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Jun 2024 19:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0C0B1C20C38
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Jun 2024 17:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79F017839B;
	Sat,  8 Jun 2024 17:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ml8AisJM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C95F178385;
	Sat,  8 Jun 2024 17:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717866656; cv=none; b=NSOSSlwqy/F8WVapaHyryGNBNZe+L6znwI1EtlLoAy7mk1SH5DSrlqUgsd4uIuCWipU5dIh0eZhykSeaVnuT4x3NlBv+Ib6zu44xGvrSqSXog90HSSKndZOZ9oB1cAVdcRoDnNfsnVhhYu4P40yZNj30B27c9CnfQsA1VjHlJK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717866656; c=relaxed/simple;
	bh=EME+hP+C8RcELSTwJMFpS19yQjGf6X67aiKV3VGymjA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VqbdXOy1dRAxvVbEvL6nxr4Vo2Hy/hHGFvSV3Za+MdEQ3gwoWXGtvTbKduLB9hjI7YHq4TMaTMyrNQiEsF8J+S1eF8TJ0zMSDFkNo2c/TMlNCMAzLISdKqPXPXmxMfG6QgiS0qNIB/F5TgqOF/qER3U/3r2tp0LPx+TeODZfYHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ml8AisJM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF54C2BD11;
	Sat,  8 Jun 2024 17:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717866656;
	bh=EME+hP+C8RcELSTwJMFpS19yQjGf6X67aiKV3VGymjA=;
	h=From:Date:Subject:To:Cc:From;
	b=ml8AisJMkDjOiGAfEhU+AhxuJgrOTa9ovGJaupob+NIQJRLgq9REEakVLUFlccJIp
	 /1Fxg3LW2D3DprFpb9kVBx7/6lM2MDSCky5bYWAFblBd+SI/U5O+KZiH+xV7Eo2ny2
	 4UzPkBjQ0baCN7pbGQpzyw7R8wwhdvTB82xbiYx30V4c87LYRAKi97tUwNHs1SZeog
	 h+fFztuPP2JYCSv6nSfTVA6m7SPPpRv0PfGzXPIxfcOn5mbX2Q0uvJlLeRAEqA8tzH
	 ntp74BiJBMF/vuLJOA9qgyNKm20TpX9G8Pe2Ucse91PbotlhcE5HLcw5K6Neb0Pwi0
	 mUMGk0eVE7jZQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eaa80cb550so37274271fa.0;
        Sat, 08 Jun 2024 10:10:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXK6YM6UgIyON25jJeZO/oISJf8AVVXKE2hrmw+iPasBnMbHZD+Oj/OgM5RV8XkAHl9czGwTd7Cl8M1Wf2VpeRRcX1Sxthys/+DMpTW
X-Gm-Message-State: AOJu0YyJuJuuaWycJKBBNzxjh12J/VZx1pviyxrfrJ/1loodSwaJg6fV
	7m4CRW0l9IEuJqL7S9Kk3PMokBvZgLLHMrJaNezpvi6i1rFYZHkirETFJxAYL9cmW2q8rgBnUdz
	WUsTx4TyOkKK37lduleOjhGsPcWc=
X-Google-Smtp-Source: AGHT+IGNxW1H3Q8XfKKi0/3cGJVN4Sxmi0CFR+Rfzd6cywGlrDfWwsCl7DNaaBrjbzwKzpha3z5CYNKpPaISpxHH0Vo=
X-Received: by 2002:a2e:9187:0:b0:2ea:83d1:4802 with SMTP id
 38308e7fff4ca-2eadce3e25fmr32884721fa.27.1717866654865; Sat, 08 Jun 2024
 10:10:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 9 Jun 2024 02:10:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNATJ8UbgHdPfi7nCkQLZNNf0hgsXe5XWAqW=-34p03Vepw@mail.gmail.com>
Message-ID: <CAK7LNATJ8UbgHdPfi7nCkQLZNNf0hgsXe5XWAqW=-34p03Vepw@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.10-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Linus,

Please pull Kbuild fixes for v6.10-rc3.
Thanks.



The following changes since commit c3f38fa61af77b49866b006939479069cd451173:

  Linux 6.10-rc2 (2024-06-02 15:44:56 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.10-2

for you to fetch changes up to 9185afeac2a3dcce8300a5684291a43c2838cfd6:

  modpost: do not warn about missing MODULE_DESCRIPTION() for
vmlinux.o (2024-06-07 08:42:31 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.10 (second)

 - Fix the initial state of the save button in 'make gconfig'

 - Improve the Kconfig documentation

 - Fix a Kconfig bug regarding property visibility

 - Fix build breakage for systems where 'sed' is not installed in /bin

 - Fix a false warning about missing MODULE_DESCRIPTION()

----------------------------------------------------------------
Masahiro Yamada (6):
      kconfig: remove unneeded code for user-supplied values being out of range
      kconfig: gconf: give a proper initial state to the Save button
      kconfig: doc: fix a typo in the note about 'imply'
      kconfig: doc: document behavior of 'select' and 'imply' followed by 'if'
      kconfig: remove wrong expr_trans_bool()
      modpost: do not warn about missing MODULE_DESCRIPTION() for vmlinux.o

Richard Acayan (1):
      kbuild: explicitly run mksysmap as sed script from link-vmlinux.sh

 Documentation/kbuild/kconfig-language.rst | 12 +++++++++++-
 scripts/kconfig/confdata.c                | 13 -------------
 scripts/kconfig/expr.c                    | 29 -----------------------------
 scripts/kconfig/expr.h                    |  1 -
 scripts/kconfig/gconf.c                   |  3 ++-
 scripts/kconfig/menu.c                    |  2 --
 scripts/link-vmlinux.sh                   |  2 +-
 scripts/mod/modpost.c                     |  5 +++--
 8 files changed, 17 insertions(+), 50 deletions(-)




-- 
Best Regards
Masahiro Yamada

