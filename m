Return-Path: <linux-kbuild+bounces-3550-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DECD6978ED1
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Sep 2024 09:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D5431F26812
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Sep 2024 07:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEB57DA9C;
	Sat, 14 Sep 2024 07:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="T5XcjebT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8A7175B1;
	Sat, 14 Sep 2024 07:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726298407; cv=none; b=FyRydCC/0CusFnj29TJyrWBSk2tXwHiBgSViLnMCEridAPnewdngSAsNWMaM43QCUrrwSBq1YG6nvDyxHRfNncE/3MYfXShFp146m9AJV3DIqm4br7T4tfn/wC60pkecclHDQfs6T8bEBcGnKwbxw0FoIp1UzqpVBPLUZsuQhYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726298407; c=relaxed/simple;
	bh=+nCRBcECe+f7eLWxihkl9KlyRYWxmo7Kggbc1KNnjQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wmq1mVQ6hF2PGd/mWOjM3t7sLGiK2CULPiE+i9/B5GxSBljseY/SHCip+mh2hqS9vVAxkVJ8bpDh8PoqFBAdPN419IaJY7e950TQ3eskEfYvR9zLwxjWf2RbUByjXyfXaCHHyQkYxYkrB1MpmRVbE3O+SdhdUx8rq9L5YWqsEn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=T5XcjebT; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZNbttXLmsVTMJFfGZ6eGNTGy2rEvBvnnhCiM1YadOGs=; b=T5XcjebTzldcSw0eTGWOH00qZf
	1/tC4KrHsifNzy9aqGeOfujkr5GUa/C3rWvyB7zeO8Fj91XU8P5z6bF5KsmE6MCeqPjc+X1eS+fBj
	7mvMnXJWOmncZNBgX89XsijRX0aSNPvoyQ3LexQlx68rDu3v0if8yeDeLK/sZzSgH2L9j4q5Z33Ru
	7ndW+bJcrhu1AU4HJYmCivVwzzzaMzD7FmRfFM6rHYTyXogkWGxf4xBPx/+CBlq8sFYDOhkkSBSWg
	sqgaSg2ER2LF36QtyqCkruf3/DPbOUBLwgT2puhhqJjOk33xos+r7QII+06b2lqDHb5xFwC+GOPtZ
	yyhIwB+w==;
Received: from [2001:9e8:9c6:1501:3235:adff:fed0:37e6] (port=46920 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1spN4T-0088YS-FG;
	Sat, 14 Sep 2024 09:19:53 +0200
Date: Sat, 14 Sep 2024 09:19:42 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Jing Leng <3090101217@zju.edu.cn>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jing Leng <jleng@ambarella.com>
Subject: Re: External modules with O=... (was: Re: [PATCH] kbuild: Fix
 include path in scripts/Makefile.modpost)
Message-ID: <20240914-loutish-crouching-echidna-3bfd6d@lindesnes>
References: <aowpzz4rbedjkwkl7b4a2f5pf2p5cgsu6knsgxnayckhbumxf3@aznrm7oliydb>
 <442e8058.43a4.191dea175d7.Coremail.3090101217@zju.edu.cn>
 <lnizw6jklneisxkhah7ezy4tcrn2wpm52ibh5euz7ipyfansde@kc4onuvrrmxr>
 <mesi5e46iumhgdbvzl2gfwdamtv34baydb5d4pmud4fu7n4dto@fewx4uzbtjl6>
 <CAK7LNATDVN9ukAJdztobZ=aMLvfgE_wW1N_gsB-x3OiRE-Jrog@mail.gmail.com>
 <oli5wymvdxrk4ds54yh65s4cewztn4daxujgjfprzw2f2ozqqi@35kdsvivgrzw>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <oli5wymvdxrk4ds54yh65s4cewztn4daxujgjfprzw2f2ozqqi@35kdsvivgrzw>

On Wed, Sep 11, 2024 at 10:38:58AM -0500, Lucas De Marchi wrote:
> On Wed, Sep 11, 2024 at 04:28:30PM GMT, Masahiro Yamada wrote:
> > On Wed, Sep 11, 2024 at 1:36 PM Lucas De Marchi
> > <lucas.demarchi@intel.com> wrote:
> > > 
> > > On Tue, Sep 10, 2024 at 09:43:14PM GMT, Lucas De Marchi wrote:
> > > >On Wed, Sep 11, 2024 at 09:10:09AM GMT, Jing Leng wrote:
> > > >>>-----Original Messages-----
> > > >>>From: "Lucas De Marchi" <lucas.demarchi@intel.com>
> > > >>>Send time:Tuesday, 09/10/2024 22:00:29
> > > >>>To: "Masahiro Yamada" <masahiroy@kernel.org>
> > > >>>Cc: 3090101217@zju.edu.cn, "Michal Marek" <michal.lkml@markovi.net>, "Nick
> > > >>> Desaulniers" <ndesaulniers@google.com>, "Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>, "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Jing Leng" <jleng@ambarella.com>
> > > >>>Subject: External modules with O=... (was: Re: [PATCH] kbuild: Fix include path in scripts/Makefile.modpost)
> > > >>>
> > > >>>Hi, I was pointed to this thread since I'm trying something similar
> > > >>>in kmod's testsuite. See below.
> > > >>>
> > > >>>On Tue, May 24, 2022 at 02:52:45AM GMT, Masahiro Yamada wrote:
> > > >>>>On Tue, May 17, 2022 at 7:51 PM <3090101217@zju.edu.cn> wrote:
> > > >>>>>
> > > >>>>> From: Jing Leng <jleng@ambarella.com>
> > > >>>>>
> > > >>>>> When building an external module, if users don't need to separate the
> > > >>>>> compilation output and source code, they run the following command:
> > > >>>>> "make -C $(LINUX_SRC_DIR) M=$(PWD)". At this point, "$(KBUILD_EXTMOD)"
> > > >>>>> and "$(src)" are the same.
> > > >>>>>
> > > >>>>> If they need to separate them, they run "make -C $(KERNEL_SRC_DIR)
> > > >>>>> O=$(KERNEL_OUT_DIR) M=$(OUT_DIR) src=$(PWD)". Before running the
> > > >>>>> command, they need to copy "Kbuild" or "Makefile" to "$(OUT_DIR)" to
> > > >>>>> prevent compilation failure.
> > > >>>>>
> > > >>>>> So the kernel should change the included path to avoid the copy operation.
> > > >>>>>
> > > >>>>> Signed-off-by: Jing Leng <jleng@ambarella.com>
> > > >>>>> ---
> > > >>>>>  scripts/Makefile.modpost | 3 +--
> > > >>>>>  1 file changed, 1 insertion(+), 2 deletions(-)
> > > >>>>>
> > > >>>>> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> > > >>>>> index 48585c4d04ad..0273bf7375e2 100644
> > > >>>>> --- a/scripts/Makefile.modpost
> > > >>>>> +++ b/scripts/Makefile.modpost
> > > >>>>> @@ -87,8 +87,7 @@ obj := $(KBUILD_EXTMOD)
> > > >>>>>  src := $(obj)
> > > >>>>>
> > > >>>>>  # Include the module's Makefile to find KBUILD_EXTRA_SYMBOLS
> > > >>>>> -include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
> > > >>>>> -             $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
> > > >>>>> +include $(if $(wildcard $(src)/Kbuild), $(src)/Kbuild, $(src)/Makefile)
> > > >>>>>
> > > >>>>>  # modpost option for external modules
> > > >>>>>  MODPOST += -e
> > > >>>>> --
> > > >>>>> 2.17.1
> > > >>>>>
> > > >>>>
> > > >>>>
> > > >>>>I do not think "M=$(OUT_DIR) src=$(PWD)" is the official way,
> > > >>>>but this patch is a clean up.
> > > >>>
> > > >>>I tried what is in this patch and also tried to find an official way in
> > > >>>the docs.
> > 
> > 
> > There is no official way.
> > 
> > > >>>
> > > >>>In kmod's testsuite we build dummy kernel modules to exercise the API.
> > > >>>https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/tree/testsuite/module-playground
> > > >>>
> > > >>>This works:
> > > >>>     make -C /lib/modules/$(uname -r)/build M=$PWD
> > > >>>
> > > >>>This doesn't:
> > > >>>     make -C /lib/modules/$(uname -r)/build M=$PWD O=/tmp/kmod_test_modules
> > 
> > 
> > 
> > O= points the output directory of the kernel,
> > not the output directory of the external modules.
> > 
> > 
> > /lib/modules/$(uname -r)/build
> > is the clean source tree.
> > 
> > /tmp/kmod_test_modules
> > contains the build artifacts of vmlinux and
> > in-tree modules.
> > 
> > Then, the command you gave would work.
> > 
> > 
> > 
> > 
> > 
> > 
> > > >>>
> > > >>>I also tried the variants above with setting src, but all of them give
> > > >>>me errors - I used 6.10 and 6.11-rc7 for these tests.
> > > >>>
> > > >>>Is there a way to do this?
> > > >>>
> > > >>>thanks
> > > >>>Lucas De Marchi
> > > >>>
> > > >>>>
> > > >>>>Applied to linux-kbuild. Thanks.
> > > >>>>
> > > >>>>
> > > >>>>--
> > > >>>>Best Regards
> > > >>>>Masahiro Yamada
> > > >>
> > > >>Hi Masahiro,
> > > >
> > > >I guess you meant Lucas :)
> > > >
> > > >>
> > > >>I think your intention is to separate the source code from the compiled output.
> > > >>The correct command should be:
> > > >>   make -C /lib/modules/$(uname -r)/build src=$PWD M=/tmp/kmod_test_modules
> > > >
> > > >oh, looks like this works. Apparently my mistake was trying to set O=
> > > >like I normally do for in-tree modules.
> > > 
> > > spoke too early... It worked because I was in another machine pointing
> > > to a 6.8 kernel. It seems like something broke between 6.9 and 6.10.
> > > 
> > > Running a quick bisect, it's pointing to this commit:
> > > 9a0ebe5011f4 ("kbuild: use $(obj)/ instead of $(src)/ for common pattern rules")
> > 
> > 
> > Overriding 'src' from the command is not allowed. That's why.
> > 
> > 
> > > Error like below:
> > > 
> > > $ make -j$(nproc) -C ~/p/linux-dim/src MddPWD/build srcx=$PWD
> > > make: Entering directory '/home/ldmartin/p/linux-dim/src'
> > > make[2]: *** No rule to make target '/home/ldmartin/p/kmod/testsuite/module-playground/build/mod-simple.o', needed by '/home/ldmartin/p/kmod/testsuite/module-playground/build/'.  Stop.
> > > make[1]: *** [/home/ldmartin/p/linux-dim/src/Makefile:1922: /home/ldmartin/p/kmod/testsuite/module-playground/build] Error 2
> > > make: *** [Makefile:240: __sub-make] Error 2
> > > make: Leaving directory '/home/ldmartin/p/linux-dim/src'
> > 
> > 
> > I suggested M=relative-path + VPATH=
> > but I do not know what you want to achieve.
> > 
> > https://lore.kernel.org/linux-kbuild/CAK7LNATGGibmjZzYX_A2SkJthmOPbKw2K3R7JYuHTWzgGL2Zjg@mail.gmail.com/
> 
> but that is only for in-tree modules, not external modules, right?
> Quick reproducer on what I expected would work:
> 
> 	git clone https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git
> 	cd kmod/testsuite/module-playground
> 	make -C $KDIR M=$PWD O=$PWD/build
> 
> So... did I get the below statement right?
> 
> 	There never was an official way to build external modules with
> 	source and build in different directories. Up until 6.9 we
> 	could pass `-C <kernel_srcdir> M=<mod_builddir> src=<mod_srcdir>`
> 	for unofficial way. After that there's no alternative.

yes, AFAICT your summary describes the situation quite precisely.

Kind regards,
Nicolas

