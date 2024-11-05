Return-Path: <linux-kbuild+bounces-4521-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CF09BD9DB
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 00:45:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEB75B211B0
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2024 23:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B470216A1A;
	Tue,  5 Nov 2024 23:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNc8LT5h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C7321018F;
	Tue,  5 Nov 2024 23:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730850296; cv=none; b=SVtAeEnxE5eOepkjz9JGisFtU6xYGzHV2CpxqYv4JcJxYbAneEtPsf7ApJVisqWk1YtnEi0lETaRkptX8uB2fsIy6slKZjYS31Ko3gECbrP2V2dZUzqPmr6sSIsFS9zdmwfPIlsy2ojPHIBDs0xFrBOCUviJiUKAa2DtuPM5drw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730850296; c=relaxed/simple;
	bh=tnKHcdKPMnpM0B8QAkRdoB68/zbIcA3YHlIatwfta4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nW1Ac5+uxeA4HGY4EfRfkp+WXocFfKyB8xG8oRu2g5OAvCFtYbtBPtiyY2U8WTqAvaV0hw8zTaT8VmzE7q/F000aGyu5Ikmlsw9mitKTAI9o5oGH+OOolAXpUNRgXZYKP/Yo4tZysvsHjDaLKvPRu8SNDgzjdTn3SVBmqAlYu9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNc8LT5h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00F1C4CED5;
	Tue,  5 Nov 2024 23:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730850296;
	bh=tnKHcdKPMnpM0B8QAkRdoB68/zbIcA3YHlIatwfta4s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NNc8LT5hXsJ/2xrOE9DA408q02nhXBtRYBMzGeLo4bLHd9CUE83xoz5WyKxEUTDQf
	 tot0l6LhfyL28QwvOFg3zvaBASzU+4VQ1YUv/9vsQlFYYt/q4qsSvr9uOjA/fRHR5K
	 cO1b+Vp0Kn2EX66mIDUiaBvn8DCGtIbdKFULK3jC9bn8Vr5sIi9kGVkL99NtSbJeV/
	 uPDEGMhyawxRuYGqba7eeP5D180rFY0+c6WIny1GJ37knagx4snuPLyVthR18bMUhE
	 gdqWKMlQLD//l1OSS+a+7vRcSNhk8me6TblUCAaDGp4Wx/T5DWJqbXFs79wQlxA4+4
	 iNqsb+0eaF/HA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e6c754bdso6114507e87.2;
        Tue, 05 Nov 2024 15:44:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVng4MeIQ9wxlgIYZgBVfRfGRB6KqIgnK2Uquf+LXHhGtRcopyWnsM2VBpWf3wNA+SHUsE2fqr9yUHqB6c=@vger.kernel.org, AJvYcCXTq6dlVji96VOnOzFZ0AjV6IqvfrqbKSOnI+G8tvOPMgyaHRectTzB7+AsAfjNW2mjYWWRhnVETAhejZnq@vger.kernel.org
X-Gm-Message-State: AOJu0YxH+qQi06LZNcQgbwEzSVEtmygULyVrUYcbRnwNebrZ8eBV927q
	6DxAxvUlnCUqOwO8ialQgloRXMClG7o+gvr10nC32aRSFsR5/e77D9RcaWoXWkqoQxnAAFX0Ho0
	gAIm0ZoECmfpbSrWhExMS2kA90sA=
X-Google-Smtp-Source: AGHT+IEj1gKPJ0hGZfQFbmLAvHg7tpeqM1REiHvuxkfl0DvEtJsWY4ATMOcRlwUHzlaOxV6MWvLTqhpsmz6GygXcaHE=
X-Received: by 2002:ac2:4c4b:0:b0:53a:bb9:b54a with SMTP id
 2adb3069b0e04-53c79e8ed05mr9480800e87.48.1730850294595; Tue, 05 Nov 2024
 15:44:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014141345.5680-1-david.hunter.linux@gmail.com>
 <20241014141345.5680-7-david.hunter.linux@gmail.com> <20241015192017.173d316e@gandalf.local.home>
In-Reply-To: <20241015192017.173d316e@gandalf.local.home>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 6 Nov 2024 08:44:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ_rzz=iEVGOq-GOWrwBMoVEMtswXKPj3WA2==+0_evdg@mail.gmail.com>
Message-ID: <CAK7LNAQ_rzz=iEVGOq-GOWrwBMoVEMtswXKPj3WA2==+0_evdg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] streamline_config.pl: process config options set
 to "y"
To: Steven Rostedt <rostedt@goodmis.org>
Cc: David Hunter <david.hunter.linux@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, shuah@kernel.org, 
	javier.carrasco.cruz@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 8:19=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Mon, 14 Oct 2024 10:13:36 -0400
> David Hunter <david.hunter.linux@gmail.com> wrote:
>
> > An assumption made in this script is that the config options do not nee=
d
> > to be processed because they will simply be in the new config file. Thi=
s
> > assumption is incorrect.
> >
> > Process the config entries set to "y" because those config entries migh=
t
> > have dependencies set to "m". If a config entry is set to "m" and is no=
t
> > loaded directly into the machine, the script will currently turn off
> > that config entry; however, if that turned off config entry is a
> > dependency for a "y" option. that means the config entry set to "y"
> > will also be turned off later when the conf executive file is called.
> >
> > Here is a model of the problem (arrows show dependency):
> >
> > Original config file
> > Config_1 (m) <-- Config_2 (y)
> >
> > Config_1 is not loaded in this example, so it is turned off.
> > After scripts/kconfig/streamline_config.pl, but before scripts/kconfig/=
conf
> > Config_1 (n) <-- Config_2 (y)
> >
> > After  scripts/kconfig/conf
> > Config_1 (n) <-- Config_2 (n)
>
> Hmm, can you show the example of this. My worry here is that there are a
> lot of cases that have:
>
>  Config_1 (m) <-- Config_2 (y)
>
> Where Config_2 is just some binary option to modify the module set by
> Config_1. If we keep Config_1 because there's some 'y' that selects it, w=
e
> are going to keep a lot of unused modules around.

Basically, there is no good way to distinguish
in-module option (just CONFIG_BCACHEFS_SIX_OPTIMISTIC_SPIN=3Dy,
which is a property for CONFIG_BCACHEFS=3Dm) from real dependency.




> >
> > It should also be noted that any module in the dependency chain will
> > also be turned off, even if that module is loaded directly onto the
> > computer. Here is an example:
> >
> > Original config file
> > Config_1 (m) <-- Config_2 (y) <-- Config_3 (m)
>
> If Config_3 is used, then it should add Config_2 as a dependency. I guess
> that's what this patch does.

Agree, but I am not sure how to pick up only this case.


--=20
Best Regards
Masahiro Yamada

