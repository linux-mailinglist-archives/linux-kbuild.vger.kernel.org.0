Return-Path: <linux-kbuild+bounces-13391-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFcRLD6TGGoMlQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13391-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 21:10:54 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F30835F6E97
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 21:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FB8530131E8
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 19:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19BC3368A4;
	Thu, 28 May 2026 19:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ILl4HY1G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DC22F8E88
	for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2026 19:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779995114; cv=pass; b=j56YxHZBfuf/n4OWWQfMOevZ9dwz7fpzM4grexFds6Cq+dumvzRa1O/SJ2s7BlD3sRADZB/8S3bFNEfACVu+4uJeL7MS6VapvqlSylVXZ//l54wudwdsIwWQ4NsH+CRjNaGa4O97SRZt9OYFoc9hWt72CHQ8legkJJdHAIHucFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779995114; c=relaxed/simple;
	bh=y4Bbb4J8lASYOK52zh5o+m5RzeLvKudKDuTc0Qn4b38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uhuHogHIHu2BPVA0Hw4qARGuKnCBzImNiE9Fj6q/XWIKPmk13c7VgFBDF+XcWnJc4rx1Ft1cVbbXDT1Flbed/QONdCovoohm5MmkAxqxysUNXRKi6pidelwqGQ/e3AFKZfJCNb9cVVf9eEw2sh2GDR6ipulkO+xa82Pf8UeNQGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ILl4HY1G; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50e61648f10so2181cf.1
        for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2026 12:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779995112; cv=none;
        d=google.com; s=arc-20240605;
        b=lotJKUqymebKlBQOeRdCQvCF6ZNWIG/xIQ05MfCqmUio9W7Rk/6KJglc3YQN6R6M7R
         tmXe9fQaZqYOt8fpWF1likJ6Ix3dUlixcHT8CRSqMCeFzkwxlOG4hJELli4J3bq5oL+x
         6LH009WK50IKhvxdCDMc1ejlJvO3MoGxnQaLtFlnn+pAPswpI7Q+LrG7forsCesSQwyG
         15FW2s+50XL8CO9VHp42VC2qPT5GCaCn3YhauFmgWbk4/XymKAiNM5TuLfGetcGb84Ua
         M04qhTtdolgidqTfvRjE0YSwh9+Tsr+bworz1u9p/APH1259Uveb/SIaWs7RQhfue122
         O7EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8Fbsmv+6O7TS0nAIvm3pb4iiGQVOKjsqXhBEGEcBbPQ=;
        fh=xsTBtFdhgxAQAQgikf/AiTiWr74LVA9bte5onIwxYPY=;
        b=WPzBP5YAqNEMJQeLcrd2Sb2OJJbV2DcWAIIP7+M6je8QVfi7Hntj6HYDKT0dIL5gwj
         +U+6BmUmFM9xikmHs1JhZ5iJhYL3+3ndsicTlDMP1UVU05stMR3AS63riA75qCpXSrVG
         UuL2vKJt4XFNPeCMIwU5Ltq2bNH47sZR8imAI7WaWheKZQFiMhyYbJa27BnnzHX7XSse
         OZVMsn31jZKPGJwJUsIZzETp3pujrk+I4joWdLsSrvTlPVtXxkShGKEZ6GN68Pfp6RwO
         k2gP/RXUtx/UG5GvvUnG7SWfSQTvU9X3qucKTVk/Qz18feefQ+kyAS5k9ZHMGIqmEQ/N
         ZjMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779995112; x=1780599912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Fbsmv+6O7TS0nAIvm3pb4iiGQVOKjsqXhBEGEcBbPQ=;
        b=ILl4HY1Gi3Nck+LD8HQCfIvxTpUd30NdxZG+S6rS9ibEke3OY+VvK6UZ7tcVpoAcaO
         V/tr+NgjtfLRuttJVKqSsd39ta4X6VAgUWhohVjMGsOuJAjxDaNmN9Sv9gnRE0M0yIjR
         FQeVD/mCYbxjNwWsEUcIk/XZqPhGuyz42+sF8aCp5X3WYlAyvwHDqzXtvyGfKxNZo80D
         Z6iKVWk26PbcLt1Ds3D8kp5anvQ8sX/AnK5GLAWhgna9aC+f+LZh3i/yNJ1D4hXUPfwy
         ZNdOoPrTu5jMNYOoArBn9hlgYGRRxn0tXUKbStk+TRhh8ypSAuvhKzL6zyVk5TRGxITJ
         HiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779995112; x=1780599912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Fbsmv+6O7TS0nAIvm3pb4iiGQVOKjsqXhBEGEcBbPQ=;
        b=BjEYlsvMYphNnT4Tx8M6PKbRSM033ECGymYx56Of0EcnG2I+NTbsMFgwBdeQCgqk5H
         hnvCQ1eOeN8nU7nMIn3lMWY1WUFnAgigIv7jSQkb4qaXoaDAzk0jjc3JaV+OfAbPYogW
         /HM0IyAE6dnbDtD0irJ2uOVGl4gIo0HpgBM2yhPBOx6Yf9YojYz1X6CMR0ev20yJViTH
         sJHNqCFeW3kaQ2r1XNICjHy48sse2NgAMVLrsWuQOjp2vtR1M49bDdxiy4dMrV5GSPBp
         h0BBYB9ndDBqENwnyD3RWSn9IwTKoZJlVOcp1TYDPhIQVC4aaj7qhqyCyRNstvpFgJE2
         FHLw==
X-Forwarded-Encrypted: i=1; AFNElJ8b0v5inHXOWFlliHfz0c+gzzai3M4+PG1RD0tL2keP1Lxi6GZ/CfNUPuA1xaU9VlNX+qU/8ndiRCWm+uo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEPFVpQTKg7A7ZBGIuMPipeDI8xzMFRm2LuMzGdOcknqnUeaiq
	Fzc0auQwA9moME6lFZppDl+DnAHNVtmBp092VXM+B10okC8veZTrcDsLZJyjrvveva4+7cgIxRa
	0KB3WORYEnMtn64YoKp+8jBjop7RxbC7hc4mkLYn+
X-Gm-Gg: Acq92OGazMjJlhq09UKndR8DQ+xO5WZ+V2lZ8DBtIb56XN8bzNyXnU7GlHdXXAEnqI1
	d8hZ59v4BeTe3MAjGV4+YujIEjSu2umyQtgDkI0jDn45fMVU3SIFUD/mcTli0YvM1J0zzuzIZV1
	nHYZtoT9kZDLHorHDyfHIpoKxcaOh8GmeVunehUGUCl9CGL2K5VhLZ4FbH5LHGKQz6e5ER9jJWl
	VSjb3LL/jhQkZmC6yEW9/t9NKndsueqkG2b1RAnc+LLHWcPbhVpev8J7J6EAYdccK8AzKOaJtBg
	2gBlcZppv2JJvcbpFfdfvuVMdmfKuGad4BXx2Oj0T8l4Og1Y
X-Received: by 2002:a05:622a:8c14:b0:50f:bea3:9485 with SMTP id
 d75a77b69052e-5172cc5dbedmr441831cf.2.1779995111825; Thu, 28 May 2026
 12:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526172926.2717929-1-xur@google.com> <20260526172926.2717929-4-xur@google.com>
 <177992962862.1361033.11249653355160017674.b4-review@b4>
In-Reply-To: <177992962862.1361033.11249653355160017674.b4-review@b4>
From: Rong Xu <xur@google.com>
Date: Thu, 28 May 2026 12:04:59 -0700
X-Gm-Features: AVHnY4Kpzs0qh2r1fVo7N5kE04LZemrV5UvvFNp2x8zXNTtJzeAxmD36VHtf_ME
Message-ID: <CAF1bQ=Syrnb-wEfXmHpcDg3u7JVXQnDExhjWFzDAzA3paZD7mQ@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] kbuild: distributed build support for Clang ThinLTO
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13391-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F30835F6E97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Nathan,

Thanks for sharing the AI review findings. Please see my responses to
the comments below:

On Wed, May 27, 2026 at 5:54=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Tue, 26 May 2026 10:29:26 -0700, xur@google.com <xur@google.com> wrote=
:
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 0718e39cedda..b36c7c6817bd 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -249,6 +249,12 @@ ifdef CONFIG_LTO_CLANG
> >  cmd_ld_single =3D $(if $(objtool-enabled)$(is-single-obj-m), ; $(LD) $=
(ld_flags) -r -o $(tmp-target) $@; mv $(tmp-target) $@)
> >  endif
> >
> > +ifdef CONFIG_LTO_CLANG_THIN_DIST
> > +# Save the _c_flags, sliently.
> > +quiet_cmd_save_c_flags =3D
> > +      cmd_save_c_flags =3D printf '\n%s\n' 'saved_c_flags_$@ :=3D $(ca=
ll escsq,$(_c_flags))' >> $(dot-target).cmd
>
> Sashiko notes that we might want modkern_cflags here as well, which
> seems like it could really matter for LoongArch?
>
>   https://sashiko.dev/#/patchset/25040?part=3D3
>
This is a valid point, as users have the ability to add new flags via
KBUILD_KERNL_FLAGS and they are likely needed to pass the backend. I
will update saved_c_flags to include modkern_cflags.

> The other comments might be relevant too but I did not look too closely
> as I am wrapping up my day but I wanted to bring this to your attention
> sooner rather than later.

The second comment concerns using a shell script to get _c_flags: I
opted for this method instead of $(saved_c_flags_$(<) to avoid loading
$(<).cmd in the Makefile. Note that I only load $(@).cmd at the end of
the file. However, if we would rather use the latter approach, I can
make that change, though it will require loading $(<).cmd file.

The third comment concerns file name matching: That is a fair point; I
should have implemented a more precise matching criteria. I will
address and fix this.

I disagree with some of the comments regarding compile times. We have
tested this build mode extensively and observed no compile-time
regressions compared to the existing in-process ThinLTO build.

I will send the updated patch shortly, after I tested the changes.

-Rong

>
> --
> Cheers,
> Nathan
>

