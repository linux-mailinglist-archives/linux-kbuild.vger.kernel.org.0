Return-Path: <linux-kbuild+bounces-7374-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D13ACF8C4
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Jun 2025 22:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D17D0189A3EC
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Jun 2025 20:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CCB27CCF5;
	Thu,  5 Jun 2025 20:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="al042plZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374C3278E7E;
	Thu,  5 Jun 2025 20:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749155221; cv=none; b=MEmjR/mt8G8LpVlIlxDvflSwMR+QD2XzOV8o+GVbXc28NYf6N+/o7Mkq4XNV41Gn5eoo/eqviZe7tpSAnLrVsjO8rmi/PufZblNaCUwmKkMaiGHqBVroG3xoIiaVy7zxglQBmDCQewSCyilBPRo5v7waKe7aJt7X87gQDFFtRjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749155221; c=relaxed/simple;
	bh=+JF8071c4lg517Db2sZWM2wPzcqmgMnNhvsONpKsV6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kFkk3EX3h12MCXpgBhnkF55kZYQupbcCUnjFLASHR1/w16l7DM+siOym9nrPf2YmkEbU1qceBB/4XNq1GjVgYVnsLwXysi49GunNAnFKKu61oVdiniR7+ofGmiKH8OIx4M+dlM0g42sml5akkaNy+PJ3DyMW91DjD5qa3xswurM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=al042plZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D663C4CEF1;
	Thu,  5 Jun 2025 20:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749155221;
	bh=+JF8071c4lg517Db2sZWM2wPzcqmgMnNhvsONpKsV6s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=al042plZEwSKO33dQYs8uhiNo3am4rm03ZapJ0mOZsMI/wBKbQUR2h+TVFk6qrFJ5
	 /htTVXsHuuHeA34w8bfLhGYM0aG39hDuWOW3aaaEAuTZAcFPPt7sBFcbW/vT/62KxD
	 KRHjtOnYfazHU/HUszg2kNqOnQsRi3urtYqfwJQFU0MAwFKvMjaOFyB1nbQ2z75sDY
	 VwKikGiDM9+kiimbx510M7R1qr7hYJd1UcdjxjsxDwkFgISx13iV5w/d4aLdiqjhGx
	 5RbPOIOjhWlBA/XwN3E5WNVMBU5tcblO4h5k0srBwKLyBVAUicwKV9lWF5vbS/Aa/j
	 muSAwe3R5HPXw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5534edc646dso1533149e87.1;
        Thu, 05 Jun 2025 13:27:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVu6lPg89Lg2/oLnnBNEGgZniQ3De+ijS72vM777uTmAqJ8T96yDWu/wt0jo9UlHWf6AwruDND8XmV0lsqtGA==@vger.kernel.org, AJvYcCXwARLIU9gDobJlBLURwsyy78mI3r2LjNAmjZ5IPeMPw89jQUdyNw82eUWb3EA2Ybgw3B0eu5MDXL+V1hY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc/pqy65tJ91/LYhr81dr4NT8NEMqu/RpCmr0wT/Pm47kBfITS
	W587KFQBvU6YnfKUAxtaYWN+FAnRg6X3aCIpS+lHLovBjbL3AL6Qxs7/Ao4i/dZcvpDzTB7nWEM
	E/c0RJSSXywxtzgaPSX9uT5Q3pa63XdE=
X-Google-Smtp-Source: AGHT+IHXcZhSOdZlV1roysND+AZ5TLN6Wb4vTVAhUmHeA1S9SKwpmBH969zJOMQtUYUrSCphCcp+JdrLH68C/ulK43w=
X-Received: by 2002:a05:6512:4002:b0:553:2bf7:77be with SMTP id
 2adb3069b0e04-55366be2d0fmr120285e87.22.1749155219745; Thu, 05 Jun 2025
 13:26:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602105539.392362-1-masahiroy@kernel.org> <4fefa5cb-462f-4e13-9d45-f58775d78bab@suse.com>
In-Reply-To: <4fefa5cb-462f-4e13-9d45-f58775d78bab@suse.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Jun 2025 05:26:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNATQhR9PLSfEZ92FRuD4OGBEk1pk5DUtV4doif9JgUNhnQ@mail.gmail.com>
X-Gm-Features: AX0GCFvlwxGcsH6fc-dcXHNogSFPZbHaHSA1vg5WXcmspcGkRb9SRl7WuL6pz-s
Message-ID: <CAK7LNATQhR9PLSfEZ92FRuD4OGBEk1pk5DUtV4doif9JgUNhnQ@mail.gmail.com>
Subject: Re: [PATCH] module: make __mod_device_table__* symbols static
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Daniel Gomez <da.gomez@samsung.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 5:50=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wro=
te:
>
> On 6/2/25 12:55 PM, Masahiro Yamada wrote:
> > The __mod_device_table__* symbols are only parsed by modpost to generat=
e
> > MODULE_ALIAS() entries from MODULE_DEVICE_TABLE().
> >
> > Therefore, these symbols do not need to be globally visible, or globall=
y
> > unique.
> >
> > If they are in the global scope, we would worry about the symbol
> > uniqueness, but modpost is fine with parsing multiple symbols with the
> > same name.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
>
> --
> Thanks,
> Petr
>


Applied to linux-kbuild

--=20
Best Regards
Masahiro Yamada

