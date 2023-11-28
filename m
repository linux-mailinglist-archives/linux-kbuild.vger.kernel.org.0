Return-Path: <linux-kbuild+bounces-179-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E53D17FB98F
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 12:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BDCC1C21265
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 11:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212B846530;
	Tue, 28 Nov 2023 11:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/aYqu6v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F27D511
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Nov 2023 11:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA56C433C8;
	Tue, 28 Nov 2023 11:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701171888;
	bh=guVQnjvPaV+z42jgf62dWWfF0TqriCPnTjAgzPyzxms=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d/aYqu6vn5DDREA/9VJfY02ukaUiOZ+PPaAzqolR/aOMxdiATKsY8+PtgFUGGLYbU
	 6L4qRE6VRlGiFT41Xr5D7u4rvpnEMBlX3U+pRH+YuVJvSSiet0VB2Vn/9iTE6+Wrub
	 XXwWkFA3Q2jBqVXoIdw8h+9ocDX86mv1vBZ/ovtjdNFs7e1+tZSXa18ZHnAt20v4hu
	 0ZsT6IxMZGpSmArYjjSDfLS+CMh6wAMjVcrjWMtDeP7KQ9+wazyz4SgkwFMxxv8m5K
	 L7tk0R08kr8HWfM+d4hu8bCXVshlra0vLQvpAtrBQxR8d+KPVpdFPT3/M844UMaJVu
	 P5Xnrb+LC76kA==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1fa1c3755afso1426293fac.1;
        Tue, 28 Nov 2023 03:44:48 -0800 (PST)
X-Gm-Message-State: AOJu0YwzDLkysMKcmPLP6Eo29LZnWfFxQK4bRvTqpBwjOoVOwGkraUFM
	QTzdyPfoTaGZs4k8yA2/ZOYjhatAklX8JH3Lk4U=
X-Google-Smtp-Source: AGHT+IE++xAdjjagU/hso0TxHFl08NatL1qvkjh/s1wbEKplR9/ZY/+K3LxbRaf3aAa9WEkpkfiMyftS8jxLOMfya70=
X-Received: by 2002:a05:6870:6c0b:b0:1f9:5310:90ab with SMTP id
 na11-20020a0568706c0b00b001f9531090abmr7776846oab.3.1701171888137; Tue, 28
 Nov 2023 03:44:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122235527.180507-1-kent.overstreet@linux.dev>
 <CAK7LNASQ+btvNOZ8yU6JLXBHVzPaEwj-7z0_dFouw2EUKd=3uA@mail.gmail.com> <20231125195620.rjgkooixugucv2vp@moria.home.lan>
In-Reply-To: <20231125195620.rjgkooixugucv2vp@moria.home.lan>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 28 Nov 2023 20:44:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT3_rk7xysSGnzq1carsght6gziyCnwEX=fjXy-KwhQEg@mail.gmail.com>
Message-ID: <CAK7LNAT3_rk7xysSGnzq1carsght6gziyCnwEX=fjXy-KwhQEg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Allow gcov to be enabled on the command line
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	linux-kbuild@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000001842ac060b34f29a"

--0000000000001842ac060b34f29a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 26, 2023 at 4:56=E2=80=AFAM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Fri, Nov 24, 2023 at 11:02:00AM +0900, Masahiro Yamada wrote:
> > On Thu, Nov 23, 2023 at 8:55=E2=80=AFAM Kent Overstreet
> > <kent.overstreet@linux.dev> wrote:
> > >
> > > This allows gcov to be enabled for a particular kernel source
> > > subdirectory on the command line, without editing makefiles, like so:
> > >
> > >   make GCOV_PROFILE_fs_bcachefs=3Dy
> > >
> > > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > > Cc: Nathan Chancellor <nathan@kernel.org>
> > > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > > Cc: Nicolas Schier <nicolas@fjasle.eu>
> > > Cc: linux-kbuild@vger.kernel.org
> > > Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
> > > ---
> > >  scripts/Kbuild.include | 10 ++++++++++
> > >  scripts/Makefile.lib   |  2 +-
> > >  2 files changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> > > index 7778cc97a4e0..5341736f2e30 100644
> > > --- a/scripts/Kbuild.include
> > > +++ b/scripts/Kbuild.include
> > > @@ -277,3 +277,13 @@ ifneq ($(and $(filter notintermediate, $(.FEATUR=
ES)),$(filter-out 4.4,$(MAKE_VER
> > >  else
> > >  .SECONDARY:
> > >  endif
> > > +
> > > + # expand_parents(a/b/c) =3D a/b/c a/b a
> > > +expand_parents2 =3D $(if $(subst .,,$(1)),$(call expand_parents,$(1)=
),)
> > > +expand_parents  =3D $(1) $(call expand_parents2,$(patsubst %/,%,$(di=
r $(1))))
> > > +
> > > +# flatten_dirs(a/b/c) =3D a_b_c a_b a
> > > +flatten_dirs =3D $(subst /,_,$(call expand_parents,$(1)))
> > > +
> > > +# eval_vars(X_,a/b/c) =3D $(X_a_b_c) $(X_a_b) $(X_a)
> > > +eval_vars =3D $(foreach var,$(call flatten_dirs,$(2)),$($(1)$(var)))
> >
> >
> >
> > I do not like tricky code like this.
> >
> > Also, with "fs_bcachefs", it is unclear which directory
> > is enabled.
>
> It's consistent with how we can specify options in makefiles for a
> particular file.


It is consistent in a bad way.

You used "GCOV_PROFILE_" prefix
for the full directory path, while it is already
used as a file name which is relative to the
current directory.



>
> I suppose CONFIG_GCOV_PROFILE_DIRS would be fine, but your patch isn't
> complete so I can't test it.


I do not understand what you mean by "isn't complete".

It is just a matter of adding the config entry somewhere.

I added a patch just in case, though.


Note, both approach pros and cons.


The command line approach works for external modules.


With the CONFIG option approach, you can easily see
which directories are profiled by checking the .config,
but it is not easy to enable gcov for external modules.







--=20
Best Regards
Masahiro Yamada

--0000000000001842ac060b34f29a
Content-Type: text/x-patch; charset="US-ASCII"; name="per-dir-gcov.diff"
Content-Disposition: attachment; filename="per-dir-gcov.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lpi9qfrq0>
X-Attachment-Id: f_lpi9qfrq0

ZGlmZiAtLWdpdCBhL2tlcm5lbC9nY292L0tjb25maWcgYi9rZXJuZWwvZ2Nvdi9LY29uZmlnCmlu
ZGV4IDA0ZjRlYmRjM2NmNS4uYzk1ZDkzMTg5ZWNjIDEwMDY0NAotLS0gYS9rZXJuZWwvZ2Nvdi9L
Y29uZmlnCisrKyBiL2tlcm5lbC9nY292L0tjb25maWcKQEAgLTM3LDYgKzM3LDEwIEBAIGNvbmZp
ZyBHQ09WX0tFUk5FTAogY29uZmlnIEFSQ0hfSEFTX0dDT1ZfUFJPRklMRV9BTEwKIAlkZWZfYm9v
bCBuCiAKK2NvbmZpZyBHQ09WX1BST0ZJTEVfRElSUworCXN0cmluZyAiRGlyZWN0b3JpZXMgdG8g
ZW5hYmxlIGdjb3YgcHJvZmlsaW5nIgorCWRlcGVuZHMgb24gR0NPVl9LRVJORUwKKwogY29uZmln
IEdDT1ZfUFJPRklMRV9BTEwKIAlib29sICJQcm9maWxlIGVudGlyZSBLZXJuZWwiCiAJZGVwZW5k
cyBvbiAhQ09NUElMRV9URVNUCmRpZmYgLS1naXQgYS9zY3JpcHRzL01ha2VmaWxlLmxpYiBiL3Nj
cmlwdHMvTWFrZWZpbGUubGliCmluZGV4IDFhOTY1ZmU2OGUwMS4uNWQ4MGY3ODRiOTIyIDEwMDY0
NAotLS0gYS9zY3JpcHRzL01ha2VmaWxlLmxpYgorKysgYi9zY3JpcHRzL01ha2VmaWxlLmxpYgpA
QCAtMTQ3LDggKzE0NywxMiBAQCBfY3BwX2ZsYWdzICAgICA9ICQoS0JVSUxEX0NQUEZMQUdTKSAk
KGNwcGZsYWdzLXkpICQoQ1BQRkxBR1NfJCh0YXJnZXQtc3RlbSkubGRzKQogIyAoaW4gdGhpcyBv
cmRlcikKICMKIGlmZXEgKCQoQ09ORklHX0dDT1ZfS0VSTkVMKSx5KQoraWZuZXEgKCQoZmlsdGVy
ICQob2JqKSwkKENPTkZJR19HQ09WX1BST0ZJTEVfRElSUykpLCkKK2V4cG9ydCBHQ09WX1BST0ZJ
TEVfU1VCRElSIDo9IHkKK2VuZGlmCisKIF9jX2ZsYWdzICs9ICQoaWYgJChwYXRzdWJzdCBuJSws
IFwKLQkJJChHQ09WX1BST0ZJTEVfJChiYXNldGFyZ2V0KS5vKSQoR0NPVl9QUk9GSUxFKSQoQ09O
RklHX0dDT1ZfUFJPRklMRV9BTEwpKSwgXAorCQkkKEdDT1ZfUFJPRklMRV8kKGJhc2V0YXJnZXQp
Lm8pJChHQ09WX1BST0ZJTEUpJChHQ09WX1BST0ZJTEVfU1VCRElSKSQoQ09ORklHX0dDT1ZfUFJP
RklMRV9BTEwpKSwgXAogCQkkKENGTEFHU19HQ09WKSkKIGVuZGlmCiAK
--0000000000001842ac060b34f29a--

