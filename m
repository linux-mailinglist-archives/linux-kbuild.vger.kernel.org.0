Return-Path: <linux-kbuild+bounces-6913-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9224AA81D8
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 19:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6AAB189FBAA
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 17:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E1527A117;
	Sat,  3 May 2025 17:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdfHbD+D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F301DB546;
	Sat,  3 May 2025 17:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746293238; cv=none; b=heAbKSVMxwgXK65tWKIYII5MNaNpHkvvnibtYRQEkRjS7QnsJNuSmpufY428bqw8pgvZYw+xZb+uuxdJfRtesaxFXeYKTnvusAq9ANwASA0Vsnu29bJIJWWSHh1AQwgeImc6nO5kt0t/M6Y4uj/GoeNSO3RNGcLt+25IoI85GLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746293238; c=relaxed/simple;
	bh=afYEBQ54OVfQ8bXwdjP2yZIT46gbP/p+Xv9cI/7InNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuYGF41jTLkgThB3M5N/aZr/MHiJQ8GYhbOkbZDLus0zAFRMYNMN/i+1OuL+rUbM4RlgYoHhHjS4u1Yv63LjoZs55YFnUCEiPu3HPotbeg7viyaHoul14GzwYk4h/HViw/nJ6z0kNVnKn73nvX567fEc9oBVX80IXoGqq9V4nI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pdfHbD+D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032C2C4CEE3;
	Sat,  3 May 2025 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746293236;
	bh=afYEBQ54OVfQ8bXwdjP2yZIT46gbP/p+Xv9cI/7InNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pdfHbD+DYSJqOcPBc2NPyBDCetpA605SdGiW/iyPj3iwbOIwv4+/0Qi3LGbhTrVIk
	 MF3svDxvy34K6HBKOyIVIkmgBuXy8rwzqjCZcnAOdAxRz4S6czbI1I5ctYTO5Z6z9u
	 jNEUEAkWmW8F1VCIIFLDvbY65HAUsqKWJJKwlfWHJ76GylT373e6pD9mEz4VyjJYKN
	 jPHuQfazFlpLGKEvzl23vKaNvuoK7FTc5+56VVHuS4KcC3E224KE4gzalZypbueCRM
	 3ByCFixh6yY/tExKEPWXm1M0r/2tKOLQTc3JaSq0H9TUCVJWpzoj9SznzwurxLhe2V
	 VoTCfZLPmok1g==
Date: Sat, 3 May 2025 10:27:11 -0700
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kbuild@vger.kernel.org, Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-um@lists.infradead.org
Subject: Re: [PATCH v2 2/3] randstruct: Force full rebuild when seed changes
Message-ID: <202505031026.6FB74507@keescook>
References: <20250502224512.it.706-kees@kernel.org>
 <20250502225416.708936-2-kees@kernel.org>
 <CAK7LNATDbxc+3HQ6zoSk9t-Lkf4MSNmEUN6S5EqoVWnBQw_K6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATDbxc+3HQ6zoSk9t-Lkf4MSNmEUN6S5EqoVWnBQw_K6g@mail.gmail.com>

On Sat, May 03, 2025 at 03:13:06PM +0900, Masahiro Yamada wrote:
> On Sat, May 3, 2025 at 7:54 AM Kees Cook <kees@kernel.org> wrote:
> > +$(obj)/randstruct_hash.h $(obj)/randstruct.seed: $(gen-randstruct-seed) FORCE
> >         $(call if_changed,create_randstruct_seed)
> [...]
> So, this rule is executed twice; for randstruct_hash.h and for randstruct.seed
> 
> randstruct_hash.h and randstruct.seed will contain different hash values.
> 
> I recommend keeping the current code.

Agreed -- getting stuff into generated is much preferred. Thank you!

-- 
Kees Cook

