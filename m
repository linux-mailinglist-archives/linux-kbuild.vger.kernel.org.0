Return-Path: <linux-kbuild+bounces-6767-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10438A9F493
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Apr 2025 17:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 778561A83B96
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Apr 2025 15:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFED25D1FE;
	Mon, 28 Apr 2025 15:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vp+36QXB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3852356A7;
	Mon, 28 Apr 2025 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745854544; cv=none; b=POe9MbKOy6YAXI0yzPtXaP5/+oTV+eWw1dkNSpS4g19RyeIqSkHLEjedHiZJaGyx27jnsZyuIRXZVigH+JP4vfQtIDEDK/oDTn2+1UJGOl9PdEmwGAdWKj76fzPVM8v1Kweh2UL0X2oC+LdyG2Va5yDHY6P14LjCpsGtuHqgSWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745854544; c=relaxed/simple;
	bh=A1H8cIFZbMQdQ5tSdCHnzznMerZGplQabykDkjjTZEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VM74EZ2lclJLxEPo3iG9g1pmb8IrRsaN9ianjaM1FBCF+s/sW329x5hx/vdZhpHlQtJZcInMvCrON4zYB6Y6d/PWVgi1OPs47u+dztrN2MbtkKnMUacSkeQMPn+icmX+GsJtQFQ18Ef7G+4YEK7TKnQU7rQH23wjfge3J+yo04Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vp+36QXB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C89C4CEE4;
	Mon, 28 Apr 2025 15:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745854543;
	bh=A1H8cIFZbMQdQ5tSdCHnzznMerZGplQabykDkjjTZEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vp+36QXBQJeL8fkvJ9v1jnok9hrJiejCJ+9dhi/RYDeQQSv8RcyKU/Ws+3+GOklBW
	 qQI9U1Si3sRgqdSgV2H04px6eFpVSzuiCiYq5WUjrUU+fuoBVIXcmJJ2MczJ4/WkUv
	 +RwOAOGQeVbJZmyTvMS0cE8SPcFf8hXB/xEtIuRlshnOMAiwtH2G58ZHbEWeaTfSX6
	 WWDSc0+cdvFs2wgmWI0cWyU5kd1fXXTM9JEd/KYLfZh0ZFkTi9VCPmiHZJYclgdeq0
	 FY8m0b6TwSX4znMLMs9AnghtFDocIqfD5buplBCZX56ut5iaeSmQhjuucUBhZD4VPo
	 cScIB/NtoNe3Q==
Date: Mon, 28 Apr 2025 17:35:38 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v1 0/7] Add generated modalias to modules.builtin.modinfo
Message-ID: <aA-gSp-nqPXP7wOz@example.org>
References: <cover.1745591072.git.legion@kernel.org>
 <65c912cc-3a27-4b0b-913e-784ff6d07221@suse.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65c912cc-3a27-4b0b-913e-784ff6d07221@suse.com>

On Mon, Apr 28, 2025 at 03:47:06PM +0200, Petr Pavlu wrote:
> On 4/26/25 18:16, Alexey Gladkov wrote:
> > The modules.builtin.modinfo file is used by userspace (kmod to be specific) to
> > get information about builtin modules. Among other information about the module,
> > information about module aliases is stored. This is very important to determine
> > that a particular modalias will be handled by a module that is inside the
> > kernel.
> > 
> > There are several mechanisms for creating modalias for modules:
> > 
> > The first is to explicitly specify the MODULE_ALIAS of the macro. In this case,
> > the aliases go into the '.modinfo' section of the module if it is compiled
> > separately or into vmlinux.o if it is builtin into the kernel.
> > 
> > The second is the use of MODULE_DEVICE_TABLE followed by the use of the
> > modpost utility. In this case, vmlinux.o no longer has this information and
> > does not get it into modules.builtin.modinfo.
> > 
> > For example:
> > 
> > $ modinfo pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30
> > modinfo: ERROR: Module pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30 not found.
> > 
> > $ modinfo xhci_pci
> > name:           xhci_pci
> > filename:       (builtin)
> > license:        GPL
> > file:           drivers/usb/host/xhci-pci
> > description:    xHCI PCI Host Controller Driver
> > 
> > The builtin module is missing alias "pci:v*d*sv*sd*bc0Csc03i30*" which will be
> > generated by modpost if the module is built separately.
> 
> Could you explain what is currently broken because the device-table
> alias information isn't available? I think adding this information is
> reasonable, both for consistency and so kmod can display accurate
> information, but is there more that I'm missing?

Yes. Right now, aliases that are generated by modpost are not available
for kmod because it's not in the modules.builtin.modinfo.

-- 
Rgrds, legion


