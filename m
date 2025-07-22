Return-Path: <linux-kbuild+bounces-8095-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF04B0D6E1
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 12:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D16A3A5AD8
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 10:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9F52E2F06;
	Tue, 22 Jul 2025 10:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="btDw2eRE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9C92E06ED;
	Tue, 22 Jul 2025 10:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753178744; cv=none; b=mmjA7Nkee0IL3YhxShY6OfmtUWaRsXdgd+Svcgkq5BgSGJAfuWkqw94tS7T5qIed8cpEWBc3G0SBU9XfQIhEpF79DyTbvgMe5faoLUeNaQZFIxwCKfqyji+9vsJmDtxq60AO8JHX7qOj22aEctmc6W30u+6/quuSyKJV1F8zMyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753178744; c=relaxed/simple;
	bh=IlLy1p8cz2ISRMPbvg4/n/abtc9H+c/qnZ5bEjePPwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHaWn0mR8Y9TfIB+XHz/+LKy5yziIFvq7psEuSmIqQdPqfxJvqlsHQhfMulVE4rSmKrBFch2aglhfzy1MfHligZZ8Y+5QiYyVcy6e3RWAA07sXF+I7aus7jX7Nw09JUMwvoHSbFrJH8CfNjtFDGgUkLl9WFeuB0s5veaPceeB+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=btDw2eRE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7899C4CEEB;
	Tue, 22 Jul 2025 10:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753178744;
	bh=IlLy1p8cz2ISRMPbvg4/n/abtc9H+c/qnZ5bEjePPwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=btDw2eRExWr9siGIr/Xozyp7idZEf4Glqg6nrxtHxAJGV6UxAVFbid784++CxNqLR
	 AiIwI6+8gI0Z03hvOVKnLiCRL8lLR44oXK7tlSZicaXaLiiHbHHZ6xQX10HdbkKnfO
	 Q2x2B5D5QNf+V/mR8OICiAHO78w9/jlS/FWJPZAekIPjGDhQIPahef967LaSgn9KRF
	 ADNf7PsvEGxF4jOPtegyLIexbq41U7Oo4dPkkIK6K+X6qMt6ag5YUQDOtkizjHn5sm
	 7+4gIB53fqepnLwx9qSkLOISWjQMyk/wzjxf73F4NOU81fmHLi5I6Qob/bIVyxgVRt
	 YgoeOjhLG18Uw==
Date: Tue, 22 Jul 2025 12:05:38 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH v4 0/7] Add generated modalias to modules.builtin.modinfo
Message-ID: <aH9icpCpoHqBBzEm@example.org>
References: <cover.1750511018.git.legion@kernel.org>
 <aHUI8KqD0_dtTY3D@example.org>
 <CAK7LNARjC_FCam14RXfTVTQ4_jtXuBKfDsdyG84_k9L1x5zJyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARjC_FCam14RXfTVTQ4_jtXuBKfDsdyG84_k9L1x5zJyg@mail.gmail.com>

On Wed, Jul 16, 2025 at 01:23:26AM +0900, Masahiro Yamada wrote:
> Hi, sorry for the delay.
> 
> On Mon, Jul 14, 2025 at 10:41 PM Alexey Gladkov <legion@kernel.org> wrote:
> >
> > On Sat, Jun 21, 2025 at 03:57:12PM +0200, Alexey Gladkov wrote:
> > > The modules.builtin.modinfo file is used by userspace (kmod to be specific) to
> > > get information about builtin modules. Among other information about the module,
> > > information about module aliases is stored. This is very important to determine
> > > that a particular modalias will be handled by a module that is inside the
> > > kernel.
> > >
> > > There are several mechanisms for creating modalias for modules:
> > >
> > > The first is to explicitly specify the MODULE_ALIAS of the macro. In this case,
> > > the aliases go into the '.modinfo' section of the module if it is compiled
> > > separately or into vmlinux.o if it is builtin into the kernel.
> > >
> > > The second is the use of MODULE_DEVICE_TABLE followed by the use of the
> > > modpost utility. In this case, vmlinux.o no longer has this information and
> > > does not get it into modules.builtin.modinfo.
> > >
> > > For example:
> > >
> > > $ modinfo pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30
> > > modinfo: ERROR: Module pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30 not found.
> > >
> > > $ modinfo xhci_pci
> > > name:           xhci_pci
> > > filename:       (builtin)
> > > license:        GPL
> > > file:           drivers/usb/host/xhci-pci
> > > description:    xHCI PCI Host Controller Driver
> > >
> > > The builtin module is missing alias "pci:v*d*sv*sd*bc0Csc03i30*" which will be
> > > generated by modpost if the module is built separately.
> > >
> > > To fix this it is necessary to add the generated by modpost modalias to
> > > modules.builtin.modinfo.
> > >
> > > Fortunately modpost already generates .vmlinux.export.c for exported symbols. It
> > > is possible to use this file to create a '.modinfo' section for builtin modules.
> > > The modules.builtin.modinfo file becomes a composite file. One part is extracted
> > > from vmlinux.o, the other part from .vmlinux.export.o.
> >
> > Masahiro Yamada, does this version of the patchset look better to you ?
> 
> 
> Looks better, but this may break s390 build:
> 
> https://lore.kernel.org/linux-kbuild/202506062053.zbkFBEnJ-lkp@intel.com/
> 
> I have not taken a close look at it.
> If we do not find how to fix the warning, we would
> end up with the original solution.

I think I found a problem. I just pushed fix to my branch. I'll make a new
version of the patchset in a few days. I want to test it a bit longer.

> > > Notes:
> > > - v4:
> > >   * Rework the patchset based on top of Masahiro Yamada's patches.
> > >   * Add removal of unnecessary __mod_device_table__* symbols to avoid symbol
> > >     table growth in vmlinux.
> > >   * rust code takes into account changes in __mod_device_table__*.
> > >   * v3: https://lore.kernel.org/all/cover.1748335606.git.legion@kernel.org/
> > >
> > > - v3:
> > >   * Add `Reviewed-by` tag to patches from Petr Pavlu.
> > >   * Rebase to v6.15.
> > >   * v2: https://lore.kernel.org/all/20250509164237.2886508-1-legion@kernel.org/
> > >
> > > - v2:
> > >   * Drop patch for mfd because it was already applied and is in linux-next.
> > >   * The generation of aliases for builtin modules has been redone as
> > >     suggested by Masahiro Yamada.
> > >   * Rebase to v6.15-rc5-136-g9c69f8884904
> > >   * v1: https://lore.kernel.org/all/cover.1745591072.git.legion@kernel.org/
> > >
> > >
> > > Alexey Gladkov (3):
> > >   scsi: Always define blogic_pci_tbl structure
> > >   modpost: Add modname to mod_device_table alias
> > >   modpost: Create modalias for builtin modules
> > >
> > > Masahiro Yamada (4):
> > >   module: remove meaningless 'name' parameter from __MODULE_INFO()
> > >   kbuild: always create intermediate vmlinux.unstripped
> > >   kbuild: keep .modinfo section in vmlinux.unstripped
> > >   kbuild: extract modules.builtin.modinfo from vmlinux.unstripped
> > >
> > >  drivers/scsi/BusLogic.c           |  2 -
> > >  include/asm-generic/vmlinux.lds.h |  2 +-
> > >  include/crypto/algapi.h           |  4 +-
> > >  include/linux/module.h            | 21 ++++-----
> > >  include/linux/moduleparam.h       |  9 ++--
> > >  include/net/tcp.h                 |  4 +-
> > >  rust/kernel/device_id.rs          |  8 ++--
> > >  scripts/Makefile.vmlinux          | 74 +++++++++++++++++++++----------
> > >  scripts/Makefile.vmlinux_o        | 26 +----------
> > >  scripts/mksysmap                  |  6 +++
> > >  scripts/mod/file2alias.c          | 34 ++++++++++++--
> > >  scripts/mod/modpost.c             | 17 ++++++-
> > >  scripts/mod/modpost.h             |  2 +
> > >  13 files changed, 131 insertions(+), 78 deletions(-)
> > >
> > > --
> > > 2.49.0
> > >
> >
> > --
> > Rgrds, legion
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
> 

-- 
Rgrds, legion


