Return-Path: <linux-kbuild+bounces-7376-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDA3ACFBD0
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 06:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C1FC172CFB
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 04:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC281A9B48;
	Fri,  6 Jun 2025 04:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qaTnSg2K"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DA4125DF;
	Fri,  6 Jun 2025 04:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749183056; cv=none; b=Xo+L+p6DAeYYapegu654e7wNaI/1s8hyHQCYK+4AGf5tmSstsYHdP2MNxynrrfQhhAqLrmghQwDJEOlLIw7zsoYHhDsenbP1Rm8WTuwTlKSmwi1pzAnniYB9XivHDpOt51tuqCGt/N1O4apIZXUmQx/zF24W+/VOgIAEsqsp28M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749183056; c=relaxed/simple;
	bh=bCe16r2I+YJMXAdal9rTugZ3u2+TIeJPfQZ1V8kT68k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VMRcLNOtbgV39A2t+ZkjvsATYk2vdNSKJLpZMvEiiLafP6ffPIinn+tagHDlL02zTiVa+Av6j1KlKymRduyRECwoaOneQGBDr18hOxG0FiG75WrfK8LgqIEo6uNGkCm9n315SsFu0qOxvYyjEUthJZlu3bfC34sJj5Yh4aB0KIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qaTnSg2K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E01C4CEED;
	Fri,  6 Jun 2025 04:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749183055;
	bh=bCe16r2I+YJMXAdal9rTugZ3u2+TIeJPfQZ1V8kT68k=;
	h=From:To:Cc:Subject:Date:From;
	b=qaTnSg2KrK/z70bWZNwwtHTdKerM5Ou8oB4j/R6Tha+AyYb+scGmp8CRIalWgUzuQ
	 oKpVpdW4F551u9qifdSk7mEkTYLBlnrEUQ6s1gkC0J/L3mEnwaoGiiBtY6JPKUZek5
	 bstLjwnqacdASBwUf5djPrysR5U+CKK16eC7dhysMCR8RbjCYYUluYOhu/kjA5W/I2
	 NyetSHzjXAa+sfrIhOMb2ywppGwWlLn6UN5RLhfb5x7TRvbaPgSf5m0NpEWxvYG6H7
	 gmJ5CEHHYZAJ5h5tcELj9f5VpHkbJBPhQq+tNOtqM4x6glQA+ldzIiMJSadDTje6I1
	 34DgVg0EobcVQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Petr Pavlu <petr.pavlu@suse.com>,
	Alexey Gladkov <legion@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 0/4] kbuild: generate module.builtin.modinfo from vmlinux.unstripped instead of vmlinux.o
Date: Fri,  6 Jun 2025 13:10:22 +0900
Message-ID: <20250606041029.614348-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Currently, modules.builtin.modinfo is generated from vmlinux.o, which
occurs before modpost. So, we cannot include modpost-processed data
into modules.builtin.modinfo.

This patch set allows to generate modules.builtin.modinfo from
vmlinux.unstripped.

I think this patch set will be useful to clean up this:

https://lore.kernel.org/linux-kbuild/cover.1748335606.git.legion@kernel.org/T/#m98813857abf2101bdf67f1b8529a44f5c7f4746d

The original approach generates modules.builtin.modinfo from two files
and then cancatenates them into a single file.

I prefer generating modules.builtin.modinfo from a single point.

I think 1/4 is a good cleanup regardless of modules.builtin.modinfo


Masahiro Yamada (4):
  module: remove meaningless 'name' parameter from __MODULE_INFO()
  kbuild: always create intermediate vmlinux.unstripped
  kbuild: keep .modinfo section in vmlinux.unstripped
  kbuild: extract modules.builtin.modinfo from vmlinux.unstripped

 include/asm-generic/vmlinux.lds.h |  2 +-
 include/crypto/algapi.h           |  4 +-
 include/linux/module.h            |  3 --
 include/linux/moduleparam.h       |  9 ++--
 include/net/tcp.h                 |  4 +-
 scripts/Makefile.vmlinux          | 73 +++++++++++++++++++++----------
 scripts/Makefile.vmlinux_o        | 26 +----------
 scripts/mksysmap                  |  3 ++
 8 files changed, 63 insertions(+), 61 deletions(-)

-- 
2.43.0


