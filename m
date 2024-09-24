Return-Path: <linux-kbuild+bounces-3690-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E043983B60
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 04:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 471B1280D93
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 02:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7A811CA0;
	Tue, 24 Sep 2024 02:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aeQaFQEd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96B3186A;
	Tue, 24 Sep 2024 02:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727146547; cv=none; b=We+DwFefUMLqC9BcXjPdTARsU8z0wq4oMFX0rAsSsGmGoTopdqZ/fclXnSxAJnl3vbRkaiGaofurXn4r6aR0XenOjUwV70tnVqMNRp96taDEZ0HZjrZ5OEPn/xcPrjLtu3ghijcwamaW2/2XF28uSFcrgXKi3bD5pK+p3eP+JhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727146547; c=relaxed/simple;
	bh=M05yQW07ThRxiR3MSK4O8QgHXz6dEgYifJTyHDD+xkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+f4iViIfZdQqNPIKkQmjqdgf28NFFBmolL0t4w7HavW+8SMexpyFANfX63HXPBohw9aJfLJw//oJ8FKCxLqP3rtOLn2CIPAibQJQnsOTe1fTIBfcbOzCh/s/bwOQeMY84xiFUc5VZeVpYpsy0uyXHSiV2aKGhNjH0leZ0/mIkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aeQaFQEd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED56C4CEC4;
	Tue, 24 Sep 2024 02:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727146546;
	bh=M05yQW07ThRxiR3MSK4O8QgHXz6dEgYifJTyHDD+xkk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aeQaFQEd2XED5QwtSSuc1H4/fjRx3g6+9mUnHqQ2Az0yfx0WGYs9MqDhi+fnC8aIH
	 npbQvHQeQdW3CcPwC2WG0c85kVH7ni+QB+9fR1z2EkITIT4uELViFpAdvJUT2VxNgj
	 ARYWOgxkmv2Da6vFfwM6slUxTnQKsbPMeYRNyvqcIDOM+B0A7fasQzanxDjNhVigeG
	 +yCUU3bs8dKLRd5jNJqpoqTJYLytE7UtSfLrfJd8iOI6HF/YBncz01rM3Ds5Vbj21/
	 7XPuX9KBnE0IhYt0HCeMIogARb+pnrU/MQ/T3QSkjD/NSZISzD71MaY5Nj6x2p4PCU
	 U0z4ojRjjVRsw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-537a2a2c74fso1344757e87.0;
        Mon, 23 Sep 2024 19:55:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKNxVnVjI8fbO2m/3UB/uzNXESIG6SlkycEWi4HxiL13Mp6UPpaGBecB0r2KB8Z+CpHjQlJd5rxXbvryE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGdzE/rA4W55POGkzhifWC/r9/aUmZ2s+7G3Bt0fxraBzwq/JO
	FYbh3ZOi++4wVtDZl3iCJ9IuuIUvTWXPKKLlsU31Simuh9KpUy1z1LXeQUgVw/IkZ+GDrKLJcr9
	xHYsD1t/Gth2yLc6oqKWGe949qwE=
X-Google-Smtp-Source: AGHT+IF+feueLHfUVsLlViU2g/9FMR0cgj7bJbDtHpOfkPC18Hbu9o014UANWiTP0EWCkLLQepx07X4YGksDjmY9Ce0=
X-Received: by 2002:a05:6512:ea5:b0:533:456a:cb33 with SMTP id
 2adb3069b0e04-537a69146eamr429765e87.20.1727146545036; Mon, 23 Sep 2024
 19:55:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913171205.22126-1-david.hunter.linux@gmail.com> <20240913171205.22126-2-david.hunter.linux@gmail.com>
In-Reply-To: <20240913171205.22126-2-david.hunter.linux@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 24 Sep 2024 11:55:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNATkjh8LR58+SZPw44ezbRj6-aisQ9nsUoTY_6yVf+t3Mg@mail.gmail.com>
Message-ID: <CAK7LNATkjh8LR58+SZPw44ezbRj6-aisQ9nsUoTY_6yVf+t3Mg@mail.gmail.com>
Subject: Re: [PATCH 1/7] linux-kbuild: fix: config option can be bool
To: David Hunter <david.hunter.linux@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, javier.carrasco.cruz@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

"linux-kbuild: fix:" is not an appropriate subject prefix.

Just try "git log scripts/kconfig/streamline_config.pl".


You will see  "streamline_config.pl:" is consistently used
for the commit subject.


For example,

"streamline_config.pl: check prompt for bool options"




On Sat, Sep 14, 2024 at 2:12=E2=80=AFAM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> Select configs that do not have a prompt. Config options can be bool or
> tristate. Ensure that bool options are also selected.


I do not see an immediate benefit from this patch.



Boolean CONFIG options are skipped due to the following code:

if (defined($orig_configs{$config}) && $orig_configs{$config} ne "m") {
    next forloop;
}


So, I do not understand why this patch is necessary
until I see 7/7.




>
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---
>  scripts/kconfig/streamline_config.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/strea=
mline_config.pl
> index d51cd7ac15d2..a828d7ab7e26 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -238,7 +238,7 @@ sub read_kconfig {
>             }
>
>         # configs without prompts must be selected
> -       } elsif ($state ne "NONE" && /^\s*(tristate\s+\S|prompt\b)/) {
> +       } elsif ($state ne "NONE" && /^\s*((bool|tristate)\s+\S|prompt\b)=
/) {
>             # note if the config has a prompt
>             $prompts{$config} =3D 1;
>




--
Best Regards

Masahiro Yamada

