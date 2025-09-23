Return-Path: <linux-kbuild+bounces-8932-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E27B95B4C
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Sep 2025 13:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9544348039F
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Sep 2025 11:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4EE322A1B;
	Tue, 23 Sep 2025 11:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TEIq1Xdz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FCC322773
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Sep 2025 11:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758627699; cv=none; b=oRib6J53Ui005ORUXNUuKTee+xwRSA7yWXsBjwUy1ivQlMWrWdSmDwvDHxI9eVYOz3pUWDpBGsxvk5B0AU5x/0/QofJ+UMLS/3yw2eEeXEstGmVqjy/RCJCpLHKjuogWIPC0T5Aqidj4hOFD6dZqd6bW/TKUHA3iin1Dww7L1qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758627699; c=relaxed/simple;
	bh=ni/iW7lHvCETYsNLqM+6mrbh0nHcxoeJh6ppyyodxBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFwdcNOB4pH5hsqLQj5Iy40riq6dNTnK/1/pZmZ1ex4PskNTGJbKsLu/EEvYOyIVEg6tpZamuMgD3OaBuW79FuRYAHM2LoCikEjlPu8C9+S2KzAIOROraJ3BC8tbAH900AiqSKNuyPLK/M60xH4xS6KT3NUjwqb1ZYEUsDQRxF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TEIq1Xdz; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b2e66a300cbso308343066b.3
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Sep 2025 04:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758627696; x=1759232496; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IWyQsVT69lCH4BbHgJw8BTZrGLVn1LISbLgsWJksB2o=;
        b=TEIq1XdzVLF77z4gEHT1fsE3L4HBLibKdBczYVqWf8T4vAHkEzOUNQjoQZK+RJg0yP
         BpcHI5HcNeNYru8NWnvpNQkJhRncO+2RjpcDMaxB80XlX1jgspldXmJvH1VF8sFR6lI/
         xjqwyIhDhAFf4QuygwRPeJ5PhlzRkcrMSymlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758627696; x=1759232496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWyQsVT69lCH4BbHgJw8BTZrGLVn1LISbLgsWJksB2o=;
        b=XeoYu4hg9vlPPTmIcdjNPt6NHgSP8/+DhbBCREFlIcflQ9UvwOu/4EBEqPp3zXLBKt
         hHS8vXIBXxomV+8/jUqb4rKDbL3HyLWndazkh0sCDl5abHA7BMoxsqw4gxS2YLrSJ2FO
         0f3v5UHjd+8GY8fWiWvqNSOZXNwgU7wjYyWC0ya4GeX+SVQuAwPWEfkOdyuvtsDeRTOx
         lGl6A5lNpeMzjHXqiQaiKL/UxNLC+Lei/0DNOsfDCrUm+4DV2gmru2aZdviW9o+Zfgqo
         DoZS/K3vtjGQdRsUAqhjoeG3Gpm1kp9t9hQ5bECaB11IoD3KwooEjjaaSYgZ+2Ku+y2S
         7/IQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+lMt/PVZnuYJP1aidamVimIfHK1xK+4/Bc8b+Yq+BZJKj1g5HUzwiB4PTWLVbSkQCBdmgiyQszJHPKOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQyE5ikPRxx8/IcYpXJaws4sBc9PkkEj7/b0Zr4sL/hmuwxAS1
	1DtgFyP5PaUps6mWkbPY6cN5o4+EorLkkWAO90fAH7eTIT3AQLDfZ+VznuOPA5SGaLS6yDaa10N
	lGDnUx8XlE/omydPh97AECGpwcHq7nuMqrnGWcbV+
X-Gm-Gg: ASbGncuYVn7hqV3Aq2lcwHS7YzcQ3m/xBOJcxWvIYFp0oOJfJJL32q8nA1+LGfAk2ij
	s+4UKSEoIPF/OaPsXGGOifFI9D7LYaCNViDrdgpWGQyAJHsPGf+RiI82xmC+lu1LXUb6/yYVeUQ
	eoVAimwfHwgKf+vpJhm5vEMIcaA3bTmCWG+QCOvyq90OWvdTcgwpgxNNoSeW47vjHffQQUwYR61
	umBOA==
X-Google-Smtp-Source: AGHT+IGrdWASkDi0uzKstAS6gCO+IkX+beb6qDtQM/pHo/U2gJML4F/8n8aKHXSqRtEtzuVCYsCIm2sq6lJUE+SBu9U=
X-Received: by 2002:a17:907:3cc7:b0:aff:17b1:dde1 with SMTP id
 a640c23a62f3a-b3027262102mr225357866b.1.1758627696464; Tue, 23 Sep 2025
 04:41:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922224835.1918759-1-sjg@chromium.org> <20250922224835.1918759-5-sjg@chromium.org>
 <c02f08cc-0613-4e57-886f-9d49803cea00@infradead.org>
In-Reply-To: <c02f08cc-0613-4e57-886f-9d49803cea00@infradead.org>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 23 Sep 2025 05:41:25 -0600
X-Gm-Features: AS18NWB4EKjOIEuMPIXmxBf8Tvh6v8BvbRz0KdMc1wY4lFgjkq_tIGSsRb9Mi1A
Message-ID: <CAFLszTjZX4raMaxG0mk1Tbborh8=ZBJWSCxAL_=4H-G1fQ6f-Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] kbuild: Allow adding modules into the FIT ramdisk
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, Nicolas Schier <nicolas@fjasle.eu>, 
	Tom Rini <trini@konsulko.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	=?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Han Shen <shenhan@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, Rong Xu <xur@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Randy,

On Mon, 22 Sept 2025 at 17:08, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi,
>
> On 9/22/25 3:48 PM, Simon Glass wrote:
> > Support 'make image.fit FIT_MODULES=1' to put all the modules into a
> > ramdisk image within the FIT.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > ---
>
> Regarding $subject, a comment in scripts/make_fit.py says:
>
>   Note that this tool does not yet support adding a ramdisk / initrd.
>
> Is the comment incorrect or are you changing that feature here?

I am changing it (in patch 2 of this series).

Regards,
Simon

>
> Thanks.
>
> >
> > (no changes since v1)
> >
> >  scripts/Makefile.lib | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 1d581ba5df66..2e880d9b4706 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -398,9 +398,15 @@ MAKE_FIT := $(srctree)/scripts/make_fit.py
> >  # Use this to override the compression algorithm
> >  FIT_COMPRESSION ?= gzip
> >
> > +# Set this to 1 to include an initrd with all the kernel modules
> > +FIT_MODULES ?= 0
> > +ifeq ($(FIT_MODULES),1)
> > +EXTRA := -B $(objtree) -m
> > +endif
> > +
> >  quiet_cmd_fit = FIT     $@
> >        cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> > -             --name '$(UIMAGE_NAME)' \
> > +             --name '$(UIMAGE_NAME)' $(EXTRA) \
> >               $(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
> >               $(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
> >               --compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
>
> --
> ~Randy
>

