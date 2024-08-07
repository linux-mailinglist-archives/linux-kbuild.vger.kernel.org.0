Return-Path: <linux-kbuild+bounces-2877-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF8094A682
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 13:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE7EB1C22A1E
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 11:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE391DD39A;
	Wed,  7 Aug 2024 11:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oKMx0VBf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FB91D174B;
	Wed,  7 Aug 2024 11:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723028471; cv=none; b=d8ZRe+gXJefduPJRo9U+s3lfNrrm3tUC6CBXdrvEdhFOCmyfjJAiwfLlk0tDwZcYBGEmC6lPjWtkSzu6mlTaDbe/sARBWROcvDJ9LhOtYljCN8nJN/j0W8syT5S/eV9eQYSmf2DSF3x8beQtM63J3lP7/XKAqbqMQXeAapdUMww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723028471; c=relaxed/simple;
	bh=k6GWvSmzs8fww5dKho7yB+WRfQj5+Coz0kDkKHV5yck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9rg6A2Zrs+ZMtDIDT7AsJNUU/RyZiWTXH/dag0lD9qfJhZimKFJUr9Qr5OuJJKLkCi5X+jbfpvRoBjT9DvbbjUTswYMM6VbfEvX4r4S07TSaA16tMeLHqwV+oZXDIXKm7iwwdlsrX9mKzD+rbf/qrbx0vuw7+JDtxqsb/cxLY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oKMx0VBf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028E6C32782;
	Wed,  7 Aug 2024 11:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723028470;
	bh=k6GWvSmzs8fww5dKho7yB+WRfQj5+Coz0kDkKHV5yck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oKMx0VBfuW0ZbA+q8N88Z8je7UdEVeFR/J7DKZhgUWWtGzsKzmv/2IIIw/MBY5DQ8
	 9KM/R9OjyiCqg2rMxtzzGjaJfozNrmvFkIqkny5F2S99dF+tg1jAxrLnYhbJCD7EYS
	 gz/rMkISr6xHiE/WD7KM9ygxBx8JRYFghLRZ1S8w=
Date: Wed, 7 Aug 2024 13:01:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: da.gomez@samsung.com
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
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, speakup@linux-speakup.org,
	selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-serial@vger.kernel.org,
	llvm@lists.linux.dev, Finn Behrens <me@kloenk.dev>,
	"Daniel Gomez (Samsung)" <d+samsung@kruces.com>,
	gost.dev@samsung.com, Nick Desaulniers <nick.desaulniers@gmail.com>
Subject: Re: [PATCH 00/12] Enable build system on macOS hosts
Message-ID: <2024080753-debug-roulette-8cb1@gregkh>
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>

On Wed, Aug 07, 2024 at 01:09:14AM +0200, Daniel Gomez via B4 Relay wrote:
> This patch set allows for building the Linux kernel for arm64 in macOS with
> LLVM.

Is this a requirement somewhere that this must work?  It seems like an
odd request, what workflows require cross-operating-system builds like
this?

thanks,

greg k-h

