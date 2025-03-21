Return-Path: <linux-kbuild+bounces-6272-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E944A6B400
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Mar 2025 06:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59F8E7A6E3D
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Mar 2025 05:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D00DB664;
	Fri, 21 Mar 2025 05:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="snLL6CxI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C601876;
	Fri, 21 Mar 2025 05:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742534536; cv=none; b=WJ5Cz3LsZwnutZ6zhRopdiIgUkK5BNQmZgoK82aQ1BDHKS9jZReLv2AMKeSn1xpsXWh2vuKGlX76xFoAqep8riYJQNM3lHRbZk5G1NuKB035VPu1qPWAKN/6hz1ix0LCjFFpUlZmeB/jcZcxytCWl5K7eNa6ZgkeJZ0tqFZS25Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742534536; c=relaxed/simple;
	bh=D0Pei1toekIKyJ/MVpUeBKX12yw54PAwd6J9pJFnZCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0mzCbA8iTvKXHjg8mvoV+wrVcDm1uv7qu/Djjgzlg5jyze16qr8H50VutIA8lAXoZ35RPC/Md79tIPq2I6sIhAZHCjIgqQ+D1xSVGb84Q+j0WElDqoQapm1HZs0xseiwZqMRTnTLyKzbwYsU6U1pZqXDteqwip3m72CnypB5cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=snLL6CxI; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 21 Mar 2025 06:22:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742534530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W3Cb0w4pXl6oKydKmRWXmTfgUw0p6eRvj8lJ0OG3Czg=;
	b=snLL6CxI6mv8IwgsVERISDFNRPjP/XjxLsGS1tM9r06dFp9rnuBGbU8MDUEZorMaDomMX9
	JSZFu6tD/7ZjP/5Zk/mp0Z67uJ6X0Q4t/NAeDHG3i466Su6N4uYU12SPcipu7nmcflrzL9
	nYcj5cA9lnJIN2DUQ3KHihZhu5Bzh+c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ben Hutchings <ben@decadent.org.uk>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] kbuild: deb-pkg: require debian_revision when creating
 source package
Message-ID: <20250321-proud-serious-kakapo-a6cdec@bergen>
References: <20250311190124.634007-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311190124.634007-1-masahiroy@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Wed, Mar 12, 2025 at 04:00:26AM +0900, Masahiro Yamada wrote:
> Debian Policy [1] specifies the version format as follows:
> 
>     [epoch:]upstream_version[-debian_revision]
> 
> Here, the presence of the debian_revision part indicates a non-native
> package, while its absence indicates a native package.
> 
> Kbuild adopts the source format 3.0 (quilt), meaning the kernel is a
> non-native package and therefore requires the revision portion.
> 
> This commit prevents the creation of an invalid source package when
> KDEB_PKGVERSION contains no hyphen.
> 
> [1]: https://www.debian.org/doc/debian-policy/ch-controlfields.html#version
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/package/mkdebian | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index b6dd98ca860b..193e33bcb989 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -94,6 +94,14 @@ set_debarch() {
>  # Create debian/source/ if it is a source package build
>  gen_source ()
>  {
> +	# The Debian Policy requires -debian_revision portion in the version.
> +	# Since the source format 3.0 (quilt) is used here, a hyphen is
> +	# required in the version.
> +	if [ "${KDEB_PKGVERSION:+set}" ] && ! echo "${KDEB_PKGVERSION}" | grep -- '-..*'; then

Thanks.  At first, I thought that the check pattern could be enhanced,
but testing with '--' as version suffix led to 

    dpkg-buildpackage: warning:     debian/changelog(l1): version '6.14rc5+me--' is invalid: revision cannot be empty
    LINE: linux-upstream (6.14rc5+avm--) trixie; urgency=low
    dpkg-buildpackage: info: source package linux-upstream
    dpkg-buildpackage: info: source version unknown
    dpkg-buildpackage: error: version number does not start with digit

thus this is great as it is.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

