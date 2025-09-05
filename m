Return-Path: <linux-kbuild+bounces-8748-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A51CDB461A7
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 20:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A48A14E190F
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 18:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6ADF2BE7B5;
	Fri,  5 Sep 2025 18:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Imvi4AOT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708072AD25;
	Fri,  5 Sep 2025 18:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757095382; cv=none; b=sTDEPdPgSgZg+NQn3p3KAGHfZ7SnESbsX/Xyc5niEoGVY41dXDfGn0UjW70jf2/vmAYos29xS2qzopvs3ENucSRyJXsZhuw7d2whmVnwa0gbWde+4HAKQSTjrUeJlQdhlyruTpy2E5gxe4u2fSDVI1wkyOHLFpJmMW5OjBFhGPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757095382; c=relaxed/simple;
	bh=hAJ4x2W+ROFMjcNY1H+cl3OVZvsIOc93Nsd1wiY/2aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjDEG4D9o1UwsSDr/KCAwXeae/WjrlKFOHtl2JPLqrr+383f/SOwMghub9FIklmG1nYD9Y3M5gVOA2yZWVKOrThJNOltcnWztT+nsukdcL43H4q52eFgRZKTECqH2NFYQIc8lCcBY4/EYEQhHNJckW7XE/3KsM/z6WJElXmMyrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Imvi4AOT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34696C4CEF1;
	Fri,  5 Sep 2025 18:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757095381;
	bh=hAJ4x2W+ROFMjcNY1H+cl3OVZvsIOc93Nsd1wiY/2aE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Imvi4AOTOGUvNfESIb6chOwQnvzxZAyS9BmPWSaKINeEifc3n6FVzsp88c+h+/wdR
	 4EgFVZpGUrx+acUYbYFiAXRgESG8xI1eAzxPmiNV2nwgYFQ3oPO+9zxvZ7SkYbaonI
	 leLkOR57WCVdib7UAKKu+cZXPghGh4cuS/uIkzGMu0AUsyDVrRRIT1dd1l5mwFH6mX
	 sZ5dZQxg++4ZEd261+NHxNlael/23r0U6nbK1BBgwO8iRWomA84+TiFFNyGcN5ycF0
	 L3up9g5rZcqE4fxG6sm9KdtLb3JPN8NsWvR2orjIB/oqyWROS9ANnb/ZmRKUs0R91m
	 EPB8nd9Rajaxw==
Date: Fri, 5 Sep 2025 11:02:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Paul Barker <paul@pbarker.dev>
Cc: Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gen_compile_commands: Look in KBUILD_OUTPUT if set
Message-ID: <20250905180256.GA319413@ax162>
References: <20250905-gen_compile_commands-v1-1-9f5194542d4d@pbarker.dev>
 <3fya5rij6amcwt36jthyezkzov44m6rdvlacymqfpbkcmzrnw4@fymsxhcqq6tj>
 <e09dce93d521a89e3820a91e7c319d680cae203f.camel@pbarker.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e09dce93d521a89e3820a91e7c319d680cae203f.camel@pbarker.dev>

Hi Paul

On Fri, Sep 05, 2025 at 06:26:32PM +0100, Paul Barker wrote:
> On Fri, 2025-09-05 at 09:34 -0700, Justin Stitt wrote:
> > On Fri, Sep 05, 2025 at 11:17:43AM +0100, Paul Barker wrote:
> > > If someone is already using the KBUILD_OUTPUT environment variable to
> > > specify the directory where object files are placed, they shouldn't need
> > > to repeat the same information to gen_compile_commands.py.
> > > 
> > > Signed-off-by: Paul Barker <paul@pbarker.dev>
> > > ---
> > >  scripts/clang-tools/gen_compile_commands.py | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> > > index 96e6e46ad1a702cb0fad5d524a9a02d222b236ec..7b94a2ffba0b4d5f1290b51bd602fb3f33acce6a 100755
> > > --- a/scripts/clang-tools/gen_compile_commands.py
> > > +++ b/scripts/clang-tools/gen_compile_commands.py
> > > @@ -39,8 +39,9 @@ def parse_arguments():
> > >      parser = argparse.ArgumentParser(description=usage)
> > >  
> > >      directory_help = ('specify the output directory used for the kernel build '
> > > -                      '(defaults to the working directory)')
> > > -    parser.add_argument('-d', '--directory', type=str, default='.',
> > > +                      '(defaults to $KBUILD_OUTPUT (if set) or the working directory)')
> > > +    parser.add_argument('-d', '--directory', type=str,
> > > +                        default=os.environ.get('KBUILD_OUTPUT', '.'),
> > >                          help=directory_help)
> > >  
> > >      output_help = ('path to the output command database (defaults to ' +
> > > 
> > 
> > Thinking out loud: It might make sense to also change the default output
> > path in some cases but not in all cases. For my clangd setup in vim, it
> > does some discovery for a compile_commands.json and I have some
> > different ones in various build-* directories -- I guess it'd be cool if
> > they were automatically placed in their appropriate spot. With all that
> > being said probably YAGNI.
> 
> I think it makes sense to place the output file in the current directory by
> default if you run gen_compile_commands.py directly.
> 
> The `make compile_commands.json` target places it in the output directory, and

Yeah, I think it should be made clearer in the commit message that this
change should only impact people who run the script manually. When it is
generated through the compile_commands.json make target (which is the
preferred way IMO), KBUILD_OUTPUT should already be respected because
gen_compile_commands.py is run with $(objtree) as the current working
directory.

I am fine with the actual contents of the change though, it does not
feel like much of a burden to support this scenario.

> `make rust-analyzer` does the same for the rust-project.json file. I did think
> about whether we should change these, since clangd and rust-analyzer look for
> the relevant files in the source tree or its parent directories. But people may
> be using multiple output directories for different configs or archs, so writing
> the files to the source tree isn't a good default for everyone.

Yeah, I do not think this should be generated in the source tree
unconditionally since those commands are tied to that build directory
due to CONFIG_ options and such.

Cheers,
Nathan

