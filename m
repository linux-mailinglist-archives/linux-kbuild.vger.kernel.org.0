Return-Path: <linux-kbuild+bounces-10674-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7A2D3A3B7
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 10:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D44F30062F7
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 09:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90FF3033E8;
	Mon, 19 Jan 2026 09:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vEOLoFGX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA5227A92E;
	Mon, 19 Jan 2026 09:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816292; cv=none; b=AT9/5P19e0iqKlS5hUKWlMtOgptyc+z5trZW5Kxf5n1pTxko43yKNSA1CL6uUqCEEcVjeS2aff1Liu66JM17N/vQZn/XstBJJB/MLq+YAAJhMhMKFr9IE2iezlWt4lfcLS+mP0rfo2m9JFls8jeKw7BMlTMB5taSUUFkqhtxG9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816292; c=relaxed/simple;
	bh=EcsFtNBz14qUy+qxSidGwRHIuIetaehmoip++SZfUwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPf2IdoVmB2Z66GhxA6QW5U+8I6l9gBGjddwx3RcC+NuoITkkZJ4HToilmqvd7LcXaTSRDeA2otxsXoie2vZneWnz4PLBm7MW+75/VASwEnlcCfTucx2JNXh17LUVyGXMgqtdzKfAd+x1EX0AtVtpIjFSqIpL0lTIVX5jTEwJIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vEOLoFGX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC26EC116C6;
	Mon, 19 Jan 2026 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768816292;
	bh=EcsFtNBz14qUy+qxSidGwRHIuIetaehmoip++SZfUwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vEOLoFGXQk6rvZFlz65PeL1ifGfqH3DjhwE1S0OMNJ7XRwB2rBZL0V/gZaF84atsg
	 iEANNETEpSq7ZrtJphbMT1u0II4IaSEsZoCat5I32tsJZHZYM5R+9HyrARWYOAOQPo
	 /C0EeMac5C1Pd5WsH/wFcW/g8pFmenpIjAkgHLJs=
Date: Mon, 19 Jan 2026 10:51:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Luis Augenstein <luis.augenstein@tngtech.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	maximilian.huber@tngtech.com
Subject: Re: [PATCH 00/14] Add SPDX SBOM generation tool
Message-ID: <2026011916-idealism-paternal-cfd5@gregkh>
References: <20260119064731.23879-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119064731.23879-1-luis.augenstein@tngtech.com>

On Mon, Jan 19, 2026 at 07:47:17AM +0100, Luis Augenstein wrote:
> This patch series introduces a Python-based tool for generating SBOM
> documents in the SPDX 3.0.1 format for kernel builds.
> 
> A Software Bill of Materials (SBOM) describes the individual components
> of a software product. For the kernel, the goal is to describe the
> distributable build outputs (typically the kernel image and modules),
> the source files involved in producing these outputs, and the build
> process that connects the source and output files.
> 
> To achieve this, the SBOM tool generates three SPDX documents:
> 
> - sbom-output.spdx.json
>   Describes the final build outputs together with high-level
>   build metadata.
> 
> - sbom-source.spdx.json
>   Describes all source files involved in the build, including
>   licensing information and additional file metadata.
> 
> - sbom-build.spdx.json
>   Describes the entire build process, linking source files
>   from the source SBOM to output files in the output SBOM.
> 
> The sbom tool is optional and runs only when CONFIG_SBOM is enabled. It
> is invoked after the build, once all output artifacts have been
> generated. Starting from the kernel image and modules as root nodes,
> the tool reconstructs the dependency graph up to the original source
> files. Build dependencies are primarily derived from the .cmd files
> generated by Kbuild, which record the full command used to build
> each output file.
> 
> Currently, the tool only supports x86 and arm64 architectures.
> 
> Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
> Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
> Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>

This is great work, thank you so much for doing this!

Note, I just tested the series, on 6.19-rc6, and with CONFIG_SBOM
enabled, I get this following "message" at the end of the build when it
generates the sbom:

	make[3]: Nothing to be done for 'sbom'.

Is that intentional?

thanks,

greg k-h

