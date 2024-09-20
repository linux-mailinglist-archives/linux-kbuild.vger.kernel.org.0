Return-Path: <linux-kbuild+bounces-3657-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC2897D653
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 15:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDC9E282AA5
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 13:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F59217965E;
	Fri, 20 Sep 2024 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="WRlmsuBp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC06515351B;
	Fri, 20 Sep 2024 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726839687; cv=none; b=QL4te2cD3BL+wmQLGBuvoMf5Zp86i6vSq6bsU95wkEZVMBnCQnRA92utUd4Nk5kCrumXB/vykw4SrV+i1fvRqqn6diDM8JsXgTnpTlimLjhBhufDjRNkDjusPRAFEm0w/CyHXqacZwGd/ppLjkJ/1CKQUy4bTvRwZCpWxTNrYxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726839687; c=relaxed/simple;
	bh=u78G29czlytOSKsfZklnm90Ws1hb193EQLcLcLeOxAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T85ZD88QR/+wFXWnWjXbyHkeO85U5ZBuvXFs7aVk4feDVmqyf9Jqi5M6NT/Gdp4AAFqXdFzWfwCmH6cmVbQPMZKwHvo1Gms5p8uqima3erst09FQFFMCuNoxpfv8TCxZzbRmvlqcL2VcEOlDjctPcjb8s/uqxgffDdSgQoYSihk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=WRlmsuBp; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1726839682; bh=u78G29czlytOSKsfZklnm90Ws1hb193EQLcLcLeOxAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WRlmsuBpqnU+vd98F6clO5894MlggtF+7AX1h6YJTuTvKUQcX0g0PHLsDu3NvVdVY
	 AKcEXM547n5P0sJT/785NZCbd+pgz8MHxpLVpkdBfl9EI8r/+ajROOCuAwzKrByljc
	 xy3TYrBqG7nzBZorJotsqTsP1DAeJQIfX+yMmHtE=
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri, 20 Sep 2024 15:41:22 +0200 (CEST)
Received: from l-nschier-nb (unknown [83.68.141.146])
	by mail-auth.avm.de (Postfix) with ESMTPSA id 19FD2807F5;
	Fri, 20 Sep 2024 15:41:22 +0200 (CEST)
Date: Fri, 20 Sep 2024 15:41:20 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 00/23] kbuild: support building external modules in a
 separate build directory
Message-ID: <Zu17gH-A1rAAIS_-@l-nschier-nb>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <Zu1Q1yi4bs2plCxl@l-nschier-nb>
 <CAK7LNAS7D_d+Kz5+rk3OuN0StY=d3iOOa4Un12HYyF4w89LbTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAS7D_d+Kz5+rk3OuN0StY=d3iOOa4Un12HYyF4w89LbTQ@mail.gmail.com>
X-purgate-ID: 149429::1726839682-DDD1300A-88616040/0/0
X-purgate-type: clean
X-purgate-size: 5711
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Fri, Sep 20, 2024 at 09:58:47PM +0900, Masahiro Yamada wrote:
> On Fri, Sep 20, 2024 at 7:39 PM Nicolas Schier <n.schier@avm.de> wrote:
> >
> > On Tue, Sep 17, 2024 at 11:16:28PM +0900, Masahiro Yamada wrote:
> > >
> > > There has been a long-standing request to support building external
> > > modules in a separate build directory.
> >
> > Thanks a lot, you are making several of my colleages very happy with
> > your patch set!
> >
> > > The first half is cleanups of documents and Makefiles.
> > >
> > > The last part adds KBUILD_EXTMOD_OUTPUT (MO=).
> > > This is too big changes, and too late for the current MW.
> > > (I did not test kselftest at all.)
> > > I hope people test this and may uncover some issues.
> >
> > I'm not through all the patches in detail yet, just one observation beforehand:
> >
> >     $ make KBUILD_OUTPUT=build allnoconfig
> >     $ ./scripts/config --file build/.config --enable modules --enable accessibility
> >     $ make KBUILD_OUTPUT=build olddefconfig
> >     $ make KBUILD_OUTPUT=build
> >     $ make KBUILD_OUTPUT=build CONFIG_SPEAKUP=m MO=/tmp/build M=~+/drivers/accessibility/speakup modules
> >     /home/nschier/src/kbuild-review/drivers/accessibility/speakup/genmap.c:23:10: fatal error: mapdata.h: No such file or directory
> >        23 | #include "mapdata.h"
> >           |          ^~~~~~~~~~~
> >     compilation terminated.
> >     make[3]: *** [/home/nschier/src/kbuild-review/scripts/Makefile.host:133: genmap.o] Error 1
> >     make[3]: *** Waiting for unfinished jobs....
> >     make[2]: *** [/home/nschier/src/kbuild-review/Makefile:1971: .] Error 2
> >     make[1]: *** [/home/nschier/src/kbuild-review/Makefile:251: __sub-make] Error 2
> >     make: *** [Makefile:251: __sub-make] Error 2
> >     [exit code 2]
> >
> > If I add "EXTRA_CFLAGS=-I${MO} and EXTRA_HOSTCFLAGS=-I${MO}" to the module
> > build command, it works as expected.
> >
> > Patching this into kbuild works for me, too, but I haven't checked whether it
> > breaks some other scenarios:
> >
> > diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> > index e01c13a588dd..056c7da2776f 100644
> > --- a/scripts/Makefile.host
> > +++ b/scripts/Makefile.host
> > @@ -97,10 +97,13 @@ hostrust_flags = --out-dir $(dir $@) --emit=dep-info=$(depfile) \
> >                   $(HOSTRUSTFLAGS_$(target-stem))
> >
> >  # $(objtree)/$(obj) for including generated headers from checkin source files
> > -ifeq ($(KBUILD_EXTMOD),)
> >  ifdef building_out_of_srctree
> > +ifeq ($(KBUILD_EXTMOD),)
> >  hostc_flags   += -I $(objtree)/$(obj)
> >  hostcxx_flags += -I $(objtree)/$(obj)
> > +else
> > +hostc_flags   += -I $(CURDIR)
> > +hostcxx_flags   += -I $(CURDIR)
> >  endif
> >  endif
> >
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 1bdd77f42289..428a9eb74381 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -190,11 +190,15 @@ endif
> >
> >  # $(src) for including checkin headers from generated source files
> >  # $(obj) for including generated headers from checkin source files
> > -ifeq ($(KBUILD_EXTMOD),)
> >  ifdef building_out_of_srctree
> > +ifeq ($(KBUILD_EXTMOD),)
> >  _c_flags   += $(addprefix -I, $(src) $(obj))
> >  _a_flags   += $(addprefix -I, $(src) $(obj))
> >  _cpp_flags += $(addprefix -I, $(src) $(obj))
> > +else
> > +_c_flags   += $(addprefix -I, $(src) $(obj) $(CURDIR))
> > +_a_flags   += $(addprefix -I, $(src) $(obj) $(CURDIR))
> > +_cpp_flags += $(addprefix -I, $(src) $(obj) $(CURDIR))
> >  endif
> >  endif
> >
> > Is '-I$(MO)' in CFLAGS/HOSTCFLAGS is something we should support by
> > default, or should this be added to the external module's Makefile by
> > the respective developers themselves?
> >
> > Kind regards,
> > Nicolas
> 
> 
> 
> We can fix it more simply.

Ah, yes.

> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index e01c13a588dd..c1dedf646a39 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -96,12 +96,10 @@ hostrust_flags = --out-dir $(dir $@)
> --emit=dep-info=$(depfile) \
>                   $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
>                   $(HOSTRUSTFLAGS_$(target-stem))
> 
> -# $(objtree)/$(obj) for including generated headers from checkin source files
> -ifeq ($(KBUILD_EXTMOD),)
> +# $(obj) for including generated headers from checkin source files
>  ifdef building_out_of_srctree
> -hostc_flags   += -I $(objtree)/$(obj)
> -hostcxx_flags += -I $(objtree)/$(obj)
> -endif
> +hostc_flags   += -I $(obj)
> +hostcxx_flags += -I $(obj)
>  endif
> 
>  #####
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 1bdd77f42289..d8ce0f59fd17 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -190,13 +190,11 @@ endif
> 
>  # $(src) for including checkin headers from generated source files
>  # $(obj) for including generated headers from checkin source files
> -ifeq ($(KBUILD_EXTMOD),)
>  ifdef building_out_of_srctree
>  _c_flags   += $(addprefix -I, $(src) $(obj))
>  _a_flags   += $(addprefix -I, $(src) $(obj))
>  _cpp_flags += $(addprefix -I, $(src) $(obj))
>  endif
> -endif
> 
>  # If $(is-kernel-object) is 'y', this object will be linked to
> vmlinux or modules
>  is-kernel-object = $(or $(part-of-builtin),$(part-of-module))
> 
> 
> 
> 
> 
> However, I'd rather fix each Makefile
> to add necessary include paths explicitly.

Sure, clearly makes sense.  Especially as the explicit include path
addition is also as simple as:

    HOSTCFLAGS_genmap.o += -I $(obj)
    CFLAGS_main.o += -I $(obj)

Kind regards,
Nicolas

