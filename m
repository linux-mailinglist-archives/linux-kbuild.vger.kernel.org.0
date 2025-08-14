Return-Path: <linux-kbuild+bounces-8478-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FD7B27116
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 23:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D4A85A7D14
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 21:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388C0279DCC;
	Thu, 14 Aug 2025 21:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KM8YaiWQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AF318DB1F;
	Thu, 14 Aug 2025 21:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755208308; cv=none; b=bFXctrZyaEXgCUYxtrwhIoa3+fmfeek1UShIxIhjr+FVtaXViG1kJxyDEL8gS0y7Zm2cYXiQ10XwBe/1q6ANw7eu+PSg3BmcYeTIvQM/CdXWnYIRCkh2iGPwR5dazSyAUeyTcLMp+DzNqx8AybhczU3Dtfqs9PVzTUegDsWhVCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755208308; c=relaxed/simple;
	bh=3PZUvshKNgS1EW1hvZi8hAaoj+TWiBTTfynCAv5tXFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lultb1tdg1y3gSARE5a9d2aqk/3sBqNBckKNXC1cbl9/+tSE0bz83FSROUwHCZjnzzApIvgWekQ3QnsN/rTtYMP3128DKF9pzR+AmcU8IH8jeFiL4F5DDABf7oOCDoaS4lt2LxQU5/N2ZQ9TyteAKNtRq/VOAA7KWm2JlWzzF6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KM8YaiWQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6384AC4CEED;
	Thu, 14 Aug 2025 21:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755208307;
	bh=3PZUvshKNgS1EW1hvZi8hAaoj+TWiBTTfynCAv5tXFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KM8YaiWQjpDdHhMS6hyIHw9mZDc1nkL/FD/+KlDFz8y0++7MQehJBL2cvwgrBGI9Q
	 D+NQtTrLKvaIOhqb61+Prd7DvSazgl5fxmNTc4F2ItveFLcwiKWDBF7PWfUXTdUD2u
	 BD+VCQv89vw3aFgfK30ySRp0ImUQXiF/QUfGd/xoWKSy1KMXKcSzEmmyEwWtlG+B4r
	 VsMHQPNq/kSAt8JAU71tm0EKKwlYQJS7J+iM6XgBbjEPaRRjB1GOy2SsSIX5bMqbep
	 nut+WcOyE3YBsrr1o9vJuDsZvFhnjINpqhhJcTsg83HBn0+nUbZT6WMTz9UDqFJUYr
	 mw7FG1rU6SKbg==
Date: Thu, 14 Aug 2025 23:51:40 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 9/9] s390: vmlinux.lds.S: Reorder sections
Message-ID: <aJ5abMK4nbdg4RBj@example.org>
References: <cover.1755170493.git.legion@kernel.org>
 <919570dc048786c4d07affaec4b761811c6c21c5.1755170493.git.legion@kernel.org>
 <20250814141658.7684Fd6-hca@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814141658.7684Fd6-hca@linux.ibm.com>

On Thu, Aug 14, 2025 at 04:16:58PM +0200, Heiko Carstens wrote:
> On Thu, Aug 14, 2025 at 03:07:17PM +0200, Alexey Gladkov wrote:
> > Reorder the sections to be placed in the default segment. The
> > .vmlinux.info use :NONE to override the default segment and tell the
> > linker to not put the section in any segment at all.
> > 
> > >> s390x-linux-ld: .tmp_vmlinux1: warning: allocated section `.modinfo' not in segment
> > >> s390x-linux-ld: .tmp_vmlinux2: warning: allocated section `.modinfo' not in segment
> > >> s390x-linux-ld: vmlinux.unstripped: warning: allocated section `.modinfo' not in segment
> > 
> > Cc: Heiko Carstens <hca@linux.ibm.com>
> > Cc: Vasily Gorbik <gor@linux.ibm.com>
> > Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> > Cc: linux-s390@vger.kernel.org
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202506062053.zbkFBEnJ-lkp@intel.com/
> > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > Acked-by: Heiko Carstens <hca@linux.ibm.com>
> > ---
> >  arch/s390/kernel/vmlinux.lds.S | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> Is there any reason why you didn't reorder the patches?
> https://lore.kernel.org/all/aIeUq0qYXoNIePwd@example.org/

Oops! My bad. This patchset was added to linux-next and seems to be in
the correct order, but then it was removed and I seem to have lost this
change.

-- 
Rgrds, legion


