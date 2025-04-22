Return-Path: <linux-kbuild+bounces-6719-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C56A95C29
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Apr 2025 04:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DF4A7A38B3
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Apr 2025 02:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02861A3A94;
	Tue, 22 Apr 2025 02:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Tor8XHRm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB341A00F0
	for <linux-kbuild@vger.kernel.org>; Tue, 22 Apr 2025 02:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745289503; cv=none; b=TbC+RV16+N8wrsRco2kulz1LL5e7tmlLNYcsAjzieXDk64spbcPc0tMbwetDbOemjbKReFWSZDrVK1XSCT1D2HssCEthLS5rePScIKzf4dUTDEBypTisGBWMef4erWGs7s3T4zDa7QlaowVgSt0BFiVqbY4zoW5H0vnwhB6xQSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745289503; c=relaxed/simple;
	bh=m1yMCm5BRURQkTkthO160wuOl1r+JBDJ8JKG9mL70Ps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDg/fRWnKLJtzIjgGLMxSWUfCwpRyy2FD4bhETCqDw7R3tKign6JqPn8v9Tjw0Wf66W/NevAhcm5scPpWeTxIDfP4EGIa1zGlwf7/DQ35380UzcpDQCWTfbre1DfbKW09gySAAd8wOBxOVGtCZf1fZgLu8I7JpO9Pexn8S1Qc/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Tor8XHRm; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e573136107bso3698029276.3
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Apr 2025 19:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1745289500; x=1745894300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7eAi0OH7b5xLzSVXwOwnWLVsbzyannU+ufJsFO8uuE=;
        b=Tor8XHRmHO8OGMWZ1tYU9UXptIchkli1Ae/YISB0al4DpG0LpP/kjgdsNViQ1t9Ztw
         sCK4KbAaZT7eP/t7zF6tXqinpqSBQ3BnatQTxJRfOoTs1hu5Rgg4WSm/1XA0OFk6usNc
         zgxxbjZM9rLJjsY9NlVFSfVSqwrsCBvHBdMn0NpLeItEdyxVgoA2qo/nhwEAX7fNL4DE
         ZTGCQtS1MZWdeYd5dfV6udH8EcuNjZCtzCzmCgTDGncF3UE+MpcHyCj9sRUVyjyE8NF4
         JkZsUJ42yGLGuuQLJ9msb0lY9uJ0ynoViFZGne8rOikKoDKfeEjNd9IFzegsSxg+t8rc
         gAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745289500; x=1745894300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7eAi0OH7b5xLzSVXwOwnWLVsbzyannU+ufJsFO8uuE=;
        b=Fk3FDhXAOvaDgIcvh7znlXORGDxpwWFh5fgwKcbGawQ6z/x2gvfxEzAUmFOhN/YOSg
         1NIdLboSvApgbjvK8LkouU/Mx5Yjr56COdn27fNRUGFgxjoNdhW0iEvrac+PJmHxU3Bz
         v4dxZODeQVURzTxXDS17rKR4sprBTqJOHMR+5wNJNAo4zY/3NrbrmZybuFliCxOKIOaV
         L0BCfh2Nl+KgqmBy7i0czHIBVe7euqRaPohaQsU3JqTVlmPJ/wD+sif3U1VW6jYaf63d
         M0puu/Wg7Uta902Zuyd8awz5/+mIW/bioS8BrTdPaIGb4LR3Ku8v/aMHwHSZst7le1r7
         rvOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzWh/xgPsath5Rxe/GAgKw3wblbIP0CumWalF0mXtLT4AcviR+h5/QRHuBQ1yZ7JlYAPQcpHFaPdSItD8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw48sRSeLJFZxzcmnIH0Jk4gTXLRO3G46y8Ko369Xh7gaUDy/g4
	tvCkjMFWkqSKKgzbDa0LTpMPCw/Yg4oOQ4reWLWG7FSiTGHQz19KGH9HOQcU08y5HV1C2xCnWvt
	SfTuXE877vTItL8K8hq1gWNFz9jU567KN45BR
X-Gm-Gg: ASbGncsh5NsU0lhkHb7Ll/Kushl3auUWh++8D5ttjSubFSLA0KjI9DNJuI1zdGg7Wwb
	U8rJnEHvhXGpIUgrKVuwNVeugyAfqRtopH9Lq+zbOEYZ0H/TMdHWWyPWKwh7hpSDEFsYRKq19GA
	3gtkkRxoigj+4S6Z2VoPKXqlR6Bso6iiom
X-Google-Smtp-Source: AGHT+IEBsF+GdUC/ycqCwWJCqQEPIgxnxovCs8VulAPF24hG16HtUyXji535ndx9u4H0Zeebq7vBj70AA6oUc8NrXEc=
X-Received: by 2002:a05:6902:1588:b0:e72:9562:7638 with SMTP id
 3f1490d57ef6-e7297eae346mr19133785276.39.1745289500228; Mon, 21 Apr 2025
 19:38:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404215527.1563146-1-bboscaccy@linux.microsoft.com>
 <20250404215527.1563146-2-bboscaccy@linux.microsoft.com> <CAADnVQJyNRZVLPj_nzegCyo+BzM1-whbnajotCXu+GW+5-=P6w@mail.gmail.com>
 <87semdjxcp.fsf@microsoft.com> <CAADnVQ+JGfwRgsoe2=EHkXdTyQ8ycn0D9nh1k49am++4oXUPHg@mail.gmail.com>
 <87friajmd5.fsf@microsoft.com> <CAADnVQKb3gPBFz+n+GoudxaTrugVegwMb8=kUfxOea5r2NNfUA@mail.gmail.com>
 <87a58hjune.fsf@microsoft.com> <CAADnVQ+LMAnyT4yV5iuJ=vswgtUu97cHKnvysipc6o7HZfEbUA@mail.gmail.com>
 <87y0w0hv2x.fsf@microsoft.com> <CAADnVQKF+B_YYwOCFsPBbrTBGKe4b22WVJFb8C0PHGmRAjbusQ@mail.gmail.com>
 <CAHC9VhS0kQf1mdrvdrs4F675ZbGh9Yw8r2noZqDUpOxRYoTL8Q@mail.gmail.com> <CAADnVQK7kyBso6bNEtNyC6zTBDuBv-K-c4a9KBVid+B405VX6Q@mail.gmail.com>
In-Reply-To: <CAADnVQK7kyBso6bNEtNyC6zTBDuBv-K-c4a9KBVid+B405VX6Q@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 21 Apr 2025 22:38:09 -0400
X-Gm-Features: ATxdqUG68qWAXIVdhOvLBjOhkCBCyDq8PvskWDE6YshFl7NEp_uX0oI69pZKXTU
Message-ID: <CAHC9VhQE6xXQ1E1hmWzbrPNyVh_gKsp8U_GnPYr=0gS_RMATWQ@mail.gmail.com>
Subject: Re: [PATCH v2 security-next 1/4] security: Hornet LSM
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	David Howells <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Jan Stancek <jstancek@redhat.com>, Neal Gompa <neal@gompa.dev>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	keyrings@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, nkapron@google.com, 
	Matteo Croce <teknoraver@meta.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 7:48=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> On Mon, Apr 21, 2025 at 3:04=E2=80=AFPM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Mon, Apr 21, 2025 at 4:13=E2=80=AFPM Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> > > On Wed, Apr 16, 2025 at 10:31=E2=80=AFAM Blaise Boscaccy
> > > <bboscaccy@linux.microsoft.com> wrote:
> > > >
> > > > > Hacking into bpf internal objects like maps is not acceptable.
> > > >
> > > > We've heard your concerns about kern_sys_bpf and we agree that the =
LSM
> > > > should not be calling it. The proposal in this email should meet bo=
th of
> > > > our needs
> > > > https://lore.kernel.org/bpf/874iypjl8t.fsf@microsoft.com/
> >
> > ...
> >
> > > Calling bpf_map_get() and
> > > map->ops->map_lookup_elem() from a module is not ok either.
> >
> > A quick look uncovers code living under net/ which calls into these API=
s.
>
> and your point is ?

Simply the observation that the APIs you've mentioned are currently
being used by code living under net/; you're free to take from that
whatever you will.

> Again, Nack to hacking into bpf internals from LSM,
> module or kernel subsystem.

I heard you the first time and rest assured I've noted your general
objection regarding use of the BPF API.  I'm personally still
interested in seeing a v3 before deciding on next steps as there were
a number of other issues mentioned during the v2 review that need
attention.  I would encourage you to continue to participate in future
reviews of Hornet, but of course that is entirely up to you.  In the
absence of any additional review feedback, I'll preserve your NACK if
we ever get to a point that your comments are worth mentioning.

--
paul-moore.com

