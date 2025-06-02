Return-Path: <linux-kbuild+bounces-7346-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31052ACB13B
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 16:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 175F83BE67A
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 14:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5396F242D6F;
	Mon,  2 Jun 2025 14:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttByLBnQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28576242D67;
	Mon,  2 Jun 2025 14:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873040; cv=none; b=b62jZgNhpf6TRZbGHcRIrwV5GoVHxGub82P7gb45zQ0QoElgDWOlnuB19aTgqEY29aetAdTitw20BN7N6plUIyCwRcyKHs9J7w6DTrMRiwqQJZrl6WgNQIgH/DQARHKCQDxvJt9B9//tOTf+JfHi8BBKykRHJQDA3/M7TRX5VOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873040; c=relaxed/simple;
	bh=FztaFmIgnvh43VPe3rgfHG9Mvv4UP6IuQIFrylQXNcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LI5SENs5hafDrUZ2MztzUzfsnxLUpKLlviSDc4drTgD3XQ1XmP1QYd2I94Tt/66ZfzIRGlwZgyq9S04IIFMGzAAPybC6cEa2qZmsIs+jKL6KnA8tFr5aoe9baXIpj0GHReOAKWMaIKlrSraz2M05Dfjw4NTT+e67izAENj5O+WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttByLBnQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C925BC4CEEE;
	Mon,  2 Jun 2025 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748873040;
	bh=FztaFmIgnvh43VPe3rgfHG9Mvv4UP6IuQIFrylQXNcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ttByLBnQcGKm5dFRXpi272veH0S4brmvPNO6dRrbTnpk7Wsdv5QPP9evlKRSvvdhH
	 f6aJGfe0/0UjkuHrppu+tZVV95lywG0VeqBevTfM93gdjEdd9GiybwuMFl04FNl+wz
	 iSC7yoVRa7QV+B6w0dQVub9TBvTiYfunmWnktrisTH72znLDkcdSJCVychDQ+B8NWp
	 MqNXP1Hs1d4LuWGWIbSIZBimraN6NSJw9f5EFtqjpNO++6WKXbag4sPmS5jlSPWRJo
	 qjP1GC+uPENK54LYkYNXpFG9cVl/r1iKyr26vZ/ce6MvfRSMWkiGRk+k00zCJP4oHY
	 ybmez4Ie+Q0qQ==
Date: Mon, 2 Jun 2025 16:03:54 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 3/6] modpost: Make mod_device_table aliases more unique
Message-ID: <aD2vSnZhofEPilcL@example.org>
References: <cover.1748335606.git.legion@kernel.org>
 <ecf0ebdda5bcf82464ed1cebbf50afdcd8b5b23a.1748335606.git.legion@kernel.org>
 <CAK7LNARkhc40UfrmmqsqmqkCn60=7zHc=pDFGR4o=k2p7CsABA@mail.gmail.com>
 <aD1bozP0l67f_wbs@example.org>
 <CAK7LNAQmQtvB4PfmH4MkRM123wySON6cF6TG79fi0WER1sz4Gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQmQtvB4PfmH4MkRM123wySON6cF6TG79fi0WER1sz4Gw@mail.gmail.com>

On Mon, Jun 02, 2025 at 07:58:41PM +0900, Masahiro Yamada wrote:
> On Mon, Jun 2, 2025 at 5:07 PM Alexey Gladkov <legion@kernel.org> wrote:
> >
> > On Mon, Jun 02, 2025 at 04:45:36PM +0900, Masahiro Yamada wrote:
> > > On Tue, May 27, 2025 at 6:08 PM Alexey Gladkov <legion@kernel.org> wrote:
> > > >
> > > > In order to avoid symbol conflicts if they appear in the same binary, a
> > > > more unique alias identifier can be generated.
> > >
> > > Why must this be unique?
> > >
> > > What problem would happen if the same symbol names
> > > appear in MODULE_DEVICE_TABLE()?
> >
> > Before these patches this was not a problem as non-unique characters are
> > in separate object files when the module is compiled separately.
> >
> > But when the modules are compiled into the kernel, there is a symbol
> > conflict when linking vmlinuz. We have modules that export multiple device
> > tables from different object files.
> 
> This is because the __mod_device_table__* symbols are global, but
> I suspect they do not need to be.
> 
> Let's test this
> https://lore.kernel.org/lkml/20250602105539.392362-1-masahiroy@kernel.org/T/#u

I tested this patch with the config:

make allmodconfig
make mod2yesconfig

and it works.

-- 
Rgrds, legion


