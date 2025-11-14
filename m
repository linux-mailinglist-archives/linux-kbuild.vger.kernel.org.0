Return-Path: <linux-kbuild+bounces-9635-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE59C5DAE2
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 15:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D86594F5720
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 14:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7E43254B6;
	Fri, 14 Nov 2025 14:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I2CGGAdD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2714F3254B9
	for <linux-kbuild@vger.kernel.org>; Fri, 14 Nov 2025 14:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130555; cv=none; b=hANAcOs0vSeF/UMAftwWJryq/2Ea1UOQmz/KEkPftIqr2vOUt49uYV50LA/cDEqgv8AfPd1Km+fyLzC1DjUa+JKXttZKBaV/HwzW7jhTFjKe9fNJAus6W4lOkX7LfFH/qeo5126uWL/VE4mFZBnOwJ5e9lJAD9SEHOW9i2Jq6/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130555; c=relaxed/simple;
	bh=SCcqXqhuIc5p1lG4YME97qhEXeJg9jAJ1dPQdeDcfsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+t7kzUaOrHzdn/O4aPlzKGFy1hu4FZMehalhLHLXu+vQ339CjTLjCwyRb6kYtQeACCVX3OkUl/pIJmFi8zGrRLTC0Xsl3Pq9wlJ8s5uNCTWUWlO6fbwKul4uCOKaELp9Jjsc/vpd587C83iCLsGOAQAdYt4u5HlxqqNkV9D2eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I2CGGAdD; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b735e278fa1so243363866b.0
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Nov 2025 06:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763130552; x=1763735352; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jg8UhYyfIcptC8xMkqg0NZVGQx0oq9KUEmx/oB+LJ1Y=;
        b=I2CGGAdDqv0HLDzlh1LCTyG/Opv7PPFC0ez4nOdz7C3iff8BJpkXyzbfp5SaKZ/Z+d
         8K2Hc/sF87FGY9rYWRRHBmGwRt6HaE4wH4S6nEkTyPvSAOMYqBdVuWStI35qRtVdu70s
         gm0453TK0J/o2Cpyx18VgdekIqSxBTiifANWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130552; x=1763735352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jg8UhYyfIcptC8xMkqg0NZVGQx0oq9KUEmx/oB+LJ1Y=;
        b=a07CBh3Ud677kDSI5GDAqcDhzzw5k1mawDONWDCQbdEimyB67YwYxhQlofwHXVffGx
         RCq6yHwiHEDdLJQJIhjy8h1p43neicP9wx9PU9SWCuya37GHu7K8FGs2oYT8J7pSA6Ae
         D+9YyqVRfQe0mE8elPUSs770psljxKxQ2opARmjlTGN/rmY17Onp6+lMN4OpBgmSyCjl
         voo70GBPbbHocryDdJFeZrma+taShAV4fao34fwVGztLM9/3p1k4iGkenxItaodu9AiY
         WGVqTPu2eE4hSExln0F+hVyjjl9eMV2f/s7mwHedXmq+l7Rqh5LrkvHTVbYixUWKDMOi
         KQvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/GMBEy7tbykLki6308e/ZmJdZlPlsloWY26brLM9fdQOjF2j/Hly+dFWoIv8tnRCTmyhYyQfl4SkwMz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YylbDrgkE/qXM5H+8nxSR0Lsq05YB1z/+veLId6elY2fgopJm+D
	U5Kp4Qyms4SITAP3n7/MOJlVKGjVCegYYEMOeEyRRFFWH7Bo0wBUGC7f49eUuwZ76YdtbN35Ec8
	tJmptufGT+xhQ7uv9cs9LWbC+odkjl91b2HeVkuFx
X-Gm-Gg: ASbGncvL/GQFwgPPWsZP/OlPucTqlmZ3CziTUynIKi0tsciOSDXh+K9IyGqMAIRox00
	V5DeaPkCMyVWGMZjXFSH6DfxP4DDBUtrQ5jOKO5mmExl3AW6CeGImHN0cPUa5OSsD8QAF/k2XQ0
	jPAoC5A7HJxOnA0Lxubl8z8yKTc3T0q1SqR0srlUYMJWsdlVzyWU2WP6jO2yX4/h+Gd8n8wawwE
	0bVLEj1y08fQBqB13o2OcElmtbzDJBdq/1+zVmdypf87YgqAZG8U02pitXj5NghIV/nuo1JD3Fw
	yvSAR0LidJdEths=
X-Google-Smtp-Source: AGHT+IEQrcEjm+EwruWenAD1SgftvhKZnuypLhuDVZI95EhaYlc+y/sSIShAmiZrhKlBtwl5CPR0wrJpmGlKlp8F3Xs=
X-Received: by 2002:a17:906:4885:b0:b73:6e0d:4f6b with SMTP id
 a640c23a62f3a-b736e0d5e13mr150352766b.36.1763130552454; Fri, 14 Nov 2025
 06:29:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006230205.521341-1-sjg@chromium.org> <20251006230205.521341-6-sjg@chromium.org>
 <aQ-zXyOr2FPz2V0Z@levanger>
In-Reply-To: <aQ-zXyOr2FPz2V0Z@levanger>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 14 Nov 2025 07:29:01 -0700
X-Gm-Features: AWmQ_bkevTI3W156k4lC19DtSJXiQDIHESMbZpsCHrIX0hT8ilR8Z93eB4aaz1A
Message-ID: <CAFLszTgCh7GS6yoJB53zf+Bw8_72F5DyfnvgKD8-bz-dbW6L-g@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] kbuild: Allow adding modules into the FIT ramdisk
To: Nicolas Schier <nsc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	=?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Tom Rini <trini@konsulko.com>, Nathan Chancellor <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Kees Cook <kees@kernel.org>, Rong Xu <xur@google.com>, Will Deacon <will@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nicolas,

On Sat, 8 Nov 2025 at 14:19, Nicolas Schier <nsc@kernel.org> wrote:
>
> On Mon, Oct 06, 2025 at 05:01:56PM -0600, Simon Glass wrote:
> > Support 'make image.fit FIT_MODULES=1' to put all the modules into a
> > ramdisk image within the FIT.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > Acked-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >
> > Changes in v4:
> > - Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
> > - Use an empty FIT_MODULES to disable the feature, instead of '0'
> > - Make use of the 'modules' dependency to ensure modules are built
> > - Pass the list of modules to the script
> >
> >  arch/arm64/boot/Makefile |  4 ++++
> >  scripts/Makefile.lib     | 10 ++++++++--
> >  2 files changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
> > index b5a08333bc57..d10c85f96aea 100644
> > --- a/arch/arm64/boot/Makefile
> > +++ b/arch/arm64/boot/Makefile
> > @@ -43,6 +43,10 @@ $(obj)/Image.zst: $(obj)/Image FORCE
> >  $(obj)/Image.xz: $(obj)/Image FORCE
> >       $(call if_changed,xzkern)
> >
> > +ifeq ($(FIT_MODULES),1)
> > +.PHONY: modules
> > +$(obj)/image.fit: modules
> > +endif
>
> This does not work for me.  I tried:
>
>     make clean
>     make image.fit FIT_MODULES=1
>
> but modules are not built as KBUILD_MODULES is not set in top-level
> Makefile.  Works for me with the following diff:
>
>
> diff --git a/Makefile b/Makefile
> index d14824792227..e6b8bcbdb073 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -772,7 +772,13 @@ endif
>  # in addition to whatever we do anyway.
>  # Just "make" or "make all" shall build modules as well
>
> -ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)
> +modules-targets := all
> +modules-targets += $(if $(FIT_MODULES), image.fit)
> +modules-targets += modules
> +modules-targets += nsdeps
> +modules-targets += compile_commands.json
> +modules-targets += clang-%
> +ifneq ($(filter $(modules-targets),$(MAKECMDGOALS)),)
>    KBUILD_MODULES := y
>  endif
>
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 73a10f65ce8b..f7f0c144908a 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -174,6 +174,7 @@ endif
>  all:   $(notdir $(KBUILD_IMAGE))
>
>  image.fit: dtbs
> +image.fit: $(if $(FIT_MODULES), modules)
>
>  vmlinuz.efi image.fit: Image
>  $(BOOT_TARGETS): vmlinux
> diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
> index d10c85f96aea..b5a08333bc57 100644
> --- a/arch/arm64/boot/Makefile
> +++ b/arch/arm64/boot/Makefile
> @@ -43,10 +43,6 @@ $(obj)/Image.zst: $(obj)/Image FORCE
>  $(obj)/Image.xz: $(obj)/Image FORCE
>         $(call if_changed,xzkern)
>
> -ifeq ($(FIT_MODULES),1)
> -.PHONY: modules
> -$(obj)/image.fit: modules
> -endif
>  $(obj)/image.fit: $(obj)/Image $(obj)/dts/dtbs-list FORCE
>         $(call if_changed,fit)
>

Thanks for trying this and for suggesting the fix. Indeed I had not
tried the module feature starting from a fresh build.

Regards,
Simon

