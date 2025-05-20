Return-Path: <linux-kbuild+bounces-7175-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3E6ABDD0A
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 16:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78A9D1897E01
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 14:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB1F22D794;
	Tue, 20 May 2025 14:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vPYfX/Wh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317E51AF0C8;
	Tue, 20 May 2025 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747751469; cv=none; b=UXdRxnOIxyOn7r64WiywDASYQkdnSI1ciNTNkvUlYXugt15GM/17OJCXaP6BFK0kTKpZMb91XK8NHWKHAU752MaKkMLyoe/Kyh12MTHsIT87TeIFZK9P/muAkjWAI7NFLyfq+0JZpdMZFOQMV1uo43bAm0jVVfwVlqPC6UtZ4Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747751469; c=relaxed/simple;
	bh=f3Bm+vGkam2mdGleQTX64PuwPT5vvIv85wSu6+MtV1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EyNiD5HH3zMLrB29bASkqQsHRUQ1CwxEmWHnKeJ3OMx13ViUaoIgSKI4IpblD81nssv13u6NysTZj6WSApH2gNN7kXx6enHSiGFxEm0rZNbOAjGItMn2ODJPOYKN2xbV1Nu0PMnF5/BpbpjJzTZQr+00HWtcTTqZbMwroPsZ9Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vPYfX/Wh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189BCC4CEE9;
	Tue, 20 May 2025 14:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747751468;
	bh=f3Bm+vGkam2mdGleQTX64PuwPT5vvIv85wSu6+MtV1Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vPYfX/WhBietxhN+xIRkqpvjTo3DEPuqzYYkcDLb/01fglMmQ37cxRho4+sTsmICK
	 3g8jFY1Z36/TjVXnMAwxq7VvauZLGm5wNG2gQGQbRaY4tyVxCQp8uJxW3Vx1+TUils
	 cn0uFd2j+PiFX35K3vhtKpC4ducSY5BBRHwymOhFFLBqy4dKaiMY0lV4kR4l1HNCra
	 FoeUv3/3aMjIroMN++g6MA4SI7DLRXjJqlI7p6sGZ5dlZo88/WWTgDYPzjJ08sfwB0
	 iK1DervVsrkl3U9xPg7AH6XVs5BMQwYYpxy2l/F+esuQqt9d8s4NE7Pd/K5PKIAJ2r
	 wbdJzl69LdVIQ==
Date: Tue, 20 May 2025 16:31:02 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Nicolas Schier <nicolas.schier@linux.dev>, Akira
 Yokosawa <akiyks@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Some kernel-doc fixes
Message-ID: <20250520163102.611cecc6@sal.lan>
In-Reply-To: <aCyPFAKhSQIFR_lJ@smile.fi.intel.com>
References: <cover.1747747695.git.mchehab+huawei@kernel.org>
	<aCyPFAKhSQIFR_lJ@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 20 May 2025 17:17:56 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:

> On Tue, May 20, 2025 at 03:33:05PM +0200, Mauro Carvalho Chehab wrote:
> > Hi Jon,
> > 
> > Let me consolidate some patches on a single PR to make life simpler
> > for you. Those should address Stephen and Akira's concerns with
> > regards to KernelDoc class usage via sphinx kerneldoc.py extension.
> > 
> > Patch 1:	don't let Sphinx suppress errors/warnings;
> > Patch 2:	fix a KeyError when trying to acess data from non-existing files;
> > Patch 3:	add try/except blocks to avoid crashes when handling bad
> > 	kernel-doc markups;
> > Patch 4:	makes Lore and kernel-doc ML receive patches related
> > 	to kernel-doc.py and get_abi.py.
> > 
> > Patches 1 to 3 were already submitted on separate series. Patch 4 is new.  
> 
> Can we actually utilise CONFIG_WERROR to fail the build. If yes, the build will
> be failed. This is in align with the warnings in the C code.

It makes sense to me - either to use CONFIG_WERROR or to have something like:

	make SPHINX_WERROR=1 htmldocs

Btw, kernel-doc.pl (*) and kernel-doc.py have several command-line parameters
to control warnings:

  $ ./scripts/kernel-doc --help
  ... 
  -Wreturn, --wreturn   Warns about the lack of a return markup on functions.
  -Wshort-desc, -Wshort-description, --wshort-desc
                        Warns if initial short description is missing
  -Wcontents-before-sections, --wcontents-before-sections
                        
                        Warns if there are contents before sections (deprecated).
                        
                        This option is kept just for backward-compatibility, but it does nothing,
                        neither here nor at the original Perl script.
  -Wall, --wall         Enable all types of warnings
  -Werror, --werror     Treat warnings as errors.
  ...

(*) from the above, only -Werror is documented at the Perl version.

In the future, I'm planning to do some work to improve it - including
removing the deprecated -Wcontents-before-sections.

But anyway this is out of the scope of this series, as we're aiming
to be bug-compatible with kernel-doc.pl. The crashes were unintended.

Regards,
Mauro

