Return-Path: <linux-kbuild+bounces-8542-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F983B2E228
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Aug 2025 18:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A4B83BD179
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Aug 2025 16:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32A8322A19;
	Wed, 20 Aug 2025 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkPzI7Ur"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A384431CA72;
	Wed, 20 Aug 2025 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755706308; cv=none; b=NSz3kdSg6r01O12QaJqjLGcp0ejYuFjHmZccQpLzyidafC85AksXUQbRPLp9gT1FWadSr43Kbf9hzkZCnFf3DlKIuc6ptg9Ksj5J2gV8bunplky+Ub3i9jq7/DnWlWLtjBdMgY3VZNhWc+WLp5SFwgkGI15r5MW0n5sXT0gdfVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755706308; c=relaxed/simple;
	bh=Jgv0+727RcBmLZ75xL/ndSMhEId+rvBQAtXXGW422Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JklYFF/YOVTOpcPMocXxCdi2RNRsgo37gUSBCV9H4noe1TT6kM+8gzhj2jfenN5vjwZFsEaJJ78QY2pJPorePmQrHjXK1ivgKy0A7JBgjAZULEr5BbPbQ0XOo18VcsYP8JB42Gmn326Baha7q5q5LRFiKg5k/zaOM5ClM0BoTfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkPzI7Ur; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE7A2C4CEE7;
	Wed, 20 Aug 2025 16:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755706308;
	bh=Jgv0+727RcBmLZ75xL/ndSMhEId+rvBQAtXXGW422Jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XkPzI7UrGLkoanGse67TAfXMZbPIZVQHG0NmTSvP+CH/DUTeaR+/FBhe7ah3ixtFE
	 xumFhk/eSiBnsbr6H+eASRUcv/dUC7HPdYJoyvsFs6qVj74NLVJ1soNfty0dtnDBr9
	 U4V96O82sE2YXPLOzibyObUiTE9ZPPD+igZ7/R3/9yLH9jHndSmUPIejeCF3F8BQko
	 Hw1MKZ/tcOqXp2oeWms4gDy+DcD9egUyzUaMq6NXD0QNng/H3gmPgSsqo/JHFs2O8W
	 6h4FYmBhwawOIKG2HjfmDgeZQ0frbBYrwgRCsmEUDUPRlhzSZmADZ5MHtBEAz3opZQ
	 B5JgnZkNI7hvw==
Date: Wed, 20 Aug 2025 09:11:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Alexey Gladkov <legion@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Khalid Aziz <khalid@gonehiking.org>, linux-scsi@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Arnd Bergmann <arnd@arndb.de>, Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v6 4/9] scsi: Always define blogic_pci_tbl structure
Message-ID: <20250820161142.GB3805667@ax162>
References: <cover.1755170493.git.legion@kernel.org>
 <93ca6c988e2d8a294ae0941747a6e654e6e8e8b8.1755170493.git.legion@kernel.org>
 <yq1v7mkxe2h.fsf@ca-mkp.ca.oracle.com>
 <20250819071817.GA1540193@ax162>
 <yq18qjeyd4a.fsf@ca-mkp.ca.oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq18qjeyd4a.fsf@ca-mkp.ca.oracle.com>

On Tue, Aug 19, 2025 at 09:52:10PM -0400, Martin K. Petersen wrote:
> >> Applied to 6.18/scsi-staging, thanks!
> >
> > I think I will need this change to apply patch 7 [1] to kbuild-next
> > without any issues [2]. If there is little risk of conflict, could I
> > take it with your Ack?
> 
> Sure, no problem. Dropped the patch from my tree.
> 
> Acked-by: Martin K. Petersen <martin.petersen@oracle.com>

Thanks a lot!

