Return-Path: <linux-kbuild+bounces-12738-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE6SO90z2GkWZwgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12738-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 01:18:54 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6763D078A
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 01:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CBE653010838
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Apr 2026 23:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78406371D11;
	Thu,  9 Apr 2026 23:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8q5v/Oq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D5724466C;
	Thu,  9 Apr 2026 23:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775776726; cv=none; b=HjZAloOy1hA59oieEi55rK9o9BkeyWl64Ievxohu0lxqdRVBSafD+H+TkaQuFZIA4OYTezauVPPKc2f43drs/mdENCAONduv8aSBE3zL3e/51goaEsEcaCcIPir+1rEiArJAh07ieqqnX+0EW9Rz+gm+aBSKDcQiD0YEE/TSzKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775776726; c=relaxed/simple;
	bh=eKDd6KUMUCu02RfSWacnIXaGCIk5zUPaj4PgRqhdJu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jyYj5gLl6fRAPXWnjUAYw30G9kVw+fonjAIV76UCmV+II722f45tqQ81evcDYUlLmJ/qYCEZRD7oLrOAp3Y1fssmG3UwzEP5q2RhO/Zu1LjKAoz1KTVVfJPsg1vhvELo8AHVNP009yTMsvKf1EGnEIrx3uNsV1vK58VP5kkNxBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8q5v/Oq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB81AC4CEF7;
	Thu,  9 Apr 2026 23:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775776725;
	bh=eKDd6KUMUCu02RfSWacnIXaGCIk5zUPaj4PgRqhdJu8=;
	h=Date:From:To:Cc:Subject:From;
	b=n8q5v/Oqm2V2dUOt1sRaEkkk7zGGNVG8buuDWTJOijL27CCNH0PF4oiKBs5puMaA1
	 t+49XKKbsDWE7zp9QZLEimdAiyVad6Ra6S8kV3lw2IL9eXD2uzNOXcw6JF4f2VEutH
	 gIykNyMjc8ePbBtSQ7Tbbck1HuBRfkHD4miOoa7MPAfNMLieC/mlv5YXcoZ+Vj+S6i
	 oge21PxbtxBSbfKSAfOucMAyZQlcsrrRIKimcy0ozneUv/31bhxw0v8ybDct7SzF87
	 tfO0Ygr753Y+8j0iH7hv83D70nIh2Y6G8teVGyQFHg1G8fVOrYwysfDbBrsow514al
	 mPBfvW0JRWPwQ==
Date: Thu, 9 Apr 2026 16:18:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [GIT PULL] Kbuild fixes for 7.0 #4
Message-ID: <20260409231842.GA3337002@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12738-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE6763D078A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Linus,

Please pull this final round of Kbuild fixes for 7.0, comprising of two
small fixes. If there are any issues, please let me know.

Cheers,
Nathan

The following changes since commit 7aaa8047eafd0bd628065b15757d9b48c5f9c07d:

  Linux 7.0-rc6 (2026-03-29 15:40:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.0-4

for you to fetch changes up to deb4605671cfae3b2803cfbbf4739e7245248398:

  modpost: Declare extra_warn with unused attribute (2026-03-30 07:45:34 +0200)

----------------------------------------------------------------
Fourth round of Kbuild fixes for 7.0

- Make modules-cpio-pkg respect INSTALL_MOD_PATH so that it can be used
  with distribution initramfs files that have a merged /usr, such as
  Fedora.

- Silence an instance of -Wunused-but-set-global, a strengthening of
  -Wunused-but-set-variable in tip of tree Clang, in modpost, as the
  variable for extra warnings is currently unused.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>

----------------------------------------------------------------
Janne Grunau (1):
      kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH

Nathan Chancellor (1):
      modpost: Declare extra_warn with unused attribute

 scripts/Makefile.package | 3 ++-
 scripts/mod/modpost.c    | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

