Return-Path: <linux-kbuild+bounces-7291-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C873AC5022
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 15:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E635F171CB6
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 13:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631042750F0;
	Tue, 27 May 2025 13:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTu9jXPy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E73F274FF5;
	Tue, 27 May 2025 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748353506; cv=none; b=RqfYZq+lJrJ1IMIbF9gvGqhEQj5BI6ocurOAFqdb1Keuto6HEsFadqgJigyTE0JceImyY5Q44lry+c0Nsup5oF1p8FEHUDm9fGgLkZ2sVaeLQ1kRuXFcLfD63HpyfhcFdGqhNY1wqtPF4lk+FbIgnf6mc+LEkaNWc5LYWNqbeQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748353506; c=relaxed/simple;
	bh=hdVwWIIFhOiVZNi5/WCVrh8jRCyoHJRKWRlgG03/Qi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDfTDudj+4e6uzZgZN1AWL5fORw/lFMnPcFfzpLXf6hwH/Dy/vLsbSFFNkPYeW3Tel36IBewRLpgSySDMcpZdjpJIr/bHeLksDty1EMQqXv/c2UOsSZPIQ5K9rwOg7OOUS0kKlZWDYYaDldREzib82LIaoTa9kieys9ZhZrprHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTu9jXPy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923DFC4CEE9;
	Tue, 27 May 2025 13:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748353505;
	bh=hdVwWIIFhOiVZNi5/WCVrh8jRCyoHJRKWRlgG03/Qi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZTu9jXPy0GS4Qz6kfxF6VYwzqX/NmeEQW43rMCFhzPiVuY3240M8R0OHJN14dktqi
	 TeN+54/YHND2H3eMrhHvscDfTMbkolnlJnjyuDU0OShz5xsCAVjKyh5Wk0qDFZdC3o
	 JHrPpxU9EBgpzJhtmLkXR88Ah/A6tDQYLgTkQ9YBOP22fHpF2nas2gg3DzHqSnyBm6
	 LFaa3hymFqRF0woyehWHF1sxvbovBea5FqoRI/Ozigo6VSZmNR+ApoInIcwV76dKw0
	 dZduOtGkXAtB/ITy+9MCTJW0FBYG9yePFM7I3ULDAgeGhx/O65ibjXwsjlVC6AlpTW
	 bQ6NhV0VDXfYg==
Date: Tue, 27 May 2025 15:44:59 +0200
From: Alexey Gladkov <legion@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Khalid Aziz <khalid@gonehiking.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH v3 7/6] scsi: Always define MODULE_DEVICE_TABLE
Message-ID: <aDXB27Pesn7RJAtZ@example.org>
References: <cover.1748335606.git.legion@kernel.org>
 <20250527131544.63330-1-legion@kernel.org>
 <9b1a69dd12531299dcc9b077d065ebbaa6e14c51.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b1a69dd12531299dcc9b077d065ebbaa6e14c51.camel@HansenPartnership.com>

On Tue, May 27, 2025 at 09:22:09AM -0400, James Bottomley wrote:
> On Tue, 2025-05-27 at 15:15 +0200, Alexey Gladkov wrote:
> > Since MODULE_DEVICE_TABLE no longer depends on whether the module is
> > built separately or compiled into the kernel, it now makes sense to
> > always define DEVICE_TABLE. In this case, even if the module is in
> > the
> > kernel, correct module.builtin.modaliases will be generated.
> > 
> > Suggested-by: James Bottomley <James.Bottomley@HansenPartnership.com>
> > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > ---
> >  drivers/scsi/BusLogic.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
> > index 8ce2ac9293a3..08e12a3d6703 100644
> > --- a/drivers/scsi/BusLogic.c
> > +++ b/drivers/scsi/BusLogic.c
> > @@ -3715,7 +3715,6 @@ static void __exit blogic_exit(void)
> >  
> >  __setup("BusLogic=", blogic_setup);
> >  
> > -#ifdef MODULE
> >  /*static const struct pci_device_id blogic_pci_tbl[] = {
> >  	{ PCI_VENDOR_ID_BUSLOGIC,
> > PCI_DEVICE_ID_BUSLOGIC_MULTIMASTER,
> >  	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
> > @@ -3732,7 +3731,6 @@ static const struct pci_device_id
> > blogic_pci_tbl[] = {
> >  	{0, },
> >  };
> >  MODULE_DEVICE_TABLE(pci, blogic_pci_tbl);
> > -#endif
> 
> You don't need to do this in two steps.  The original problem of
> defined but not used table stopped being a problem when the structure
> was converted to static const over ten years ago (the compiler doesn't
> warn about unused static consts).

Ah. Ok, I will recreate this patch shortly.

Basically my original plan was to fix compilation errors as a first step,
and second step make MODULE_DEVICE_TABLE be used independently of MODULE.
Because there are a bunch of modules that also use MODULE_DEVICE_TABLE
only if MODULE is defined.

-- 
Rgrds, legion


