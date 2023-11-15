Return-Path: <linux-kbuild+bounces-8-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDF47E7F33
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Nov 2023 18:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92E3A281B9D
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Nov 2023 17:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C580F30334;
	Fri, 10 Nov 2023 17:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qth9rBQG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CVg6EvQ+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6853E46A
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Nov 2023 17:47:10 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D3DB3D578;
	Fri, 10 Nov 2023 09:44:37 -0800 (PST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 7F53821992;
	Fri, 10 Nov 2023 17:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1699638265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EYAgDQt7eB0w4cAnKtCjsEc9BO9IoUXrjcQ62KDllKo=;
	b=Qth9rBQGAnzwAnCKDJ8zor20XIDEQsOPXEhs/aHJ3Y1Y5dxO9McpVLMSwfiVTEebS55Zv2
	1XjD96DVYPsqab7MewJRnvh8xrgoaQSGjQzRoBXGOpNqxW4/GEGJdWslVA1LG2xUkZ+d1O
	R7Gr4wFAocV3Tt2f4DaS518OXPCY7tg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699638265;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EYAgDQt7eB0w4cAnKtCjsEc9BO9IoUXrjcQ62KDllKo=;
	b=CVg6EvQ+T5l73hl8bEHLdBOBref+XFvEfFrvR3JIRFdB3dEZvGDzqM182DKJFYnVYjoAmc
	Q4A0kLoBMrPiEtDw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 1C5F62D40D;
	Fri, 10 Nov 2023 17:44:23 +0000 (UTC)
Date: Fri, 10 Nov 2023 18:44:22 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Jan Engelhardt <jengelh@inai.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>,
	linux-modules@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	Lucas De Marchi <lucas.de.marchi@gmail.com>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jiri Slaby <jslaby@suse.com>, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH rebased] kbuild: rpm-pkg: Fix build with non-default
 MODLIB
Message-ID: <20231110174422.GY6241@kitsune.suse.cz>
References: <20231009140733.GV6241@kitsune.suse.cz>
 <CAK7LNAQQMFUt4R1m_U8kBY5=BvxD_dMuE4MD4kpd48WK1E+AGA@mail.gmail.com>
 <20231010101552.GW6241@kitsune.suse.cz>
 <CAK7LNASX2_-xt3Qvxie_G=Q4fuVYR6eE47QjQ5NZf7QxY-4_tQ@mail.gmail.com>
 <20231017104453.GG6241@kitsune.suse.cz>
 <CAK7LNASKPg0JK0QsLGb1Rfx2ysvHJTm3NFOvtwOpZRz4-20T8w@mail.gmail.com>
 <20231017122747.GH6241@kitsune.suse.cz>
 <CAK7LNAT3N82cJD3GsF+yUBEfPNOBkhzYPk37q3k0HdU7ukz9vQ@mail.gmail.com>
 <20231017151050.GJ6241@kitsune.suse.cz>
 <p86sq573-s32q-6792-4978-43s1pn91r027@vanv.qr>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <p86sq573-s32q-6792-4978-43s1pn91r027@vanv.qr>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Oct 18, 2023 at 03:12:41AM +0200, Jan Engelhardt wrote:
> On Tuesday 2023-10-17 17:10, Michal Such�nek wrote:
> >
> >> In my system (Ubuntu), I see the directory paths
> >> 
> >> /usr/aarch64-linux-gnu/lib/
> >> /usr/i686-linux-gnu/lib/
> >> /usr/x86_64-linux-gnu/lib/
> >> 
> >> If there were such a crazy distro that supports multiple kernel arches
> >> within a single image, modules might be installed:
> >> /usr/x86_64-linux-gnu/lib/module/<version>/
> >
> >For me it's /usr/lib/i386-linux-gnu/.
> >
> >Did they change the scheme at some point?
> 
> It's a complicated mumble-jumble. Prior art exists as in:
> 
>  /opt/vendorThing/bin/...
>  /usr/X11R6/lib/libXi.so.6 [host binary]
>  /usr/x86_64-w64-mingw32/bin/as [host binary]
>  /usr/x86_64-w64-mingw32/sys-root/mingw/bin/as.exe [foreign binary]
>  /usr/platform/SUNW,Ultra-2/lib/libprtdiag_psr.so.1 [looks foreign]
> 
> The use of suffix-based naming must have been established sometime
> near the end of the 90s or the start of 2000s as the first biarch
> Linux distros emerged. Probably in gcc or glibc sources one will find
> the root of where the use of suffix identifiers like /usr/lib64
> started. Leaves the question open "why".

That's pretty clear: to be able to install libraries for multiple
architectures at the same time.

Thanks

Michal

