Return-Path: <linux-kbuild+bounces-307-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EE480B60F
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Dec 2023 20:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 921F4281012
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Dec 2023 19:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED30D1A287;
	Sat,  9 Dec 2023 19:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oya+JYtn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C960479D0;
	Sat,  9 Dec 2023 19:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54063C433C7;
	Sat,  9 Dec 2023 19:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702150028;
	bh=7eH07NOIg7S8Oed4coNU+KjHoIA9mCHcWUGQlTJkMPE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Oya+JYtn3Cq/MhxsUXeD3D7IBJkonamRcMfitlmvhGEYsmiLchPHZnlplmY53wqWv
	 EaoovI5qxTqt1x3zoHJQQr4MIb+FFRtaX2+1XKtZNMnYOuiWrO+ejd/mfDV12UpVrI
	 gkALHdkxTKFp5umpgnGBJrMrey2WnbuTZ0QyNv7KTwK5U7gD2840J2Iq7j22cvPFdw
	 WjkD/boNZJV04eAD6SuT6pPGrQ5yzDNRHEkndIcxzl+4QrW+Ud8xGMCvfy1x47G9iS
	 sBIVDYPWIsf1sqqfBE2hVnyGzWNb7gsYAgVN6wKdX6/Axhb6qKmcL9MeNcP3plK+cv
	 3IyZj7QjEPYgg==
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6d9d21959aaso1738569a34.2;
        Sat, 09 Dec 2023 11:27:08 -0800 (PST)
X-Gm-Message-State: AOJu0YzIZUNiNigIqfrZdI8bD/+RoYSJuc/yAVSQVfERsNHkjEp2u90h
	eAUbV/lcX3xqf2IAohQbBOHggRMrqbgyzcW0KpM=
X-Google-Smtp-Source: AGHT+IH5U7uAkrOlN3vsQGa3BZk5t88Q0NfxBahA43BOSk5sfQ9Z4k/bjUIe9Pijg1scldtw7f0I++8XGNlQ8+qcjgc=
X-Received: by 2002:a05:6870:2008:b0:1fb:2025:e5b2 with SMTP id
 o8-20020a056870200800b001fb2025e5b2mr1212829oab.103.1702150027738; Sat, 09
 Dec 2023 11:27:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231126071914.932241-1-masahiroy@kernel.org> <ZW67BGhBzh4f3G3T@bombadil.infradead.org>
In-Reply-To: <ZW67BGhBzh4f3G3T@bombadil.infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 10 Dec 2023 04:26:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQAckvYsU_mAuGS=pDzUk=-ZmAN9K45iTLQn0wfaYkDfQ@mail.gmail.com>
Message-ID: <CAK7LNAQAckvYsU_mAuGS=pDzUk=-ZmAN9K45iTLQn0wfaYkDfQ@mail.gmail.com>
Subject: Re: [PATCH] init: move THIS_MODULE from <linux/export.h> to <linux/init.h>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-kbuild@vger.kernel.org, 
	Paul Gortmaker <paul.gortmaker@windriver.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 5, 2023 at 2:54=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org>=
 wrote:
>
> On Sun, Nov 26, 2023 at 04:19:14PM +0900, Masahiro Yamada wrote:
> > Commit f50169324df4 ("module.h: split out the EXPORT_SYMBOL into
> > export.h") appropriately separated EXPORT_SYMBOL into <linux/export.h>
> > because modules and EXPORT_SYMBOL are orthogonal; modules are symbol
> > consumers, while EXPORT_SYMBOL are used by symbol providers, which
> > may not be necessarily a module.
> >
> > However, that commit also relocated THIS_MODULE. As explained in the
> > commit description, the intention was to define THIS_MODULE in a
> > lightweight header, but I do not believe <linux/export.h> was the
> > suitable location because EXPORT_SYMBOL and THIS_MODULE are unrelated.
> >
> > Move it to another lightweight header, <linux/init.h>. The reason for
> > choosing <linux/init.h> is to make <linux/moduleparam.h> self-contained
> > without relying on <linux/linkage.h> incorrectly including
> > <linux/export.h>.
> >
> > With this adjustment, the role of <linux/export.h> becomes clearer as
> > it only defines EXPORT_SYMBOL.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>


I will fold your reviewed-by tag.

Thanks.


>
> Do you want this this to go through modules-next or your tree? I'm fine
> it goes either way.
>
>   Luis



--=20
Best Regards
Masahiro Yamada

