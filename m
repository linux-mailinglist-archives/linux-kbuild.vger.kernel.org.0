Return-Path: <linux-kbuild+bounces-7288-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAB0AC4F01
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 14:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F506168BFF
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 12:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF64D212B0C;
	Tue, 27 May 2025 12:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtsUKHsQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D356C2ED;
	Tue, 27 May 2025 12:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748350701; cv=none; b=u2Lyh7CMHjhRV+myQ1O9F5GNLj8BELKsvxI/DbdWbk6/4UVxImu4bChmHiTqNwpNhC8QE8bF1OO4djujVpH4d8U4wnLWmnyo4E9P4+/j85fgm26gUCWkMcy5xv6j8eS17aPdUj/DbTqy86xzacI5wXeM3J1ovn6icm2U/bC054E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748350701; c=relaxed/simple;
	bh=8fNDXQ9wNkxnXTzRMl64ky9f5IhJbEJPvtSA4rQu8oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCNOg56tk8oyMOWkyGlr5Xvb8VySdhez1tYX3OC8OupF2Rh0DSg4iDye+wWR4++uoMg8HyR0uv+O/n3h961bbXJJBLyV8ccGsR97ljwDj+TsThuM4GbdiRRv88IhXOkrNP/QmOs0hX7H+3rIFBUWy/EsMKr0r2cCNClQUh7RPpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtsUKHsQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21406C4CEE9;
	Tue, 27 May 2025 12:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748350701;
	bh=8fNDXQ9wNkxnXTzRMl64ky9f5IhJbEJPvtSA4rQu8oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtsUKHsQ7+VxZL8ojRcD/mnflUdEpiNYKZwYClWneoIiTZD/aUWHMkdelCAb2cz0f
	 qZFQlbZ5nGCug/ibS2U1yGRciENLlTLfMeSevBY7Dhwt1DDQrWcysjcKHCLkiu5teZ
	 j0IUQfeQy6w/GdTg0o+Z2QBahfhMcYoAtgRsB5hsqePLuD3PBhdbY1UAe+dgNJSYtd
	 ma3gC2EbBX/fRguzBM1jtW/WgzI4VBn+DD+DXg/KZcauI/3zNoayBB8Ms7/LyeDGTC
	 XJnapivJ+nwrYwYC2Eu9BBhaIU/TNNvt98pjYcQtA2X+7dtarrGw80S9Nk51JITyYV
	 cIVHhwsQAZB3w==
Date: Tue, 27 May 2025 14:58:14 +0200
From: Alexey Gladkov <legion@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Khalid Aziz <khalid@gonehiking.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi <linux-scsi@vger.kernel.org>
Subject: Re: [PATCH v3 1/6] scsi: Define MODULE_DEVICE_TABLE only if necessary
Message-ID: <aDW25htH2tMzqtqH@example.org>
References: <cover.1748335606.git.legion@kernel.org>
 <628e85f1b7e9d0423a8b83ac3150b3e151c9c4e3.1748335606.git.legion@kernel.org>
 <f361faffc1863358e8fda98f994f6a49b6f0d4c9.camel@HansenPartnership.com>
 <aDWoCU2YrxaCBi42@example.org>
 <65d96116e06d73fe4e219a595820d610e74290c9.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65d96116e06d73fe4e219a595820d610e74290c9.camel@HansenPartnership.com>

On Tue, May 27, 2025 at 07:58:27AM -0400, James Bottomley wrote:
> On Tue, 2025-05-27 at 13:54 +0200, Alexey Gladkov wrote:
> > On Tue, May 27, 2025 at 07:28:59AM -0400, James Bottomley wrote:
> > > On Tue, 2025-05-27 at 11:07 +0200, Alexey Gladkov wrote:
> > > > Define MODULE_DEVICE_TABLE only if a structure is defined for it.
> > > > 
> > > > drivers/scsi/BusLogic.c:3735:26: error: use of undeclared
> > > > identifier
> > > > 'blogic_pci_tbl'
> > > >  3735 | MODULE_DEVICE_TABLE(pci, blogic_pci_tbl);
> > > 
> > > Well, a) need to cc the scsi list
> > 
> > Sorry. I miss it.
> > 
> > > and b) how is this possible when MODULE_DEVICE_TABLE() has an empty
> > > definition if MODULE isn't defined (so the guard you move should be
> > > over an empty statement)?
> > 
> > In the next patch:
> > 
> > [PATCH v3 4/6] modpost: Create modalias for builtin modules
> > 
> > I remove this condition for the MODULE_DEVICE_TABLE macro and it will
> > be always defined.
> 
> Well, why?  If there's a reason for the table to always exist, wouldn't
> the best fix then be to remove the module guards from the PCI table in
> the buslogic ... they only really exist to prevent a defined but not
> used error which it sounds like you're getting rid of?

I wanted to keep the original logic and remove the build error. Before my
changes blogic_pci_tbl was only used when the module was built separately
(MODULE case).

But yes, you are right. In this case, it would be more appropriate to
remove the MODULE condition at all since MODULE_DEVICE_TABLE always
makes sense after my changes.

-- 
Rgrds, legion


