Return-Path: <linux-kbuild+bounces-5037-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 286A89E868D
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Dec 2024 17:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF6C61884C52
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Dec 2024 16:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D642C15ECD7;
	Sun,  8 Dec 2024 16:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JObvEVMr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFA914658C;
	Sun,  8 Dec 2024 16:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733675762; cv=none; b=UCHKe4334KIk+bIT2ZGv53pkg16KClwI5wf6XRwIwQ3q5NaOmeBYG5CRCZwMxgHgDLcfWWDvL/+e81rYHuT4f1Btx/17u9jRSHHmCdHWAH7hklz/cs+A70ek6swq/NLn/IuD1ifKgZM6jAQ5yB+nv0XqUbtnDkp2xgzOBdjapRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733675762; c=relaxed/simple;
	bh=9RO2zHeCmsiZrM8LnP7f43r9twDntIzP7k1BH5Stuj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMYTIJORm2Ujr1lPKWhU7IY2Ba/aPHWhbz4vs+0QgeGTKGX1zLUEztd3gM43HgipJY5A6z6KVJJt5lugGh8m7HXUnL+Jhs2hqq68wvGKAU/s3ki2JfH81vLkNdSCjeCyL5Zq38xyDtGsPmV0PkYpu+8vjflZJfjf1N420382AIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JObvEVMr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F38CC4CED2;
	Sun,  8 Dec 2024 16:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733675762;
	bh=9RO2zHeCmsiZrM8LnP7f43r9twDntIzP7k1BH5Stuj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JObvEVMrtvnb2iHeyDi87VgFaBGnrnNpvSEBAoax6VepzL6uqOBG9a7JEPkIrSJG0
	 SaEKovyEEj0EeKSgAH1RBGGv+2O857y+5ctXGbHS4BsCaod+fwAhGisdb2UNY4aNP6
	 c0ES8c0TsluqvLeL0JegFvW2Pkg2ZR94p0xvI9KKyxFLzjXOb4fUDECtftN6HrJgiw
	 YLWZD/PTfI/OQX3yjD+Nizgankk+/3i7tT+b0wKSXx3518Opl5XeJU8Ry05/B7DZpw
	 qOv5mgy0lmGXP7iK4Tgz2e6kV8X4rZwjNASF1u4r2K1FiB+i01krVLpKJs5cu9Amd+
	 AZBdUbBLF33Ig==
Date: Sun, 8 Dec 2024 18:35:57 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH rdma-next] kbuild: Respect request to silent output when
 merging configs
Message-ID: <20241208163557.GA1245331@unreal>
References: <e534ce33b0e1060eb85ece8429810f087b034c88.1733234008.git.leonro@nvidia.com>
 <CAK7LNATU2OKEWh6p9QuUXtYmYmqTkN5nspBq9DbCh9yUjqW5xA@mail.gmail.com>
 <20241204084943.GM1245331@unreal>
 <CAK7LNATGbTxu9cYGfW6FK5VFfJ2+ut_e1dSFOfo+q6CgM4XHtQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATGbTxu9cYGfW6FK5VFfJ2+ut_e1dSFOfo+q6CgM4XHtQ@mail.gmail.com>

On Sun, Dec 08, 2024 at 11:49:12PM +0900, Masahiro Yamada wrote:
> On Wed, Dec 4, 2024 at 5:49 PM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > On Wed, Dec 04, 2024 at 05:25:50PM +0900, Masahiro Yamada wrote:
> > > On Tue, Dec 3, 2024 at 10:55 PM Leon Romanovsky <leon@kernel.org> wrote:
> > > >
> > > > From: Leon Romanovsky <leonro@nvidia.com>
> > > >
> > > > Builds with -s option (silent) are supposed to silence all output
> > > > which is not an error. It is the case for target builds but not
> > > > for configs. These builds generate prints like this:
> > > >
> > > > ➜  kernel git:(rdma-next) make -s defconfig debug.config
> > > >  Using .config as base
> > > >  Merging ./kernel/configs/debug.config
> > > >  #
> > > >  # merged configuration written to .config (needs make)
> > > >  #
> > > >  ...
> > > >  Value of CONFIG_FUNCTION_TRACER is redefined by fragment ./kernel/configs/debug.config:
> > > >  Previous value: # CONFIG_FUNCTION_TRACER is not set
> > > >  New value: CONFIG_FUNCTION_TRACER=y
> > > >  ----
> > > >
> > > > Let's honor -s option and hide all non-error output.
> > >
> > >
> > > Is it necessary to add the --quiet option to every script?
> > >
> > > Kbuild already provides a generic way to suppress the stdout
> > > with 'make -s'.
> > >
> > > The following code works for me.
> > > 'make defconfig debug.config' is as verbose as before.
> > > 'make -s defconfig debug.config' is really silent.
> >
> > This is exactly what I'm doing. I'm using -s option and added -q to very
> > specific merge_config script, because "-s" is already in use in that
> > script.
> >
> > Before my change on 40384c840ea1 ("Linux 6.13-rc1"):
> > [leonro@e534d5fa4327 kernel]$ make -s defconfig debug.config
> > Using .config as base
> > Merging ./kernel/configs/debug.config
> > Value of CONFIG_DYNAMIC_DEBUG is redefined by fragment ./kernel/configs/debug.config:
> > Previous value: # CONFIG_DYNAMIC_DEBUG is not set
> > New value: CONFIG_DYNAMIC_DEBUG=y
> >
> > Value of CONFIG_PRINTK_CALLER is redefined by fragment ./kernel/configs/debug.config:
> > Previous value: # CONFIG_PRINTK_CALLER is not set
> > New value: CONFIG_PRINTK_CALLER=y
> > ...
> >
> > After my change:
> > [leonro@4dd2c2078dff kernel]$ make -s defconfig debug.config <--- silent
> 
> 
> Not sure if you checked the attached code diff in my previous reply.
> 
> To make my question clearer, does this suffice your needs?
> https://lore.kernel.org/all/20241208144622.605523-1-masahiroy@kernel.org/T/#u

Unfortunately no, as both my development suite and our CI rely on
merge_config script to create right config.

In CI, they run add very specific config options to already
well-established .config.
In my development suite, I'm removing extra options with merge_config
script.

        subprocess.call(cmd + ['defconfig', 'kvm_guest.config', 'nopm.config', 'debug.config'])
        subprocess.call(['scripts/kconfig/merge_config.sh', '-y', '-m', '-q',
                         '.config', '/plugins/kernel.config'])
        subprocess.call(cmd + ['olddefconfig'])

https://github.com/Mellanox/mkt/blob/master/plugins/do-build.py#L19
https://github.com/Mellanox/mkt/commit/26d7cbd776f508ab506f6d33cfe0e9b0bf44d557

I need both chunks, silence make ... and silence merge_config script.

Thanks

> 
> 
> -- 
> Best Regards
> Masahiro Yamada

