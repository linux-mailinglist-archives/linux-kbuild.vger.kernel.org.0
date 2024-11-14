Return-Path: <linux-kbuild+bounces-4683-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C41E9C8F12
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 17:03:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41B5828BBCA
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 16:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A0D15573F;
	Thu, 14 Nov 2024 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Yp7/Xb1k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CD71420A8;
	Thu, 14 Nov 2024 16:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731600126; cv=none; b=tj7tkm2A2/XbXEpZySnrGHdGnOoQnzbXYkDNwOoijbl29TuK7Af3TKixFHnl8PRXdWk4Dsmaxf33/ZIwyw7hBTnJGYlCBa/ZbCVYisu+rQGFmqJVcbfzbzfJ7lynH7hT78Dk2f5QOiwohseLGMru0Ad1grC46jqAY7arxgE5ftM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731600126; c=relaxed/simple;
	bh=VS84OE5xbCbtoGjEJe86AXMDZcLjjyOCrFf5UJkPv5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GB0MV1pd2kZ/NjyQK5sQ1K1G7I5FHqhk2HLPVSNYjoI5Rl3xYnDygTV2CODn/MJS2hKu8KEkj1o9B55kwur/0YnIDibXGOgTZ+LVppB0ha61G2ikmf2zAFb11NbP1chn2afTTY4iOlWkj5S/HWs7N+4m0dN8KnJidhgWaxPW/GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Yp7/Xb1k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC512C4CED0;
	Thu, 14 Nov 2024 16:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1731600125;
	bh=VS84OE5xbCbtoGjEJe86AXMDZcLjjyOCrFf5UJkPv5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yp7/Xb1kBh3F3QX4NTiTbx2Msm3PiCERUJGapnyxDghcRefRHmTXs/+fVfygWp4xI
	 HjwAC/RQsmOF7BOdHwuWWZ7ocvnD428Bvf7VgC7FAD3YFk/14EoCtCjSq2F9Mb0WuV
	 M7iMfm6SesUEvnX5sj/g/m5kAsBo+Tsbjow6yHY4=
Date: Thu, 14 Nov 2024 17:02:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Parth Pancholi <parth105105@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v2] kbuild: switch from lz4c to lz4 for compression
Message-ID: <2024111442-yeast-flail-fcea@gregkh>
References: <20241114145645.563356-1-parth105105@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114145645.563356-1-parth105105@gmail.com>

On Thu, Nov 14, 2024 at 03:56:44PM +0100, Parth Pancholi wrote:
> From: Parth Pancholi <parth.pancholi@toradex.com>
> 
> Replace lz4c with lz4 for kernel image compression.
> Although lz4 and lz4c are functionally similar, lz4c has been deprecated
> upstream since 2018. Since as early as Ubuntu 16.04 and Fedora 25, lz4
> and lz4c have been packaged together, making it safe to update the
> requirement from lz4c to lz4.
> 
> Consequently, some distributions and build systems, such as OpenEmbedded,
> have fully transitioned to using lz4. OpenEmbedded core adopted this
> change in commit fe167e082cbd ("bitbake.conf: require lz4 instead of
> lz4c"), causing compatibility issues when building the mainline kernel
> in the latest OpenEmbedded environment, as seen in the errors below.
> 
> This change also updates the LZ4 compression commands to make it backward
> compatible by replacing stdin and stdout with the '-' option, due to some
> unclear reason, the stdout keyword does not work for lz4 and '-' works for
> both. In addition, this modifies the legacy '-c1' with '-9' which is also
> compatible with both. This fixes the mainline kernel build failures with
> the latest master OpenEmbedded builds associated with the mentioned
> compatibility issues.
> 
> LZ4     arch/arm/boot/compressed/piggy_data
> /bin/sh: 1: lz4c: not found
> ...
> ...
> ERROR: oe_runmake failed
> 
> Cc: stable@vger.kernel.org

What bug does this resolve that it needs to be backported to stable
kernels?

thanks,

greg k-h

