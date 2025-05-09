Return-Path: <linux-kbuild+bounces-7067-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC8BAB1ACD
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 18:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05E787B265F
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 16:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2782237165;
	Fri,  9 May 2025 16:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lV1v+cf7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D2386352;
	Fri,  9 May 2025 16:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746809060; cv=none; b=GnykbbOExsDxaeLJ5Vpj7zG0oWPdiJJHMF+4IHa5xj/4ZQo3J1KWUUjuQ+IP63OspdMAol9hARRtk6XBassT5VUyWVtKrRuFjxv0V2SaT9vV+MNO7cDIEnT+vz3jETIOnrWuoYjqCRIZp09KKdNSRSVJkNWRbxR4TrCoOujh1aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746809060; c=relaxed/simple;
	bh=OrTNaCqTg7Wb7eMC4CKBGXhU7TgUADg/DO19JPUXwU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbUqbOk2s8vW9AoeJ0aNGxPP1ltFYZIjrhqhwK5RYuDIAnXpp9dk6BdLAxzYGriu2MbSVigJ+1P4FJ5+EA/7aRjR/PPonX0XMPUbgUn+pc4x3FIGkVYgCbDBlJq19/hdXAw8YFC7+KZb0Nw8yzt6sfI/nwizVTv5gfPWScQ+Hus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lV1v+cf7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1AD8C4CEE4;
	Fri,  9 May 2025 16:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746809059;
	bh=OrTNaCqTg7Wb7eMC4CKBGXhU7TgUADg/DO19JPUXwU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lV1v+cf72fQB087lLvvCenKTqn7huyMihzvEETU5ZtRrcU3mqqTGUinHYjf1qHRla
	 Y0U4c/d4Q4FmelPFoNstuctW+TP/eyDt8Rc5pskC2WQmg7ixmTZ9j/6rRYpFB5v8EV
	 qn4flEjSzN8N6863HeKZqmxe5Yf2JFTcjdWkqewTe2lvl9Udryrk0qkSJDDuKeTPQD
	 +OSLt84NKaEF1CrFBl1Nc0YJQM5mv2lKlO4moCVfQFMglHn2gMDM9kH1gMkKKKGbVI
	 D1yCnVhOG2nA7Hp9JyOZWuJbv8/qT2gbGgv7qsrGn5nUQyR6Pyx2jLam8+VNU7GuZn
	 69LgY5rDIDt9A==
Date: Fri, 9 May 2025 18:44:14 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 5/7] modpost: Create modalias for builtin modules
Message-ID: <aB4w3jYu8lavZl3E@example.org>
References: <efd64a6f-d6e5-4790-96b6-0776cd3a7f5a@suse.com>
 <20250505093830.25688-1-legion@kernel.org>
 <CAK7LNARzreJXDX6X_L2iTfb86pKgk7jkFrAp-8UdktZm7BqObg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARzreJXDX6X_L2iTfb86pKgk7jkFrAp-8UdktZm7BqObg@mail.gmail.com>

On Fri, May 09, 2025 at 12:42:39AM +0900, Masahiro Yamada wrote:
> On Mon, May 5, 2025 at 6:39 PM Alexey Gladkov <legion@kernel.org> wrote:
> >
> > For some modules, modalias is generated using the modpost utility and
> > the section is added to the module file.
> >
> > When a module is added inside vmlinux, modpost does not generate
> > modalias for such modules and the information is lost.
> >
> > As a result kmod (which uses modules.builtin.modinfo in userspace)
> > cannot determine that modalias is handled by a builtin kernel module.
> >
> > $ cat /sys/devices/pci0000:00/0000:00:14.0/modalias
> > pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30
> >
> > $ modinfo xhci_pci
> > name:           xhci_pci
> > filename:       (builtin)
> > license:        GPL
> > file:           drivers/usb/host/xhci-pci
> > description:    xHCI PCI Host Controller Driver
> >
> > Missing modalias "pci:v*d*sv*sd*bc0Csc03i30*" which will be generated by
> > modpost if the module is built separately.
> >
> > To fix this it is necessary to generate the same modalias for vmlinux as
> > for the individual modules. Fortunately '.vmlinux.export.o' is already
> > generated from which '.modinfo' can be extracted in the same way as for
> > vmlinux.o.
> >
> > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > ---
> >
> > v2: As Petr Pavlu suggested, I separated the builtin modules from the external
> >     modules. I've also added a search for duplicate modules.
> >
> 
> 
> 
> > ---
> >  include/linux/module.h   |  4 ----
> >  scripts/mod/file2alias.c |  5 +++++
> >  scripts/mod/modpost.c    | 35 +++++++++++++++++++++++++++--------
> >  scripts/mod/modpost.h    | 15 ++++++++++++++-
> >  4 files changed, 46 insertions(+), 13 deletions(-)
> 
> 
> I can implement this with less code change.
> 
> I attached my patch.

That is a good point. I'm gonna do it this way. Thanks!

-- 
Rgrds, legion


