Return-Path: <linux-kbuild+bounces-2885-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3C394A9F2
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 16:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E9D21F221FC
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 14:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83ECF5811A;
	Wed,  7 Aug 2024 14:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YAczGrJM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323AC2E419;
	Wed,  7 Aug 2024 14:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723040386; cv=none; b=EsnkOOnTXfi7LuBS6odCPt1b/TFOMnH7fHu4piCQbeZG081kH0KNJdo5w7rqJ/IIEO5s4AZUnNG5fzvX9l1cQRk3j15sLqKdxdPpNOhTB1ZGxB4Pk42lI4lsQevieTAnA/NwKCRgswKngOkZqrkLo5OcnsvozcqEquL/mpg9WYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723040386; c=relaxed/simple;
	bh=wkgLS15kdTLvliT36oyzsisWKqBnPHwCzUiy0yCqFCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4gAvATApv8w445duLTWWsiYyH6raQWnDO3owcZ/+yuHr5JFLlnEhNBxlijlajgKg74ZekGfAg6kFo+lQTM9cI8m53Kva4lXyTY96ayo+E0Tb5aHHG01lEbLjbNIMEsVR/oLOwSFtLYPDLWY6rGsYJOl75uWJbITxFx8W/u8yzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YAczGrJM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E804C4AF0E;
	Wed,  7 Aug 2024 14:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723040385;
	bh=wkgLS15kdTLvliT36oyzsisWKqBnPHwCzUiy0yCqFCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YAczGrJMpAyxr/f9jMPRPSOGy5+QP2UgLWDtprDt4SHUXFWtjm6k8ab/4XyffRL93
	 TJzwQEOdv0lfhHsHhkcsxfTj8RJ9vQwhIHPQ1sRIBFbnZ05b0+alKHuwjos4btuiel
	 zsvVDu9TZrQn9IB5ZxXT8uzfgAEIcnHyoGBXl5Hw=
Date: Wed, 7 Aug 2024 16:19:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Gomez <da.gomez@samsung.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	William Hubbs <w.d.hubbs@gmail.com>,
	Chris Brannon <chris@the-brannons.com>,
	Kirk Reiser <kirk@reisers.ca>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"speakup@linux-speakup.org" <speakup@linux-speakup.org>,
	"selinux@vger.kernel.org" <selinux@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	Finn Behrens <me@kloenk.dev>,
	"Daniel Gomez (Samsung)" <d+samsung@kruces.com>,
	"gost.dev@samsung.com" <gost.dev@samsung.com>,
	Nick Desaulniers <nick.desaulniers@gmail.com>
Subject: Re: [PATCH 00/12] Enable build system on macOS hosts
Message-ID: <2024080758-dedicator-smoky-44be@gregkh>
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <CGME20240807110114eucas1p2e1ca4cbd352c6cd9d60688b1570df8d4@eucas1p2.samsung.com>
 <2024080753-debug-roulette-8cb1@gregkh>
 <3jnp6tnkjpvnisefomxagazu2u3uzzt7rcon3r5jssraxzwegb@gsxc7c5sfh7v>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3jnp6tnkjpvnisefomxagazu2u3uzzt7rcon3r5jssraxzwegb@gsxc7c5sfh7v>

On Wed, Aug 07, 2024 at 01:56:38PM +0000, Daniel Gomez wrote:
> On Wed, Aug 07, 2024 at 01:01:08PM GMT, Greg Kroah-Hartman wrote:
> > On Wed, Aug 07, 2024 at 01:09:14AM +0200, Daniel Gomez via B4 Relay wrote:
> > > This patch set allows for building the Linux kernel for arm64 in macOS with
> > > LLVM.
> > 
> > Is this a requirement somewhere that this must work?  It seems like an
> > odd request, what workflows require cross-operating-system builds like
> > this?
> 
> This isn't a requirement, but it would, for example, support workflows for QEMU
> users and developers on macOS. They could build/compile the kernel natively and
> use it to launch QEMU instances, simplifying their process.

But that's not a real workload of anyone?  How often does this ever come
up?  Who is going to maintain this cross-build functionality over time?

thanks,

greg k-h

