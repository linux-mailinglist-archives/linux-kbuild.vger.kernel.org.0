Return-Path: <linux-kbuild+bounces-5000-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 253F79E48ED
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2024 00:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6246516589F
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2024 23:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31618207E04;
	Wed,  4 Dec 2024 23:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXBawvMv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD01207DFA;
	Wed,  4 Dec 2024 23:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733354783; cv=none; b=WM//NwUtVgUrsYvXJUk1Ks4XkmyD41a3Xf679UD8LSFznDG2azd1SsPR2TZbyUX3FZUg/SAB78YOpTuhOqwQVNwT0T6FBqosD5R0Vk+zYzZyQy36drGfRuJO8hJoLF1GAQnDanz9Kq91nxIKykCIQAbUbKyJ+uM5aFZUZEvY2kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733354783; c=relaxed/simple;
	bh=Afcq6SdufB2E9JP717fH6xo/4r8JMnHsLvDcI0uP8Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdXVFWRMg848DdFNaTKT4//N9Z4VJsLU97YhQvqB7GpSITl9MXhPZj1Yj36tTJjmssig2L9RPgBrUTlSufDlvPS35KEE6L5H+QsKolKUmdG49AR8YXJH4m2N06Ad6OfuSL706nqAa1FV8OUB8nzFcgi3gbMhe2NGq55oUefCFz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXBawvMv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965C0C4CED2;
	Wed,  4 Dec 2024 23:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733354782;
	bh=Afcq6SdufB2E9JP717fH6xo/4r8JMnHsLvDcI0uP8Lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fXBawvMvMCEnOHHNy6Nu8Z2ytvYd8KTsFd7I4IDdve/446nzTeWlulXz9chyTpkol
	 AF95PKJW0gjJBAo6AdFj/Huf5/rc1F2Oeb1UW2ppTPOM7mITHJo0ZUsg57tI6K5ciH
	 U7mgZU0xfuyABa6yqDQ1zKYVareCFH2fm0r4R/CONI8TKQ+5bDp4oQiRsfdOrSVz+8
	 SWVuLdVMkvqWVdEdrkWaK+Z738dmcctGTtFXvG19ByjBMkZybid0P8lwXfSldDX/is
	 mi7L5BOvUntvDYNrmzY+r/X4ngEvi2W+EadXjRk7iTo/WYB2Ipe3LG8XM5yDLzKE3q
	 0j6Aa81ZZNg8w==
Date: Wed, 4 Dec 2024 15:26:21 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: linux-kbuild@vger.kernel.org, jude.gyimah@rub.de,
	thorsten.berger@rub.de, deltaone@debian.org, jan.sollmann@rub.de,
	masahiroy@kernel.org, linux-kernel@vger.kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu
Subject: Re: [PATCH v6 00/11] kbuild, kconfig: Add support for conflict
 resolution
Message-ID: <Z1DlHcnukVtwB_Ah@bombadil.infradead.org>
References: <20241028034949.95322-1-ole0811sch@gmail.com>
 <Z1DesQ8fYQBDSvKa@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1DesQ8fYQBDSvKa@bombadil.infradead.org>

OK now that I've gone through the entire series again, I think this
is looking so much better. Just address those things I mentioned and
rebase on to v6.13-rc1:

  * use checkpatch
  * simplify commt logs and be more imperative and to the point

But from my perspective hopefully on the next respin, my hope is that
this will be ready.

  Luis

