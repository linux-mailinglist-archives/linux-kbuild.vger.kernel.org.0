Return-Path: <linux-kbuild+bounces-13664-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pUovFniFJ2oHygIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13664-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 05:16:08 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBAB65C018
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 05:16:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HR6Awosy;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13664-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13664-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3DA373010F2E
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2026 03:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66170800;
	Tue,  9 Jun 2026 03:16:01 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F5D304BB2
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Jun 2026 03:15:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780974961; cv=none; b=pSAANJfKeDnQ8JMb2QSwSJMHn6zQqL2aLZGHgaZqEGG5O+s3OwqlkTuwGYOPaypceSuZVKgB2ikc2o39s8p+M/QCPmqHbfsj/EbxgKv/StWvwmZOnFwqCtWG+6wZ/VgkB6tbMfqCCerBfBgBPCECUkNqYMGmTkaEr6CYQSNbbK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780974961; c=relaxed/simple;
	bh=lxRDYNoFJnWmWgGXW/6ilYmBJ7W480LK2QLPQi0AMs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIItXArUoOAL6JiJaS5bfml37N7AP1/27gD44HvmYyzmP12a6hw/z7EsjfLFCE6eQ2AwqMGRgtVJZVbW81x1YZqqegBiSnnHgHNTipNTfk+x5ZD6EpX3aDGq7gH/cWI9NQndYBlko/Xt7kIHJQ2NDos+QwqlD0qsrDZwj7PkzOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HR6Awosy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63191F00898
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Jun 2026 03:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780974959;
	bh=c+wnoHWsLitINc3OOlDfUIKnqGXtml8EjNQ9mvRgfkg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HR6Awosy7qbg+uTC+SnH0htuVWby4ExcSwjvjMDAxxKHdKLmuYG/fCWTz47raZDQJ
	 soNZ7NbfX/9aTEleEomc3sCO1Iv+6auDtZ1QU/b7CiKysy7XSymR2hq6h9ThzehtXI
	 nUstah4xeMw4vrSOQN+Apv0IXT+60gAV9ehK+5OpB6odKUre4rGNMxJMEEaQVQr8++
	 ZpvQ05fz5YtehWEKGcSwZ+L9vh0ztdH0hrX+OJ+LeDxTaagQlDpgHMVZMH/GR4o4Ty
	 ARgr2VFcELiKE25k8JlB6uSXyY+wC6Vh84uBu2yyYYKM01Hv/gTfCbHNs0XfoIENde
	 tMHmk8lW4Xo/g==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6912f4acca4so5721597a12.1
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Jun 2026 20:15:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ugDyqK+Hv9GF+LIpl/871z9Rg7mGrDj1+Cx7q2B6kMzU0UK5owZO+7AZPoaz2O1FhK/tJqc5z5aytFeg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLDifoSzYSjIJcOPxz48eQLhNkNIBnjUGmKbirJE3+NFSzUxYt
	wwvClq5SWQoLkXNHOm+LeMznIU7YP6POcIaSxlV6NtrkfmpF8x6yHxcyNKWSXB6q7s2oFX1kYoo
	lWfz8/gCVSfyjtfnx74O3P9VzS0ndkm0=
X-Received: by 2002:a05:6402:3227:b0:687:50e8:eb0d with SMTP id
 4fb4d7f45d1cf-68fa503ff29mr7895861a12.18.1780974958515; Mon, 08 Jun 2026
 20:15:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606092501.3200459-1-chenhuacai@loongson.cn> <20260608214558.GA2340474@ax162>
In-Reply-To: <20260608214558.GA2340474@ax162>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 9 Jun 2026 11:15:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H54YJ_5_XYxGCDTMF2e3gC91JtW5QnJfvjbVnCjbfv=bw@mail.gmail.com>
X-Gm-Features: AVVi8Ccsd0h3SBZvIBf4ywjw_h1obRZ-GFFF_42JjCmQXVodlcXywjCe8uZ5pSU
Message-ID: <CAAhV-H54YJ_5_XYxGCDTMF2e3gC91JtW5QnJfvjbVnCjbfv=bw@mail.gmail.com>
Subject: Re: [PATCH] init/Kconfig: Update the THREAD_INFO_IN_TASK description
To: Nathan Chancellor <nathan@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Nicolas Schier <nsc@kernel.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Andy Lutomirski <luto@kernel.org>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13664-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:chenhuacai@loongson.cn,m:nsc@kernel.org,m:yangtiezhu@loongson.cn,m:luto@kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[chenhuacai@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chenhuacai@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CBAB65C018

Hi, Nathan,

On Tue, Jun 9, 2026 at 5:46=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Hi Huacai,
>
> On Sat, Jun 06, 2026 at 05:25:01PM +0800, Huacai Chen wrote:
> > When commit c65eacbe290b81 ("sched/core: Allow putting thread_info into
> > task_struct") introduces THREAD_INFO_IN_TASK in 4.9, the only supported
> > architecture is x86 and thread_info only has a flags field. The Kconfig
> > description said thread_info should only has the flags field but didn't
> > explain the reason.
> >
> > When commit c02433dd6de32f ("arm64: split thread_info from task stack")
> > introduces THREAD_INFO_IN_TASK for arm64 in 4.10, its thread_info has
> > more fields than a single flags, and arm64 works well.
> >
> > Then commit 37a8f7c38339b2 ("x86/asm: Move 'status' from thread_struct
> > to thread_info") adds status back to thread_info for x86 in 4.16, and
> > x86 still works well.
> >
> > After that, risc-v, powerpc and many other architectures all introduce
> > THREAD_INFO_IN_TASK and their thread_info have more fields rather than
> > a single flags field, of course they also work well.
> >
> > I don't know the exact reason of the original description, but obviousl=
y
> > it is wrong and misleading, so I update it, let LoongArch and some othe=
r
> > architectures easier to support THREAD_INFO_IN_TASK.
> >
> > Also improve the try_get_task_stack() and put_task_stack() description.
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>
> You addressed this to Kbuild folks but I don't really think this is our
> domain. I think you would be better off sending this to the scheduler
> folks or Andrew Morton.
OK, I will resend it to scheduler. Thanks.

Huacai

>
> > ---
> >  init/Kconfig | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 2937c4d308ae..a9466879d553 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -207,11 +207,12 @@ config THREAD_INFO_IN_TASK
> >       bool
> >       help
> >         Select this to move thread_info off the stack into task_struct.=
  To
> > -       make this work, an arch will need to remove all thread_info fie=
lds
> > -       except flags and fix any runtime bugs.
> > +       make this work, an arch will need to remove the task_struct poi=
nter
> > +       field from thread_info and fix any runtime bugs.
> >
> >         One subtle change that will be needed is to use try_get_task_st=
ack()
> > -       and put_task_stack() in save_thread_stack_tsk() and get_wchan()=
.
> > +       and put_task_stack() in save_thread_stack_tsk(), get_wchan() an=
d any
> > +       other stacktrace functions.
> >
> >  menu "General setup"
> >
> > --
> > 2.52.0
> >
>
> --
> Cheers,
> Nathan

