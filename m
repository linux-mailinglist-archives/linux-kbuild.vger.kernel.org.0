Return-Path: <linux-kbuild+bounces-6624-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC47A8A9F4
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Apr 2025 23:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 009FE7A71DE
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Apr 2025 21:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0D725E804;
	Tue, 15 Apr 2025 21:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2n3dr1U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86E225DCE6
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Apr 2025 21:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744751731; cv=none; b=d1eejSdNMoVQ4AhQD1kBjn+AeuDhOCQ6SZrd1KUstnJ8y/iMmkfPHraJuUg9MzX6U9d2Kv7tFf4jq0NFWhAlz6/9YAjrErca1IhVW2s4xwshGDrBs8hMvfDhGvBD3fMdrqEEtBAzzUyn65L9rL0YPcCktkRdD3xj0B3qS+ib1No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744751731; c=relaxed/simple;
	bh=EIelD1kRI28LIWmr4lOjglDtUYMJf8kDpoxgbrN+G5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWTM6kkkuq4R36GVhJ3iXHowiEJX02PzCSq1CKFmZgnqZxt/PJu4ShhaN9bfZdEN/rwV+ZN3JrbNxOznYFiB5MR6Q80AC8u7nrlYdCzltjazRlmwRMlifHbVPvPEzJe6gveGQOWguvPJBkcOv+KPO2dYChCkbU7F9Pel/48Exto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2n3dr1U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1597DC4CEE7;
	Tue, 15 Apr 2025 21:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744751731;
	bh=EIelD1kRI28LIWmr4lOjglDtUYMJf8kDpoxgbrN+G5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f2n3dr1Uv/3mrpcyVAWwsLLHXETRLjgHY0PNT0ViOdP/BN0yN0wUb0TigOpWNiwwp
	 LJXonHcBfU8wDiiZJWA603I123j8hMZO9BGTjLlpd9z8ZTuOIWo6a8FwpdoSGeaqbx
	 wDsbNb59Ksae862J6QOgBKitjdZHUGPdHBptXKfJdThifMQ0d2pD+YjGpyC4mxBJJi
	 U2MLZ/13u4sh8jkctXTUaN70/IFr24AZE2oH7f84nQofIjK+g5AryC/DkkCED29AgC
	 BLT2ksBBK/0zad8Wq9bZB0UOr6D0mXsdoCP3aGV19iFqwhev4JhaQ2cRYg5ZgoGKxN
	 NO7dFoaWwl2rw==
Date: Tue, 15 Apr 2025 14:15:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] correct disabling of -Wshift-negative-value
Message-ID: <20250415211527.GC995325@ax162>
References: <10b1ebd8-5d32-41a2-9454-1b40e98d5187@suse.com>
 <20250414193836.GA107755@ax162>
 <26dcdba6-1aae-4a5c-bd64-78406b7f39b9@suse.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26dcdba6-1aae-4a5c-bd64-78406b7f39b9@suse.com>

On Tue, Apr 15, 2025 at 07:53:12AM +0200, Jan Beulich wrote:
> On 14.04.2025 21:38, Nathan Chancellor wrote:
> > On Mon, Apr 14, 2025 at 04:23:36PM +0200, Jan Beulich wrote:
> >> The warning is supported only from gcc6 onwards, hence its disabling
> >> needs probing that the (positive) option is actually supported.
> >>
> >> Fixes: 1344794a59db ("Kbuild: add -Wno-shift-negative-value where -Wextra is used")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > The patch itself seems fine (I might add "scripts/Makefile.extrawarn: "
> > to the title) but if I understand correctly, this is only to support GCC
> > 5? Would this be necessary if GCC 8.1 becomes the minimum supported
> > version of GCC for building the kernel?
> > 
> > https://lore.kernel.org/20250407094116.1339199-2-arnd@kernel.org/
> > 
> > If people are actively noticing this, perhaps we should send this to
> > Linus's tree for backports then Arnd could revert it in his series?
> 
> Actually, aiui that work was meanwhile merged. Hence the patch here is

I think only x86 has been bumped to a minimum of GCC 8.1 so far, done in
commit a3e8fe814ad1 ("x86/build: Raise the minimum GCC version to 8.1").
That series is still being reviewed/worked on as far as I can tell, so I
think these patches would still be needed for other architectures.

> indeed only applicable to stable trees. No idea how such a situation
> is to be handled. (Apparently the same is true for "correct disabling
> of -Wstringop-overflow": That option was introduced in gcc7.)

Normally, you would just send a patch to the stable maintainers and
mailing list just like this but the commit message would say something
like "<xyz problem> was fixed in mainline in such a way that cannot be
easily backported due to <xyz reason> so do <xyz thing> to resolve said
problem in the stable trees".

Cheers,
Nathan

