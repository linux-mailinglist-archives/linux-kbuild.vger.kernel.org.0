Return-Path: <linux-kbuild+bounces-4026-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1642F99827A
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 11:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A87F92817E9
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 09:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C59B1BC06E;
	Thu, 10 Oct 2024 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlsJOB2u"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E21B1BBBFD;
	Thu, 10 Oct 2024 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728553046; cv=none; b=kKEveWA7tE3CLqQ8U8k9w54o+uyY/bGD5rJI2gpAc6icFPTKP0ixPJmFPv2MtxOmQUnZ4aW8olu0QQ5FsMTyCDA/TfpzLDX+e1Dgu9QgBuAz83GiuDgOW7+CSP9zIh+SihxtzB6Cz1qsCGIi7PO2Y8zGK8ShAa6tCtWlW12I2yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728553046; c=relaxed/simple;
	bh=VHw6/ru4WIVfCSF+1BJ/2OnkobBWimQqjQ0m1jsqe1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sYn3YzHA7jezRX/jdXFBlZlISKMFY3Sce3QMHqiP5uTA77EWBqwDrBXwtZvHtrg1UrczDZmiMHJHp+K+hggnLNTrlf5nHXFlHLM8c06EYhcElLKhMRMHulbN77JMMfDn67dq6PWZGF5IWNopoK+y3MXLJeQw/k/L97LyckkEey4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlsJOB2u; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fac187eef2so7420011fa.3;
        Thu, 10 Oct 2024 02:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728553042; x=1729157842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qasUjW8lOXNOYBd4pGW/rSPH9GILqj8in2xygjAFCM8=;
        b=FlsJOB2u3lR+BH7X3NVJqnOWLPPzqFMxPvk3tUb6VXeq1ELc7sXWz3WYTmTkWyl194
         FnsQnfy7Ls9ZlZjwwZlVRz26ZM8qU9yDB1atoJ+gs6NhULALVb8UoZXmIdK7ArCatK05
         Un4zkZMb5VwsrhIXlNbyT5/Rb84B0pnb6KLCEsyhDyRyDAYW3v7eSywVjJrJKenIaURQ
         keoXX9plhbZavdgg+km+DtgkAOe1zaHdFk5Po6An4gUan3BtILtf+pwY5po8Aehlp9Dh
         HX1U2AM0mB3b2mVdj3OSpvHZXabQ2fLDQ4Znb2ZkIZmM7rDmT3AUsoaYh5HkiyPal3Yc
         6GrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728553042; x=1729157842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qasUjW8lOXNOYBd4pGW/rSPH9GILqj8in2xygjAFCM8=;
        b=lf6pAVk4yo5ci6j4H/29eDBfN+Sd4HM73cUvdITFf7zUXFD/jfBzbQa1SEaD6P/u0+
         PHpheasRRgk0euMoriqH0Jrv2+tF6OwofOd/bLKd31C9Vnd0BzJ5WpV8IW3We1bVBToe
         F40tODZnDlHZwd1Kf/TFy1zxAbvMkdgHeX8MfAONfpNc2KLyKfOVkXjBMrhZiJoqFSz8
         h9jXXwJBeBCy+YjZBfZ7PXXhjOafm64ThfgXZnwWTgUFHQaO2c2oP7sSnJ8Mo+lMIPAa
         hnWlOSxjs37rOt6fLxDT3NSF1vjHZ4a+QhNfok51CSySM3rVO7EDwJQ2KuolBMz6vVa5
         aZmw==
X-Forwarded-Encrypted: i=1; AJvYcCXgHKiFUGQwl33SCLsrMykfa0U42VcsIk080uc9RfMRSjDXDRqXt0gy0giKBzCueYu0YPF06CCyUR/kfobw@vger.kernel.org, AJvYcCXib4b7r8Dv8bExpknU4vmhkCOHn6JI9dyjurSag1sfFRIbi34gVi6oa020bJZ7WV5o55Es4z8V0fWFS8BQGw==@vger.kernel.org, AJvYcCXrT+j1F6SNGvcUXO3GlVrHQ60JZUuyuLyvg/B4L5TROaHck5BoUp+oSqkEc2ZL8+/1X1+gk95w06lRQb8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ZZDjgPFR+purIoLEGCG5tD5rM1x3EpU2Ee5ojoep3vy2TYfp
	HcixH8e1111++Qxb5ptF/XLeV+RV2LGwD9bGs4k124Ut20cPPMZhYcVJiVmvpFZD4An/vbw7Ptr
	6OB6tytSbbQSHk6mTsg9Dy7NzVWk=
X-Google-Smtp-Source: AGHT+IFoqWdCcFDyIW+T0u2K8pinEPwVaR4dgwJcH4CIPd5f99UTZp6LTbYJnA+DiT5gZsxG7Rmadj7M2RjxD5xISsQ=
X-Received: by 2002:a05:651c:a0a:b0:2f3:b8dc:7d24 with SMTP id
 38308e7fff4ca-2fb1873e91emr32922731fa.17.1728553042257; Thu, 10 Oct 2024
 02:37:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <42aa307d7ffae1851b4a8787f5c276dd0b3beece.1728543368.git.linux@leemhuis.info>
 <b32f1e42-d775-4538-ba36-9e9b906a34e3@leemhuis.info> <CA+icZUUgwJWY=PWO5fQPZbUc-q=LkdHXVe4+g-LnXmQfCA3N7Q@mail.gmail.com>
 <CA+icZUX9hrwFXA-6KVT+yZ=-NqyPB=LOKKWSf77-xb32totgHA@mail.gmail.com> <a5b3c47e-5f0f-4c0f-8ad9-4fb34d150548@leemhuis.info>
In-Reply-To: <a5b3c47e-5f0f-4c0f-8ad9-4fb34d150548@leemhuis.info>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 10 Oct 2024 11:36:46 +0200
Message-ID: <CA+icZUUmo+mJTKUS8kH9qUNH0+CqeYNspqp9OA-iWw1KMMDMwg@mail.gmail.com>
Subject: Re: [RFC PATCH v1] module: sign with sha512 by default to avoid build errors
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	linux-modules@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 10:57=E2=80=AFAM Thorsten Leemhuis <linux@leemhuis.=
info> wrote:
>
> On 10.10.24 10:42, Sedat Dilek wrote:
> > On Thu, Oct 10, 2024 at 10:29=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail=
.com> wrote:
> >> On Thu, Oct 10, 2024 at 10:19=E2=80=AFAM Thorsten Leemhuis <linux@leem=
huis.info> wrote:
> >>> On 10.10.24 09:00, Thorsten Leemhuis wrote:
> >>
> >> That was wrong in the original code which you moved:
> >>
> >> +config MODULE_SIG_SHA384
> >> +       bool "SHA-384"
> >> +       select CRYPTO_SHA512 <--- SHA*384*
> >
> > Thorsten, please fix it!
>
> That looks intentional to me -- and CRYPTO_SHA384 from a quick look does
> not even exist.
>
> But that's not at all my area of expertise, so I would not want to touch
> it anyway.
>
> Ciao, Thorsten
>
> P.S.: Vegard Nossum mentioned in the fediverse that I could also solve
> the problem the patch is about by adding "default MODULE_SIG_SHA512" to
> the "choice" section; haven't tried that, but that sounds like a better
> solution. Will likely give it a try, unless someone brings up unwanted
> side effects this might cause.
>
>

SHA1 | SHA256 | SHA512 <--- IMHO enough.

-sed@-

