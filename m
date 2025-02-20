Return-Path: <linux-kbuild+bounces-5845-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41421A3E2EB
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2025 18:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9A3D422109
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2025 17:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5648A21420E;
	Thu, 20 Feb 2025 17:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HxDKYopk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BAA206F0C;
	Thu, 20 Feb 2025 17:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740073430; cv=none; b=Fp88LH43Waa+fFr8mamzD33Re8ZQ3W3LNRix5HD00UZVFMUqusvh5O9jr8+Rjrd5keBVn9bowc4LP2Bz603XBj4avGB/2I1kr8bZTT4lRcoapIGcSRcPdqEiGjlIw23DHZw6yyeW9a/nNyNGmghZt84CaZk38v923bWe8OnsgEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740073430; c=relaxed/simple;
	bh=ejZYvgXSCpJiyhBZ7MBC/Defiazv7Z+1j7tghoj2CjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VENaWvb0bLbRlKavOL6hB+zC6dscccxuzZReqrdkkjbSBu/OiAwqh1ZCNQ/Dy+vzrxAQqoWJ0/1rEz2TpYc2jB7p6NS5R9xfNExEIRPPUIQ7m6i5T4QpJioUJzuvKtlvZMC0bv+zO2zoG4+Nda7+QEYOIdE0ekUqohlP8ytcidM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HxDKYopk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC48C4CEE2;
	Thu, 20 Feb 2025 17:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740073429;
	bh=ejZYvgXSCpJiyhBZ7MBC/Defiazv7Z+1j7tghoj2CjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HxDKYopkIQ9RkbeJKKADTnS0Q7Mc8zNFFOiW7aEH08wA6yoUGUXMcBXJ9/N/tpENY
	 +HGxKA3cw/kqjMk+ez6mnq95u276ahrx2jLRzwsx7jtCi/sI9hfSR9x0kAqDLs2pJZ
	 NgW8cF2jzmbuzFERSergaYVtse87S3cdYXjHvitU=
Date: Thu, 20 Feb 2025 18:43:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Nicolas Schier <n.schier@avm.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Ben Hutchings <ben@decadent.org.uk>, regressions@lists.linux.dev
Subject: Re: [PATCH 3/4] kbuild: slim down package for building external
 modules
Message-ID: <2025022057-reclusive-overreach-ac89@gregkh>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-4-masahiroy@kernel.org>
 <b3a8816c-3846-83ab-9750-fd12041d9495@quicinc.com>
 <20250220-red-antelope-of-education-5417aa@l-nschier-nb>
 <0ee862ec-4c36-4c3e-ae90-627c6b0e527b@quicinc.com>
 <20250220-kickass-famous-kittiwake-c11f5b@l-nschier-nb>
 <80cf4e9a-5d49-4bc3-8160-1b23c31d4d36@quicinc.com>
 <2025022020-armband-clock-69af@gregkh>
 <13fac9ee-cad9-466b-9216-8c0516600b03@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13fac9ee-cad9-466b-9216-8c0516600b03@quicinc.com>

On Thu, Feb 20, 2025 at 10:24:32AM -0700, Jeffrey Hugo wrote:
> On 2/20/2025 9:49 AM, Greg KH wrote:
> > What do you need/want to parse the .config file in the first place?  Why
> > not rely on the generated .h files instead as those can be parsed the
> > same way as before, right?
> 
> Two usecases -
> 
> First when secure boot is enabled, DKMS looks for CONFIG_MODULE_SIG_HASH to
> figure out signing the modules so that they can be loaded.  Removing .config
> causes an error in DKMS and the module signing process will fail.  The
> resulting modules (already compiled successfully) will fail to load.
> Whatever the user needed those modules for will no longer work.

Shouldn't the "normal" kbuild process properly sign the module if it
needs to be signed?  Or are you trying to do this "by hand"?

> If the user is on Ubuntu, and has built a kernel 6.12 or later, they need to
> build upstream DKMS and use it as none of the Canonical provided DKMS builds
> have the fix.  This feels like a situation that would make the user afraid
> to upgrade their kernel (to your point above).
> 
> This feels very much like an "at runtime" issue, assuming external modules
> are supported.  I may be wrong here.

external modules can be broken at any moment in time, you know that.
There's never a guarantee for that at all.

> Second, our usecase is that we look at the .config to tell if a particular
> driver is included in the kernel build (config =y or =m). This driver
> provides diagnostic information which is useful to our product, but not
> required for operation.  It does not have headers that are exposed to the
> rest of the kernel, so checking the generated .h files does not work.  If
> the driver is not built, we provide a backported version that is then built
> out of tree.

You can check the same .h files for those config options, no need to
manually parse a .config file.  What's wrong with including
include/generated/autoconf.h properly?  That's what the build system
uses, right?

thanks,

greg k-h

