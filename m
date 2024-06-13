Return-Path: <linux-kbuild+bounces-2121-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFA6907BF0
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Jun 2024 21:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04B17286210
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Jun 2024 19:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A9414C5A9;
	Thu, 13 Jun 2024 19:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6qLatly"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBDC14C585;
	Thu, 13 Jun 2024 19:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718305275; cv=none; b=TNoSj5r6xfVqE1G8EiH8JBZSIcOut4qCKl8rg8ST82WZ2uCy/CX1UvEOl4t1tmc11i7O6ReJ+b3qmk0AdX5PW3RfF69IPNRVSvqdhOp9AYhq4ltj3lzoLTryEeKiuazEtah6xbHDOvjADXd6RP4F4UQ4VTV14dg3MFuE//5d8KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718305275; c=relaxed/simple;
	bh=sghfIhT5oY+tPHqDu4LipzkIR2seQaIOymMpCrX+MtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKRQ8hjC7AnvrqvxdFgDfGvKNaPK049GzC7zhoJGeuRqsJ24XdbuA9sAqmK4GsHaZWf5SHcffLHbLe6X3B6zka/VXVG8AzrivlapH5wpzgpscrEKmS0/G2xbkM2ZdgQI6B6Q5zY0bJ2Yas6Krpa3SckzBtM+lBGYufHTMZdgfv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6qLatly; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0B1C2BBFC;
	Thu, 13 Jun 2024 19:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718305275;
	bh=sghfIhT5oY+tPHqDu4LipzkIR2seQaIOymMpCrX+MtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T6qLatly0beLEzMo5OPJgcvTGJUNYoGOFJH1U8kVSXaCz4sgsoSfZdT+QBqRMwKxp
	 dqxQZ1PwKE/MFFQvbOd61M/67G+HAXhR99VB11JF9XtSSnsoojMJ6khtwgiO3Y/eAB
	 0FsTe9JhfBodrhgcd2OUcXvc0SSoY32zZHXaSyhjh/Fd8fsJBP+A8deQUnEhOghTS7
	 CYEFxjbEaKbyo5kWftBIB0oYxkmRIr0psQydtxwsZMZA5ZE9d+DY0NM7TWKgPxwF6F
	 ndBqOnJCLtUQHLwfcH3RhP8VvM+kDCvtQIM/aTjsZ17dpxGNaa+ThWM2LTxaFkJDm0
	 wyhhMxIeJa+GA==
Date: Thu, 13 Jun 2024 12:01:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rafael Aquini <aquini@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH 1/2] kbuild: rpm-pkg: make sure to have versioned
 'Obsoletes' for kernel.spec
Message-ID: <20240613190113.GA1272931@thelio-3990X>
References: <CAK7LNATxSePzOrHaQvS1MQo4mpAwdfwrDu3iuUsYZ+RL=LiirA@mail.gmail.com>
 <20240611211123.959459-2-aquini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611211123.959459-2-aquini@redhat.com>

On Tue, Jun 11, 2024 at 05:11:21PM -0400, Rafael Aquini wrote:
> Fix the following rpmbuild warning:
> 
>   $ make srcrpm-pkg
>   ...
>   RPM build warnings:
>       line 34: It's not recommended to have unversioned Obsoletes: Obsoletes: kernel-headers
> 
> Signed-off-by: Rafael Aquini <aquini@redhat.com>

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/package/kernel.spec | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index e095eb1e290e..19e458341f45 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -27,7 +27,7 @@ The Linux Kernel, the operating system core itself
>  %package headers
>  Summary: Header files for the Linux kernel for use by glibc
>  Group: Development/System
> -Obsoletes: kernel-headers
> +Obsoletes: kernel-headers < %{version}
>  Provides: kernel-headers = %{version}
>  %description headers
>  Kernel-headers includes the C header files that specify the interface
> -- 
> 2.45.1
> 

