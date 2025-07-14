Return-Path: <linux-kbuild+bounces-8007-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB7EB04059
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jul 2025 15:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C93F165E2A
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jul 2025 13:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FBF24DD0A;
	Mon, 14 Jul 2025 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErktvYbW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673661F91C7;
	Mon, 14 Jul 2025 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500471; cv=none; b=NOFgRwHUFnZ2sJ4AvZHJY5w3IgJ1LYOS92sAdzVLSw7klNa4hVjovSHhhq55PirE61noUgIqbb7C1B4xLVOWbZMm6ElccRF4CFevi/Uqsc67x/mn06anyog/zKzyVjy/9Eiw21fCyAs0kj0tBAgMPIe1V8cQrPl4dO9kWGagQGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500471; c=relaxed/simple;
	bh=J1b+SwmY1CVMGJKpm02Nut4kM1uOvEucFcJm1VhPLgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abLHvhjzqsMqBPZs+j1aDiWl61OIjBPmN2A8WtpFKIhMPuHwVNbq4tTIpn0Kc3WPg1biy3XXNAvSgzWwqieqihRHdhBj55ge49bfnnlkZliDZhRMIPwpv3OVr8obhpL5ULU+g+oU9Zw+5c5Pf+N48+i28GXK/Dv+TgmfF3+rLOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ErktvYbW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F544C4CEED;
	Mon, 14 Jul 2025 13:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752500471;
	bh=J1b+SwmY1CVMGJKpm02Nut4kM1uOvEucFcJm1VhPLgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ErktvYbWlkLwrEIJXXKATdVLmuT+DErUqvDi7lUIyBpELgl4/EyjHCK/zfLk4dh9X
	 jMG42mQXU3UcTy/9MSSVusl1h5qBe3F4LoCP//OnKV41a9Oadj5JYc2KfkVuuWm8ob
	 Ct6ObRx6s7SQ5UK9s4858074C1hOFqCfHPVVCucNY0Gr5D3wgeu3O6QhCUVOpDP+KM
	 Ie3sfojY0SSzOM29yIHBWs3VxxJ4L66jDL5CG8lu6b3JPeRKj2f1ZFMcSwPm6mIEAF
	 b8RVMTQxBU9BmpT2fW02wfrDx2JsTInqpEUsNvBzyE4X86t+LF7wDWuok/44R0JQnM
	 bcAKz1KHWDdNg==
Date: Mon, 14 Jul 2025 15:41:04 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH v4 0/7] Add generated modalias to modules.builtin.modinfo
Message-ID: <aHUI8KqD0_dtTY3D@example.org>
References: <cover.1750511018.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1750511018.git.legion@kernel.org>

On Sat, Jun 21, 2025 at 03:57:12PM +0200, Alexey Gladkov wrote:
> The modules.builtin.modinfo file is used by userspace (kmod to be specific) to
> get information about builtin modules. Among other information about the module,
> information about module aliases is stored. This is very important to determine
> that a particular modalias will be handled by a module that is inside the
> kernel.
> 
> There are several mechanisms for creating modalias for modules:
> 
> The first is to explicitly specify the MODULE_ALIAS of the macro. In this case,
> the aliases go into the '.modinfo' section of the module if it is compiled
> separately or into vmlinux.o if it is builtin into the kernel.
> 
> The second is the use of MODULE_DEVICE_TABLE followed by the use of the
> modpost utility. In this case, vmlinux.o no longer has this information and
> does not get it into modules.builtin.modinfo.
> 
> For example:
> 
> $ modinfo pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30
> modinfo: ERROR: Module pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30 not found.
> 
> $ modinfo xhci_pci
> name:           xhci_pci
> filename:       (builtin)
> license:        GPL
> file:           drivers/usb/host/xhci-pci
> description:    xHCI PCI Host Controller Driver
> 
> The builtin module is missing alias "pci:v*d*sv*sd*bc0Csc03i30*" which will be
> generated by modpost if the module is built separately.
> 
> To fix this it is necessary to add the generated by modpost modalias to
> modules.builtin.modinfo.
> 
> Fortunately modpost already generates .vmlinux.export.c for exported symbols. It
> is possible to use this file to create a '.modinfo' section for builtin modules.
> The modules.builtin.modinfo file becomes a composite file. One part is extracted
> from vmlinux.o, the other part from .vmlinux.export.o.

Masahiro Yamada, does this version of the patchset look better to you ?

> Notes:
> - v4:
>   * Rework the patchset based on top of Masahiro Yamada's patches.
>   * Add removal of unnecessary __mod_device_table__* symbols to avoid symbol
>     table growth in vmlinux.
>   * rust code takes into account changes in __mod_device_table__*.
>   * v3: https://lore.kernel.org/all/cover.1748335606.git.legion@kernel.org/
> 
> - v3:
>   * Add `Reviewed-by` tag to patches from Petr Pavlu.
>   * Rebase to v6.15.
>   * v2: https://lore.kernel.org/all/20250509164237.2886508-1-legion@kernel.org/
> 
> - v2:
>   * Drop patch for mfd because it was already applied and is in linux-next.
>   * The generation of aliases for builtin modules has been redone as
>     suggested by Masahiro Yamada.
>   * Rebase to v6.15-rc5-136-g9c69f8884904
>   * v1: https://lore.kernel.org/all/cover.1745591072.git.legion@kernel.org/
> 
> 
> Alexey Gladkov (3):
>   scsi: Always define blogic_pci_tbl structure
>   modpost: Add modname to mod_device_table alias
>   modpost: Create modalias for builtin modules
> 
> Masahiro Yamada (4):
>   module: remove meaningless 'name' parameter from __MODULE_INFO()
>   kbuild: always create intermediate vmlinux.unstripped
>   kbuild: keep .modinfo section in vmlinux.unstripped
>   kbuild: extract modules.builtin.modinfo from vmlinux.unstripped
> 
>  drivers/scsi/BusLogic.c           |  2 -
>  include/asm-generic/vmlinux.lds.h |  2 +-
>  include/crypto/algapi.h           |  4 +-
>  include/linux/module.h            | 21 ++++-----
>  include/linux/moduleparam.h       |  9 ++--
>  include/net/tcp.h                 |  4 +-
>  rust/kernel/device_id.rs          |  8 ++--
>  scripts/Makefile.vmlinux          | 74 +++++++++++++++++++++----------
>  scripts/Makefile.vmlinux_o        | 26 +----------
>  scripts/mksysmap                  |  6 +++
>  scripts/mod/file2alias.c          | 34 ++++++++++++--
>  scripts/mod/modpost.c             | 17 ++++++-
>  scripts/mod/modpost.h             |  2 +
>  13 files changed, 131 insertions(+), 78 deletions(-)
> 
> -- 
> 2.49.0
> 

-- 
Rgrds, legion


