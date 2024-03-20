Return-Path: <linux-kbuild+bounces-1265-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A65A881406
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Mar 2024 16:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EEA81C21A11
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Mar 2024 15:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE29140866;
	Wed, 20 Mar 2024 15:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rcQa+4pa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4184AEE9
	for <linux-kbuild@vger.kernel.org>; Wed, 20 Mar 2024 15:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710946921; cv=none; b=N6gguS2sIs99DAPEqxt6rRotrkBqhxQyC/jk6eoDVwB+i0+0qSUN7YdJawLIjsNUjaCVXWBL9NNVbMAVcTQa+MESQLp7iby5jMGLRATKmcDxiX1AywYKDoliI8DyQn1SYTETioUmAJMfhM0G9sVlA94qljozEs7SmDnkPmNN6z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710946921; c=relaxed/simple;
	bh=+4EsG1JyTS1pmGYSbeoCZezGh3/7hj5M3guBOkcgeSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AyvUl77+1q/bTApQbmTBB3flBndwCKtisgr21+HYVzoL83u0m98I9J7sLf693Uk6WeilFledBznBx1WcGQ/RvEj6l8Ha2KSbPmaVT1XJSHlfeXHAFJN8cJBW0EpJN1Ac0LSp9s/cWtv0RmwmS6/1b8Fqa6jlNPA2y7Wm9G+XDWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rcQa+4pa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9B2C43394
	for <linux-kbuild@vger.kernel.org>; Wed, 20 Mar 2024 15:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710946921;
	bh=+4EsG1JyTS1pmGYSbeoCZezGh3/7hj5M3guBOkcgeSA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rcQa+4pa1OEc+r4q8AdMwNbZSdvMi/Ar2u8PlywadsQ/8XLnzWK1htTNgqvK4+6jn
	 hEgNHSdYDxZxRXEacO1R7S0HzTDV4lEmrwIJMcfMNMV1pU7QArXcQUqTaR2yVX1Y2W
	 yEDwKd9DoIjIPs373Q8gt1AlpAiXqnBuUiUynpSF89WHXlO/+vjiNMyATrtvLscblO
	 /wj61XiCyd18yqgWkXOw8OfBACSn8Kx4FD7p1b3zaEKSYnlNtEHzoxu11Q/ivapenx
	 IiRvfyaRUiwaGfLo4qqDXCJmGxdq2hnFKT7zjExQ+oWqqRnO43k5r5/lrrrKhaATkU
	 modfuN44H+xBg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5157af37806so2393099e87.0
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Mar 2024 08:02:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2qd3pdR2uYbVerF+L7B1dywMyOZhPOsTPVo7xEJtkUNWdUhwP0McaXjtKsp1+ImGM0AkSEpnrWmAEWt3Wt20bp6QMBEPNJCYQzA+P
X-Gm-Message-State: AOJu0YyIrgc85HxyPAjYhQgIPwFF3OPRtvle6/7RdETBjHMbNQGzUPfx
	4Vm8IsO2s0O+moRDInAD9iw/eYIp3/UdTOS3l9zS77aLgDYsxRYdUQpSmGgyNOOu8gVghw0uLI2
	AsVCE5/bdnlUfnDmmy4D02zmIvTA=
X-Google-Smtp-Source: AGHT+IG0j19U1sFCWoaEa1jykFIBvUxwQ25ue63Nk6hHxIzZiHHBAWPLTH0L+uDeGP5r1JX4ckzloCha9fUFGp5bUD4=
X-Received: by 2002:a05:6512:3d91:b0:513:c607:7a9b with SMTP id
 k17-20020a0565123d9100b00513c6077a9bmr15637797lfv.41.1710946919911; Wed, 20
 Mar 2024 08:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZfodWv+E6Ekqr7fl@goliath>
In-Reply-To: <ZfodWv+E6Ekqr7fl@goliath>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 21 Mar 2024 00:01:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNATUFzG9jTfFB831vZr7t-8w6UWfX85Jn2tEvypkmhcs4A@mail.gmail.com>
Message-ID: <CAK7LNATUFzG9jTfFB831vZr7t-8w6UWfX85Jn2tEvypkmhcs4A@mail.gmail.com>
Subject: Re: M= modules build w/ objects in different directory
To: "Daniel Walker (danielwa)" <danielwa@cisco.com>
Cc: Jing Leng <jleng@ambarella.com>, 
	"Valerii Chernous -X (vchernou - GLOBALLOGIC INC at Cisco)" <vchernou@cisco.com>, 
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>, 
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 8:20=E2=80=AFAM Daniel Walker (danielwa)
<danielwa@cisco.com> wrote:
>
>
> Masahiro,
>
> I found this commit,
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D23a0cb8e3225122496bfa79172005c587c2d64bf
>
> It had this note,
>
> [masahiro: I do not think "M=3D$(OUT_DIR) src=3D$(PWD)" is the official w=
ay,
> but this patch is a nice clean up anyway.]
>
> Is there an official way or recommended way to build objects in a directo=
ry
> outside the external modules source directory and outside the original ke=
rnel
> source directory ?
>
> Daniel


There is no official way.
One known tip is to use a relative path for M=3D.

For example, the relative path from your kernel source
to your external module directory is  ../path/to/module

 $ make O=3Dpath/to/output  M=3D../path/to/module


The module objects will be output into
path/to/output/../path/to/module/.




--=20
Best Regards
Masahiro Yamada

