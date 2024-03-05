Return-Path: <linux-kbuild+bounces-1159-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F14871744
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 08:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 986251F21C5D
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 07:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5B37EEE2;
	Tue,  5 Mar 2024 07:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V8yUo6Gy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897FE7E775
	for <linux-kbuild@vger.kernel.org>; Tue,  5 Mar 2024 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709624994; cv=none; b=FIJOpb7uGngpHai49Cyf3efX9E6Q2g22HM4AgdbyDkTv6m3NdUUJHKA3iDBz8RJNU0eTaodISgVuj0CDGvjNQoorENBIrMD/E13SEym1Bb7FZHKpwduR1WbxH/wP6EMN0aLRM+1bYh/jK7ogVEmpbCO8ijZnd3eL5RaClGA90+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709624994; c=relaxed/simple;
	bh=G0azDVyc+1/3hvXIMLTl3mAD63L6klmysjz8hmf4lZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZUkFVDJwo+Cm6bItFAo7Ey9obBxxOQOUjVY7dTR8WJ1L0DdW2Sq5UGHb1KQzmkj0HcHgZV40wD/jG6BDMTtfk1TUXayPTe3Mmtb5krAKGASS27mHq0vPez2nm6rt2xLjRBY0Vh/HBtwdkj9mh7DsZ1MK1CeX/vyab/QKQYF6rKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V8yUo6Gy; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56715a6aa55so2521354a12.2
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Mar 2024 23:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709624990; x=1710229790; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZTlwIT9w7Ye2oUDZ5aSGoTWx5DRZwVc6z6LT8pMQV8=;
        b=V8yUo6GyeNYTuy7rek+TyyQ9u3waEZkOIy8FgsloyomeRjSMEze/KqUOpaDYqfNkb3
         U+bUIl+z9RYFn6DB0rDEATjW+mhtOI3B1WJct59LucQ6VrmvAnE4E/zwDYvi69lJlXeZ
         2H/c3YCDwfZLEKJUbb79U8ijG6htURPPgpAP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709624990; x=1710229790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZTlwIT9w7Ye2oUDZ5aSGoTWx5DRZwVc6z6LT8pMQV8=;
        b=XbAxTWj+3uPVYkH8bxWQpU509k9aYQey2oDursYzm6Wymd/vX9YpsIks5RKNGwJM81
         YdqkpYzE5kMZOmRzDIkI3M/MYPXGDlAyqGHI36eO/NDQhXccMmGLGZKjrUz4Kk2yvyRi
         +Vc+i8sLM+vtZxVI2RnPvbr1C9srNYA27qNwVHkbx4Kk5i0b3nWKIhcA3gblFTEji0Bi
         zZv0AVAu9axt/u8xpq/VU21wmbx9Xdo68risnKij+srOOFtR1prXKod3aNKxgUmiCkDU
         yG5l3IjgWkBboSkpgdXSRTHZMr3FFYF017PZTMq1SwgW0Nbo2DeyqMo6QQcEwQyqSCFd
         IxEA==
X-Gm-Message-State: AOJu0YxGIsyeKNOaui1j6UObym/mBWkGX8JVtNdPw4Y/rNdFYjEFKUl4
	JICH5gaRIQoN3L7CHGelooVIlQqkHfxbshGOpf2iqRADe0Kw0usuRpS4IYFEmTXo4KF3yhddt1Z
	u+w==
X-Google-Smtp-Source: AGHT+IG0FkSzzVQ91LF7SSB1Td3etON0nzIbS6M15A9djMaLalhpbZMxGURj9RsnmFO6nveKQC/zNg==
X-Received: by 2002:a50:c943:0:b0:565:fb4c:7707 with SMTP id p3-20020a50c943000000b00565fb4c7707mr7542866edh.26.1709624990394;
        Mon, 04 Mar 2024 23:49:50 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id ek23-20020a056402371700b00564e9746fdasm5503518edb.28.2024.03.04.23.49.49
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 23:49:49 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-412e4426e32so12325895e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Mar 2024 23:49:49 -0800 (PST)
X-Received: by 2002:a5d:4903:0:b0:33d:f7d2:50e6 with SMTP id
 x3-20020a5d4903000000b0033df7d250e6mr8042962wrq.31.1709624989230; Mon, 04 Mar
 2024 23:49:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228060006.13274-1-tfiga@chromium.org> <c1025094-d9aa-4f4c-bb8f-a486f9953bec@infradead.org>
In-Reply-To: <c1025094-d9aa-4f4c-bb8f-a486f9953bec@infradead.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 5 Mar 2024 16:49:32 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AOvUtHOOU-OKQKJwyJGXSt6EopcMBsHWz83n_0XfnOjA@mail.gmail.com>
Message-ID: <CAAFQd5AOvUtHOOU-OKQKJwyJGXSt6EopcMBsHWz83n_0XfnOjA@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: menuconfig: Make hidden options show with
 different color
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, Nicolas Schier <n.schier@avm.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	Jesse Taube <Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 2:40=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi,
>
> On 2/27/24 22:00, Tomasz Figa wrote:
> > When hidden options are toggled on (using 'z'), the number of options
> > on the screen can be overwhelming and may make it hard to distinguish
> > between available and hidden ones. Make them easier to distinguish by
> > displaying the hidden one with a different color (COLOR_YELLOW for colo=
r
> > themes and A_DIM for mono).
>
>
> > Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> > ---
> >  scripts/kconfig/lxdialog/dialog.h  |  5 +++++
> >  scripts/kconfig/lxdialog/menubox.c | 12 ++++++++----
> >  scripts/kconfig/lxdialog/util.c    | 19 +++++++++++++++++++
> >  scripts/kconfig/mconf.c            | 18 ++++++++++++++++++
> >  4 files changed, 50 insertions(+), 4 deletions(-)
>
>
> > Changes from v1:
> > (https://patchwork.kernel.org/project/linux-kbuild/patch/20231228054630=
.3595093-1-tfiga@chromium.org/)
> >  * Replaced A_DIM for color themes with COLOR_YELLOW, because the forme=
r
> >    has no effect to black text on some commonly used terminals, e.g.
> >    gnome-terminal, foot. Reported by Masahiro Yamada and Nicolas Schier=
.
> >    I ended up with COLOR_YELLOW, as it seems to look comparatively dim
> >    with mutliple light and dark color themes in Chromium hterm and
> >    gnome-terminal.
>
> I guess COLOR_YELLOW is a relative thing, i.e., it depends on the term's
> current color scheme in my testing.

Yeah, it's kind of on the edge of being relatively neutral, i.e. not
standing out much more than the visible options, but I couldn't really
find anything that would work better for the standard 16-color mode.
An alternative would be to implement support for the 256-color mode,
but that would likely require quite a lot of changes in the existing
code (and I'm not very familiar with how to do it in ncurses...).

>
> With rxvt (with a beige/khaki background), I do see yellow.
>
> With xfce4-terminal (with amber/orange foreground on black background,
> i.e., my default from days of amber monochrome displays ;), the "yellow"
> comes out as a faded/washed out/dim orange. But still readable.
>
> Anyway, this looks useful to me.
>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks a lot!

Best regards,
Tomasz

