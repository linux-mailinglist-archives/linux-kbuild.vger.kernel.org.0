Return-Path: <linux-kbuild+bounces-5034-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDCF9E855C
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Dec 2024 14:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF89D2815B7
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Dec 2024 13:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC787145B25;
	Sun,  8 Dec 2024 13:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PB5vO1Ae"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D1878276;
	Sun,  8 Dec 2024 13:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733663858; cv=none; b=uvERl+WXjUOKOCJJ2z1Fp7Ih0arS9Aprd2llho/Ka4CHj0mPddzGmCkIph+GTNw2E0x9fV1oWigtxR87HazHQL0EISaaIgONpsM0Qfep3eobPNoCCq/zJfeaS3lyj7TWPH+d7f9FdTYqKyopWzt95LuB6oiwBGVwYP0mLpOxcOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733663858; c=relaxed/simple;
	bh=alp4eZMNDjtTvWmY7SQQDd+Vs80A1M1mtxpQYJ6YND0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VHAOW+Fa+hS0Gq52j6OkQMDXX/GtZXchn09aKK8U/wRA+8c0Ju8uIG9WS8fwgzg4/q1a2Ajfc9zQOALayTZd9A+STphbzf1ZBMr1+LGlcsMsoNwVkl9C2zfEX2275K0ToCiqZiRry8m+U4hXFfjIQN7GWqNc6CrX2ZiyxDe2vRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PB5vO1Ae; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7013BC4CEE0;
	Sun,  8 Dec 2024 13:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733663858;
	bh=alp4eZMNDjtTvWmY7SQQDd+Vs80A1M1mtxpQYJ6YND0=;
	h=From:Date:Subject:To:Cc:From;
	b=PB5vO1AeQhAFwkARsLvHqjwAZkyuRh8VkGwh912CEh6p4k5y89AvqC274GTkql0x6
	 kTaMzvenoIF25xRSoc27XN5liUv5gVbjI7Qb4uBn8vd+dGAqE4WOA/jemCvRPNH71m
	 TKDbDbEf8xtZx13CoZSKJxoSWD7AnlXrxGtkifhE03R0m3k+b9yPWXyGhmPh4QpW9A
	 4IyPo/KEZ5Fj66rDOsR3Ix5B0VZFxLzDZw7s98Mdb5j/42zcIpovb5koYqO4gK5CRA
	 Y8EgzmY8wN3anmvlaU9IkeYa34KN3yikV7SO9qffXnkBYau85vxb+KR7e3FEm9GMLH
	 BpFMp9/+7xz+g==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53de92be287so3438231e87.1;
        Sun, 08 Dec 2024 05:17:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWvlJ94sdJ+CtuZbKb4i2o5N6JaceXJnZrpgF9rHS1JRd41xfc5m4fCLaiJ3NhAT3QR8qtWrzyyEqqxuGk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb8679JnQIlR9HO/XqiXM/QlRc4TTPFP/QPlfi8OcWomQ5JZ29
	I+b3N6+OevhOoPq3P42Nu+sloQuTt4flUWWc3ceUfi1p5BpcytUrSmGY/WFPq3b6zFq9vXfk1MQ
	DqQxJfqH+fV11WEJ+BaW8aMvUPgM=
X-Google-Smtp-Source: AGHT+IGLlXueVGz+ABH2L4K8gPyRYAL+Ft5njyiDqOg0/jrq8tYTggrHxmiDTyu7LVmkHgigWQsjCzfP5pgDcIVc1RE=
X-Received: by 2002:a05:6512:3091:b0:53e:3a01:cf4d with SMTP id
 2adb3069b0e04-53e3a01cfe0mr2032045e87.31.1733663857043; Sun, 08 Dec 2024
 05:17:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 8 Dec 2024 22:17:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQmNNCfOeqybJD-=TpA1nVE923pLc7Xvpa+k55rkR7hRg@mail.gmail.com>
Message-ID: <CAK7LNAQmNNCfOeqybJD-=TpA1nVE923pLc7Xvpa+k55rkR7hRg@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.13-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Linus,

Please pull some Kbuild fixes.
Thank you.



The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.13

for you to fetch changes up to d8d326d64f6702caab01ea0cd48f6c0054f3d1b4:

  kbuild: deb-pkg: fix build error with O= (2024-12-08 17:11:34 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.13

 - Fix a section mismatch warning in modpost

 - Fix Debian package build error with the O= option

----------------------------------------------------------------
Masahiro Yamada (1):
      kbuild: deb-pkg: fix build error with O=

Thomas Gleixner (1):
      modpost: Add .irqentry.text to OTHER_SECTIONS

 scripts/mod/modpost.c                | 2 +-
 scripts/package/install-extmod-build | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)


-- 
Best Regards
Masahiro Yamada

