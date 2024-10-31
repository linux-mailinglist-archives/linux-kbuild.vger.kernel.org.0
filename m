Return-Path: <linux-kbuild+bounces-4437-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3A29B73DA
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 05:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96921286201
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 04:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E0213C3C2;
	Thu, 31 Oct 2024 04:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThfSJNnQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7406413BAE4;
	Thu, 31 Oct 2024 04:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730349072; cv=none; b=TwvoX2L3t6rkPpBKdrusUbIgR43zzuCw1L6mFSVU0VwUoJbW3/uRnPB9oZUVRUAtArsT87ajfLSZBvfNXTOI7kuHNiW3tgv14xBk3xCcUgYE6MnbH2XvYv4xnsQ2gmfGzHbQ7t0OiU+JFFkBfjVAFdqhfnri8NOzEIKVAM234Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730349072; c=relaxed/simple;
	bh=JJp4IZ4DLL0UDx9Ys17ZBy5yx8DNYbawB1cUUzBJNtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsI103/rdg8exo2Yc/Hd0IMMp3lX/F0rMwTpNranY9ngDHX91Puex79nOsbbfhYoEdR3k2rLLfqUa3aeeSqMm0utTbSpbFPToy8MczrWAtUk0m9TRu9GVPbZgJHEmr9sw+veNI55Lk6aXgzvG7XIujWoRNJx9EqlW7D3U5GmPtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ThfSJNnQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D23EC4CEC3;
	Thu, 31 Oct 2024 04:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730349072;
	bh=JJp4IZ4DLL0UDx9Ys17ZBy5yx8DNYbawB1cUUzBJNtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ThfSJNnQhkHd/d/UblXbohAz7Q+k80aKtVrEVZ6rR5TLSVfD7Sx3+m4dFqVlJtlB4
	 de4lgo1M7gZRgSRpuQc3g0+XPFhWjzFlgKYh3oWf49n86KvumAS2v3q3HQhuLJJq2F
	 e0T4uoVkA/o7KRH2Ra3RCex9vYgtrLe5jmDpPLHSZqRH3fCFOrSlHHoYUKELyF8ByU
	 BOhM4hjVfN3BdE7HdAjGZWhJuWxbxcLPHYSR8PzHe6+3rhPujV8c7MJWzd4qCRcz6g
	 d9Oon3DuOt9ggmDTSzr7s25JdXNWeCFhNTCxJtHhhOiAL2wrQnPnsnVGAUjSebLk/Z
	 kQpKHiCugiIRw==
Date: Wed, 30 Oct 2024 21:31:10 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
	Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2] scripts: Remove export_report.pl
Message-ID: <ZyMIDieFsLC-MiA0@bombadil.infradead.org>
References: <20241030-remove-export-report-pl-v2-1-f289ab92bd2e@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030-remove-export-report-pl-v2-1-f289ab92bd2e@google.com>

On Wed, Oct 30, 2024 at 05:16:34PM +0000, Matthew Maurer wrote:
> This script has been broken for 5 years with no user complaints.
> 
> It first had its .mod.c parser broken in commit a3d0cb04f7df ("modpost:
> use __section in the output to *.mod.c"). Later, it had its object file
> enumeration broken in commit f65a486821cf ("kbuild: change module.order
> to list *.o instead of *.ko"). Both of these changes sat for years with
> no reports.
> 
> Rather than reviving this script as we make further changes to `.mod.c`,
> this patch gets rid of it because it is clearly unused.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Thanks! Applied and pushed!

  Luis

