Return-Path: <linux-kbuild+bounces-342-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B8F80E589
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Dec 2023 09:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DA2F1C208E9
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Dec 2023 08:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A2918031;
	Tue, 12 Dec 2023 08:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nO7P7OnJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E19179B2
	for <linux-kbuild@vger.kernel.org>; Tue, 12 Dec 2023 08:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5770C433C9;
	Tue, 12 Dec 2023 08:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702368598;
	bh=DZOkSoIr87VtnL1V3GfRTuV5FLX7wYkz5v52z+Xj/u0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nO7P7OnJpk8fbinPF/P1b0+FRIrOevhyKinqt/1glfvcrdcHxDkrqgqv51zbm5trj
	 Hq5l5FnvTLUg7zIiSdAcare6KUYH44xLORWad8KNyk1uTBIAeZXesqjmLwm+e2lVnl
	 VKQiQ/TXQPuVpDU9s6hy+Az9ajOgHa2dV7yP1NqgWphMXV0o8Uo7vWgHRqhLjT51YR
	 YZGYdsYWh8sLOS8K4BZgcRC0oBA4EDw2VMc9UwyU7G6jMmm2mCDN4od2rqWBbmWVTo
	 DGgUy2zP4VthQ30vgXJTKS+HkDLL/3Mqblfu7dmTCIP6AkFss+ycB3B4Sr9YQn6YwH
	 n51PI7pDw0c8g==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-202c4368762so1332933fac.2;
        Tue, 12 Dec 2023 00:09:58 -0800 (PST)
X-Gm-Message-State: AOJu0YxSqhUAnPIMCBIf5q2ONB+kOcqTnd1PHmG4tmR1tSiY8ud5e6Mk
	lWYP92QDSbegCmkhXyH5/mkXzEPpqb/1kW70+2c=
X-Google-Smtp-Source: AGHT+IFw/p6xKvOm4GvGvxSXnYJ6nT+UwE1PSX6srErUMKGirtjMDCPjf8dTtBWbeDBvzsP9VdTidyWzC8q1b3M4/rE=
X-Received: by 2002:a05:6870:818c:b0:1fb:75b:1315 with SMTP id
 k12-20020a056870818c00b001fb075b1315mr7449288oae.103.1702368598334; Tue, 12
 Dec 2023 00:09:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208181802.88528-3-leobras@redhat.com> <ZXgMa57Ere6FJCJB@infradead.org>
In-Reply-To: <ZXgMa57Ere6FJCJB@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 12 Dec 2023 17:09:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQiJW0eFYQZN0wuURhrdc-8y7=TcEazpxhLf=+mRbKHHQ@mail.gmail.com>
Message-ID: <CAK7LNAQiJW0eFYQZN0wuURhrdc-8y7=TcEazpxhLf=+mRbKHHQ@mail.gmail.com>
Subject: Re: [RFC PATCH v5 1/1] scripts: Introduce a default git.orderFile
To: Christoph Hellwig <hch@infradead.org>
Cc: Leonardo Bras <leobras@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 4:32=E2=80=AFPM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> Urrg, hell no.  Alphabetic order is the only one allowing sensible
> searching.  If you have a different preference use your local .gitconfig
> instead of enforcing completely random preference on others.



Unlike .gitignore, this feature is opt-in rather than enforced.

To use this, you need to run

'git config diff.orderFile scripts/git.orderFile'

or

'git diff -C scripts/git.orderFile'



Indeed, the file order is subjective, leaving
us a question "do we need it in upstream"?

At least, it is harmless for people who have no interest.


--
Best Regards
Masahiro Yamada

