Return-Path: <linux-kbuild+bounces-1485-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7553489D712
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Apr 2024 12:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 068E8B215E0
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Apr 2024 10:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952BF1EB46;
	Tue,  9 Apr 2024 10:35:19 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517496FE35;
	Tue,  9 Apr 2024 10:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712658919; cv=none; b=XLptXSboDl0U9ck/e6zpOp8+SRvzsiK/eljFyiWTuD+whtLzecvAyKVtKPyud4KSdHO8L7tuiGUJIkuPgrYtdrtPI0WEkpO+UiTTvxECvCPRyBsDeHChkSDv/UCF4bztaT2NGviPvwm2g2cVCAooYwFK6Yf3Q6JD13gntQsxf04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712658919; c=relaxed/simple;
	bh=WT9pOkL0o92Z2IOw5J90BU1u8X7lD/ah1Qc4kRSPngc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XUiyVhoh2Cei18lvePZ/eSFIhzZWqG4MXgSsgjLAp3FsnWFSoe0U2QCySPz1otlHx+ilFL2i2lX+f56qTB03O0HcRywD0+owIQLS+CJfT2/oWPtBkFes+yIJAl28YLneXDQV2A1PTuJkt/wdOSK40dj50JE1qrZ2yeZGiQ+sXk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6181b9dc647so16001677b3.1;
        Tue, 09 Apr 2024 03:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712658915; x=1713263715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nktIVSuXupLDwEe7/K2WYoIkf/M9z2rTr/fahEtJAJk=;
        b=UjKfGwIbafF0HkcCQAfRKdM3OnF7h9Exm1equnfKExw3tpJo/lbtgdCj6P2zGQ3APB
         T+M3FC7vYnOhRPk7OdACgrS/f9+MKNnG+N7NEyTkomhGQScJsEPMgLMLqZXi6dNmKqGK
         n8PVGsIgmSnRqSodQDi2GjXCp9psXxtstseyE06/RmV0F6KO3vYUHCiSwH5lKUHTpKp0
         WIk8eMVSKtT6YM6IUkRoikt229ScCXxlmQCyaSk0kVK64hY5jw0qiBSxXDDCytPQAt18
         so4GsUMTIjvHvSdtTNaSiJrtXCk6Pb+/naD2InYDu/aOwbbCMkmKYg69rAc0aiKmqrXy
         kk4g==
X-Forwarded-Encrypted: i=1; AJvYcCVjBXYGkmZqdkCAOq3jraJx1FiA+3Vtt7ns/Vfm9IK8i7fwBEuD5iPSb/0Te044bmAl8AzuXqym5nppp5JZx7aNOHSt3SA+vyKi0znpSugrxOPx1XMaS+2b7BnvnTeYK3/9Vcv7TzQKN0BEK6bmTCc=
X-Gm-Message-State: AOJu0YxdK8XQ8xoCt3TLxpgkUJt4rdfwmskGmdliJzK34UnhkraibVXB
	rZYgK/tC6h/eegB8q7xCw6fIkeBujzcju6NCVxegtQSCKNeOoi9Rn/26mqsosjY=
X-Google-Smtp-Source: AGHT+IHPoC5vJKiLlcUoz+lVTfQO7/Zgf7xLvVNKf9PcSXUvdvYrwBe6nd580XqrLsmrU6icw3CpVw==
X-Received: by 2002:a81:73d7:0:b0:609:f87b:aad3 with SMTP id o206-20020a8173d7000000b00609f87baad3mr10234701ywc.31.1712658915593;
        Tue, 09 Apr 2024 03:35:15 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id dc13-20020a05690c0f0d00b0060a046c50f1sm2113349ywb.58.2024.04.09.03.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 03:35:15 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dbed0710c74so4743189276.1;
        Tue, 09 Apr 2024 03:35:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUW63mCpHqud79pP+L3YoNRnGlm5rt7uKStvfzAazAtmA4u2+XsmesDFIJWLZY0fJd825Z1OOYPJ1e0HeVyrZIfkSR2dGomK6SmR373qg6mk1qc7jtt+5Qh0kIbIxdEamnB94wcDAED7cNrqM6Jm2o=
X-Received: by 2002:a25:bcd1:0:b0:dc2:41de:b744 with SMTP id
 l17-20020a25bcd1000000b00dc241deb744mr9626198ybm.32.1712658914994; Tue, 09
 Apr 2024 03:35:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
 <a816fea-9974-d17f-bed6-69728e223@linux-m68k.org> <87sezu97id.fsf@intel.com>
In-Reply-To: <87sezu97id.fsf@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Apr 2024 12:35:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMhXFm-kZ50Un1ZFmEcjJ7SnpyEyw65-wucBGpVRUFww@mail.gmail.com>
Message-ID: <CAMuHMdVMhXFm-kZ50Un1ZFmEcjJ7SnpyEyw65-wucBGpVRUFww@mail.gmail.com>
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

On Tue, Apr 9, 2024 at 12:04=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
> On Tue, 09 Apr 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > The user should not need to know which helpers are needed for the drive=
r
> > he is interested in.  When a symbol selects another symbol, it should
> > just make sure the dependencies of the target symbol are met.
>
> It's really not "just make sure". This leads to perpetual illegal
> configurations, and duct tape fixes. Select should not be used for
> visible symbols or symbols with dependencies [1].

In other words: none of these helpers should be visible...

> What we'd need for usability is not more abuse of select, but rather 1)
> warnings for selecting symbols with dependencies, and 2) a way to enable

Kconfig already warns if dependencies of selected symbols are not met.

> a kconfig option with all its dependencies, recursively. This is what we
> lack.

You cannot force-enable all dependencies of the target symbol, as some
of these dependencies may be impossible to meet on the system you are
configuring a kernel for.

The current proper way is to add these dependencies to the source
symbol, which is what we have been doing everywhere else.  Another
solution may be to teach Kconfig to ignore any symbols that select a
symbol with unmet dependencies.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

