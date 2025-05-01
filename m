Return-Path: <linux-kbuild+bounces-6841-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3538AA618C
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 18:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96EB43A86F3
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 16:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87A320C47C;
	Thu,  1 May 2025 16:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="GKucUTUN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337391C173F;
	Thu,  1 May 2025 16:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746118139; cv=none; b=ny/53gPZHmF1TFfQgMIG+RwUJlI6cgBKONqbnnaCbJkXHBXx2GwykFq63FHX1J/2gTgbmiq2pwwz+5Ooe0QNHL5YL1AwL04zJLE7YJVBWweE06x5p0xk7jszEeY/SPsbKEG735fljMd6C71kj8U5178T/ARIaVolk5y6MYxLutc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746118139; c=relaxed/simple;
	bh=n+rp/1cfKWUVbAn2ayQIlXtUE0b/J4JdBnNRkRwb6x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmZAr/Wtw052OELEaKT/8jRtgNHE5Va96xaUmwOklI4cjNL+omoBBPKSn/8EpG6rHXVoNaS5xZNBRpHTXUnzFM4/K2D0+a3UTKAdYGUKMQLyIgTAhJtk9JB5LKusv4rEGtghixM+agoz5+u/Rwrh3xeTFcN48I2EpoA9AShb0bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=GKucUTUN; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1746118134;
	bh=n+rp/1cfKWUVbAn2ayQIlXtUE0b/J4JdBnNRkRwb6x8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GKucUTUNMeD2bPB11ZzjZiqIVgo4OjcUcIqicF632tFjAi8qs9kmxPN6wwBxRtzAj
	 9naGTZeY9bn+2boxu52Z/zGFxoKe48WMyR92EdspNOUfVwzRToN5Y7VVNMewbE9XtJ
	 4Zk7wE8EZshmiKS8cyGJLqMsaKSQnUggdfIQsg3g=
Date: Thu, 1 May 2025 18:48:52 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Ben Hutchings <ben@decadent.org.uk>, Peter Oberparleiter <oberpar@linux.ibm.com>, 
	MPTCP Linux <mptcp@lists.linux.dev>
Subject: Re: [PATCH v2] kbuild: make all file references relative to source
 root
Message-ID: <e3ccb1ef-1b7a-4069-960f-a6fc5353c1ce@t-8ch.de>
References: <20250315-kbuild-prefix-map-v2-1-00e1983b2a23@weissschuh.net>
 <edc50aa7-0740-4942-8c15-96f12f2acc7e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edc50aa7-0740-4942-8c15-96f12f2acc7e@kernel.org>

Hi Matthieu,

On 2025-04-29 18:12:29+0200, Matthieu Baerts wrote:
> Hi Thomas, Masahiro,
> 
> +Cc Peter Oberparleiter, MPTCP ML
> 
> On 15/03/2025 14:20, Thomas Weißschuh wrote:
> > -fmacro-prefix-map only affects __FILE__ and __BASE_FILE__.
> > Other references, for example in debug information, are not affected.
> > This makes handling of file references in the compiler outputs harder to
> > use and creates problems for reproducible builds.
> > 
> > Switch to -ffile-prefix map which affects all references.
> > 
> > Also drop the documentation section advising manual specification of
> > -fdebug-prefix-map for reproducible builds, as it is not necessary
> > anymore.
> > 
> > Suggested-by: Ben Hutchings <ben@decadent.org.uk>
> > Link: https://lore.kernel.org/lkml/c49cc967294f9a3a4a34f69b6a8727a6d3959ed8.camel@decadent.org.uk/
> > Acked-by: Borislav Petkov (AMD) <bp@alien8.de> # arch/x86/
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> 
> Thank you for having worked on that!
> 
> (...)
> 
> > diff --git a/Makefile b/Makefile
> > index 5c333682dc9142b1aacfe454a5c77f5923554b7d..4f920187cee658ae4d1b807fca365f6994274828 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1067,7 +1067,7 @@ endif
> >  
> >  # change __FILE__ to the relative path to the source directory
> >  ifdef building_out_of_srctree
> > -KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srcroot)/=)
> > +KBUILD_CPPFLAGS += $(call cc-option,-ffile-prefix-map=$(srcroot)/=)
> >  KBUILD_RUSTFLAGS += --remap-path-prefix=$(srcroot)/=
> >  endif
> 
> Today, I noticed that my CI for the MPTCP subsystem couldn't produce
> code coverage files like before: the source files are not found. A 'git
> bisect' pointed me to this patch. Reverting it seems to fix the issue.
> 
> 
> My CI is building the kernel out of the source tree, in ".virtme/build".
> Before and after this patch, GCOV seems to do its job properly.
> Capturing GCOV data with this lcov command seems OK too:
> 
>   lcov --capture --keep-going -j "${INPUT_CPUS}" \
>      --rc geninfo_unexecuted_blocks=1 \
>      --include '/net/mptcp/' \
>      --function-coverage --branch-coverage \
>      -b "${PWD}/.virtme/build" -o kernel.lcov
> 
> But after this patch, lcov complains some files are not found, e.g.
> 
>   ERROR: (source) unable to open
> ${WORKDIR}/.virtme/build/net/mptcp/ctrl.c: No such file or directory
> 
> 
> The output file is different: the path to the source file is wrong
> because it points to the build dir. Instead of ...
> 
>   SF:${WORKDIR}/net/mptcp/ctrl.c
> 
> ... now I have ...
> 
>   SF:${WORKDIR}/.virtme/build/net/mptcp/ctrl.c
> 
> 
> Are there modifications needed on GCOV side to adapt to the behaviour
> change introduced by this patch? Or something else needed on the
> userspace side?

I'd like to focus on the report from Ville Syrjälä [0] first.
While it is easier to reproduce and investigate, I suspect the solution
found there will also work for your usecase.


Thomas

[0] https://lore.kernel.org/lkml/aBEttQH4kimHFScx@intel.com/

