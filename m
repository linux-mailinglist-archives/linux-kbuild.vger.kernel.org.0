Return-Path: <linux-kbuild+bounces-755-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B72178461C2
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Feb 2024 21:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CA852827C5
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Feb 2024 20:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23038528E;
	Thu,  1 Feb 2024 20:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SBo4/l3M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4718529F
	for <linux-kbuild@vger.kernel.org>; Thu,  1 Feb 2024 20:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706818000; cv=none; b=l8OvhLX8d1SDnBjPdrlVvn/14e9GZdCwz/4NOhsDZMuXk65ssYLVWcXvparSFwb8XG2PKCsPgR5Kec2m6nmM2/E0QuIotIiWipg6jmybmF2zYmL1IgL/TS7861zCgiBxiXP5LVttfKSK29iKHJ2kLVGHk43JfnTPKzCMzyu4wug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706818000; c=relaxed/simple;
	bh=oA7/NspYB65l8rTsetujkWO2pCTj/tsZobfNjYRmfKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fihiKy8NplNNJn8Ki6gZBtTMbIdzJ2HMgPKBLS981+wnVzjvpI2p7QkW72D8KUsgIA0MkBdDWCKOgZodktg0ByZqS4OCpBJIDVLDw77xxGOnu3wzUPakVXqkOxRGEofsCnXZBBmYClN4+EEVxTgd2WTLIoQMBSWuZeVz7mx6HZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SBo4/l3M; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a36cb22869aso105428266b.0
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Feb 2024 12:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706817996; x=1707422796; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kP3MIyg6XgOfzN8W5NDTvSQr/3wxGR91YVPW2iDkboc=;
        b=SBo4/l3MwuUmebhLknMVjJiuyErNiSKGUuEVap6fg8rpef0Lac34Oy150IEMpc9U0U
         z8JyU6SsIBo9pv+zEQ4w4iWvqYaDwnRoUDo8C8KhbYMLdXKoyhvHHIfF6wjFuBdpu7Te
         UmAs0o5N15W56AOruvzKjtvJwUhebCMI9QYZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706817996; x=1707422796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kP3MIyg6XgOfzN8W5NDTvSQr/3wxGR91YVPW2iDkboc=;
        b=u69aYW0WL1EgJr0X7QGqzMEF4uVvKYA4b4fO6qR64vkG59NhqJ5MG8Mlqw0Ac662ey
         lzwBBvxaIOYq11VoVH26nZpxuM6nXoMRGIRlBTSrHlCz4iqEu4IEq8WVqsrd4wjrnl4d
         2B2w4fmb6u0Rvyas/aVeHy/7vC8G0+SNvRBqsxWT0FKEl/RGR1yyuIpA84a8jEAyJE6j
         e3RabJLmJkR/QLrhpvHjpTR6U14xEw0B5FTuyerpMuWXvUFtbrQfFr2EXUeObbJx927R
         tjMK4hG7d9McwGmcPddQGGgWBXZLx61kV++/LjkMCE+tmo4TjObOnhu+a0y10+DVUnoi
         lr5A==
X-Gm-Message-State: AOJu0YxMVu+jIv1jsmQnbG8rVWLsXCYXcMEyQxq0jwYcgEH/798eiY3u
	Y1YTemZ9h1pgea3sJCRcO+lzaIo/BsXknIOzwtvdH/iW/dU+iiIVs15RDW3Nwei+yV9F6lCDBDD
	UdpaikA==
X-Google-Smtp-Source: AGHT+IFx3IGBtwy/vIEw3LGRTh3qIlx43H7Z/fAEMX3kAQ7WmywSImMwbsnd7CgOqvYwFfvJeZeoFw==
X-Received: by 2002:a17:906:dfcb:b0:a31:616c:7a7 with SMTP id jt11-20020a170906dfcb00b00a31616c07a7mr4728253ejc.16.1706817996578;
        Thu, 01 Feb 2024 12:06:36 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWiZuzVROZ6n9GaT2Z3pzxlQRSJ5KbMwCyXJx/iOTUj4MQ0hb0SIYHDjWXWhwYz0GQDQtRFAvjopuwG/y3HOBZh3Fg1++jrzbk2MpU6
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id ch17-20020a170906c2d100b00a35fa9ea3b7sm114059ejb.126.2024.02.01.12.06.35
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 12:06:36 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-558f523c072so1989736a12.2
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Feb 2024 12:06:35 -0800 (PST)
X-Received: by 2002:a05:6402:509:b0:55f:43af:19d7 with SMTP id
 m9-20020a056402050900b0055f43af19d7mr4668961edv.34.1706817995577; Thu, 01 Feb
 2024 12:06:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNASGqfMkTuzP28qydpYCC0ct3cAgMpbPpmgHuQHZbtLhbA@mail.gmail.com>
In-Reply-To: <CAK7LNASGqfMkTuzP28qydpYCC0ct3cAgMpbPpmgHuQHZbtLhbA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 1 Feb 2024 12:06:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whJKZNZWsa-VNDKafS_VfY4a5dAjG-r8BZgWk_a-xSepw@mail.gmail.com>
Message-ID: <CAHk-=whJKZNZWsa-VNDKafS_VfY4a5dAjG-r8BZgWk_a-xSepw@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild fixes for v6.8-rc3
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Feb 2024 at 05:40, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>  - Replace tabs with spaces when followed by conditionals for
>    future GNU Make versions

This is horrid.

Now, the whole "whitespace type matters" is broken in Make anyway, so
clearly this is a fundamental make problem, but this commit makes
things worse by making the tab replacement use eight spaces, so it
really visually is entirely indistinguishable.

Don't make a 'make' problem worse by not visually distinguishing tabs
from spaces.

IOW, those "that can't be a tab" cases should have used pretty much
_anything_ but 8 spaces. Yes on indentation of nested 'if' statements,
but no on then using something that visually makes no sense.

IOW, those nested if-statements should use perhaps just 2-4 spaces
instead. That tends to match what we sometimes see in C files too, and
it is visually very clearly not a tab with the kernel coding rules
(yes, yes, some people set tabstops to smaller values, that's _their_
problem).

I've pulled this, but please fix it, and don't make an insane Makefile
whitespace situation worse.

                Linus

