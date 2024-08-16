Return-Path: <linux-kbuild+bounces-3033-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 900F7953F23
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 03:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 457261F24058
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 01:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555211D69E;
	Fri, 16 Aug 2024 01:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QlZW91yi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3097138DF9
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Aug 2024 01:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723773216; cv=none; b=ovfU8i5JbFBPc/p/GAq1ZM7oKHOLhfQ3z7WY9vIJv1qbHiMfHZODGoW0tJdlNMkoOBWOoRHffOLyfrD5nK7YVaJdRlCAlDQNYAyeIi8BFC6I9/QtxJjrk4F4v1CzjwbrpHqQZgQ5I4jJud2rRGnEMOrMShY3PTJe1eRkzdPys6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723773216; c=relaxed/simple;
	bh=CsQtEKd+22Aa3er5vEynJ2X/5Qpvd/Cp6+aoD95Osx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d3BgNkpnDvZH0WedopD/D+snwA5Tr/CYGxxK9u2rJ6hmitIbJQ2fmRI0hxKqLayzkZ9O/godbAWNiMb5Q7QWfTjSF0HluCgrwACudPg3XMQx58wdPA/LfbG8F9XOgTLS3QOWeHhIerfwxM6zrJ9QrcvpZ6aV6TEPg9erusuWjII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QlZW91yi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29D6C32786
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Aug 2024 01:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723773215;
	bh=CsQtEKd+22Aa3er5vEynJ2X/5Qpvd/Cp6+aoD95Osx0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QlZW91yiiT2ipkmBFH1GMPliCNUK8kVP93PTQ894zBHksWHqFY0Bl98hCnHuOjdDc
	 hAX0AsUyAcVCrLU/tMKLEM0Jtkpt4yhsX+i+JwBaYeGAGASNQG3s6nDP4Gk6avopzN
	 xwQie97D1n5ca6xrnGYbZKxrs9rgkCS2a2yuOdlSUB1J045lsN8RY3gIMyb9srHoDT
	 hIvyvY4V7CYJRRPTba9WO1txXP7VGuhBVtY+lQ/HBKNth8HTdheRd2XRwiCEN8a8I3
	 h8O+EpZMh/Nj+Crr+DpjmXc3pipckCdyTJ1BYtV2BHX7fI39HttWj2LHiyev1tjdmG
	 b5L101tz8Z4Hw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52f01afa11cso1911206e87.0
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 18:53:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUsLx7PLFhszkh2hFLPJAc7XNPNqYwq4TIFPYw6qj79NW5bN5WT+tWO+S5f7B2BbgTTTYzNyfqGhPRj9wOpvmVnpt73gD1jlvhg6zax
X-Gm-Message-State: AOJu0YxgpU2dnpSHoT8rY8uFkbUCItaJF+tqm0LXuPO9c3giTzAJvWNU
	cDOnQvm3s5XWzThREd3WuAZyvckuidUdaU3rgcZdiABuOC5EvdsAmIz2q1rmj4MQjYW2380K5H9
	GBoYvg0ppjnaQHUxFLlgjndc+vrE=
X-Google-Smtp-Source: AGHT+IGqplYDUYKslDuGdO1wu/rkk6APusFZS4UYm/1wnvKm4V/JmlLqokx9wwoxZcgeRu/FzSTlyVRmua7EgQxlqgs=
X-Received: by 2002:a05:6512:a8b:b0:52e:9d6c:4462 with SMTP id
 2adb3069b0e04-5331c6b0257mr656903e87.23.1723773214391; Thu, 15 Aug 2024
 18:53:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815110059.4912-1-tianyuanhao3@163.com> <CAL_JsqJOb=WvP85VN1R+ERj3pRnddwcDjwyW4OOx5vL4W6RC7A@mail.gmail.com>
In-Reply-To: <CAL_JsqJOb=WvP85VN1R+ERj3pRnddwcDjwyW4OOx5vL4W6RC7A@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 16 Aug 2024 10:52:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNASTXOe5_VR2n79EFbp6a=hLoKKstoy31zf1nZv2PXjcaA@mail.gmail.com>
Message-ID: <CAK7LNASTXOe5_VR2n79EFbp6a=hLoKKstoy31zf1nZv2PXjcaA@mail.gmail.com>
Subject: Re: [PATCH 1/1] kbuild: Only build dtc if needed
To: Rob Herring <robh@kernel.org>
Cc: TIAN Yuanhao <tianyuanhao3@163.com>, linux-kbuild@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Simon Glass <sjg@chromium.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 7:41=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> +Masahiro
>
> (use get_maintainers.pl in the future)
>
> On Thu, Aug 15, 2024 at 5:01=E2=80=AFAM TIAN Yuanhao <tianyuanhao3@163.co=
m> wrote:
> >
> > At present Linux always builds dtc if CONFIG_DTC is defined, even when
> > DTC is provided. The built dtc is not actually used, so this is a waste
> > of time.
>
> That's kind of a edge usecase, so I'm not sure it is worth the
> complexity.


Indeed. Not worth the complexity.


Overriding DTC is not a general use.
It is a knob so that someone can test the latest
dtc from upstream.


> We could also just make CONFIG_DTC visible so it can be
> disabled. Or make it a path defaulting to the built-in one. Maybe
> Masahiro has some ideas.


Let's not do anything.


This patch is NACK.





>
> > Update the Makefile logic to build dtc and fdtoverlay only if DTC or
> > FDTOVERLAY is not provided.
>
> Overriding fdtoverlay is not even supported currently. Adding support
> for that should be a separate patch.
>
> > Also, add an fdtoverlay wrapper to hide the actual path differences of
> > fdtoverlay from the make_fit.py script.
>
> That's ugly.
>
> Rob



--
Best Regards

Masahiro Yamada

