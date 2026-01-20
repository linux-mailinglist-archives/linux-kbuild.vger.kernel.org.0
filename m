Return-Path: <linux-kbuild+bounces-10750-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIKwIjrVb2mgMQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10750-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 20:19:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF654A2CE
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 20:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B1260A63A91
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 18:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B34834BA2D;
	Tue, 20 Jan 2026 18:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aFdU520n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF2344BC97
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 18:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932705; cv=pass; b=fkScdUucKw0vRshSdCD0a1G7beWocInZNPFkLaaX0U4R8x1Ec8yTYMAEHGFoIX8kFYHoqX6feH3quPrQ4JEhnfNDMbMOifRxrtjqOMCDe3zsKFYMiFkhJ5U+/XX8wZH5uFB1jzuxapHMTH5VRWIFEZmdOFpV9Ldhsb37Fpkfp8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932705; c=relaxed/simple;
	bh=6uJ8uXj14S0D0ONW/lrmUGGFAUg1zVWxSuh2ypdbbKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BaSKLSBDTLj/XtsAlGxZMn9DupK1Ilh6mnvG6xwACgMBEcISGSYr6A6wzA2neJM6OJtvnxBId6RoFbRAzNZBE1c+JJtJRnbNwYCUSpYEVoQjRm8WWL0M4lKB+gfjIaosrB3KQyfooximRHwlu/46wMxJuKms/S5nq1tXBaatP7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aFdU520n; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b86f3e88d4dso1012750966b.0
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 10:11:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768932701; cv=none;
        d=google.com; s=arc-20240605;
        b=Dungd+WTJgKy8GX6//8WG2bnyeqia5ocnqOflZyC1FHS6Kf1vLIidO53mVmiUTHWE2
         LcWhJXp0ivCPHonZs7E8myV0l7a3k3HPgP06YOg4kVeHGkVrSHAuZQmodW0rLJGzdib4
         B2YCmjmn8RKX/EHEAdyVWivhyx3Tn7DVg7DXG3DjbYLQ0BeCN28JaKmA+3T1iiI6lWMW
         vCTFECeru51gVwf7z2eiUbXdfdb1w7iezBCxXTCkUNkDRfrAPm1ENTeGUDXPQeGlUMY2
         dqNT7DuYu8ywW2IGs1bn2WOdps7eS+l6qhvEWFkK/+D/JICVAlV4Le3KOMoXmVG84ayK
         vjYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6HNUo8PrhXo91SkMVhjYZd+vwGPnd7oySasSZ/9ylOM=;
        fh=S99Gkp9Aew+7VZs2kLR7sKUcQfixxjSeSvpjPGv6tYY=;
        b=BqziUqqpNcVwzhfJfPstfi5F7tzt1WAow+WrAGRKl1ruuNMbuDb5Y15LBKp8bw9W8H
         KcLgcw1m3NpSNsnV5SOHDrrrs1iU1ku0zFCHI/syOZjvWj0NSh31WxJWoU+8EULlLPzT
         JLVj+M6N8+TTIPY5CBD1ZRl1i4pHW8l5WvdOXXBUMA+ev6rT/6MtQNqwAz08LxOefADi
         Ja0wq6PXjyJ6nHgW5J8CIdZ6+QGN1ySWQhi8+51/ufzJhzQKxRIQ6icKT/mfKSzMcsXZ
         N8SqhE3ffCAjzE4LS8tIjCsuc+cLhXIqoTCQiOlcR7I2rdjHxI0H+ATh84JorPO3alIi
         ZNMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768932701; x=1769537501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HNUo8PrhXo91SkMVhjYZd+vwGPnd7oySasSZ/9ylOM=;
        b=aFdU520nbVSDQemnPew7IttArDTdI7gpkrAp++7Ej7junQJTzyd2JfWYJjm8JD34ao
         gVIhbyD4jL2ZMKH6dyyhvrWhnb/eS01Z2DkUxuE/4MvB2SkqvSw3nLxwdksuUZQBFNS0
         HjxvxYMxoGruZj5qVWNZAcwPwqtlGG9zTezOsufE99YJKxLw4Kh8dD3tRL+CHZRECcgG
         Z9A7oOmXQAVDGZu9abGW1VALn6RqdEbQ+jkza/yeCSfdonWCpJnFAPS1JnVF4htDYXhU
         FVng51liiQea5to2nHGW6Vziz2t1yDAreHT6wESvCWRcDaIvpR+wR6Y2q81XBF3ftgp4
         +yBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768932701; x=1769537501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6HNUo8PrhXo91SkMVhjYZd+vwGPnd7oySasSZ/9ylOM=;
        b=MBjH29xTb3KWfXULn4XbnRxEzbH5f8/lBOXACWA/ERBKlTfu5Vuq/v5zwugj+RGGG4
         LFJJScXwrR6ztcFg9570WCwFaQto9336+vFnlcVfuxoboI3YoyD+tjNTTds0Bu195/fl
         29iBNzwuuHMc7SdunJNfTKxuIXLwJLHHPXlPRPB57hck4l79MsVf3bLup851Eeowldqr
         Ic7i+WZo7A8tPrLtoxv4r43mehUR8Ix31PKbdT7b/v/rW5zgOZkdzr8ZvHG5XRu9/F3H
         2ZIQU14k069w2vwI/ubd5aZWh2ot0IKkEnldfK0+5C3rDnRzDwKvjO/gTb80ckIoJ3Z9
         PbeA==
X-Forwarded-Encrypted: i=1; AJvYcCWc42QYQ0ffigIwIL2f/VdIJ8zMm4mw6XknYG73Qlz9P5/UE+JeHuE22i42/ZBp8ZIro9zy4i2lnGX3750=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0trqId3hdm4XsZdq0VdDtTg7YAGIETTeJfClqBJzsbTz6S9xa
	rr++xVl4hBHoyjGKvI5IozxKyOVNLHRD+v9OLw7PU9jb+FMegxd8pIxgD9tcqqWD0flO/HySTnL
	zgoA2CRFdW4qT67/VVyGE6eY7lpFn1jwXSWJ+FE4=
X-Gm-Gg: AZuq6aJaYeF1Xx5HkeoXEVMCcVNVqC15RL6oLQT+GiF/Lh2S8erm0cGxd0L5sziIME7
	W7NblVAvYa9b+TDn5eWJG1VG4k+0zmlEqXPetR7ZZWJwM7wzls90j0mgUQs7j6cBALQsvX6wukD
	QtWNBxz4Rs0PUeB8na0VPrSAM7xHZcLsTlMIy9QeVbQirDC438jl185rDN1+HIIDzxIahD0cHdK
	CtD9MQnNzt4d8Jlp+gPuJGH5YL/8gs14vkYV7uvQP4lJpazTNDQrdweMQxv0pFotpSLyY48qgJU
	UNRCoVIDevWIOqIuGHdEuSZI+ccA84RW2vwtDtXpWgnds4bh3eDlZ19s1a1dELq67Wmx3N2CeWj
	Mrfk=
X-Received: by 2002:a17:907:d92:b0:b87:1d30:7ec with SMTP id
 a640c23a62f3a-b8792f7985dmr1331959866b.37.1768932700986; Tue, 20 Jan 2026
 10:11:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114193716.1740684-1-morbo@google.com> <20260116005838.2419118-1-morbo@google.com>
 <20260116095318.46a149fb@pumpkin>
In-Reply-To: <20260116095318.46a149fb@pumpkin>
From: Bill Wendling <morbo@google.com>
Date: Tue, 20 Jan 2026 10:11:24 -0800
X-Gm-Features: AZwV_Qg0Q8H8gkTfPD29xQRQkPN2S6byR4RDcVQeMnbq12oeSFaTrTP_sX4-TZQ
Message-ID: <CAGG=3QWLn1uRih-F0mVfEjXNjw47Tb=-RWsoqBJUHH=7e_qwPQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] Compiler Attributes: Add __counted_by_ptr macro
To: David Laight <david.laight.linux@gmail.com>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Marc Herbert <Marc.Herbert@linux.intel.com>, 
	Uros Bizjak <ubizjak@gmail.com>, Tejun Heo <tj@kernel.org>, Jeff Xu <jeffxu@chromium.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	John Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Brian Gerst <brgerst@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Nicolas Schier <nsc@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Naman Jain <namjain@linux.microsoft.com>, Simon Horman <horms@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Douglas Anderson <dianders@chromium.org>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10750-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,infradead.org,linux-foundation.org,linux.ibm.com,linux.intel.com,chromium.org,suse.com,linux.dev,linutronix.de,vger.kernel.org,lists.linux.dev,goodmis.org,zx2c4.com,zytor.com,linux.microsoft.com,redhat.com];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[morbo@google.com,linux-kbuild@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[google.com,reject];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 1DF654A2CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Jan 16, 2026 at 1:53=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri, 16 Jan 2026 00:57:57 +0000
> Bill Wendling <morbo@google.com> wrote:
>
> > Introduce __counted_by_ptr(), which works like __counted_by(), but for
> > pointer struct members.
> >
> > struct foo {
> >       int a, b, c;
> >       char *buffer __counted_by_ptr(bytes);
> >       short nr_bars;
> >       struct bar *bars __counted_by_ptr(nr_bars);
> >       size_t bytes;
> > };
> >
> > Because "counted_by" can only be applied to pointer members in very
> > recent compiler versions, its application ends up needing to be distinc=
t
> > from flexibe array "counted_by" annotations, hence a separate macro.
> ...
> > diff --git a/Makefile b/Makefile
> > index 9d38125263fb..6b029f694bc2 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -952,6 +952,12 @@ KBUILD_CFLAGS    +=3D $(CC_AUTO_VAR_INIT_ZERO_ENAB=
LER)
> >  endif
> >  endif
> >
> > +ifdef CONFIG_CC_IS_CLANG
> > +ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> > +KBUILD_CFLAGS        +=3D -fexperimental-late-parse-attributes
> > +endif
> > +endif
>
> Will that still be needed for clang 22?
> Looks a bit like a temporary flag to avoid regressions.
> Probably ought to at least have a comment that it won't be needed
> by some future clang version so that it gets tidied up.

I don't believe that there's a timeline for removing this flag, but I
agree that it should go at some point.

-bw

