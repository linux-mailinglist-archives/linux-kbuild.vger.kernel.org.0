Return-Path: <linux-kbuild+bounces-612-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AF38359FF
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jan 2024 05:13:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1397B1C21408
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jan 2024 04:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA516122;
	Mon, 22 Jan 2024 04:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PLWbGf8D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C9D610D
	for <linux-kbuild@vger.kernel.org>; Mon, 22 Jan 2024 04:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705896829; cv=none; b=FMsuYAwp2745zRS1L4a+zm//V7ZEX4SjnKRld1709wQft/P4Hx7e8VFtyV/cRnOR0RuUKo1j8IgG+Q7R5XlfO216WyxboDa1E/dvemygS+Al2smmI1cB7o3ilRTIikAlFFfUkPRhmLg9sYSqzn+Fl9/c+BSrZsK3XYdcwI49t+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705896829; c=relaxed/simple;
	bh=sFyv+jUWRXd/cynW/u9ytP1g1fYNXA9LJzShvHGdwP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s2AcTHdZsk19UzLMb+8SJxEWFUQV+knffXpmdQwkU/dFZr7XM2uZ6xgkjKJmS9a6X7wPGXlviJtYa93D00AkDhBuukwlknV3YUqycQCteRRVRdFbIQNFls5chvLmFolO5+F7nbWVPsOTfYztYF9Auc8YkNGTe7i50j8eDgZPwyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PLWbGf8D; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a28f66dc7ffso649436166b.0
        for <linux-kbuild@vger.kernel.org>; Sun, 21 Jan 2024 20:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705896826; x=1706501626; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFyv+jUWRXd/cynW/u9ytP1g1fYNXA9LJzShvHGdwP4=;
        b=PLWbGf8DqqZRS4ebVQlJSYwWox8ZDlQyT7ITPMLl02ogjtg5nsiuz/Pu72c3d/CZTc
         m7LBh2ecbB+5deg4Tuax94+Az1YuTm3jWxNmAZbzkCSc7WX6jQWjfyUbofq0BBmH+QQH
         1ZknQhY5ls23SnTr4NG8HH5lZeV3rPL5BdxRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705896826; x=1706501626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFyv+jUWRXd/cynW/u9ytP1g1fYNXA9LJzShvHGdwP4=;
        b=o5dPJ4hir5Feoy6al1tBWQmmFlHpxSkYCxSJL8Wg+RAhJ48uKgh11O7CXf1DplJfat
         mWZ0m8FJ/pyAS3c0Tou/OsQNiFFEOIlpGzRpmUADWLA31VvSvKpiGASWDOYMH7Bihecr
         /G+wWNGmianWbaeiTV1Z6RYYGzubVoEsCIDkkj8VNjSJplBJn07Ioii0CZtlBc4fSTP5
         d+swm6uYEk5vzmsz95l6GEhufokmgfkHucxxsP2OD4LZkHmHdtNEow12BwVDy2zUgsHP
         wwIPlguTlAsPBBfhcNznvVg9Fcxedb+khFrXXgqdc8dqkOOjfLief1nxS7SUh/ElA1tV
         WavA==
X-Gm-Message-State: AOJu0YznE6qj/gg0gSz22y7IPMxOKdBX0mQtdvF4EkoE4IbxfeMQZ/n8
	YzPmj/DP6Mrebd9Y0cPIDQnfp+RQWzm6Oo9pyZhiF5sOUgOzM8KcPZ+N5sBOvzk63YZXIJ7B2lE
	=
X-Google-Smtp-Source: AGHT+IGVhGMTBgBiuOHWG7hf0Noeli+6GnSoA6ZRbFYOYWwPb/At7yZDoiVZ2fSXpMc7DWr9Otvk7g==
X-Received: by 2002:a17:906:1bb1:b0:a27:fdc1:59c6 with SMTP id r17-20020a1709061bb100b00a27fdc159c6mr3899507ejg.26.1705896825876;
        Sun, 21 Jan 2024 20:13:45 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id st8-20020a170907c08800b00a2ff7a6b47esm1703909ejc.46.2024.01.21.20.13.44
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jan 2024 20:13:45 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3392b15ca41so686895f8f.0
        for <linux-kbuild@vger.kernel.org>; Sun, 21 Jan 2024 20:13:44 -0800 (PST)
X-Received: by 2002:adf:f641:0:b0:337:b36d:72a4 with SMTP id
 x1-20020adff641000000b00337b36d72a4mr1723451wrp.36.1705896824443; Sun, 21 Jan
 2024 20:13:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231228054630.3595093-1-tfiga@chromium.org> <CAK7LNATBipJtprjvvRVYg8JcYOFXQdpLEyEc+4+8j1PtBQ+PUg@mail.gmail.com>
 <CAAFQd5C3vAUJhKiQ1LPkZv3dJxNvK4QinRezV9Q8rz_Ov6FSUQ@mail.gmail.com>
 <CAK7LNAQcaDneE4rnjvV+GTSBBMozm5deu_q9+STTn60ervZJbA@mail.gmail.com>
 <CAAFQd5DcxL80cb8w9OZs0mpD=Y3K=LmM7exG7U_DaSsMkfni7Q@mail.gmail.com>
 <CAK7LNASyiYasGa2_Ppp54nEq2m08q_Z_keViZDCavmNN0rBAzQ@mail.gmail.com> <ZaZv_TNR5_1zOCji@reykjavik.ads.avm.de>
In-Reply-To: <ZaZv_TNR5_1zOCji@reykjavik.ads.avm.de>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 22 Jan 2024 13:13:27 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BUBnCcg5nBfL-McdkR3dVEjqxFgz+amkhURxBpdRGaSA@mail.gmail.com>
Message-ID: <CAAFQd5BUBnCcg5nBfL-McdkR3dVEjqxFgz+amkhURxBpdRGaSA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: menuconfig: Make hidden options show as dim
To: Nicolas Schier <n.schier@avm.de>, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jesse Taube <Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 9:01=E2=80=AFPM Nicolas Schier <n.schier@avm.de> wr=
ote:
>
> On Tue, Jan 16, 2024 at 07:58:05PM +0900, Masahiro Yamada wrote:
> > On Mon, Jan 15, 2024 at 2:04=E2=80=AFPM Tomasz Figa <tfiga@chromium.org=
> wrote:
> > >
> > > On Sat, Jan 13, 2024 at 8:23=E2=80=AFPM Masahiro Yamada <masahiroy@ke=
rnel.org> wrote:
> > > >
> > > > On Wed, Jan 10, 2024 at 10:05=E2=80=AFPM Tomasz Figa <tfiga@chromiu=
m.org> wrote:
> > > > >
> > > > > On Fri, Dec 29, 2023 at 1:10=E2=80=AFAM Masahiro Yamada <masahiro=
y@kernel.org> wrote:
> > > > > >
> > > > > > On Thu, Dec 28, 2023 at 2:46=E2=80=AFPM Tomasz Figa <tfiga@chro=
mium.org> wrote:
> > > > > > >
> > > > > > > When hidden options are toggled on (using 'z'), the number of=
 options
> > > > > > > on the screen can be overwhelming and may make it hard to dis=
tinguish
> > > > > > > between available and hidden ones. Make them easier to distin=
guish by
> > > > > > > displaying the hidden one as dim (using the A_DIM curses attr=
ibute).
> > > > > > >
> > > > > > > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > > > > >
> > > > > >
> > > > > >
> > > > > > Do you think this is useful?
> > > > > >
> > > > > > This changes the color only when you select a hidden item.
> > > > > >
> > > > > >
> > > > > > For unselected items, you cannot distinguish hidden ones,
> > > > > > as A_DIM has no effect to black text.
> > > > > >
> > > > > >
> > > > >
> > > > > Hmm, are you sure about that? For me it seems to dim the text. it
> > > > > seems to be also used in the existing code for dlg.button_inactiv=
e.atr
> > > > > of the mono theme:
> > > > >
> > > > > https://elixir.bootlin.com/linux/latest/source/scripts/kconfig/lx=
dialog/util.c#L26
> > > >
> > > >
> > > >
> > > > Then, your code works only on the mono theme.
> > > > (when your terminal does not support color, or
> > > > "MENUCONFIG_COLOR=3Dmono make menuconfig")
> > > >
> > >
> > > No, that's not what I meant. It works for me for all themes, see the
> > > screenshot at https://postimg.cc/sBsM0twT . The terminal is tmux
> > > inside hterm (which in turn is supposed to be compatible with xterm).
> > > I guess I can test a couple of different terminals.
> > >
> > > In which terminal is it not working for you?
> >
> >
> > I use gnome-terminal.
> > The disto is Ubuntu 23.10
>
> I see the same behaviour as Masahiro described with foot 1.13.1 on
> Debian 12.

Thanks for testing! I'll use the two for my testing as well and try to
figure out something more portable.

Best regards,
Tomasz

