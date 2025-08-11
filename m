Return-Path: <linux-kbuild+bounces-8345-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 289CAB214D5
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 20:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BD1846072D
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 18:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63D32D4819;
	Mon, 11 Aug 2025 18:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrMnhbxE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787651E2858;
	Mon, 11 Aug 2025 18:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754938134; cv=none; b=nhg/SRI1RsLk94oE49JbFxB/U9HOAVn/0xMxNyIBvmzWMc7h0p4LaN4qRRyoqZyxNHiTlqIOE4DmqADXWqm76DihdZxHMK8tYxqiclFQL6ZLkidza80V+4HgQHOXEkxR/HEiqsjZ5F/6y2Fwlew0pIiRNkDqyD6zhzPi5mroLkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754938134; c=relaxed/simple;
	bh=V2ebLN2lCYMtobAQmErA32Kl4k0qm9O7vsyLPUmzKgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UQNDsZgHApGStCDtTE2CmPSV4lAGVazvWwG4a1hFgcvAbMm1zSH5lhYwlyYqdb0p25JpJUTPq6MOGwIvkr1Z7000WvlRsnFAZPFNufBvmH/GQprvN3eZS+Z3pWIdxSERMKNmzvuSpq8viVkJ+SAQd5IqjL1n9KZSeIEbsAL3aCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrMnhbxE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C888C4CEED;
	Mon, 11 Aug 2025 18:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754938134;
	bh=V2ebLN2lCYMtobAQmErA32Kl4k0qm9O7vsyLPUmzKgc=;
	h=Date:From:To:Cc:Subject:From;
	b=jrMnhbxEl1/OzFCGhER5TseSfWS4/UePhPbdRD8JAmzZl5ut3BrdvCtKiaIl+Wy2X
	 L0QLfM88N30w6SLdQu0B36vPukmAenxX5HpXzOsCcv9sW2op2fZ1l/JO1eGosOP2Lz
	 biq/omrLCTekvQWwA616EI0hrcUZlAE4IbxAQImfGl4Ip/ZCgUjvIRFs0VFCDUOqAZ
	 snzIOV13mQ4SwH79k21gAT9of8/82Awf6f5i9qLT2vfc0lB4hmVAJW1UYJTOjBJBHG
	 fT1gDyq/6srNcD+WNFpbSyq+K/QLdHO06zkiJtnluiHApn+c7cov1Ex2TXxF/E9Wz+
	 GdXy42W0GB6pw==
Date: Mon, 11 Aug 2025 11:48:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Updating Kbuild tree and contacts
Message-ID: <20250811184849.GA1266@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

Nicolas and I have taken over Kbuild maintenace from Masahiro as of
commit 8d6841d5cb20 ("MAINTAINERS: hand over Kbuild maintenance"). Could
you please update your contacts for the Kbuild tree to both of us and
the Kbuild tree to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git

and start pulling kbuild-fixes and kbuild-next in at their respective
places within the -next update cycle? Please let me know if there are
any issues or questions.

Cheers,
Nathan

