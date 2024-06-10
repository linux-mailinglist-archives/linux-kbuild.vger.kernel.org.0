Return-Path: <linux-kbuild+bounces-2044-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6A99019B3
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Jun 2024 06:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46B7BB214DA
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Jun 2024 04:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D80EA93A;
	Mon, 10 Jun 2024 04:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y1xt+kmy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16432594;
	Mon, 10 Jun 2024 04:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717993160; cv=none; b=W11T9meDLjmgccqwuWZyHkeOjDA1MmrccZxCxN0nqVmAai6Jv/G1TNuvVnZfkBjbnBJRhN7+eBHcGGQQaWLslvLNSJuxFetUFb0er48crkobv3Ujou2rqFWTLfzKaPCG0tx2NHks+VstfPLVuOjlK6jAAAjhsgvAPzb5dmkHzMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717993160; c=relaxed/simple;
	bh=WGkSbHeWqik7hDXkiD1w5blDcamK906LbfM03OIX790=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCNrZRJgw1M15HxATpGVNvhhDg+jcLbMl++g5MFE2w6lLkjQYDK7AjfDVY5LSyUuP/e/Yty4BbB7cxgi+lvCQkxrfMDJ8uUuj+hQfJI2e+Llw7vBEfdVpc3U/I6RALZ8m8runC41y4py9PMehidsZkReR2dhfz4qqB9QlShduUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y1xt+kmy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9469C2BBFC;
	Mon, 10 Jun 2024 04:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717993159;
	bh=WGkSbHeWqik7hDXkiD1w5blDcamK906LbfM03OIX790=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y1xt+kmyE8PJwMd6gGp06XBnWeKSmcT+duD5U1K8O0VJipp/UoFemHRMTAnCWAMTM
	 w/frblds9ST0xI5aPed1p+AtTyBjC8zVyLriEAoFZ0C7Oto8cC1MYuue/HIhVm9Ujd
	 2BOS+frQ4jS/zdHgSe20y9dQRga09910987W7TEo=
Date: Mon, 10 Jun 2024 06:19:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-kbuild@vger.kernel.org, masahiroy@kernel.org, nathan@kernel.org,
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, didi.debian@cknow.org
Subject: Re: [PATCH] kbuild: Install dtb files as 0644 in Makefile.dtbinst
Message-ID: <2024061006-ladylike-paving-a36b@gregkh>
References: <ae087ef1715142f606ba6477ace3e4111972cf8b.1717961381.git.dsimic@manjaro.org>
 <10bef38ea944a42d591435e024f70326@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10bef38ea944a42d591435e024f70326@manjaro.org>

On Mon, Jun 10, 2024 at 12:41:54AM +0200, Dragan Simic wrote:
> +Cc: stable@vger.kernel.org
> +Cc: didi.debian@cknow.org
> 
> On 2024-06-09 21:32, Dragan Simic wrote:
> > The compiled dtb files aren't executable, so install them with 0644 as
> > their
> > permission mode, instead of defaulting to 0755 as the mode.
> > 
> > Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> 
> Actually, some Linux distributions, including Debian, [1][2] already include
> fixes in their kernel package builds to change the file permissions to 0644.
> Thus, let's have this fix propagated into the stable kernels, to allow such
> distributions to remove their downstream fixes.
> 
> Fixes: aefd80307a05 ("kbuild: refactor Makefile.dtbinst more")
> 
> [1] https://salsa.debian.org/kernel-team/linux/-/merge_requests/642
> [2] https://salsa.debian.org/kernel-team/linux/-/merge_requests/749


<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

