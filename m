Return-Path: <linux-kbuild+bounces-4067-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2972C99AF79
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2024 01:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A76041F2311A
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 23:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086E91E3DE6;
	Fri, 11 Oct 2024 23:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ali6+h0q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C835119FA9D;
	Fri, 11 Oct 2024 23:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728690124; cv=none; b=AdiXLJ66Ba880bWNCoFZddzl8rmOiH5f+bxUNfz/PXMJD2kz3NHlyrcbNZETU9Jm1A//FJyxrqUD/diB9PNVtUR7fZ0L19TPnkHDeO2UNi2bXhkNQ57AvLQGVRWRT7GWdTZj9fcanQUQZXnXv2z4t1Uki87xYlsxf8lOvXkdhOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728690124; c=relaxed/simple;
	bh=R39JaxW1hWMiERYBsLUUIBA7/wMrOZf41oA2EiVycds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNh0rWxAB7+A3FP4tilZG9UK0jxNmhIX3bFG6M3vLPu2F7KShpZxPJL6sNth22e6U24MyDV/w5B3uSIJUAKtld0397YI+2yRezNezODal/SBOyKDoRhoNmv/z0kfCas1aiUyKKNXOKjUcCYYqljEiFkAAS73CXcpk6q5Uoe8ULI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ali6+h0q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE71BC4CEC3;
	Fri, 11 Oct 2024 23:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728690124;
	bh=R39JaxW1hWMiERYBsLUUIBA7/wMrOZf41oA2EiVycds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ali6+h0qTYeUPbTrxI6//H8Ywf9wvK81zfp8uG1dS93qGyfyp/ZPQo74bNitFtJ66
	 cXiTUv+TO5lDoWQFnJapd9vq10yys76l4BCcag76bh3tEGF2W/8bmaaLv4w3tz9h+x
	 RO1KFW4akKVSzEkHSdUAmYKAUL49JM54p6E8uWEC58XFEP0Nu2v1cN+94K7IUPDQnd
	 XYEeDzY3cT/hCMzM4BwS5kBJi7rBIsNQ0JKuE+LKSeA3SmwYv+ytGtJDAc6XV6xjcb
	 ak55JBj28kmKKtHoT/FdUejyewfQukSMTXko8RD5l6S4xY7PvIKfKiiReT3DVNKjF4
	 rbl7tq3896CGQ==
Date: Fri, 11 Oct 2024 16:42:02 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
	Miroslav Benes <mbenes@suse.cz>,
	Asahi Linux <asahi@lists.linux.dev>,
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Konstantin Ryabitsev <mricon@kernel.org>
Subject: Re: [PATCH v4 00/19] Implement DWARF modversions
Message-ID: <Zwm3ykuiyI3ugr44@bombadil.infradead.org>
References: <20241008183823.36676-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008183823.36676-21-samitolvanen@google.com>

On Tue, Oct 08, 2024 at 06:38:24PM +0000, Sami Tolvanen wrote:
> Hi,
> 
> Here's v4 of the DWARF modversions series. The main motivation is
> modversions support for Rust, which is important for distributions
> like Android that are about to ship Rust kernel modules. Per Luis'
> request [1], v2 dropped the Rust specific bits from the series and
> instead added the feature as an option for the entire kernel.

I think its important to mention *rationale* why I recommended it, it
let's you more broadly test coverage / support with tooling so that its
not just Rust modules which tooling will have to support. It gives the
option to have *one* unified way to do things. Not "rust is special",
oh no, do this instead. This also allows us to empirically evaluate
if this new solution also has benefits. If so what should we look out
for, metrics, etc. If there are proven benefits, then by all means
why not make the the default.

> Matt is
> addressing Rust modversion_info compatibility issues in a separate
> series [2], and we'll follow up with a patch to actually allow
> CONFIG_MODVERSIONS with Rust once everything else has been sorted
> out.

So this depends on that work? What's the ordering of things? That work
seems to be aimed at addressing long symbols, and that is also
generically useful, and there were odd old hacks for that for LTO.
Bring the patch reviewer with you, as they may not have all the
background.

> Short background: Unlike C, Rust source code doesn't have sufficient
> information about the final ABI, as the compiler has considerable
> freedom in adjusting structure layout, for example, which makes
> using a source code parser like genksyms a non-starter. Based on
> earlier feedback, this series uses DWARF debugging information for
> computing versions. DWARF is an established and a relatively stable
> format, which includes all the necessary ABI details, and adding a
> CONFIG_DEBUG_INFO dependency for Rust symbol versioning seems like a
> reasonable trade-off.

I think its important to state that most distributions enable CONFIG_DEBUG_INFO
already, so this means Rust modules won't be asking much more from
distributions.

> The first patch moves the genksyms CRC32 implementation to a shared
> header file and the next 15 patches add gendwarfksyms, a tool for
> computing symbol versions from DWARF.

In case I find issues with this patch series, let's split up the patches
in the next iteration by two sets, one which is the cleanups,  moves,
and non functional changes, and then a seprate set with the actual
changes needed. This let's us carry on faster so I can apply the first
set.

> When passed a list of exported
> symbols and object files, the tool generates an expanded type string
> for each symbol and computes symbol CRCs similarly to genksyms.
> gendwarfksyms is written in C and uses libdw to process DWARF.

OK so a new lib dependency at build time. What if that's not present?

> Patch
> 17 ensures that debugging information is present where we need it,
> patch 18 adds gendwarfksyms as an alternative to genksyms, and the
> last patch adds documentation.
> 
> v4 is based on v6.12-rc2 and for your convenience the series is also
> available here:
> 
> https://github.com/samitolvanen/linux/commits/gendwarfksyms-v4

Thanks! OK so I'd like to see next test coverage.

The below is more modules maintainer homework we have to do, if you're
not a modules maintainer or not interested in CI stuff you can stop
reading now:

We don't have much but for testing of modules, we have lib/test_kmod and
tools/testing/selftests/kmod/kmod.sh. kdevops now has 'make
kdevops-seltests-kmod', a respective cli defconfig is available to
allow github actions to run kdevops on a self-hosted runner too. We
already have modules tree integration with kernel-patch-daemon (KPD)
[0] [1], there's two parts to this integration to patchwork. The first is the
stuff you need to run a github self-hosted runner to test modules with
kdevops [2], one can just take that into a random Linux kernel git tree
and merge push it into github to trigger your own self hosted runner.
That's what KPD does, and in effect its visible [3].

I'm currently working on the security policies on the linux-kdevops org
to ensure I can trust the pushes to the linux-modules-kpd tree, but
you should be able to now. Once I block random people from sending PR
or pushes to the tree we can run CI on that tree by you just having to push.

But the current coverage sucks.

Luca noted we can run the kmod git tree meson test but the preload
stuff needs to be fixed so we can actually run all the test on that
tree on a VM [4].

Given all the work you are doing, the next thing is to add tests. 
We should also add the kmod git tree to kdevops and just run the meson
test once we can get the module tests to actually run on the VM.

[0] https://github.com/facebookincubator/kernel-patches-daemon
[1] https://patchwork.kernel.org/project/linux-modules/list/
[2] https://github.com/linux-kdevops/kdevops-ci-modules
[3] https://github.com/linux-kdevops/linux-modules-kpd
[4] https://github.com/kmod-project/kmod/blob/master/.github/workflows/main.yml#L92-L98

  Luis

