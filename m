Return-Path: <linux-kbuild+bounces-5645-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F758A2AB51
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Feb 2025 15:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33DD83AAC63
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Feb 2025 14:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D101E5B97;
	Thu,  6 Feb 2025 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Hf7uM4Jr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EC01E5B93;
	Thu,  6 Feb 2025 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738852122; cv=none; b=iFrCTwGE4l0XeIjnwZUUIa9G/Y5Ft89c3MM53hPGW2kGx81ex4qFmps7GsBbbn+mJYKfNomqj+KKuOvQwo1GcYKUQknngdFu415RFDBQclRnfJAWLVu9mmnbcQwx9XMUXBvifNMgej9z6cDeU7sO7ACmUwXWv8j25e6rdhJqI+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738852122; c=relaxed/simple;
	bh=cP18bAFLC5z20fm5XJqsusQj5NcGcW0quC9Mv6doxZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuOdLxhRk6J8Q4POxDt1GzCbwl4Kk7JiD4ix+Rco1CQyefinyhqpFPeSTxKDW6bTTzJNk8lKbzEOGtm2GmdHkedmtk2QH7TobInO0AmPyMc7mXuQVnnh2bHdKtL8AOwDeQ67KwPZvkRZ+TzHl5+8Co8E7CfrlHrTfHyomGr+NyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Hf7uM4Jr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB8FC4CEDD;
	Thu,  6 Feb 2025 14:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738852121;
	bh=cP18bAFLC5z20fm5XJqsusQj5NcGcW0quC9Mv6doxZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hf7uM4JrgK4bYWHFAvM3E8f8gZk0b/V6kmKZllWvjy3fFemWOJX+AvyIpfhRhSBiE
	 Eyflp1MV1xb5xnbwSP+ihgCvDTom8R2XQ90IGcxSt5MbNWQLcQFJixdNVjupvkbb0x
	 aTF044E0h+ibrKHG4Q2bPG6l9Zoa0LahMYqit0i8=
Date: Thu, 6 Feb 2025 11:03:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: ardb@kernel.org, chenhuacai@kernel.org, chenhuacai@loongson.cn,
	kernel@xen0n.name, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
	nicolas@fjasle.eu, sashal@kernel.org, stable@vger.kernel.org
Subject: Re: Re: [PATCH 6.1&6.6 0/3] kbuild: Avoid weak external linkage
 where possible
Message-ID: <2025020611-olive-gluten-fa45@gregkh>
References: <2024120635-wham-campsite-b62b@gregkh>
 <F6E14B0130692444+20250206083705.63378-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F6E14B0130692444+20250206083705.63378-1-wangyuli@uniontech.com>

On Thu, Feb 06, 2025 at 04:37:02PM +0800, WangYuli wrote:
> Hi, Greg,
> 
> It's rather unfortunate that currently, almost all Linux distributions
> supporting LoongArch are using LTS kernels version v6.6 or older, such as
> openEuler and deepin. [1][2]
> 
> If this bugfix isn't merged into linux-stable, then every single distro
> kernel team will have to waste time fixing the same darn bug over and
> over, even though it's already fixed in later kernels.
> 
> This would really make LTS look like it's failing to serve its intended
> purpose. And I'm sure all of us do not want to see something so terrible
> happen.

LTS is here to ensure that the original release of these branches, keeps
working for that branch.  Adding support for newer toolchains sometimes
happens, but is not a requirement or a normal thing to do as that really
isn't a "regression", right?

Most of the time, fixing things up for newer compilers is simple.
Sometimes it is not simple.  The "not simple" ones we usually just do
not backport as that causes extra work for everyone over time.

As for the distros like openEuler, and deepin, they are free to add
these patches there, on top of their other non-LTS patches, right?

thanks,

greg k-h

