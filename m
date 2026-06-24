Return-Path: <linux-kbuild+bounces-13879-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FelNJ9BgPGoMnggAu9opvQ
	(envelope-from <linux-kbuild+bounces-13879-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jun 2026 00:57:20 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A7B6C1D79
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jun 2026 00:57:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lIWiff4c;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13879-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13879-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2548730048DF
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 22:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC383B27F9;
	Wed, 24 Jun 2026 22:57:16 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6573A7849;
	Wed, 24 Jun 2026 22:57:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782341836; cv=none; b=F17V/8f0F4YAb0Q62nGTAWagQxQG3HzgJR8PZo2+GMr129tO5CHf6yvWOJ2ku6LoeqsKJ/nokG24CluCEZLcU9xyCAb0zEJMvYqutJXTY1SW7baqLBE/faE6Obg99F1GepOU7DU2uN7ZELX9o1GjG4UeNiCy3egIxFgXxwMVBm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782341836; c=relaxed/simple;
	bh=BUGth9T6GFsiGzDwFVeylUwGIQThA5Saz/Fdsq0tD7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cp1llZfHepdvMnqP2onC0q3dQUn3WaeJdadu3BCrMQa6zIpGv/+428coT85/R+nHYimRb8cs+UfY73C8wy46szhGNaRDQXSO6LY193auf7S3oIpZpZS+6rv2leXNGWm4B7iuBrGFzzSrlykDsnhotupJpioSKNpGxJFI5N6B0fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIWiff4c; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D131F000E9;
	Wed, 24 Jun 2026 22:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782341835;
	bh=vtpbjEzV0D9KX1/I3OrkLx2o++DBkjj7lU9MtNcwOXc=;
	h=Date:From:To:Cc:Subject;
	b=lIWiff4cfj5duibCM28sK8EXgZinmeOTihzEhyowHr1NP9CcWqVvE1/gEk5HtQqdH
	 cxZgFos1ps68IfD70hWaGVci2SKopIrhmAad1HT5jPedXAcnV1vc63akv3gCdvIBYb
	 4WfsEf5r2t+nuQTnmjVngNU6zPQzDE8j3mJeEMfbylis7SfFvoYBCiwR1dHA95xePv
	 dtug4Kbwe3RjYTqKSuv2qrQ/E+9kRz2KetaMfPKAiC8fmnWJ5AN9ofGCeYJTeCug4p
	 N+l4UOpyTQCBvoW9V+jMSKXtwgEmpbhDoA3NiAb0nVh3V7J+CG/ZXtkZBHuk/isPw8
	 QyLC2sCnNC6kA==
Date: Wed, 24 Jun 2026 15:57:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [GIT PULL] Kbuild updates for 7.2 #2
Message-ID: <20260624225711.GA1132314@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13879-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8A7B6C1D79

Hi Linus,

Please pull this second round of Kbuild changes for 7.2. It has all been
in next for at least a few cycles. If there are any problems, please let
me know.

Cheers,
Nathan

The following changes since commit 1a1e62a5a48494cdf33e3bfb82fb8f408da7c4cc:

  kconfig: tests: fix typo in comment (2026-06-09 16:28:46 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-7.2-2

for you to fetch changes up to 645323a7f4e55bb3abb0cb003b6b9dc715c8dc21:

  kconfig: add optional warnings for changed input values (2026-06-18 11:46:32 -0700)

----------------------------------------------------------------
Second round of Kbuild changes for 7.2

- Link host programs with ld.lld when $(LLVM) is set to match user's
  expectations that LLVM will be used exclusively during the build
  process

- Fix modpost warnings from static variable name promotion that can
  happen more aggressively with the recently merged distributed ThinLTO
  support

- Add an optional warning for user-supplied Kconfig values that changed
  after processing, such as out of range values or options that have
  incorrect / missing dependencies

Signed-off-by: Nathan Chancellor <nathan@kernel.org>

----------------------------------------------------------------
Nathan Chancellor (1):
      kbuild: Use ld.lld for linking host programs when LLVM is set

Pengpeng Hou (1):
      kconfig: add optional warnings for changed input values

Rong Xu (1):
      modpost: Ignore Clang LTO suffixes in symbol matching

 Documentation/kbuild/kconfig.rst                   |   5 +
 Makefile                                           |   3 +
 scripts/kconfig/confdata.c                         | 106 ++++++++++++++++++++-
 scripts/kconfig/tests/conftest.py                  |   8 +-
 scripts/kconfig/tests/warn_changed_input/Kconfig   |  40 ++++++++
 .../kconfig/tests/warn_changed_input/__init__.py   |  33 +++++++
 scripts/kconfig/tests/warn_changed_input/config    |   3 +
 .../tests/warn_changed_input/expected_config       |   6 ++
 .../tests/warn_changed_input/expected_defconfig    |   1 +
 .../tests/warn_changed_input/expected_stderr       |   4 +
 scripts/mod/modpost.c                              |   2 +-
 11 files changed, 204 insertions(+), 7 deletions(-)
 create mode 100644 scripts/kconfig/tests/warn_changed_input/Kconfig
 create mode 100644 scripts/kconfig/tests/warn_changed_input/__init__.py
 create mode 100644 scripts/kconfig/tests/warn_changed_input/config
 create mode 100644 scripts/kconfig/tests/warn_changed_input/expected_config
 create mode 100644 scripts/kconfig/tests/warn_changed_input/expected_defconfig
 create mode 100644 scripts/kconfig/tests/warn_changed_input/expected_stderr

