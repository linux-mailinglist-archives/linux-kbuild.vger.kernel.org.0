Return-Path: <linux-kbuild+bounces-7609-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B52EAE2A28
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 18:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D60B177893
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 16:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A340221FF5B;
	Sat, 21 Jun 2025 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DTwQfDpI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748342063D2;
	Sat, 21 Jun 2025 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750522224; cv=none; b=QYV3uL0I1RXoiQtwgUeIRa7tmuJqI+ssblGCGcUlOxdgXwigXxbtZcQxD8/9BSU9i6haKNeKoNBaU9GCgV6G52GeRopJbyZnDC/xNsg1QBJ2ewiKIs1RoIlQT52H8wOQ8rLcHjRj7DcxNDxB4EauwjxMnh0cuHwdq4ReLK1PPcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750522224; c=relaxed/simple;
	bh=yw1oz3Hw9jie0HQzYjN0TuWHel9ojqMEUURJZRcbeBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=baQqtRGRk14SaEmyz6eeVp2XkSaUDQNUyNnzrpBAvRG0WDLRI6Wm2lIZUfoYpLUD9p1/g+6jX60Zy31LGiXt1abfeViKoUMmvdznpKem1UVhT45Too8YtgLEAbjcG9DvhICTsj0kP3I1Z0uj/eyyf4BJ98LSasx4bX/+KnJtP4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DTwQfDpI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6C2C4CEE7;
	Sat, 21 Jun 2025 16:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750522224;
	bh=yw1oz3Hw9jie0HQzYjN0TuWHel9ojqMEUURJZRcbeBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DTwQfDpIQAUAgHndhDEMI3xP6dAfY4+xdRyoahIOWHLRVkp4ticYMx1t0BB3lfTc9
	 OBEbTMUFNL8A1mGPeYY1OVDIOLfmU7xwzgVS3BcKYGITpVy0nmz2gKXBZR7wyApc6P
	 M6gH1gKDPyjSklKiGKBxh2OdbiVwgy1hutDrZDrzlfjiCCca8HF/r1S139gdeRRK/c
	 ZruE3vyBasXiG8LjShuHr9p9QGjbbbd3CtfhtFf96J1y5kETOtdaOl4LJQCTi3EUHb
	 x1nPHr30AXlTUoEVM14i4vv+a4cBwcn6d7nZq2leXXiXYgrlGIQt1ApPXhOc1YECJA
	 2IwcNCLO5aP3w==
Date: Sat, 21 Jun 2025 18:10:15 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-scsi@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v4 6/7] modpost: Add modname to mod_device_table alias
Message-ID: <aFbZZ_d2NgeoSBiW@example.org>
References: <cover.1750511018.git.legion@kernel.org>
 <6e2f70b07a710e761eb68d089d96cee7b27bb2d5.1750511018.git.legion@kernel.org>
 <CANiq72k+ojA3=JfwhvjZ_=+uGBG-WmhLOigzPUXdoY8VQXbf=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k+ojA3=JfwhvjZ_=+uGBG-WmhLOigzPUXdoY8VQXbf=A@mail.gmail.com>

On Sat, Jun 21, 2025 at 05:20:49PM +0200, Miguel Ojeda wrote:
> On Sat, Jun 21, 2025 at 3:57 PM Alexey Gladkov <legion@kernel.org> wrote:
> >
> > +/* Format: __mod_device_table__kmod_<modname>__<type>__<name> */
> 
> Should we mention that `__kmod_` and `__` will be the search strings,
> or otherwise the Rust formatting (i.e. that is carries a line etc.)?

Ok. Make sense.

Basically there's a comment for the MODULE_DEVICE_TABLE macro that tells
where and how that symbol is parsed.

> Cc'ing Tomo: do we need an update on `rust/kernel/net/phy.rs`? Should
> we factor out the formatting?
> 
> Thanks!
> 
> Cheers,
> Miguel
> 

-- 
Rgrds, legion


