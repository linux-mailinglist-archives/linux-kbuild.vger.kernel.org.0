Return-Path: <linux-kbuild+bounces-186-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0967FC3C4
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 19:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 140981C20A59
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 18:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AEB3D0C9;
	Tue, 28 Nov 2023 18:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQClzvYR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C9F3D0D9
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Nov 2023 18:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB898C433CC;
	Tue, 28 Nov 2023 18:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701197798;
	bh=IVX15cwRVhanxenCb9qdxGCtzR9TfKC+zZb0qEVecvw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PQClzvYRbwUbzuEmzP8doNA+u3BoK4HmAt9XafH+ibozCpW070MaClDo9grF65Bgw
	 KlkbN72Giv36kbxxXKgsmHNgYc2VlMNv68sXObMePFGQRK7+ZLao3tpageZN78ygmC
	 XIHxGypD/VSO1owLGFxWDi8R/X7/pzCQSX4X0wqr3bPb4Chth117VUB1qMEeEjo5wz
	 u1+otPyScbfxDVcKYejLa0S4EE3nYuFUWZSP1oD+mfhRaLQeCawwCCOp+Ge+MlSJTN
	 ty9lIBKEIEHhdL3TDTtGPq91eY6H6lPNox70o12rC8TGBan7CXNFG+YXSt/mDScpNg
	 imuemKPbfxjxw==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-58a0154b4baso34902eaf.1;
        Tue, 28 Nov 2023 10:56:38 -0800 (PST)
X-Gm-Message-State: AOJu0YwAVEHgwJCg3mVeKIzBRB0I+yp81Am1ZACeA6ZyF3ib4birSo5w
	9/LBHa9NkSeIdgMVVb7dlUz7TfKNmijjQTp7qjg=
X-Google-Smtp-Source: AGHT+IFEqo5yd5/4rEOBcj46wHxE7sE0LtTiAv7hNthH3WbtiImwfv6yEqVPUbkvhP95iffaVMBJ4+FWY+6K1egXzic=
X-Received: by 2002:a05:6871:410b:b0:1fa:1d12:d1df with SMTP id
 la11-20020a056871410b00b001fa1d12d1dfmr6391876oab.19.1701197798041; Tue, 28
 Nov 2023 10:56:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128153858.84932-1-masahiroy@kernel.org> <7a2684e680ffe279ed1e586e8ddb24b94c2cf010.camel@decadent.org.uk>
In-Reply-To: <7a2684e680ffe279ed1e586e8ddb24b94c2cf010.camel@decadent.org.uk>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 29 Nov 2023 03:56:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNASWqQBcf+z+cxWphf5pi8VkB10ABYvPKSxrLKbePYwC0g@mail.gmail.com>
Message-ID: <CAK7LNASWqQBcf+z+cxWphf5pi8VkB10ABYvPKSxrLKbePYwC0g@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: deb-pkg: remove the fakeroot builds support
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild@vger.kernel.org, Guillem Jover <guillem@debian.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 1:31=E2=80=AFAM Ben Hutchings <ben@decadent.org.uk>=
 wrote:
>
> On Wed, 2023-11-29 at 00:38 +0900, Masahiro Yamada wrote:
> > In 2017, the dpkg suite introduced the rootless builds support with the
> > following commits:
> >
> >   - 2436807c87b0 ("dpkg-deb: Add support for rootless builds")
> >   - fca1bfe84068 ("dpkg-buildpackage: Add support for rootless builds")
> >
> > This feature is available in the default dpkg on Debian 10 and Ubuntu
> > 20.04.
> >
> > Remove the old method.
>
> This seems reasonable.
>
>
> > Additionally, export DEB_RULES_REQUIRES_ROOT=3Dno in case debian/rules =
is
> > invoked without dpkg-buildpackage. This change aligns with the Debian
> > kernel commit 65206e29f378 ("Allow to run d/rules.real without root").
>
> The Debian linux package has multiple makefiles used recursively
> (rather than included).  The referenced commit is kind of a hack to
> make rootless builds of a subset of binary packages work when invoking
> one of the lower-level makefiles directly.


The upstream kernel does not support individual package build
since it is implemented in scripts/package/builddeb shell script.


Is the direct execution of debian/rules still worth supporting
in the upstream kernel?


If the answer is no, "export DEB_RULES_REQUIRES_ROOT=3Dno"
is meaningless.


> It works because the package runs dh_builddeb, which checks
> DEB_RULES_REQUIRES_ROOT.  But setting DEB_RULES_REQUIRES_ROOT has
> absolutely zero effect on dpkg-deb or other low-level tools.

Please let me clarify your statement.

Do you mean this?  ("is needed" ?)

"It is needed because the package runs dh_builddeb, which checks
 DEB_RULES_REQUIRES_ROOT."





> > While the upstream kernel currently does not run dh_testroot, it may
> > be useful in the future.
>
> We can do one of:
>
> 1. Ignore DEB_RULES_REQUIRES_ROOT, assume that dpkg-deb supports
>    --root-owner-group and use it unconditionally (your v1).
> 2. Check DEB_RULES_REQUIRES_ROOT, do either fakeroot and chown or
>    dpkg-deb --root-owner-group (current behaviour), and maybe also do
>    the equivalent of dh_testroot.
> 3. Delegate this to dh_builddeb.  Since we use dh_listpackages now,
>    debhelper is already required and this would make things a lot
>    simpler.
>
> But the combination of changes in v2 does not make sense to me.



I like 1 or 3.



If I go with 3.,
does splitting it into two patches make sense?


1/2:  remove fakeroot  (just like v1)
2/2:  dh_* conversion + "export DEB_RULES_REQUIRES_ROOT=3Dno"


--
Best Regards
Masahiro Yamada

