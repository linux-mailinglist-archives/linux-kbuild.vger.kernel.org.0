Return-Path: <linux-kbuild+bounces-2318-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5769246A2
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 19:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7C881F245CD
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 17:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB081BE234;
	Tue,  2 Jul 2024 17:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PpFLNnrP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E78D43152;
	Tue,  2 Jul 2024 17:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719942451; cv=none; b=Abhs4Ylx4oWBIR6nkGRLxcAqqDeZ7yyPC0XrmWNj0h6HCYBM1AbxsHF1p5a71yG9+t7UsHHHW6PyVygO/TABoIa0wV9eVJOJdoGas76oBoKvk5YqgfVNtQjODk3bq79pp9I9Jlp2gg0Q/ESN3auCPx4hUVXbQwSthSahvc74nF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719942451; c=relaxed/simple;
	bh=qt4AzaK5oby9zJku1UXdICN0uxekYnZDCq8pxYuHAiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJB7wQo7dQXUM+khd4VFrnyN5CTmwaE3lbbN809ozz3lQrALTFks2rF697FgusQNlJjuyougZCq+s0YyiWGTRj9SFXwQTFFRgaQrigGnqbcIGlevzyE9kZFPNqceL/QWZAq60Bol/e6grqguqONi0wEcr8gY72ejbv4caRnsjbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PpFLNnrP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBCF1C4AF0D;
	Tue,  2 Jul 2024 17:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719942450;
	bh=qt4AzaK5oby9zJku1UXdICN0uxekYnZDCq8pxYuHAiM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PpFLNnrPXwo/Ykrcaof6LP0Ow35K31LODP8RDDWfl/m7kUR/r9ui7sKgdkOQgBgdV
	 eWjQmMxLmxGFBWrcMQ68NxHqphQSXZNYZqwtioh7PL7WcYPMv6rfLNRkIyzEeLpmI+
	 e/nAo8Tbk7hTQ/h3JWJsPVWS9tQ9e/tcRGEtKm7cAF3PoG06zT0vGN6dsxGOkcR1hc
	 mQ4epTGiLNwDFfO6kMg3o1NN+PNkCLG+E0mbhzlfbJiT4fh9SG+w9FmsOY1WtrxFZu
	 2VXOk4rhCDD0/HndPkNXhU1ezklJfzH9QYUZ3psIQR3mCn3zvtVRpYSaCPTbdOjWec
	 1nmLoIXjfPAAA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ee7a1ad286so6196071fa.2;
        Tue, 02 Jul 2024 10:47:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4Sq8cK0WI1DHRUIVAJrm18H9i6t+AtXSuvfeNwu9Y3zLhIYqi/9ItyYVwc8aZLB2KymtPzDo8HkBaAsIUliR4SfBPFcHXevQtwOC04BSe8dRksWBJ+YfeO0dZ8DMbizHE+32H+UWeyT5htuz/uaU9uPS91AcUWfJ+eJlc7hndacVuyEo1gA==
X-Gm-Message-State: AOJu0YwAVuZ9MdiHshSKJ+gHoPIzdaOF0ilKXDGzgNFW8azsSQi96vFm
	uSrBbrm/6/hS4fJoTdAlSvdKpUVDsP0a9JGToKwyzpzbMdOMAZCxS5BPx9QYx0r5+AuMv9E3y1M
	dapSUqK9YXTljpockzAeTLBt+VLY=
X-Google-Smtp-Source: AGHT+IFnUJnTDoIeeCSIUQmv/eFWntHd+k3NXx+eIF9lTWWy0tfaXYyN065HlY0BZhz+lJZIuICANZsE/koaXSuNl1s=
X-Received: by 2002:a05:651c:c9:b0:2ee:5ed1:a0b7 with SMTP id
 38308e7fff4ca-2ee5ed1b5ffmr63263901fa.35.1719942449467; Tue, 02 Jul 2024
 10:47:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240427145502.2804311-1-masahiroy@kernel.org>
 <20240427145502.2804311-5-masahiroy@kernel.org> <ea24aa9b-291d-47bc-98cf-5893926ff8da@kernel.org>
 <CAK7LNAT5_pDn1ZOfm8TzubH-s2HR4DQu9eEx0RgdJ3s4Cmxqow@mail.gmail.com>
 <9771d50d95e508bf8971a36b6475c782c42b46a1.camel@intel.com>
 <CAK7LNATGGibmjZzYX_A2SkJthmOPbKw2K3R7JYuHTWzgGL2Zjg@mail.gmail.com>
 <803eabc8e2fa5dec950d149f83027fd204d5ef69.camel@intel.com>
 <2ada559c1a4517ed879bb662689815b4357674ac.camel@intel.com>
 <CAK7LNAQ47bZpE6c6Yoz-jQS78uU611oZwU8bH+7e=p5zSyADJw@mail.gmail.com> <c485326b640ae6f79582155c31ecaf4a1230b1ee.camel@intel.com>
In-Reply-To: <c485326b640ae6f79582155c31ecaf4a1230b1ee.camel@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 3 Jul 2024 02:46:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNASgxeOQmjXecd4Y3=Ne6Bd48WT4Un-z4M78noe+qYQ7_w@mail.gmail.com>
Message-ID: <CAK7LNASgxeOQmjXecd4Y3=Ne6Bd48WT4Un-z4M78noe+qYQ7_w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] kbuild: use $(src) instead of $(srctree)/$(src)
 for source directory
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "nicolas@fjasle.eu" <nicolas@fjasle.eu>, "conor@kernel.org" <conor@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk@kernel.org" <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 1:15=E2=80=AFAM Edgecombe, Rick P
<rick.p.edgecombe@intel.com> wrote:
>
> On Tue, 2024-07-02 at 18:15 +0900, Masahiro Yamada wrote:
> > > So there is no official way to build just a module to the output dire=
ctory?
> >
> >
> > You already know how to do it:
> >
> > #I'm guess it has something to do with the "M=3D" option because:
> > #make ARCH=3Dx86_64 O=3D../linux-tdx-kvm-out/ -j36 arch/x86/kvm/kvm.ko
> > #arch/x86/kvm/kvm-intel.ko
> > #
> > #...works.
>
> This can build just the module, but not clean just the module.
>
> >
> >
> >
> >
> > > And
> > > it just accidentally worked all these years? IMO it's a nice feature =
to
> > > have.
> > > I've especially found it useful when doing virtualization development=
 where
> > > you
> > > need to build/test guest and host kernels as the same time.
> > >
> > > Or was it just now delegated to unofficial support after this patch?
> >
> >
> > No.
> > The M=3D option is intended for building external modules.
> > You just abused it to build the upstream modules.
> >
> > Kbuild has never supported building external modules in a separate
> > output directory.
> >
> >
> > "delegated to unofficial support" is a wrong statement,
> > as it has never officially supported in the past.
> >
> >
> > Your way is a workaround that people found happened to work.
>
> The main point is that the old behavior was useful. It seems the change t=
hat
> broke my workflow was intended to make it easier to maintain out-of-tree
> modules? If so then aren't we taking away useful behavior for in-tree mod=
ule
> development to help out-of-tree modules?


No.  I never meant to prioritize the external module builds.

I believe b1992c3772e69a6fd0e3fc81cd4d2820c8b6eca0 is the
right thing to do. That's all.



> Can you at least support VPATH method going forward? Although I am surpri=
sed I'm
> the only one that hit this. I assumed this was a common usage.


VPATH will be broken when a big change happens again
for external module builds.
That is what "unsupported" and "unofficial" mean.




--=20
Best Regards
Masahiro Yamada

