Return-Path: <linux-kbuild+bounces-6544-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D3FA82A8A
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 17:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A39347A9CFD
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 15:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304552676D5;
	Wed,  9 Apr 2025 15:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noxQPKY7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B30F2676E9;
	Wed,  9 Apr 2025 15:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744212775; cv=none; b=QUmYH/cPHOVLFyYNnEycIFwn8QVpMaPVB1b/uInfmHCW13EtrbUi9i3PDByvcY25AoAtFyaqSx1RGzS0aOb62Ujn3NKw3JwadHOnruv4EoYQEL7vxrRl/zey1zSJf05BuLo4qj/tpxc1wZ8iaRwZqM5M1NVLnxhpArvpHM/QuSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744212775; c=relaxed/simple;
	bh=8wC1vIXVUrYRDQcVV3Qol2ing2bHs2QBuSHbStzAf3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=biInTpb14xfQ/jnxk65v+2X27Xms4CSr/gqRI7LM8Ww3wokhVNo1C9taeE8+2bPIWo7ho5UTohXWi3aetMa8gP20DjC0Xcs/sfR0ry9jNN5wMcRCCKzpzHkDt0KZfKe7U8SkD5j4NQ7lDPsvXQXVfY9DXdLSTRLOYh19xWo11do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noxQPKY7; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30db1bc464dso61282751fa.0;
        Wed, 09 Apr 2025 08:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744212771; x=1744817571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0hope6H7ESnSOwlHVjc9jrLdGWOO0sRm2XAZ3flFlk=;
        b=noxQPKY7GnrVc0pqIGAGirhT8fVSpedQ2lQzYWIwlPQViiibsuk03QYxEbaS9yea30
         lgOHEum0iIok4MaWjNqsiBLZAmSpY9VEnKy7JXdnvZHl+H3VSIHoC1EqSAkbgaIZP0Wn
         1YBmzP8QYUUpo5maU0BX6W57A3BTM1X7hopaNaImXkWNVWFcWe/hybASsBylmyZi6Dbu
         4+UJ+U0WcJcR7xPHpAC3Pp89XrrkeRdqN3YxGqpUWX2l7RLM0lbx8JvA0kh57TivmTq0
         mDM4Y/fz+NZMTitb0F27Or7YbyVD8sdccalp688HVKZOUoILlKBeWnDLaKTHKil0+53i
         ziLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744212771; x=1744817571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0hope6H7ESnSOwlHVjc9jrLdGWOO0sRm2XAZ3flFlk=;
        b=p6fxggZaFERMJl3TIn6a3IdHqiWAuFwHQ1ws9VxqjeHDD4jWyuxS35r6LWuOozngB3
         YNblG9pcOYoCDfYXVmnD3UFzZ7my7A49LEyzjTJjDYEHTw0Lmeg8zZnaiZTLRdEfGZMv
         FP9+I8qMdIdJXCcatwN1AaP801yiO5rp4POT1oZNYx6w8rIbMngZDL0+wdIKYSLRqaI2
         DeAH9obIb3wbIztCfdKWrsHpO/E7pNbkdLgxE3zu+RZstBmZt6D6/1ohsu0TwpHcdYH1
         mhSXQqBhieoOz8gfDPFEfOH/Exxk6hld9vQukKgJtLHNy+/zxn6xV4bwnXwrfp+NRdca
         eJpw==
X-Forwarded-Encrypted: i=1; AJvYcCU+QFCSESjWIMOtPD0ehLsguFlc1sbZWACz3hUQFDJ7O8GnQkXVdsDtCDOhGowjGnJgRtz4FOAXz5W9EuNh@vger.kernel.org, AJvYcCUiTMSvoMzNVi7lh+2Qmv7Tx/sf5RERSmoe7rsIgA3Lv6w9NPck9On6tC6tVFZpAtp1Y3di867o2jeKPFl/yw==@vger.kernel.org, AJvYcCVHrCL1smb4GvcpZUXLEnVfTZ/Iq+D4sKKn1QR3rJBVQ11vngQVGsOoISvCic7fCiN9sc0Q4vFnwUIb3ac=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA8o1Lu6bCpFalGbKBI2r3RlptfyESJuiP1hk35jPGsAFNTZ4v
	B5TiktHg8kBZeBWqSSC4uxRVkvGGcTVfmg0hjhP9TLdTiHn0DZwRl2QlO/sh6iVJA7929e3CVXW
	+IHQzg4On53vD8xlMfKRXeY/rvo5Yje0UVUk=
X-Gm-Gg: ASbGncvFIX7Z6w5FgFU7+yAiC+zac919N5ycX0dDi0VQQOhm3iB3iQ8205jphUdF//p
	NSmBM1VEqG22L5G8x8+dMfvkr3GtN0pcweUuLBWm6BaDm0m02ATmfvRwp+MxGu2Ky8PnEHxYJG9
	bt9g0Y5g+3V6gxliXB2neQvg==
X-Google-Smtp-Source: AGHT+IFu/sCRRE/zuYQxpO7Z/QuzxIxpI2ihFbL3egoMziMj7jxtQmily5wAx7fkILu7q6XwXt4QgGWB3iFj4j66esY=
X-Received: by 2002:a05:651c:1603:b0:30b:d0d5:1fee with SMTP id
 38308e7fff4ca-30f4362f5f9mr12048941fa.0.1744212770949; Wed, 09 Apr 2025
 08:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404102535.705090-1-ubizjak@gmail.com> <CAK7LNATO1RfACvWhHJuLi-FYWMnSn6+Tp67-EZtVWNk+RCSTVQ@mail.gmail.com>
 <CAFULd4bx9BGKo_4kn14rsVr44otpdjpjn_o6=zMp8iu98f9Upg@mail.gmail.com>
 <CAK7LNATnactfA2U0CB2VcoE1eDc+bj=Jjye-Khsc3xG-iZ2XVQ@mail.gmail.com>
 <CAFULd4b25r5wf31DJputSOZhhMTrejQ_3-2P5rpeOL8H=4_mcA@mail.gmail.com>
 <CAK7LNAQVbwnnX5TJLmEShtmUtLCwr=rnZgwX9NoAke+PqzsqiA@mail.gmail.com>
 <CAFULd4b2azU-oBOTTXgQ6ahkVeYWHTJrnmJ97vtLm3P6jMOeug@mail.gmail.com> <20250409152812.GGZ_aSDEaLEOVUf3YX@fat_crate.local>
In-Reply-To: <20250409152812.GGZ_aSDEaLEOVUf3YX@fat_crate.local>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 9 Apr 2025 17:32:39 +0200
X-Gm-Features: ATxdqUGS7isbkS0rU1SwEJvoSZgZ6KTf5SF7rcW4ikE2sytX2LFzVy3mDmvZz7E
Message-ID: <CAFULd4avYC6V=-ewBcTGHA5GjuTBh++-wLNOH=M68u1rwNsAmg@mail.gmail.com>
Subject: Re: [PATCH] compiler.h: Avoid the usage of __typeof_unqual__() when
 __GENKSYMS__ is defined
To: Borislav Petkov <bp@alien8.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Menzel <pmenzel@molgen.mpg.de>, Sami Tolvanen <samitolvanen@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 5:28=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrote=
:
>
> On Sun, Apr 06, 2025 at 05:36:13PM +0200, Uros Bizjak wrote:
> > On Fri, Apr 4, 2025 at 9:14=E2=80=AFPM Masahiro Yamada <masahiroy@kerne=
l.org> wrote:
> > >
> > > On Fri, Apr 4, 2025 at 11:37=E2=80=AFPM Uros Bizjak <ubizjak@gmail.co=
m> wrote:
> > > >
> > > > On Fri, Apr 4, 2025 at 4:06=E2=80=AFPM Masahiro Yamada <masahiroy@k=
ernel.org> wrote:
> > > >
> > > > > > > > Current version of genksyms doesn't know anything about __t=
ypeof_unqual__()
> > > > > > > > operator.  Avoid the usage of __typeof_unqual__() with genk=
syms to prevent
> > > > > > > > errors when symbols are versioned.
> > > > > > > >
> > > > > > > > There were no problems with gendwarfksyms.
> > > > > > > >
> > > > > > > > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > > > > > > > Fixes: ac053946f5c40 ("compiler.h: introduce TYPEOF_UNQUAL(=
) macro")
> > > > > > > > Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > > > > > > > Closes: https://lore.kernel.org/lkml/81a25a60-de78-43fb-b56=
a-131151e1c035@molgen.mpg.de/
> > > > > > > > Cc: Sami Tolvanen <samitolvanen@google.com>
> > > > > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > > > > ---
> > > > > > >
> > > > > > >
> > > > > > > Why don't you add it to the genksyms keyword table?
> > > > > >
> > > > > > It doesn't work, even if I patch it with an even more elaborate=
 patch
> > > > > > (attached).
> > > > > >
> > > > > > I guess some more surgery will be needed, but for now a fallbac=
k works
> > > > > > as expected.
> > > > > >
> > > > > > Uros.
> > > > >
> > > > > The attached patch looks good to me.
> > > >
> > > > FAOD - do you refer to the submitted one for compiler.h or to the o=
ne
> > > > for scripts/genksyms/keywords.c? (The latter doesn't fix the warnin=
g,
> > > > though).
> > >
> > >
> > >
> > > You are still seeing the warnings because __typeof_unqual__
> > > is not only the issue.
> > >
> > > Hint:
> > >
> > > $ make -s KCFLAGS=3D-D__GENKSYMS__  arch/x86/kernel/setup_percpu.i
> > > $ grep  'this_cpu_off;'  arch/x86/kernel/setup_percpu.i
> >
> > I see.
> >
> > With my workaround, this_cpu_off is declared as:
> >
> > extern __attribute__((section(".data..percpu" "..hot.."
> > "this_cpu_off"))) __typeof__(unsigned long) this_cpu_off;
> >
> > while without workaround, the same variable is declared as:
> >
> > extern __seg_gs __attribute__((section(".data..percpu" "..hot.."
> > "this_cpu_off"))) __typeof__(unsigned long) this_cpu_off;
> >
> > It looks that genksyms should be extended to handle (or ignore)
> > __seg_gs/__seg_fs named address prefix. Somewhat surprising, because
> > genksyms can process:
> >
> > extern __attribute__((section(".data..percpu" "..hot.."
> > "const_current_task"))) __typeof__(struct task_struct * const
> > __seg_gs) const_current_task
> >
> > without problems.
> >
> > I'm sorry, but I'm not able to extend genksyms with a new keyword by my=
self...
>
> Well, we need a fix here because this fires a lot by now - triggers on my
> machines now too.
>
> So either take a fix or we'll need to revert until it is fixed properly.

The workaround is posted to the list. It should be committed to the
mainline until genksyms is fixed.

Uros.

