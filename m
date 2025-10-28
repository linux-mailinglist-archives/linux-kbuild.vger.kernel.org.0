Return-Path: <linux-kbuild+bounces-9297-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9669FC164BD
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Oct 2025 18:50:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 840E23BD7A5
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Oct 2025 17:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0012F34D91E;
	Tue, 28 Oct 2025 17:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ou17VRgY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E1934D4EE;
	Tue, 28 Oct 2025 17:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761673545; cv=none; b=FWlP+x6BeOVNZHy3NXsClD8QRDPkYyG3CZK1/XmH2FYn24E2YLSP7A/SWxMqTOpsBOjBbzPBHDgraSs36jxpVT6p9ZLZNdh4KjTA1VLLjSmrn2Tag3Aql09Bwq6AsNq0I0nutAVviDbLDKHwOy0VRDAidxYVrZgbISU531JZmRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761673545; c=relaxed/simple;
	bh=+dLtF98APFzqQMWkNMDsXupA4N5Dose6NnX1dZolbVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dh7luU1xdIEjJ4aF5IByorb9ujvga1CZdt9GO+afPkZK6rdsd34tHEYtdKdpkJuFhyX4bT2du/J8mv0F7bm9MpqtabwXFlv37ll/3JToOYiz83wt7u7Ia4XtPMV9Bt0QSqetc+55bAiCQPpeek2rGbbp4sx+pcKyYLLEo5PpXyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ou17VRgY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38512C4CEFF;
	Tue, 28 Oct 2025 17:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761673545;
	bh=+dLtF98APFzqQMWkNMDsXupA4N5Dose6NnX1dZolbVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ou17VRgYRWyf7GYttLPtnHUL+7krmFU9uA8ITFxYKSyNOUC8xGU6Qe6bONJCeuhDe
	 vm/wRRRo6LRCDrzCocybRsHQdrkYl4DuGUq+AwjWdVdURI1dbPJt2sdALRKazMZiTj
	 K3Lr4veYfZPEaGPEMYwFNXlOLTxo1T/CHWaPqBnVHmF62FcjVO9TFpjhtPmh1a5XR5
	 UZQg0nofH38apj895X+qVyxyXVzo3QomLqIW5aBbVaDbfFP8c4M2xgEilECICxAsb/
	 fxUMJ0rz2DDGwOuxk2jagSLl63Xki/UxNTaJ235oASLPSmvvBw/Q86TchAfwV1LmsS
	 0aHfqsAIUyMrg==
Date: Tue, 28 Oct 2025 10:45:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: Can't boot kernel 6.17.4+ via rEFInd
Message-ID: <20251028174541.GA1548965@ax162>
References: <CAB95QARfqSUNJCCgyPcTPu0-hk10e-sOVVMrnpKd6OdV_PHrGA@mail.gmail.com>
 <20251026211334.GA1659905@ax162>
 <CAB95QASG1pZJT7HyqxM90_FExhSVjoHmPqYHeQWXnrAzCNErmA@mail.gmail.com>
 <CAB95QARmr9b-jVdgDLpA4Qq=3WN7CYS46YEH4Ok4gpSdZHpq5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB95QARmr9b-jVdgDLpA4Qq=3WN7CYS46YEH4Ok4gpSdZHpq5A@mail.gmail.com>

On Mon, Oct 27, 2025 at 09:41:25PM +0100, Eugene Shalygin wrote:
> Hi Nathan,
> 
> On Mon, 27 Oct 2025 at 20:35, Eugene Shalygin <eugene.shalygin@gmail.com> wrote:
> > Neither the patch nor 6.18-rc3 work. I'm going to try to revert
> > 5b5cdb1fe434e8adc97d5037e6d05dd386c4c4c6 together with anything that
> > is needed to apply the reversing patch.
> 
> Replacing CONFIG_KERNEL_ZSTD with  CONFIG_KERNEL_GZIP made the kernel
> bootable. What does that mean?

Hmmmm, I am not sure... That seems rather odd within the context of the
flagged change.

Could you post the output of 'readelf -S vmlinux vmlinux.unstripped'
from the broken and good builds? Does rEFInd have any sort of additional
debugging to see why/what it is complaining about not being able to
find?

Cheers,
Nathan

