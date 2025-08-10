Return-Path: <linux-kbuild+bounces-8333-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D41FB1F8A9
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Aug 2025 08:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E9AC171947
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Aug 2025 06:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438F317AE11;
	Sun, 10 Aug 2025 06:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbRyg+hC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A981F949
	for <linux-kbuild@vger.kernel.org>; Sun, 10 Aug 2025 06:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754808689; cv=none; b=oQo/8F4/eOSlS313UaoAeE12+vZgX5g7NVzQB1lfEADUfrGScEi+rscRs3IJOC4zWlBaLcArpuzQVTbkL52EjEQWlVpL/XbQ6jHXT7ROtQ854LCuDiWLFPSEEUXzVDrcx80X1Rk6mtnYlSAadXtB/d1I6wXdDWVhbaFjGJywy7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754808689; c=relaxed/simple;
	bh=M/y7Steiven9fEmfnGydgtdz5YqgzNpAyR3eOsTVxNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fUSrMrVAy25BCqGZK5XkLibgLfZzIu5nPUMmseo6s+rO/qR1gjbXJKb5b+4gvU8dPITOUXBDDlwvN6LSPcG2JiVbQqiztLhouZlNHHHXc9TMkGNK/uyogtkKTPWQheODO5kte08gN4FVrXSXoKkBE0WdIx2fVuCUNbZgh89kNuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbRyg+hC; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2eb6c422828so3194905fac.1
        for <linux-kbuild@vger.kernel.org>; Sat, 09 Aug 2025 23:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754808687; x=1755413487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSyAKzNUDtWrK6C7PPcf3LVYOjsruaU1wKlSzLRuLfg=;
        b=BbRyg+hCPADDzTKXenfX6Xa5CEL/OKdxqkcQfoShP2HiTf7s20Te6tQbTeA1p4zM0v
         Hkb7ovSUSPdSVe3K24nMTnGbwtDRAZrg9jKoNDl6cFja/V41fYc/4oRUXZLkj72tbfFH
         i6k8kyOm8I3Fzj1I3mYintBU9T/o63JyI2mgeOXb6sej29ToIjAzXzcJvOAJTqB+AOB3
         s614ujO+HoXeW2DgnC8aEun+318VkEeMOUeoWafgvJyixiC7VL2K+wGO+3NGNjPRINGG
         0h6o3suFR0Z6hClRQNRjcHhIeTt+1uCf6f0D0d2kxVmlBzX/4o0eHIFfYBhIXGsAW3bF
         lloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754808687; x=1755413487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSyAKzNUDtWrK6C7PPcf3LVYOjsruaU1wKlSzLRuLfg=;
        b=lvtzZYLPMOWGNwupri3cCkcc7ZOXMLcMvfY1enJGS5EwdcBrmWEa+Z7bZqmyh/HugE
         y/A8v+JbJuBK4YYdTUHdiodQzxFmCF57L4b/1xWm7fC/4Id55sgdBpEe5OCi3SpHSOaZ
         E4i7vmJ8Ex1uC2AkqLDNYjwtnOGvZnfLmasE8tzAehGTkhCMhzJhjvBB6UeHKVvnlZmu
         5uEk0jGL0QyKyHVpYjWpZNuUDMjO+XMy6ViJ2fiUivPtiZIyjYzYUo2sImhoqB8/gpQc
         t7bMiHVwZ1ymKjjZvbupmdncSjqqz8/pr/5NRayy+h5i/SvT73ectDdvFwSPLV1292nS
         znkg==
X-Gm-Message-State: AOJu0YxYlF9jjV4XR9VgIgxhT7WeZyG3ved55YT+ZYs6Lc2dXy9gRpGv
	PQfyhXQMyZzkGrCCyq8gIWqpXIK66vQEydDATV4oqgufvYdLFw6Re8Tpmb5oz8BNoGIjT6EjCOx
	CnBBAJ9noxul2Bf3wDqTA9QAxhoUopGW6rw==
X-Gm-Gg: ASbGncvOTsEW3D2dtTLnGiykJCH2HJooxBaGVmbp8H0qhmRdncBpzp8o2vpO39g0qmx
	xnvnXVGgTbhUTW8ZzVx+3VWdKLzRdo0Icf17x+eEl9z1fzJiUar8LuHxpvyHSWyZiXzclUh+MTE
	OyxmFqHpol8IUVkTnJVx57l4z9XcZHynl83sl94NS9G5qM+CfBJJeinPrk57HURJOmNZSmc77Wv
	BpDsBcPwHjlSRobyQ==
X-Google-Smtp-Source: AGHT+IFRnfyMDl9xNJiKoz2wA0FebFF4YI0FElGZEAEKMe3lDifciT8QKIFS35MtZsrSqRGjxML8wv3fINENylepPAE=
X-Received: by 2002:a05:6808:3198:b0:406:6aa1:38d9 with SMTP id
 5614622812f47-43599a1ed67mr4782594b6e.13.1754808686691; Sat, 09 Aug 2025
 23:51:26 -0700 (PDT)
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
 <CAGRSmLu5bEwLPZ+8EHZTC9MxGB0e_-HckyhYDKjzz66pgW02Kg@mail.gmail.com> <440b9eb7-6c38-4fc0-aa54-5f06014d0a3a@infradead.org>
In-Reply-To: <440b9eb7-6c38-4fc0-aa54-5f06014d0a3a@infradead.org>
From: "David F." <df7729@gmail.com>
Date: Sat, 9 Aug 2025 23:51:15 -0700
X-Gm-Features: Ac12FXzZl21zUHsx_Q5Jj1k3GdqyRwuUGzdVa0Kn342rhhj8gfNp11imgzVTr_U
Message-ID: <CAGRSmLuaXpBMccnMU0+u5jp6FnV+L6KansBLB=QcE+5BC=6euA@mail.gmail.com>
Subject: Re: Unable to build custom amd64 module.
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 8, 2025 at 2:22=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
>
>
> On 8/8/25 12:54 PM, David F. wrote:
> > I'll have to either patch the makefile to not use objtool or replace
> > it with an empty script.   The highly optimized asm based object file
> > is binary only and works as it should, the call is expected.
> >
>
> so did you try what the documentation suggests:
>
> 11. file.o: warning: unannotated intra-function call
>
>     This warning means that a direct call is done to a destination which
>     is not at the beginning of a function. If this is a legit call, you
>     can remove this warning by putting the ANNOTATE_INTRA_FUNCTION_CALL
>     directive right before the call.
>

I saw that, but don't have access to source, plus it's a .S file
(actually an .asm but Linux world uses .S)

>
> > Should I choose the route to patch the makefile, which item needs to
> > be removed, I tried a couple places in makefile.build but it still
> > wanted to call it.
>
> Sorry, I have no idea. I've never looked into doing that.
> You tried modifying these with no success?
>
> # 'OBJECT_FILES_NON_STANDARD :=3D y': skip objtool checking for a directo=
ry
> # 'OBJECT_FILES_NON_STANDARD_foo.o :=3D 'y': skip objtool checking for a =
file
> # 'OBJECT_FILES_NON_STANDARD_foo.o :=3D 'n': override directory skip for =
a file
>
> with an example in tools/objtool/Documentation/objtool.txt:
>
> - To skip validation of a file, add
>
>     OBJECT_FILES_NON_STANDARD_filename.o :=3D y
>
>   to the Makefile.
>

Didn't see that - I'll give that a try ...Thanks.

>
> --
> ~Randy
>

