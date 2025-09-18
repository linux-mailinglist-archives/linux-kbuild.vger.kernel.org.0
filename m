Return-Path: <linux-kbuild+bounces-8903-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBC5B863C4
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 19:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECC497C7E9E
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 17:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C06A2BDC3F;
	Thu, 18 Sep 2025 17:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NsjX71+J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D235D263F4E;
	Thu, 18 Sep 2025 17:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758216934; cv=none; b=HdbOowh5UofGGBKNS5158bFGs8RsDbXV0KQdA/ZHEtPUWoSz5cBaKqMgEC/nT5T0NW4FZmbzlbwZrTGC7H5UJCwy1cuPSBgkIWdTcDeVbejjZapNVSDr9w21KyoepsR8R+LNZtAkjDUs5E2cuU+vMjcyzArLbOp3bVd9QBRQ6Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758216934; c=relaxed/simple;
	bh=bjkYGVf268gC3cTzQt0WDIuNozktZu6oJzVbc9TclVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDecw/oFSkJr86NwJZyVH8TFQhMa820YGrLAlwoIfo++Ws3DMBNLsUj8pz9MT7FOFJ+ctyFNy9oWoW3Q41trmJb4fYxES5UJjoOtPs5F2gBA9w/WtNAprHdq0z60ptVLC+sdsRsAG8nRfb7wOYv7N1yaCLg+BcosdJywwk+aeqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NsjX71+J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604A4C4CEE7;
	Thu, 18 Sep 2025 17:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758216934;
	bh=bjkYGVf268gC3cTzQt0WDIuNozktZu6oJzVbc9TclVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NsjX71+Jd4Trg/+roNTgLEInv9q3nseOc17Sq6miA8t41bQeBKWtrG2N8qHbNIhf/
	 jL8OsAD2ih1gjgWLouvc2tpSFs+9pKjYONEW0VoNUbaZcmZ5LM6YpO3eRMo/wyWGer
	 O5zRD6bUIed1evGmAPwBlwTRbFYXUN3/vrdFuFpxu+9cMw0evz3E/KBkQD8XrGsSP1
	 gyEWBis2XlobblSWAEtf77vzZpHX/cna2qQ0DyB1fKjLmnNqJCLdZXx0kEW3kJG4v6
	 NINM79RvITeG+VpGoQT1JE6RiBy1IMSi3PgZSdLV2lmC6aqebq5WarbhMhmm0JSC94
	 1I76Vgx9TDVXA==
Date: Thu, 18 Sep 2025 10:35:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexey Gladkov <legion@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v8 0/8] Add generated modalias to modules.builtin.modinfo
Message-ID: <20250918173529.GA3360630@ax162>
References: <cover.1758182101.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1758182101.git.legion@kernel.org>

Hi Alexey,

On Thu, Sep 18, 2025 at 10:05:44AM +0200, Alexey Gladkov wrote:
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
> modules.builtin.modinfo. Fortunately modpost already generates .vmlinux.export.c
> for exported symbols. It is possible to add `.modinfo` for builtin modules and
> modify the build system so that `.modinfo` section is extracted from the
> intermediate vmlinux after modpost is executed.

This seems good to me now. I have tentatively merged this into
kbuild-next so that it can get some more soak testing in -next, as I am
going to be paying less attention to email starting on Sunday for a week
or so, so I would like to be able to deal with regressions promptly.

  https://git.kernel.org/kbuild/l/kbuild-next

Don't consider the commit hashes stable just yet, as I would like to
give Nicolas the chance to provide tags if he would like but I did not
want to wait for the soak testing.

Cheers,
Nathan

