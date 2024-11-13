Return-Path: <linux-kbuild+bounces-4667-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CADEC9C7C41
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Nov 2024 20:38:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61C5FB26086
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Nov 2024 19:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6435204096;
	Wed, 13 Nov 2024 19:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObhHGyIm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08E4180021;
	Wed, 13 Nov 2024 19:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731526503; cv=none; b=UVoRgUEEnhcEscjVQr3/SA0gsE7S1ZZadomq3H4SdLr0TfSJdRcgmoDBPVUvXP2JZHonNjBhQKsW/6GBMUkkD5T8KrpU+7G22WzapXtS1JvV64wIzoNnk+24JelO9EJ9O98r6uygrMZDdu/Cu0hyjyuxC1w9uhVHjiAu4ftOmR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731526503; c=relaxed/simple;
	bh=epQP6XybWtX4jTsJLw088WfnWQi4u/Mzc+weU06kQXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQvc72D1QlsHXwd7txrvQ1eSlwpRnmUnqwEmEV49ikG2mMcK5r1UtUbF3PYqm5hfQGVChTpyOX8+nS86aKuiVL98ToKco51m6TiqmWhaoGqDm8fqsVOa1Pc3TDoZGUj2biCZ+DNzwu5x7og54wfBwrxOMOWTOGFREVPYvXM27F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObhHGyIm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A792EC4CEC3;
	Wed, 13 Nov 2024 19:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731526503;
	bh=epQP6XybWtX4jTsJLw088WfnWQi4u/Mzc+weU06kQXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ObhHGyImvyJa/FgZvmT+FwIJd+lfZvBi+KO929K26AFepwIv4Rf58KxEO5lciOZzO
	 +YrPic29KzYc+Ns8K5McMXTUWfqIoxt7yG5CDcog9x1L1OvLu1GA2NLssaN6gZtdZ5
	 hqoBgAI3/k9YVn3LT2FFQ8sD5C4ghkFRcz2C+DYz5JwKDkblsmWMGJZ5zKorb3Jmyb
	 J1WyYvfcz22oiLhDRDtNrsTGDg6Z5C8dzAKGzXDrLuAqX9ix6rE01U8yv6Zt628tFC
	 P2FohHZau5atecs24wCdoWS7zPj7IW14tpb3ut6eBvOyTbzhC7FOMbW2/CDsYam4sr
	 4ucXdOHSLorfw==
Date: Wed, 13 Nov 2024 11:35:01 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Neal Gompa <neal@gompa.dev>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
	Miroslav Benes <mbenes@suse.cz>,
	Asahi Linux <asahi@lists.linux.dev>,
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 01/19] scripts: move genksyms crc32 implementation to
 a common include
Message-ID: <ZzT_ZSNAmeloDjLT@bombadil.infradead.org>
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-22-samitolvanen@google.com>
 <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
 <CAEg-Je_o-e3Sc0vNJpF+3eG3sZvV-f2zrCdubRAvPSLzVdyd5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEg-Je_o-e3Sc0vNJpF+3eG3sZvV-f2zrCdubRAvPSLzVdyd5Q@mail.gmail.com>

On Wed, Nov 13, 2024 at 09:04:51AM -0500, Neal Gompa wrote:
> On Mon, Nov 11, 2024 at 11:06 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Thu, Oct 31, 2024 at 2:01 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> > >
> > > Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > Acked-by: Neal Gompa <neal@gompa.dev>
> >
> > Does this Ack add any value?
> >
> > Acked-by is meaningful only when it is given by someone who
> > maintains the relevant area or has established a reputation.
> >
> > $ git grep "Neal Gompa"
> > $ git shortlog -n -s | grep "Neal Gompa"
> >      2 Neal Gompa
> >
> > His Ack feels more like "I like it" rather than a qualified endorsement.
> >
> 
> I have tested and looked over the patches from that lens.

The tests you did, what exaclty was tested?

If it was to just ensure no regressions, then that information is
useful too, and with that you can just provide: Tested-by.

But actual details of what you test are useful. We now also have
automation of tests for modules, and expanding test coverage on that is
always welcomed too [0] [1] [2], so far we have 0 Rust coverage.

[0] https://github.com/linux-kdevops/kdevops
[1] https://github.com/linux-kdevops/kdevops-ci
[2] https://github.com/linux-kdevops/linux-modules-kpd/actions

  Luis

