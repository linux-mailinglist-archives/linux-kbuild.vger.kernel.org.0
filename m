Return-Path: <linux-kbuild+bounces-9998-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 307C4CA51D7
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 20:27:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA166305D879
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Dec 2025 19:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B793361DDF;
	Thu,  4 Dec 2025 17:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEjMGZgP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BAD361DCA;
	Thu,  4 Dec 2025 17:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764870601; cv=none; b=I+Knz8eFvFNvUmFrTQsjafvmDJSi4rFqeJAXKA0blrWdBl8TEK9CPbWeT3FQvmEgFbSoOlm27MHkIIwGsvDxjY8RYJgyD2i28NMR8lcKGuKb/HLzAf4I9p7esG2wArYWWXjLastqFEWilDbTOn8JqbSSBnklFJQXqiuIBV1CjTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764870601; c=relaxed/simple;
	bh=awRZnETkvcO/0zESeHrh1CN+vKjRx9N4IAlDBab0RYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3lh/Hh+aKAKaIwUVC5+A4YP726utQWsi1chyvtDtPJw7FteOEyW8qQ84DVvRuFPh70CNTeMGFw8WJ11G3ICkIwm9mXZZCEc+Cx+rTiDvYxXtaTJTfeYP3UBUdQ3MOsky+brZdmixiZukv3JUKIZbRUjZGZfR9yWcN44TjxCbes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEjMGZgP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC28C116C6;
	Thu,  4 Dec 2025 17:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764870601;
	bh=awRZnETkvcO/0zESeHrh1CN+vKjRx9N4IAlDBab0RYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEjMGZgP4IE+zMhT6di3NRw6AEvegViG4+PyBP8195dyhapsi0ZgVIXAmaLytgyNG
	 m00o9mXM1Eivr365qBNN1QZ1E6v3Ldx2SSOY4+rrxAJlCMHLPgMYuYcM7bS70ca6h5
	 MoLt3EFFjT7/N8NRqdBnyFmB5cZjyPe1s4L8r9CdnllK/7BV9ez8e28l7L/C44V+7T
	 rT8F8ydd+alieiYIuVBUhmfJdr2FMYe176/lIFQd5rNRkoWX29Sdvb8UZucq6trcDD
	 9IgNnluyDnnMcid1Pcjgus8ZXVfluWYAFQ1eo8bs0/p3Avt+3hdHSQbRNTvtHDLylK
	 FqRQL5j9pAryw==
Date: Thu, 4 Dec 2025 10:49:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: xur@google.com
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rafael Aquini <aquini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stafford Horne <shorne@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Piotr Gorski <piotrgorski@cachyos.org>,
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 0/2] kbuild: distributed build support for Clang
 ThinLTO
Message-ID: <20251204174954.GA1177092@ax162>
References: <20251028182822.3210436-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028182822.3210436-1-xur@google.com>

Hi Rong,

On Tue, Oct 28, 2025 at 06:28:20PM +0000, xur@google.com wrote:

First of all, my apologies for taking so long to get to testing and
reviewing this patchset.

> Rong Xu (2):
>   kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
>   kbuild: distributed build support for Clang ThinLTO
> 
>  .gitignore                 |  2 +
>  Makefile                   | 25 +++++-------
>  arch/Kconfig               | 19 +++++++++
>  scripts/Makefile.lib       |  7 ++++
>  scripts/Makefile.thinlto   | 40 ++++++++++++++++++
>  scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
>  scripts/mod/modpost.c      | 15 +++++--
>  7 files changed, 174 insertions(+), 17 deletions(-)
>  create mode 100644 scripts/Makefile.thinlto
>  create mode 100644 scripts/Makefile.vmlinux_a

Overall, this seems reasonable from a high level perspective. I have
been testing it with my arm64 and x86_64 distribution configurations for
the past couple of days and I have not noticed any issues.

Did you take a look at the robot report from patch 2?

  https://lore.kernel.org/202511052257.Bb85ptQG-lkp@intel.com/

It seems like it could be caused by different optimizations?

I plan to take a more in-depth look at the implementation after I am
back home from Plumbers in a couple of weeks (just to make sure I
understand it from a maintainer's perspective). Based on that, I will
either apply it to kbuild-next for 6.20/7.0 or ask for further
interations, while still aiming to get it into that release.

Cheers,
Natha

