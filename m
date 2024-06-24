Return-Path: <linux-kbuild+bounces-2241-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0B7914824
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Jun 2024 13:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C37AD1F241DF
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Jun 2024 11:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2512D13958F;
	Mon, 24 Jun 2024 11:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="PfhUcKS3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE00137769
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Jun 2024 11:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227408; cv=none; b=qpAnDmOgnVJI0qTPcwYwCan0JJ1Q9xBixxMio662rB75MzgMdS4TlsKdgb1TdTiBWFE6L+lkLFgm8sfzJgHibzbeZ/MlMf1PWbecsVkRku74mJ8MzU0/Rv0b/shq2uLct4nQjsAWhGWROHz73LDNHmPPpMbjdInL+J4VJRQagl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227408; c=relaxed/simple;
	bh=NIJpIVaIGRgqrAVFxWDDsZmOatrTFN0nv0zNK77uorY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BP//fB16LujHFnxmA04dUP9PKjDv/qTMQSJYGp4hZbM+QjPW2XRxa25FV2cXGjZh0XstDBMRyoc1cqF6Eo0I0CF+RN/DLRskPMCuHQkXRTYiFmIvPjoNun3Ds3pzuy3uM+Wxij61IN2VNf13uxRO0ncNYRT9663xYEUdbmoobf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=PfhUcKS3; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1719227057; bh=NIJpIVaIGRgqrAVFxWDDsZmOatrTFN0nv0zNK77uorY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PfhUcKS3kDxml/qMhX+TbaGgavPS5JQlhvcWTaCi++xUzpVkjx60yVTuoNDW8EKNy
	 sLgZhdwSpmIBpXcIBsbKujrY3POFWawlWVd64yxDuNsLavg5uurZQPw1SuZyQgz+P4
	 MYUXgtD6+M6AVntKw7Xb0OyBEHF+k4gCOoR4sRtA=
Received: from mail-auth.avm.de (unknown [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Mon, 24 Jun 2024 13:04:17 +0200 (CEST)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 4883A8063C;
	Mon, 24 Jun 2024 13:04:18 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 3B44A1840F0; Mon, 24 Jun 2024 13:04:18 +0200 (CEST)
Date: Mon, 24 Jun 2024 13:04:18 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Rolf Eike Beer <eb@emlix.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: "make xconfig" fails =?utf-8?Q?with_?=
 =?utf-8?B?Ik5vIHJ1bGUgdG8gbWFrZSB0YXJnZXQg4oCmL3Fjb25mLW1vYy5jYyDigKYi?=
Message-ID: <20240624-remarkable-hog-of-aurora-fefff1@buildd>
References: <5792762.DvuYhMxLoT@devpool47.emlix.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5792762.DvuYhMxLoT@devpool47.emlix.com>
X-purgate-ID: 149429::1719227057-72FCBE4F-D18E6261/0/0
X-purgate-type: clean
X-purgate-size: 3939
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Mon, Jun 24, 2024 at 10:56:41AM +0200, Rolf Eike Beer wrote:
> $ make O=~/repos/build/linux/ xconfig V=1
> 
> make -f linux/scripts/Makefile.build obj=scripts/kconfig xconfig
> # HOSTCXX scripts/kconfig/qconf.o
>   g++ -Wp,-MMD,scripts/kconfig/.qconf.o.d -Wall -O2    -std=c++11 -fPIC -I/usr/include/qt6/QtCore -I/usr/include/qt6 -DQT_CORE_LIB -I/usr/lib64/qt6/mkspecs/linux-g++ -I/usr/include/qt6/QtGui -DQT_GUI_LIB -I/usr/include/qt6/QtWidgets -DQT_WIDGETS_LIB -std=c++17 -I ./scripts/kconfig -c -o scripts/kconfig/qconf.o linux/scripts/kconfig/qconf.cc
> make[3]: *** No rule to make target 'linux/scripts/kconfig/qconf-moc.cc', needed by 'scripts/kconfig/qconf-moc.o'.  Stop.

Thanks for your report.  I can reproduce it and bisect led me to commit
b1992c3772e6 ("kbuild: use $(src) instead of $(srctree)/$(src) for
source directory", 2024-04-27).  We missed to adjust the host-cxxobjs
rule appropriately; this should fix the issue with less effort:

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index d35f55e0d141..e85be7721a48 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -146,5 +146,5 @@ $(call multi_depend, $(host-cxxmulti), , -objs -cxxobjs)
 # Create .o file from a single .cc (C++) file
 quiet_cmd_host-cxxobjs = HOSTCXX $@
       cmd_host-cxxobjs = $(HOSTCXX) $(hostcxx_flags) -c -o $@ $<
-$(host-cxxobjs): $(obj)/%.o: $(src)/%.cc FORCE
+$(host-cxxobjs): $(obj)/%.o: $(obj)/%.cc FORCE
        $(call if_changed_dep,host-cxxobjs)

I am going to send a proper patch.

Kind regards,
Nicolas





> The culprit seems to be 0e912c03208075b95ea726076bf1b45db8419bc2. If I revert 
> this like the following I'm able to do "make xconfig" again:
> 
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -198,22 +198,22 @@ $(addprefix $(obj)/, mconf.o $(lxdialog)): | $(obj)/mconf-cflags
>  
>  # qconf: Used for the xconfig target based on Qt
>  hostprogs      += qconf
> -qconf-cxxobjs  := qconf.o qconf-moc.o
> +qconf-cxxobjs  := qconf.o
>  qconf-objs     := images.o $(common-objs)
>  
>  HOSTLDLIBS_qconf         = $(call read-file, $(obj)/qconf-libs)
>  HOSTCXXFLAGS_qconf.o     = -std=c++11 -fPIC $(call read-file, $(obj)/qconf-cflags)
> -HOSTCXXFLAGS_qconf-moc.o = -std=c++11 -fPIC $(call read-file, $(obj)/qconf-cflags)
>  $(obj)/qconf: | $(obj)/qconf-libs
> -$(obj)/qconf.o $(obj)/qconf-moc.o: | $(obj)/qconf-cflags
> +$(obj)/qconf.o: | $(obj)/qconf-cflags
> +$(obj)/qconf.o: $(obj)/qconf.moc
>  
>  quiet_cmd_moc = MOC     $@
> -      cmd_moc = $(call read-file, $(obj)/qconf-bin)/moc $< -o $@
> +      cmd_moc = $(call read-file, $(obj)/qconf-bin)/moc -i $< -o $@
>  
> -$(obj)/qconf-moc.cc: $(src)/qconf.h FORCE | $(obj)/qconf-bin
> +$(obj)/%.moc: $(src)/%.h FORCE | $(obj)/qconf-bin
>         $(call if_changed,moc)
>  
> -targets += qconf-moc.cc
> +targets += qconf.moc
>  
>  # gconf: Used for the gconfig target based on GTK+
>  hostprogs      += gconf
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index c6c42c0f4e5d..283b427f4321 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -25,6 +25,7 @@
>  #include "lkc.h"
>  #include "qconf.h"
>  
> +#include "qconf.moc"
>  #include "images.h"
>  
> 
> I don't think this is the proper solution, but at least it works. I hope you 
> find a better way to fix this.
> 
> Regards,
> 
> Eike
> -- 
> Rolf Eike Beer
> 
> emlix GmbH
> Headquarters: Berliner Str. 12, 37073 Göttingen, Germany
> Phone +49 (0)551 30664-0, e-mail info@emlix.com
> District Court of Göttingen, Registry Number HR B 3160
> Managing Directors: Heike Jordan, Dr. Uwe Kracke
> VAT ID No. DE 205 198 055
> Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
> Office Bonn: Bachstr. 6, 53115 Bonn, Germany
> http://www.emlix.com
> 
> emlix - your embedded Linux partner



-- 
Nicolas Schier

