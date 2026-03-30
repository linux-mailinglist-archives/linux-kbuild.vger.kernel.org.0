Return-Path: <linux-kbuild+bounces-12358-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHl7II6eymmg+QUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12358-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 18:02:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D507D35E50E
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 18:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B564E300B13E
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 15:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFA5374172;
	Mon, 30 Mar 2026 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YgdUXonD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0025F374196
	for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 15:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886125; cv=pass; b=AEfBVK6tRX9IvAE1b9OkVKcHApoztV1FNrkPut21NZp6uDNLx7nEr/t3MYdV8MSnznjKTckAzSLUQBe/leEpRkWIGmZJq2u6JtciUgr2xp53/IzhKeJB0568e/bAv3V+fTEtXcCLPn8dfXKFR0rAMnWtLRDzpNJBboCm86La2s0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886125; c=relaxed/simple;
	bh=cT6dqlvV69ID7t+rQgE2fUq0TEMPLu0Zl80wvl2d13k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p8TT+TRJ0kE4wOT6bG7dkUepgik0CwVKbzkDi7FeUWJQEOnPJZAFKIWOTaR2pymM0ATVYz1KlAnjy8zKAo288314kOQjBEDr23csjIqUNkaCD6Zb7MdYNq/VRxcqbHox5M8Tcg7EE11Nl0wJUaIW4w5REEh2xiBZoei6c8JLBDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YgdUXonD; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-126ea4e9697so16495c88.1
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 08:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774886123; cv=none;
        d=google.com; s=arc-20240605;
        b=Ye/PtfxO88gQGxUnM8MsdIprybg9OWVIXbybjn1RXBWRxR/qYxdmVzuQKgsf5qsS71
         2J+a18McJpuVJ8ZgV5Ig8iHcXQ69o2NmrbEG/o+qY1FVhbuMtw9HBP7DGSsiUVsn36K+
         IM+YFt7lk57yQunoJPdaGpI4VCOeMNUbweF01NOQ8B9BNN+sNMT4M3CB1h6cDtcdCwa5
         CF2mqDvdUtw950pY2GWENih/aYP25yJu8sYJLrv9TaMRFqqlv9lsVtjA7ERguwb6ePPx
         +C0k34Ibewdz2j8aag81ZobB+FLGvZjUCRiUCWbEjAJKN78L9n5nUrTm4OTLqnbJFdph
         61mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rrHZbUOiZztpEBTZHQn3wQUAlYRvZYJdyMGu8dQ/mbk=;
        fh=tAzMa1GbOmL3Bosd2pa2cdqcF/+0I3BmfAOSboEohpI=;
        b=Yh3dIjZ0UXg9CRBQG60dvKoRQzGASty4QEqLwkHUZlbkM7EGEHz2wengLqBxdY6nGD
         l6wfYu+6i+MZvGpwNeN3qFe9r2OYK2lphlvfKDz06d8uwGNMq7t6CP0k6zqdBf7ffyKr
         Sp5tHNbqHh4avKQV1ylvtQ1AkSPLXXFoZRcaz+/pePKQu6RMYv3wH6iqtNf4leotIWdl
         78283D7f6YMfO6feC6tDwboCn+b3GovEaMBbzJ1ZtN8t6wZ6Q4Zg+PkW3WWsfHOzQoft
         PIFTf022Wla+3OLMSNGDtqfWi8IHlvU5y7yJZdsFRQVx2wRGVxL3dE1PAjF3GZv86TnN
         gVrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774886123; x=1775490923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrHZbUOiZztpEBTZHQn3wQUAlYRvZYJdyMGu8dQ/mbk=;
        b=YgdUXonD33JhGRDAgoQC/LseEGAjuIO9+bdIU9ZT1E+fsOeqcVSomCZhGjKZ0glvwN
         ky3BS5ABTaAnmLZ3zARTmUHDa6wJV/dFohpF+mxD1uqmIOf8mKE9xCkY3oRU77GL76gW
         I2WiY55KA3vtyd+1CPYjt2dqc3li4DvCx6bR9OnwAwiXE/Dn6q7gNp9TtTJ/tjaXj+cz
         o0YzxVKqb7GaEk4Lgi2sjLSteF8JFZpviozw5+PGeEj4kyHWfZwiwB0c8dQfpORJ7sp7
         wOrZGnn53mw3a8DIWT7eHVo6Puv0aAclVtdaRCQUmeJRHCburubaZcILcKiJ3pFdm8Lr
         Q+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774886123; x=1775490923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rrHZbUOiZztpEBTZHQn3wQUAlYRvZYJdyMGu8dQ/mbk=;
        b=aVcMey4zCYwMhW/gwMEkAroOXgQigFxIu2A26Ypb7qCZHinynClepd8III11qiRwkj
         jLnxojgX0rbKomWPZtBeKm76ld/cvH+pdF6d5lZCvm754U5vdTzK1n2YdOc/2Z6T6/ZR
         S3rIWotio93C0G+oAiIuyl/hAUR36clCA51X9Jf0IY2HwL5plLrlznZBRolbWwLSDZCy
         5GSXuN9bRyvVRMgsygApLjuRodT7BztFreXsG1/KazbAs1T4X9QiWmODU9P9YOChiXtT
         f1bs1crRF4x4mkXe0hILy6zJBLgAjrw0JXxGVktjWblbQvpg/QtXv2EOUc7Zpzjo3Usz
         gqrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMLwYnnGxBXc5zWs/S4elUcIZsNum2BgPTa5sv8jc4OWE7QEfjvzvse8HzZ+0TpoVynj2ZF5D7cXIyxFg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8KuYEwgdRi0B9JlKGFVoiwPApVdCaJA6PrKbTjUvBYlwJbNQh
	tUPejDWcqlHTo41YBLfmC1DojEzN+kNZK6Q2F+HgCu2RcphUmDhoRsI+xM9R4vqn/syJ6pCF3ma
	DuW/t7LRvj5IsG28hhkIjzzGi9g7C+cPdWiIGa1yX
X-Gm-Gg: ATEYQzxp1Dty5t9fITJy3NjSRuz20Xa8+aXr6R3FzG61YEhyeWji3BaxYkCr3nlJDZa
	elCuEegnOKZIQ98pAh1Z5S3lkwlA2TzcVEikUieKCPhp1TqpFA6Wvf3utlY29z4R1w3XtUCMqpU
	bJvvF9JwEulzHPS8hRSfqyFEGDgl4KIc1iSe3svXl34+TeakRNhWD5eO/ab9cUTDFvAOrtzBzxh
	GwMB5B/hCm7qY6gWVOhGYgB4xfZ7BUvRHuTlT5M7W5olH5nNOJFVvKvlmYGXGWfcEtZKN4gojvM
	h3sOFM77
X-Received: by 2002:a05:7022:693:b0:124:a780:cd42 with SMTP id
 a92af1059eb24-12ab9d26076mr223463c88.11.1774886122395; Mon, 30 Mar 2026
 08:55:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328011927.3569802-1-xur@google.com> <20260328011927.3569802-4-xur@google.com>
 <acmF7nvIh2nX5hjK@levanger> <20260330100119.GA1953970@ax162>
In-Reply-To: <20260330100119.GA1953970@ax162>
From: Rong Xu <xur@google.com>
Date: Mon, 30 Mar 2026 08:55:11 -0700
X-Gm-Features: AQROBzDUFjGXD5q1g8LEAWqYZen0RbCWLrRtXQQqURk85AMCXI5LfCGwZ0d5oM4
Message-ID: <CAF1bQ=Q7BN-ymcgWbWeXnwp_7nB4As9ygwmG_UyW+dRr7NL=VQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] kbuild: distributed build support for Clang ThinLTO
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12358-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D507D35E50E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

 op

On Mon, Mar 30, 2026 at 3:01=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Sun, Mar 29, 2026 at 10:05:02PM +0200, Nicolas Schier wrote:
> > On Sat, Mar 28, 2026 at 01:19:27AM +0000, xur@google.com wrote:
> > > diff --git a/Makefile b/Makefile
> > > index 69ccf9b8507d..d474b6f0f212 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -1047,11 +1047,11 @@ export CC_FLAGS_SCS
> > >  endif
> > >
> > >  ifdef CONFIG_LTO_CLANG
> > > -ifdef CONFIG_LTO_CLANG_THIN
> > > +ifdef CONFIG_LTO_CLANG_FULL
> > > +CC_FLAGS_LTO       :=3D -flto
> > > +else
> > >  CC_FLAGS_LTO       :=3D -flto=3Dthin -fsplit-lto-unit
> > >  KBUILD_LDFLAGS +=3D $(call ld-option,--lto-whole-program-visibility =
-mllvm -always-rename-promoted-locals=3Dfalse)
> > > -else
> > > -CC_FLAGS_LTO       :=3D -flto
> > >  endif
> > >  CC_FLAGS_LTO       +=3D -fvisibility=3Dhidden
> > >
> >
> > This hunk is just reordering but does not change any functionality,
> > right?
>
> It does, as CONFIG_LTO_CLANG_THIN and CONFIG_LTO_CLANG_THIN_DIST are two
> distinct options. That said, this hunk still does not look right based
> on Yonghong's comment?
>
>   https://lore.kernel.org/044bebc0-d996-4be3-9330-a64195c19a84@linux.dev/
>
> Rong, have you tested this with a recent version of LLVM? Or has support
> for this flag been added to the distributed mode since Yonghong's
> comment?

I did not know the Yonghong's recent change is not compatible with
distributed mode.
I meanted to enable that in distributed mode. But after reading
Yonghong's patch in llvm, I should have disabled
the -always-rename-promoted-locals=3Dfalse option.

I lightly tested my patch, but not with the llvm23 compiler. So
ld-option was filled out this option.

I can submit another version to fix this.

>
> > Nathan, Piotr: your tags got dropped from v6 to v7.  Do you want to
> > renew them?
>
> Yes, once the above is sorted out.
>
> Cheers,
> Nathan

