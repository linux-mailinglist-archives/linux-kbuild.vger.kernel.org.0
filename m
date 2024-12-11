Return-Path: <linux-kbuild+bounces-5077-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD659EC3B7
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 04:49:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C4FC163CFE
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 03:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AAA217F55;
	Wed, 11 Dec 2024 03:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GqQGwu0q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C062620968D;
	Wed, 11 Dec 2024 03:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733888883; cv=none; b=XfIBtLRPlZA3asd+Xl/+626SHw0a97purOCvZyo5bviXg45Wg0YDG7lXcAF+JdQLCpVuJGgA+HCVWXOLhwrH1uoDuKI1kkYfDcy8DlNE30Ah7ojxmR+183Aha+40iOvrdiHgf04fLDAGlrjZJZxAKPr9p/ni9FBUc9CpxSOaz/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733888883; c=relaxed/simple;
	bh=1Qm+Nh0K/a8ZjPcVF/jDjNWrfNGJjtMU1/Mfh1MwYvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFIkkbvqBIOZLL0CjH780hQmpZqWNrenN+Lzs/75MsT+jD/diDNy1GHTlKBLmzsjaqw5kmALaa77a9vfj7lXcVnZHTBS4E9xezZ39bUjjocTSxG25z/hElQnfUUYU2GrY1OZ4NdPV+KelHZatfTdgfS8eaipn3Fun4jloMnlO0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GqQGwu0q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0697DC4CED2;
	Wed, 11 Dec 2024 03:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733888883;
	bh=1Qm+Nh0K/a8ZjPcVF/jDjNWrfNGJjtMU1/Mfh1MwYvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GqQGwu0qocJc0u9pVcMFiz5DEX6nzLztNHbRv7FP0Cx7nIBWcc8VMwEt6iowweWJP
	 YT48sPljRgp+y30peYdWIIZH80i0zE3MwRiYfdoZt3k8D1PtT6DmXHErXbt4DCGk5o
	 MLhKvp5agQnqOF5G7PZGD+VREsntReBHbXJY/a487sf7nlP0aT5qvw9143WWcIdPtO
	 5lmb/1REfqHYYdWbbTYyXX5ZvvdWwSl2jI/9+uR45bGv9XQaPMMq2TPOwIuDOoekVl
	 dkGLLRruhSQ5C+yLIZfuXeOWi0cpBaoncFd6FhVQYQ2XwFCNA4uthoVaQMO2+cbzvH
	 Y3OgSVAjdb3tA==
Date: Tue, 10 Dec 2024 19:48:01 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: deltaone@debian.org, jan.sollmann@rub.de, jude.gyimah@rub.de,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
	thorsten.berger@rub.de
Subject: Re: [PATCH v6 01/11] kconfig: Add PicoSAT interface
Message-ID: <Z1kLcQmBKC4bzm73@bombadil.infradead.org>
References: <Z1DgqAb2wnlDjnLR@bombadil.infradead.org>
 <20241209005713.52352-1-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209005713.52352-1-ole0811sch@gmail.com>

On Mon, Dec 09, 2024 at 01:57:13AM +0100, Ole Schuerks wrote:
> Thanks for all the feedback.
> 
> > This just deals with the first error and there is no unwinding, is that OK?
> 
> This should be OK. dlsym() only retrieves the address of a symbol from an
> already loaded object. The calls to dlsym() thus should not need to be
> unwound, it's sufficient to unload the object via dlclose().

OK thanks, maybe add a comment about it.

> > Other than that, did you run this through checkpatch.pl?
> 
> I ran all patches through checkpath.pl. The only reported issues with this
> patch are the ones related to the use of the X-macro and one about the
> typedef for the PicoSAT type. 

I don't know what x-macro is so I don't have any clear opinion on that.

  Luis

