Return-Path: <linux-kbuild+bounces-7286-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D9CAC4DEA
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 13:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C5E017B37D
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 11:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E282609E4;
	Tue, 27 May 2025 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FN/4b7q6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1C625FA1D;
	Tue, 27 May 2025 11:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748346896; cv=none; b=N9u3sjJ5tivlAP53jLByeZj35e1Oa2r60FU2GQAV+tbmZTALumtpzb2g9Bp0IEyxPKYfPo5LtGIYeDNU2h5FCSQKCvvTA0AX8fJYLYj8+0zk/8uiPXmrj9LA4Zjt5RAA9EfA5UF+d31y//iVUDCIfEo0M0HtRVmgvnJfJ96ZsqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748346896; c=relaxed/simple;
	bh=IUjsVUHoLW+jbfDN7gXz+vjDPdWp+GcouAig6th4mUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibKCxbA0oa0Hg74a+V9PH+IReMAmW4aoVxiSH8v/90gERDrCcHPh38PZ+YNDXjXv/jw0VEk5HyrjLt2UlKQh1CgJ1PLTXEaRmNLGA5EcTUqbLAl0KUGMbCUaQq1UW6IJO647xv0gSfpXm2QlCLP/bvnuzymu69IAhNepjWDNiBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FN/4b7q6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9288EC4CEEB;
	Tue, 27 May 2025 11:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748346895;
	bh=IUjsVUHoLW+jbfDN7gXz+vjDPdWp+GcouAig6th4mUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FN/4b7q65B2O6Krre7dKF0xYdOlmPrBhzwRAR8nLPnwGsFacJtLy2NKo0Ftu/R/ut
	 V+2uB5OFHUI/L0rTRPcV6Ebo10poTqSaT4QWjM1gxPNDFtL0JIW67zrRgcFEaHnV2z
	 AvYD2v5WB8OCjC2KHxg6B1fU3OG4Nq40312xE709Q/2v3UHd8x8/lgdezdMmHLo85r
	 6dIMfAO9GnSEZkpOelen0osMCirqjdqZajr6+jTSHNymzQQhUzquQXou7UNhM3iXME
	 pd2wYQJ2tOSvkg86S0w9kiUM6mGFNYHOZoy53a0MsMAQQ/blydz5oyKj+sgVZpvgPV
	 OK+a5vFIuEPfA==
Date: Tue, 27 May 2025 13:54:49 +0200
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
Message-ID: <aDWoCU2YrxaCBi42@example.org>
References: <cover.1748335606.git.legion@kernel.org>
 <628e85f1b7e9d0423a8b83ac3150b3e151c9c4e3.1748335606.git.legion@kernel.org>
 <f361faffc1863358e8fda98f994f6a49b6f0d4c9.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f361faffc1863358e8fda98f994f6a49b6f0d4c9.camel@HansenPartnership.com>

On Tue, May 27, 2025 at 07:28:59AM -0400, James Bottomley wrote:
> On Tue, 2025-05-27 at 11:07 +0200, Alexey Gladkov wrote:
> > Define MODULE_DEVICE_TABLE only if a structure is defined for it.
> > 
> > drivers/scsi/BusLogic.c:3735:26: error: use of undeclared identifier
> > 'blogic_pci_tbl'
> >  3735 | MODULE_DEVICE_TABLE(pci, blogic_pci_tbl);
> 
> Well, a) need to cc the scsi list

Sorry. I miss it.

> and b) how is this possible when
> MODULE_DEVICE_TABLE() has an empty definition if MODULE isn't defined
> (so the guard you move should be over an empty statement)?

In the next patch:

[PATCH v3 4/6] modpost: Create modalias for builtin modules

I remove this condition for the MODULE_DEVICE_TABLE macro and it will be
always defined.

I put the drivers/scsi/BusLogic.c change before these changes to avoid
errors. Besides, even an empty macro uses a structure name that is not
defined (if MODULE isn't defined). This seems wrong in any case.

-- 
Rgrds, legion


