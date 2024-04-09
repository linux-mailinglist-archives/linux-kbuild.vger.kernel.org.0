Return-Path: <linux-kbuild+bounces-1501-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA2B89DEF3
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Apr 2024 17:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06A5C1C20B89
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Apr 2024 15:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A4912D1E7;
	Tue,  9 Apr 2024 15:24:39 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264FF12FF93;
	Tue,  9 Apr 2024 15:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712676279; cv=none; b=WJpBMfFKb+Zvm0Lx6liFmiXCi2LDAFXA+OlzYiDNXiJTVLRuWSVM6otyRoPO/oVdAK4Zrm8/Ldro4M+I/aLMkjQa5x2l6JRo/bVdvoSq7zGnim+TJItDo7tmUV3pTcTda6W4/nuoSiQ9GEQZFbB7UPeMhQigHqafvz2fL4VKJTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712676279; c=relaxed/simple;
	bh=85Dtdhs4cI7wMp4CVhZJsWIixGlTrtyaSva9NaNU/i4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A1DRd2z8ogO/dipE6dGm4sxOZv8MVHxF6Q2TsgKge/iagCXGNZ952+pkZ4vCXaWr9T2uTLCjkkWzX4m59RPBCJn5xG8DvIyNNttZFw74rJGmoWHv3KSw7kg3ojZ+c5feE/JVwWc3SdWzRs6oawGVwrsYi5v+R85VCHt8lqgEsjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-615019cd427so49122097b3.3;
        Tue, 09 Apr 2024 08:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712676276; x=1713281076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lu5hD9VvS+qp+vhw7UeQVESAr0EzPRLUzVlLL7V9CRE=;
        b=vF5ySepFHb/RzAmOoTMn/+cuolBejnJuuf3JQk5ITQOaCkhguDfY0SliaDQkmVW0WA
         edEVF9BNhKfklfckElbxMoAOUMf0OqT63va6l8RqdbHwAOGZ2OSrGSAPL1+jJP7+Gk3l
         z60gKRxKIV30klC+I5Pp0HeKAqi2+9ItEvoAzzardD/9RW3WJDGnMhH9R8Y9k386UEGb
         NMaJ8aH9/+SSOG38QM1EQp7/f5oXYiquYs9FaHWkKf+ETtcgK7TO/rwIjT2o/Svtb7Cp
         vEYUxu/qkJTmhcPkLaiH6+JRSdMgK8ZZ8/BkhOxNL8jghfTi5gWLeUaX0PteEWH/BjA0
         Pwyg==
X-Forwarded-Encrypted: i=1; AJvYcCVtrR+VDEycDG0UsGRrruzKZAP7I/A0zg7gjlPwBqO0hqEa9E/Zm6R2E5ZpxHrjPmJ4E6C95bGP0LHku8Jb8AhQ/AfZSCT+RhKbdHDRFC6XJrLiX2sS3psZhveJB4gGBdQV1atphqMLE2Ct3jU3+NQ=
X-Gm-Message-State: AOJu0YyUZPnvXWtpxBn/HbfJpNEPYmJuzPBJT2uJSY4/pCVxAK5tfCIU
	3Bg9URjZHGJ4ht1jr1SM5rRd0cEPFKCvRIgxLrjgh4PTCbiL4pRFtVP+JAo9sLo=
X-Google-Smtp-Source: AGHT+IG1cnrLl7tfsBBOIdsLlFA6/UdLeOLXuSll683s/hJa/CT5uqV2+sJU1/zA62dnxg6yc1hRsQ==
X-Received: by 2002:a0d:df82:0:b0:614:42c2:278d with SMTP id i124-20020a0ddf82000000b0061442c2278dmr20175ywe.0.1712676275174;
        Tue, 09 Apr 2024 08:24:35 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id ho3-20020a05690c630300b0060a07fdf93bsm2208208ywb.134.2024.04.09.08.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 08:24:34 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcc80d6004bso5803357276.0;
        Tue, 09 Apr 2024 08:24:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5KIXEl24dup6xUcnLf8LDIIfKGOxTFpttmBvRLfvdfrk6EkPZWzoBYakBSTpJNgZo7Btl93Z5ESE0viF8SL17C/FKbUEgBya3Vj/+Eg3PTsmkMoskimk1zZBTeOmGpXcXJqWzErECD+O/9/S0AGo=
X-Received: by 2002:a25:b10a:0:b0:dcc:f3fe:19c with SMTP id
 g10-20020a25b10a000000b00dccf3fe019cmr53487ybj.59.1712676273820; Tue, 09 Apr
 2024 08:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
 <a816fea-9974-d17f-bed6-69728e223@linux-m68k.org> <87sezu97id.fsf@intel.com>
 <CAMuHMdVMhXFm-kZ50Un1ZFmEcjJ7SnpyEyw65-wucBGpVRUFww@mail.gmail.com> <87edbe94ck.fsf@intel.com>
In-Reply-To: <87edbe94ck.fsf@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Apr 2024 17:24:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYqEpKTxHgkdm5B-Q9nM4PyzNDxmqDW=GHG7adcp83+Q@mail.gmail.com>
Message-ID: <CAMuHMdUYqEpKTxHgkdm5B-Q9nM4PyzNDxmqDW=GHG7adcp83+Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] drm/display: Convert helpers Kconfig symbols to
 depends on
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	Lucas De Marchi <lucas.demarchi@intel.com>, kernel test robot <lkp@intel.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Tue, Apr 9, 2024 at 1:13=E2=80=AFPM Jani Nikula <jani.nikula@linux.intel=
.com> wrote:
> On Tue, 09 Apr 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Apr 9, 2024 at 12:04=E2=80=AFPM Jani Nikula <jani.nikula@linux.=
intel.com> wrote:
> >> On Tue, 09 Apr 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> > The user should not need to know which helpers are needed for the dr=
iver
> >> > he is interested in.  When a symbol selects another symbol, it shoul=
d
> >> > just make sure the dependencies of the target symbol are met.
> >>
> >> It's really not "just make sure". This leads to perpetual illegal
> >> configurations, and duct tape fixes. Select should not be used for
> >> visible symbols or symbols with dependencies [1].
> >
> > In other words: none of these helpers should be visible...
>
> ...and should have no dependencies? :p

Unless they do have dependencies.

> >> What we'd need for usability is not more abuse of select, but rather 1=
)
> >> warnings for selecting symbols with dependencies, and 2) a way to enab=
le
> >
> > Kconfig already warns if dependencies of selected symbols are not met.
>
> But it does lead to cases where a builtin tries to use a symbol from a
> module, failing at link time, not config time. Then I regularly see
> patches trying to fix this with IS_REACHABLE(), making it a silent
> runtime failure instead, when it should've been a config issue.

If a symbol for a builtin selects a symbol for a module, the latter
becomes builtin, too, so that does not cause such issues?
You can get such issues when a boolean symbol depends on a tristate
symbol...

> >> a kconfig option with all its dependencies, recursively. This is what =
we
> >> lack.
> >
> > You cannot force-enable all dependencies of the target symbol, as some
> > of these dependencies may be impossible to meet on the system you are
> > configuring a kernel for.
>
> Surely kconfig should be able to figure out if they're possible or not.
>
> > The current proper way is to add these dependencies to the source
> > symbol, which is what we have been doing everywhere else.  Another
> > solution may be to teach Kconfig to ignore any symbols that select a
> > symbol with unmet dependencies.
>
> ...
>
> It seems like your main argument in favour of using select is that it's
> more convenient for people who configure the kernel. Because the user
> should be able to just enable a driver, and that would select everything
> that's needed. But where do we draw the line? Then what qualifies for
> "depends on"?

Hard (platform and subsystem) dependencies.

> Look at config DRM_I915 and where select abuse has lead us. Like, why
> don't we just select DRM, PCI and X86 as well instead of depend. :p

X86 and PCI are hard platform dependencies.
DRM is a subsystem dependency.

> A lot of things we have to select because it appears to generally be the
> case that if some places select and some places depends on a symbol,
> it'll lead to circular dependencies.

True.  So all library code (incl. helpers) should be selected, and
not be used as a dependency.
The user shouldn't be aware that the driver uses library code (or not).

> Sure there may be a usability issue with using depends on. But the
> proper fix isn't hacking in kconfig files, it's to fix the usability in
> kconfig the tool UI. But nobody steps up, because at least I find the
> kconfig source to be inpenetrable. I've tried many times, and given up.

As long as Kconfig does not handle dependencies of selected symbols
automatically, adding explicit dependencies to the origin symbols is
the only workable solution.

> I mean, if you want to enable a driver D, it could, at a minimum, show
> you a tree of (possibly alternative) things you also need to enable. But

And this series is actually making that harder, by turning all these
selects of helpers into dependencies...

> if the dependencies aren't there, you won't even see the config for
> D. That's not something that should be "fixed" by abusing select in
> kconfig files.

I consider not seeing symbols when a hard dependency is not met as
a good thing.  If everything was visible all the time, you would
have a very hard (well, harder than the current already-hard ;-)
time configuring your kernel.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

