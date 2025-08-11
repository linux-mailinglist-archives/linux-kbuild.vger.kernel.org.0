Return-Path: <linux-kbuild+bounces-8347-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E681B216DA
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 23:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A92BE1A20AEC
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 21:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E620D26E179;
	Mon, 11 Aug 2025 21:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGIjEGw6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B4A311C25
	for <linux-kbuild@vger.kernel.org>; Mon, 11 Aug 2025 21:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754946102; cv=none; b=YmfZgQzudIvlvEzDbXvAVoLLgZQr7g+ZrXmoXxkkuTH3YgPv/hRJlSkfSrmKZcabHG4T9foE3b2psstVxLmYwKYNFQSFNXe4iz/hugHMw0QuUfp0sRKEg9NaVR2JxHZr7m1ZnumiAVOkDkpoXh3SoFmgpYIp/cLxN9C+sQBKc0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754946102; c=relaxed/simple;
	bh=+z4rBXEQOw84zLG0wGe/OwBLltKxCF/g27KuT0t+jYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQH4XJbH2kGzMdecNNoyFvTvLCne8BohunVQ6M47KQMmPEH8BnerqkkwVtk13zSj5z1KZnObtYakFyJfkK5Bzygjnq2eTj5gVY5ukLYOqBE5e4qNo3cB8Kao47lLQuY6wYY2H11xCwfnNJbwL/gnN/DNnkigAof9M4p3NWXFv8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGIjEGw6; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-433f984817dso2891813b6e.0
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Aug 2025 14:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754946100; x=1755550900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgDwODcbvmkhvwrKFJbo7i7XHaj8OShIbCU/UU5WYoE=;
        b=PGIjEGw6Mxmv6hxVtU1Is50xKwUxUQOU0PF9X6UqcQ+acczBMnHpUHbI0pak2hED+g
         kba1Dc2LaMIndfp8kJyFh2CLC8SBETdMpIcfMXKOpsZ616VEseZJtN9bHTXS3EkZc3nG
         WKRsDdSkCevvQfdDo4/qr3YSkapxO9vk7BbmiWp/pSyG1BxXzLkBs2MIV4ljoOms9rWC
         9eQrzvY3rl3zeAKLjdN6/b6/8AqXC3TJk5qg3VueHwLYlwWhxGSws0rh905sSYP4HAFn
         il+1+LLEZmduO7qaPaWYxh9TQA7LTgQHUgoYjvMHS++G9t6+ccDAfzU3o5Uqnr267zWP
         PZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754946100; x=1755550900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mgDwODcbvmkhvwrKFJbo7i7XHaj8OShIbCU/UU5WYoE=;
        b=uVJ2tVR5iZTw8+jLYOKf7lj2cRX398r56wvmS0ZOQ/H0NhAh1vL+n2kwWlpe4WMb69
         94/uv309McYUynbMu+v3qGTqyjQ3NSbaufWflrpHMIapS1v+y5oC6PlQ1qOqR16T9nOd
         g1NS7vQW/uZp88rSgcp0pv8d7nyhDtlt0mV6xZjr8LsTXN3e5KaxPeKHnpL6edtKJPLU
         1cTNgNFSGbL0hzDN7y+XEivFWQaMwvZxDSfTN5E9SKloNps7wE5RrlRMuDh1OuCdwaLf
         P4zwqduDW2L+E5bKG1vo9GtPVOhp6oOegXtoJvv3bIhcbvKJTC6WcKUxVfJ6y6FNwdL6
         brag==
X-Gm-Message-State: AOJu0Yye0bz6bLDAGQ5rMuWgkHK2Qjr8DOW2IP/37vk1/oqPbtOLWoRh
	sKVWc18SlYFD7M1vfBIqOEjDDSyMxf6Fz06hZXGMRqU82tGjLRQV8Gy1XdNwn5EV5DAYchxDpGp
	7Y1hy0HwUqnu75nqi4YlH9An6uYZEpfmcaQBR
X-Gm-Gg: ASbGncsssQli9Ra17G9OArGgFk9slvgacRBlsPXZQw620Yw3bpi4QHY1RrSuDTvdMgE
	JPha/7UqWF+VeAv3VL1DK1tZ2iZBM2EkubBP5snv/E2AAYSje+Pa9DfhdB3J/jUSuVFbh9ZBVYN
	zyplqCCBbp8ymF56R4RVT6Fr32vDsfYNH1pjGq+mIjBaCSYCjmYXfro3HZ8AA1UxWnP1uLT7xAl
	CRq+c0=
X-Google-Smtp-Source: AGHT+IHjhtsEoRLxPTID0T8t4Yk1E/82kmcttKc9OIgeAobMpcUxbJXFr+kQT//9OaJy8/+QYporwNDsz+tnGcA3jV8=
X-Received: by 2002:a05:6808:15a4:b0:434:d23:b7bd with SMTP id
 5614622812f47-43597b200famr8241354b6e.3.1754946100385; Mon, 11 Aug 2025
 14:01:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGRSmLvRaFfLG-ksN=WHe3FrH4DOrcJud5BZynGhsrYc8c28ww@mail.gmail.com>
 <bf26afd4-7c4d-47ce-b294-093c15e31ec0@infradead.org> <CAGRSmLuViYdzsoPFtZ6PE9_Bo0VZB0Ccbs5c7Sy-bpct9eXr3g@mail.gmail.com>
 <CAGRSmLsxTH_sq6Vm0A_v6m0u2USrG981NhBoyJCS1hwY+bENCg@mail.gmail.com>
 <4cdde960-f897-4a17-8a5b-18fbbced4da1@infradead.org> <e7a71f76-ce38-46af-bc81-997f796ac911@infradead.org>
 <CAGRSmLu5bEwLPZ+8EHZTC9MxGB0e_-HckyhYDKjzz66pgW02Kg@mail.gmail.com>
 <440b9eb7-6c38-4fc0-aa54-5f06014d0a3a@infradead.org> <CAGRSmLuaXpBMccnMU0+u5jp6FnV+L6KansBLB=QcE+5BC=6euA@mail.gmail.com>
In-Reply-To: <CAGRSmLuaXpBMccnMU0+u5jp6FnV+L6KansBLB=QcE+5BC=6euA@mail.gmail.com>
From: "David F." <df7729@gmail.com>
Date: Mon, 11 Aug 2025 14:01:29 -0700
X-Gm-Features: Ac12FXyAcEkGnKFVPzCta9slSRfYEHfmenoaLtIrtce73rsbi43Y69K1MxyLohw
Message-ID: <CAGRSmLsDsjWmXcZE2R9gb6CVoCPKGUV2re0vJmD61Em8BsfoXQ@mail.gmail.com>
Subject: Re: Unable to build custom amd64 module.
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I tried it, it didn't work I found this:

"NOTE: OBJECT_FILES_NON_STANDARD doesn't work for link time validation of
vmlinux.o or a linked module.  So it should only be used for files which
aren't linked into vmlinux or a module."

So it doesn't do that for a module, I'll have to remove objtool one
way or another ..

On Sat, Aug 9, 2025 at 11:51=E2=80=AFPM David F. <df7729@gmail.com> wrote:
>
> On Fri, Aug 8, 2025 at 2:22=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
> >
> >
> >
> > On 8/8/25 12:54 PM, David F. wrote:
> > > I'll have to either patch the makefile to not use objtool or replace
> > > it with an empty script.   The highly optimized asm based object file
> > > is binary only and works as it should, the call is expected.
> > >
> >
> > so did you try what the documentation suggests:
> >
> > 11. file.o: warning: unannotated intra-function call
> >
> >     This warning means that a direct call is done to a destination whic=
h
> >     is not at the beginning of a function. If this is a legit call, you
> >     can remove this warning by putting the ANNOTATE_INTRA_FUNCTION_CALL
> >     directive right before the call.
> >
>
> I saw that, but don't have access to source, plus it's a .S file
> (actually an .asm but Linux world uses .S)
>
> >
> > > Should I choose the route to patch the makefile, which item needs to
> > > be removed, I tried a couple places in makefile.build but it still
> > > wanted to call it.
> >
> > Sorry, I have no idea. I've never looked into doing that.
> > You tried modifying these with no success?
> >
> > # 'OBJECT_FILES_NON_STANDARD :=3D y': skip objtool checking for a direc=
tory
> > # 'OBJECT_FILES_NON_STANDARD_foo.o :=3D 'y': skip objtool checking for =
a file
> > # 'OBJECT_FILES_NON_STANDARD_foo.o :=3D 'n': override directory skip fo=
r a file
> >
> > with an example in tools/objtool/Documentation/objtool.txt:
> >
> > - To skip validation of a file, add
> >
> >     OBJECT_FILES_NON_STANDARD_filename.o :=3D y
> >
> >   to the Makefile.
> >
>
> Didn't see that - I'll give that a try ...Thanks.
>
> >
> > --
> > ~Randy
> >

