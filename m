Return-Path: <linux-kbuild+bounces-1172-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C95887228C
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 16:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A15B31F23DDB
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 15:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F27B1272B5;
	Tue,  5 Mar 2024 15:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vI7bmK3A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398511272A7
	for <linux-kbuild@vger.kernel.org>; Tue,  5 Mar 2024 15:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709652056; cv=none; b=ac/hilmcwWNHF4mHOGFolOpRzgwJ0hlJgFfObGVG2ZHTIAtNhbHPszAKSR7mbMPak4bu2Z9GMmtZTjoQjCWy4J3vkNXXKsNiZ88OwI7i2yCkAotVfKoXa+RDr4qecwtTez7Tykva9FB5irR4hdbqlC+bCgL/topnS0GrUVAS9So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709652056; c=relaxed/simple;
	bh=S3P/XVuMzDWS/P3SECGhGnF7bxrOi82VssJjK3CFMk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDs6WYf44w7pQX4x1QURzPRfD/BCN/JT1724zqmYHOVEvrZ3JsgYz9wQdsxua5gnpGLa3VS8IgmIZa3056AeZT+Olj/8bVPt2Sra8iWRRp1LG9uHqXLEi7eLTwLoXggYSmBoCsgkb4zPYqmd7RcSNPIADAamTMdcYaBGfZtCWqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vI7bmK3A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0EBCC43390
	for <linux-kbuild@vger.kernel.org>; Tue,  5 Mar 2024 15:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709652055;
	bh=S3P/XVuMzDWS/P3SECGhGnF7bxrOi82VssJjK3CFMk4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vI7bmK3Am/GHjzV73oYkwmJ/J9ihXbeuMhGdjQWiOkGfG0kXUjJXba5akW87WLbsk
	 pwK6qoaiAKdXSp+vDKaJVty+LOFIVzeSXJ1GWOmTEml8D6iuo3/rl3eK3uISxt2ubf
	 0p/8MX80A6LErmuxOslrCBlDdOK8+BQo9WSCu1v3c0rV5x5O7s2DiPV0FcVETX1zF7
	 rEhmOv7Z/RwUj+iAyEyLJu75aI0fIKUQxXggF4jmzu4GhRcManNLACYx/XQeUkpTAH
	 qCuNZm5rOb0KdgRLzmbfJz+Cd1zHJ9Nf+tsQPreTUsmc8XRb5p/eOvUBkqBXbcUI29
	 7cFni2bisbueg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51323dfce59so5102458e87.3
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Mar 2024 07:20:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXIB+tqkPZv0DxACTPWP3mKvxmY4oOY2shpjBaWEdEevqOEsM2ypPSewmEwzFib25SyU/4QIPI1fhkEhsYrMvNFj/0GUjWYi+3GB/nR
X-Gm-Message-State: AOJu0YzLKXw1+/HNCqni595uqH63jAVzSD/cKZXN7izuRaAzz8SJLEBd
	8qB6UCWIAs0jsr0x+EkmQeMpYq2nPqJN6muyotJTz1QknDtArmk3CJJJ0k2x0qHdpF5bLGyRbY1
	XFpJHpCe0vYtwqZJUQBw2x1caPJs=
X-Google-Smtp-Source: AGHT+IF58XXSrpn0hV2eUV6wwq8SJnvkm3Vbkg7f6+aSQ0LQDuQ5RDQDlxF3bGWGyHjrtZ3pUc2xADepo1wsMXjTijI=
X-Received: by 2002:a05:6512:3493:b0:513:5873:1a29 with SMTP id
 v19-20020a056512349300b0051358731a29mr663484lfr.54.1709652054204; Tue, 05 Mar
 2024 07:20:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1709508290.git.ehem+linux@m5p.com> <ZeWa_qAsfmxJ5KFy@buildd.core.avm.de>
 <ZeYiu3V+Q5xItFHD@mattapan.m5p.com>
In-Reply-To: <ZeYiu3V+Q5xItFHD@mattapan.m5p.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 6 Mar 2024 00:20:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT+dnMAEd0nxXmb-szR-5oHZyB2YOTjVCBypDbwAXNHsw@mail.gmail.com>
Message-ID: <CAK7LNAT+dnMAEd0nxXmb-szR-5oHZyB2YOTjVCBypDbwAXNHsw@mail.gmail.com>
Subject: Re: [WIP PATCH 00/30] Adding trailing slash to $(*tree)
To: Elliott Mitchell <ehem+linux@m5p.com>
Cc: Nicolas Schier <nicolas@fjasle.eu>, nathan@kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 4:36=E2=80=AFAM Elliott Mitchell <ehem+linux@m5p.com=
> wrote:
>
> On Mon, Mar 04, 2024 at 10:57:18AM +0100, Nicolas Schier wrote:
> >
> > can you please describe a concrete problem you want to solve with your
> > patch set?  Masahiro already asked in [1], and I still don't get your
> > motivation while reading your cover letter.  It would be helpful to see
> > your goal when looking at your patches.
>
> I'm trying to develop an alternative kernel build system for one Linux
> distribution.  Due to how other pieces of the distribution work it seems
> using the out-of-tree build mechanism to build in-tree modules may be a
> better approach.  This may be abusing the current build system, but if it
> works without breaking anything else that should be acceptable.
>
> The problem I've run into is due to the mechanisms of the build system,
> the variable $(srctree) gets the value "." while $(src) got the value of
> $(CURDIR).
>
> At which point various places which use $(srctree)/$(src) ended up with
> the value ./`pwd` and that doesn't work.  Almost all uses of $(srctree)
> had it followed with a slash, so if $(srctree) includes the trailing
> slash, $(srctree)$(src) ends up the correct value.
>
> This may be outside the envelope of what is supportted, but if it works
> without breaking anything it really should be okay.




I see no good reason to do this change.

I will not take this series.




>
> > Also, I cannot see the problem with commit 16671c1e1cac2 that you
> > mentioned.  If a subtree does not want to inherit some variables, but
> > re-use the same names, it seems quite legitimate to me to reset those
> > variables before use.
>
> Take a quick glance at patch #27.  Basically every Makefile inside tools/
> sets $(srctree) to the equivalent of $(abs_srctree).  This suggests
> 16671c1e1cac2 was working around an issue for tools/perf, but instead
> the issue effects most of the Makefiles.  I'm left suspecting the issue
> was later fixed for tools/perf and 16671c1e1cac2 was a mistake.
>
> I suspect at this point removing the lines at the top of tools/Makefile
> added by 16671c1e1cac2 and removing all those duplications would work
> better.  All I'm certain of is the present situation it doesn't look
> right.
>
> Another option is dropping the last 4 looks viable.  Due to ending up
> with absolute paths, their values of $({src|obj}tree) are likely
> non-problematic for me.
>
>
> --
> (\___(\___(\______          --=3D> 8-) EHM <=3D--          ______/)___/)_=
__/)
>  \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
>   \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
> 8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445
>
>


--=20
Best Regards
Masahiro Yamada

