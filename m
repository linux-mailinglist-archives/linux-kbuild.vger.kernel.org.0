Return-Path: <linux-kbuild+bounces-12876-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDPsK58V7WlZfAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12876-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Apr 2026 21:27:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4004A46789A
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Apr 2026 21:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7DF613002895
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Apr 2026 19:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2462F3C26;
	Sat, 25 Apr 2026 19:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZBiQLP4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654AC4C97;
	Sat, 25 Apr 2026 19:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777145243; cv=none; b=S2RLmhPbJJVu2Au6LIq32yNoYmDVGVbAXuEs2+kXS+WZ/QIg50+nnNbbbzTb5j33+vCBNNKj2nUerDeiJjFMYiqlVw76Y3LyiEAD5irmFuJgPm1Gcz1aeiXmKlizS8jSDjKUkW4QYAsoGM3YasJE1hULy6pzBj38jQ+kyfxkruA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777145243; c=relaxed/simple;
	bh=fTbM1QB7sC+EbLarcKBxKDF/BEjxNA/tYWh6bQMxrEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SR7jiowsxfXFS2XewtugWQ7XLC6dN8rvccxSdopz7zSl7Izx3+BeSjeqa8asMKHympnYR574z9c2oycfBo9v7nhMWi2P1dLCFR8TEflzfSsxD0zjnvDzyCz+ud5PQUGwOl17Rf/tQVNsFZaxVoN3bOCpGIu28L1QV8a4ZsZaIH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZBiQLP4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F765C2BCB0;
	Sat, 25 Apr 2026 19:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777145243;
	bh=fTbM1QB7sC+EbLarcKBxKDF/BEjxNA/tYWh6bQMxrEI=;
	h=From:To:Cc:Subject:Date:From;
	b=lZBiQLP4IpZiu8PLjlbM8EFRh44aJQtCccw2/xiRiYcrUez4bBj45tu+QIUSjcyh5
	 OU3FGBWpX4lWh+j0Zgd6ZwHwfwk/BIgZbK9ZuatPgy7X3OxDV1SE9FFWgAbsLfcRUO
	 VLxHsu9gO7cq2elnVv6G3tb7o2L81lPxLakRKNeS4PawudnLnZ6YTM1xYoj9Em/mpU
	 0+jny1sRkpjZ1MZDuHFuOoZ/E+l23vo0uhNYhj6mRvUtY7YoRD9tYtdFl0BSwCfmPf
	 NqgHUaa8twzKmWNq2ijFc8fhvmOUasBAFVVJY458P5vkoLnChUlyXF/KsLI/zNlHjS
	 8+1ADqDlTMeyQ==
From: Nicolas Schier <nsc@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Mathias Krause <minipli@grsecurity.net>,
	Nathan Chancellor <nathan@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [GIT PULL] Kbuild fixes for 7.1 #1
Date: Sat, 25 Apr 2026 21:27:02 +0200
Message-ID: <20260425192708.2283642-1-nsc@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4004A46789A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12876-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Hi Linus,

please pull this first round of Kbuild fixes for 7.1 with two small commits.
If there are any issues, please let me know.

Thanks and kind regards,
Nicolas



The following changes since commit 028ef9c96e96197026887c0f092424679298aae8:

  Linux 7.0 (2026-04-12 13:48:06 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.1-1

for you to fetch changes up to 75f7c47ccd78c947cf1b6ddb18ea453ff0555716:

  kbuild: Never respect CONFIG_WERROR / W=e to fixdep (2026-04-24 13:57:48 +0200)

----------------------------------------------------------------
First round of Kbuild fixes for 7.1

  - kbuild: builddeb - avoid recompiles for non-cross-compiles

    Avoid triggering complete rebuilds for non-cross-compile Debian
    package builds by only triggering the rebuild of host tools for
    actual cross-compile builds.

  - kbuild: Never respect CONFIG_WERROR / W=e to fixdep

    Avoid spurious rebuilds of fixdep w/ and w/o -Werror during a single
    kbuild invocation by never respecting CONFIG_WERROR for fixdep.

----------------------------------------------------------------
Mathias Krause (1):
      kbuild: builddeb - avoid recompiles for non-cross-compiles

Thomas Weißschuh (1):
      kbuild: Never respect CONFIG_WERROR / W=e to fixdep

 Makefile                 | 2 ++
 scripts/package/builddeb | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

