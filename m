Return-Path: <linux-kbuild+bounces-560-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B023382D3C8
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jan 2024 06:04:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41D891C20FC4
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jan 2024 05:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CA263B6;
	Mon, 15 Jan 2024 05:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YGuD+MFI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D1663AB
	for <linux-kbuild@vger.kernel.org>; Mon, 15 Jan 2024 05:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e835800adso8975626e87.0
        for <linux-kbuild@vger.kernel.org>; Sun, 14 Jan 2024 21:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705295087; x=1705899887; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYKhFg53vuL9N15IX+5EquLWs1jwGTmvz1VwrsyukZI=;
        b=YGuD+MFICnODSXC8t459+Wsjv1qZntrm9pctwDfV3hYHPaVHOUKEugY999RqkYZt2M
         npFi5gQ/uc7Dz/hNd3x1idMKaccT8o1x4VlSa/S8AQMxfYEGFF5c7lRmRiK4yuIxCxoe
         ICPzVNgf8Q/7C4AeYns/9w36DPxKiYIrXIps0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705295087; x=1705899887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYKhFg53vuL9N15IX+5EquLWs1jwGTmvz1VwrsyukZI=;
        b=rzplL8xiFBWk5eUnThEwzaz2SagMTGjqmNuOXm2dWslpxet4MNJAdAXNWI6uxoMw5/
         Ivcjja/EeMDbKAgA1VSL5ajgIscUORVGawOkYOrsgLiod6QX+CbbwmI+NfwmY3E2N9hO
         jXeOVsFDuaPjIvsswJqkM+ks2qnXoUuTm9+SU4/5oB2g1hWCud1htjscvq6BRzdmH/Sa
         0oV0BOqKNlNac546ICeEsFv3Ahz9tBQk03WDc0AscWFPj3hxQ6t48FrpXgZFnLXXkQwv
         7brmqw1VlKjrXT29cZ02qLaWAztKORriJDSt8aleXocvwzoXtc6oQqRYc0oYHHJ9oHbu
         FxyQ==
X-Gm-Message-State: AOJu0YzqOPYuxm2exxY+hXOva0BSC2vQI35qyyu8cB7aLorV4itXmPTD
	S8fXtRficB6dja4uN3G5H9fRoJjw2jjkEAivlQ5guitDmQ==
X-Google-Smtp-Source: AGHT+IF1RU397B5C/Pbvqe318XgsH/VdWU6i04G00+FMD7wnstfH3ZzXomKCWSEt+ZPP419b84jxtA==
X-Received: by 2002:ac2:5467:0:b0:50e:7d6c:b968 with SMTP id e7-20020ac25467000000b0050e7d6cb968mr1265125lfn.201.1705295087451;
        Sun, 14 Jan 2024 21:04:47 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id e13-20020a170906c00d00b00a2a1bbda0a6sm4877539ejz.175.2024.01.14.21.04.46
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jan 2024 21:04:46 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3367601a301so7205224f8f.2
        for <linux-kbuild@vger.kernel.org>; Sun, 14 Jan 2024 21:04:46 -0800 (PST)
X-Received: by 2002:adf:e584:0:b0:337:a43e:c3d4 with SMTP id
 l4-20020adfe584000000b00337a43ec3d4mr658744wrm.170.1705295086160; Sun, 14 Jan
 2024 21:04:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231228054630.3595093-1-tfiga@chromium.org> <CAK7LNATBipJtprjvvRVYg8JcYOFXQdpLEyEc+4+8j1PtBQ+PUg@mail.gmail.com>
 <CAAFQd5C3vAUJhKiQ1LPkZv3dJxNvK4QinRezV9Q8rz_Ov6FSUQ@mail.gmail.com> <CAK7LNAQcaDneE4rnjvV+GTSBBMozm5deu_q9+STTn60ervZJbA@mail.gmail.com>
In-Reply-To: <CAK7LNAQcaDneE4rnjvV+GTSBBMozm5deu_q9+STTn60ervZJbA@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 15 Jan 2024 14:04:26 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DcxL80cb8w9OZs0mpD=Y3K=LmM7exG7U_DaSsMkfni7Q@mail.gmail.com>
Message-ID: <CAAFQd5DcxL80cb8w9OZs0mpD=Y3K=LmM7exG7U_DaSsMkfni7Q@mail.gmail.com>
Subject: Re: [PATCH] kconfig: menuconfig: Make hidden options show as dim
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jesse Taube <Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 13, 2024 at 8:23=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Wed, Jan 10, 2024 at 10:05=E2=80=AFPM Tomasz Figa <tfiga@chromium.org>=
 wrote:
> >
> > On Fri, Dec 29, 2023 at 1:10=E2=80=AFAM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > >
> > > On Thu, Dec 28, 2023 at 2:46=E2=80=AFPM Tomasz Figa <tfiga@chromium.o=
rg> wrote:
> > > >
> > > > When hidden options are toggled on (using 'z'), the number of optio=
ns
> > > > on the screen can be overwhelming and may make it hard to distingui=
sh
> > > > between available and hidden ones. Make them easier to distinguish =
by
> > > > displaying the hidden one as dim (using the A_DIM curses attribute)=
.
> > > >
> > > > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > >
> > >
> > >
> > > Do you think this is useful?
> > >
> > > This changes the color only when you select a hidden item.
> > >
> > >
> > > For unselected items, you cannot distinguish hidden ones,
> > > as A_DIM has no effect to black text.
> > >
> > >
> >
> > Hmm, are you sure about that? For me it seems to dim the text. it
> > seems to be also used in the existing code for dlg.button_inactive.atr
> > of the mono theme:
> >
> > https://elixir.bootlin.com/linux/latest/source/scripts/kconfig/lxdialog=
/util.c#L26
>
>
>
> Then, your code works only on the mono theme.
> (when your terminal does not support color, or
> "MENUCONFIG_COLOR=3Dmono make menuconfig")
>

No, that's not what I meant. It works for me for all themes, see the
screenshot at https://postimg.cc/sBsM0twT . The terminal is tmux
inside hterm (which in turn is supposed to be compatible with xterm).
I guess I can test a couple of different terminals.

In which terminal is it not working for you?

>
> In the normal color mode, the foreground text is black.
> (Just like a picture in https://en.wikipedia.org/wiki/Menuconfig)
> A_DIM does nothing for black.
>
>
>
> --
> Best Regards
> Masahiro Yamada

