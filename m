Return-Path: <linux-kbuild+bounces-3933-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6276799201A
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Oct 2024 19:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CFED1C20C8F
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Oct 2024 17:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2184F82890;
	Sun,  6 Oct 2024 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSfULbqS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE39A2D;
	Sun,  6 Oct 2024 17:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728236870; cv=none; b=V5bJZfrNqFPbsoOgCUj9EqMRRb78a7zGd9WWoVyH12HeCjsncCXTPsCZlfCy2ObVyOWM3dDs8UAEAURNvx42dc/q3MHjjlJXjvZ+Sx1Mfeo8G+Hh4wywZDEDZyPxS9crEZ0dW3E7/d7J5IPzKvYYVi8JRghf325fZuRRkFxs6HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728236870; c=relaxed/simple;
	bh=drHEypleCqEveJNreAEpqzz3LhgB0f4Lux0g9ViIwEc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=b5IQmXuwqSXQzF8XGqAEzW3/+5mHktC2lgtJgGwgCgNxhaWODQywwken68qmQJ4EazoDb8UgVtAnEQy5Up7yFtqBoCVlEboiVzWbhRwnzsT4efMnMGhEEEgif82UDAg57vDGOIPpQXCeJn596EhlzFcWngOSd7vNHMeOMn/b7Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSfULbqS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72248C4CEC5;
	Sun,  6 Oct 2024 17:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728236869;
	bh=drHEypleCqEveJNreAEpqzz3LhgB0f4Lux0g9ViIwEc=;
	h=From:Date:Subject:To:Cc:From;
	b=LSfULbqSrxEhwRTEK7zq1mDkephiBnvvmV9D9e082zeeMjBiJr0rSbFkwadhBBLU3
	 Vc0tL2jHdtqfO/+sxugSGaseCXb+lJbjvTb7pDaQoVPOz/gqNdx3+FlgfSlvGtOyOr
	 J0MqYY+YQtvHeQyW/ctlIBXsNnDnEs6TSr1g8WX7n988nTvxhYlT3uXZHxsA1OQhgl
	 6rd58vrzjYi5qb/lcgYMRDHCTKPt8nRgSIm0hs/jLps1giak8zwPbhrkCIJYjqklbz
	 6Uz80Zyy4ZZQmeVwmP0LgeHwl2e2uaXuaXw28DAZFEvDJgFLIM/PP2n+toy/e3j1Pw
	 DZIhDoA+mmdqw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2faccccbca7so30078811fa.2;
        Sun, 06 Oct 2024 10:47:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3od2Ndzc1UHqveDGHX8eL+B7rg/YRAkQJ4hv8QoamVklfZe0EwkGn3yo3qwtTzyrBxd5h5O1JQdlGeg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoMDBAOqR3/q65IvCrJEAjPvisZoitlGRzBYe/mWfQj4aXxfPF
	Y4U0xzSqFNUiOXhb7IPob+8hAlV2RMuWPSTYA4PFiq+pcWhVfsq43rbqK6COQyzDTpLoQqFFE8f
	1Yaf3CEsLMTZupr7Rcgx7PgQgvsw=
X-Google-Smtp-Source: AGHT+IHx4bRLBv0A4S8LH8PAbP4fRYgU93R7N3u6QiKv6yAeu20z1kx7fx0XYGz4TQV/lvJbQiQ6NOG+FCTlrth9hF0=
X-Received: by 2002:a05:6512:1387:b0:530:daeb:c1d4 with SMTP id
 2adb3069b0e04-539ab85c0fcmr4562258e87.12.1728236868152; Sun, 06 Oct 2024
 10:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 7 Oct 2024 02:47:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNATWKzHUxHofwZx9NvcR5hTvxyBSxJLW8GMsZNQgXUQcwA@mail.gmail.com>
Message-ID: <CAK7LNATWKzHUxHofwZx9NvcR5hTvxyBSxJLW8GMsZNQgXUQcwA@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v6.12-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Linus,

Please pull Kbuild fixes for v6.12-rc2.
Thanks.




The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v6.12

for you to fetch changes up to 82cb44308951ad4ce7a8500b9e025d27d7fb3526:

  kbuild: deb-pkg: Remove blank first line from maint scripts
(2024-10-07 02:36:38 +0900)

----------------------------------------------------------------
Kbuild fixes for v6.12

 - Move non-boot built-in DTBs to the .rodata section

 - Fix Kconfig bugs

 - Fix maint scripts in the linux-image Debian package

 - Import some list macros to scripts/include/

----------------------------------------------------------------
Aaron Thompson (1):
      kbuild: deb-pkg: Remove blank first line from maint scripts

Masahiro Yamada (5):
      kbuild: move non-boot built-in DTBs to .rodata section
      kconfig: fix infinite loop in sym_calc_choice()
      kconfig: clear expr::val_is_valid when allocated
      kconfig: qconf: move conf_read() before drawing tree pain
      kconfig: qconf: fix buffer overflow in debug links

Sami Tolvanen (1):
      scripts: import more list macros

Xu Yang (1):
      kbuild: fix a typo dt_binding_schema -> dt_binding_schemas

 Makefile                 |  2 +-
 scripts/Makefile.dtbs    |  4 +++-
 scripts/include/list.h   | 50
++++++++++++++++++++++++++++++++++++++++++++++++++
 scripts/kconfig/expr.c   |  1 +
 scripts/kconfig/parser.y | 10 ++++++++--
 scripts/kconfig/qconf.cc |  6 +++---
 scripts/package/builddeb |  1 -
 7 files changed, 66 insertions(+), 8 deletions(-)



-- 
Best Regards
Masahiro Yamada

