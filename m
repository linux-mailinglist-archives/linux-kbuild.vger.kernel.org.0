Return-Path: <linux-kbuild+bounces-11982-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NU3FqN3uGn5dgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11982-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 22:35:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE882A103E
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 22:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CFEE302A062
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 21:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440A9365A13;
	Mon, 16 Mar 2026 21:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gZaROILF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE99364E87
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 21:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773696704; cv=pass; b=VT3mSMiSyPuDnSigb2fPP1tFzeJ4v0KbkvGF3zKbI+d5mVdW/kz9IP/hIJc48OBHuIlAXpFoQJEsnAnOVsygWjvU65K7y1W1tmNsKQdOmYVdYaW8dyA332YseOvVpRZqHUHxSwEhOeZ1tZks6EtsmQzs9Km8lg7i7eeerjzYCG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773696704; c=relaxed/simple;
	bh=ba9bbmEAkheiEDws5LhcWEM+6hgQ4UF8udNOuiErZMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5jiVwNw2e+1sPwI0CxxZI7PIaJhShuo5NDD/gegC5Tt8pJM2MrPwNkb5lxAwLsgNk6ubTgojXU1mtjK26+WrKGD8MNvR6U4u8oz2cxa8/Zkx528ZB3payPk0d3whKsUN8RlRSRHbu2vShL0PYW9OGvqQnNO05yxJxEIQeaMdzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gZaROILF; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-509069a7a7fso197491cf.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 14:31:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773696701; cv=none;
        d=google.com; s=arc-20240605;
        b=F3R2RRcoJjpSNIO2KAOAK9HcAMxdXNmWgNuWuxI/bclpZpk9wNX0WoSbwiu1+OxBsI
         uClZALmWARNiU03RvYzTawQFwA4f//ulBmEFGrtJNPxqWkm8czw3siFcOH+pYKnDUpFD
         asur3zjiMSTfkFYCATi6OjZDUTwQlMJRhwVqBTVfGUtpKY7p2MWVADviht1EW9+FlHHY
         32Vu6PY27AHiiZedFi/k6TiF2QTHdE3e8M+crHIPAZFkjdMtL+Z46XBEWgaa9vNU7BBO
         Ad5drjEED8EJRLn6rhL8gXul+y5ajSn4Ztx0itvYzK9iIcv6zwGrd0EnCWR9AEAikAeS
         me8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I8LVGJ4gIOrfEJj4v39fONwrhQkuquXLDX2xvlgL/L4=;
        fh=1dB0bS6yrI7Q8d2SpyPjbdiuu1XYjMtnCgWDQC3U/Kk=;
        b=Id7380HRUc/BJjxt9yl54J3wziHK0AZ2nt4DrlSlia7i9AyjyVNZ9eIGG7DykS8nmT
         zwBgy8FNsxDz7k1pm1FNVXYcOqqQGaDYt4xEmm1mgUBfYwwRp0B6IXOep7nbj3Vp3jAB
         Fa46pPUzj8Xj0DRQF1I00tAr/wOZilycv278QqFbnyJyL4o1DQvoJriqJAwGfOXFRC6K
         N8BxGuDE9+HHJ3YOuS1TEjnvsBK1adWCH8C0on3DYlMvH1UdE2T1IDGvOmH74XF6kStm
         RfmDO/A/q9ycN7a2AGQjJm9hnFIBqLWifpRSgh/lUVAo7c2sW7Som47gVcJMVDnyWKL4
         RD3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773696701; x=1774301501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8LVGJ4gIOrfEJj4v39fONwrhQkuquXLDX2xvlgL/L4=;
        b=gZaROILFzKwKRm7v4s8oqxnkRNq67uE/FgJ6UlVkwxL8n/0sfwWxiNH4AL3Az2bMFS
         nMO1lV+Ye8b8y0J3HNama3S+i3XsHmRQzVlQW/qgJv/SrLQlN1IbjuhFDTRK4fYiZiYg
         QqqcmaLYFcEldjf9QDmYSQKC4oCMRMU3Wr1zPYhazM+dlewEOL0JhCflV4DcWa2xszYH
         ZswIdkysLn6azwyQzmbPjK5Qt5wUQzmjAP/0d0iCghtpkSj4sw4Mypwg6jEyR7u883MN
         2EjHcauScn81hNo8uaKdUF1toj8Db+wF5+5UwHQskp8xP0Fj4mNAI1Otk3hqQdzuwPl5
         4wHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773696701; x=1774301501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8LVGJ4gIOrfEJj4v39fONwrhQkuquXLDX2xvlgL/L4=;
        b=j8sa49PqhVcNzyisIMyE0iY494fjvOVSEMZrooZs+LpB6nhppPSA9EF83ToWtFcDAi
         1eLP1oE1wxFm43/rvr4hSzRcsYmhhfLohye4gTbhMeST/zhy1TgvJRkXZZGwC7QBJ2Oc
         1vFiZuDTnX5aqKfWR6v8dcOhfxzQw6M/uwY0mnZ8Z/OaLY22VdDfYngnSkN4IALux2WR
         +uYQriLwBYFtfvNC+W/44bQ7k2i9MDvjhDC7zqWiFyKJqDsh7O9gp7mWCFTLyIxvrdPp
         lhlBqbmanRUS6r4hYP56Fdfu4lFznrPOsFQGuYDOhDsodaompA99F+e5SjaTxEmu2SFT
         Zxzg==
X-Forwarded-Encrypted: i=1; AJvYcCUSrwQ7kWKR1RT5qyZkuvV0V9UKEn6LBDUZFMALD4VplHCqcEze1XHdzGPtjKQPLe616wQ8T04Cl3uXr5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMNQXAVBXwMhGFFGnVyqCWn7XSTX48CqqtZoUc08hEg4OzKoK5
	0LEzFJ+EJhdS7sbcnF+TWPL3ozF48N1j2lc3YhDTTwLpITTbJh1+WelMaGDaofMe5+iCIKBC90M
	4Gi1+CGp3oLQN+WY+mEiBXnqvS/CapfQd6MYeoJHN
X-Gm-Gg: ATEYQzwuuCrCswgr+m37Beilv6uRUWcLBSafI+rJ6OGbmGX9d27zOqjMCoOgETSpnUn
	Dffpb1Ez2e+mxiVwvbdFqh3acezRlrcGJ9Ae177lgdTHvYEzsmWbbb/mqd7wAMGHIFfH8ps33/c
	QuROriQ6rxyx68GN5TiFhH6zAMFC4lYx5hqcDv0EuFwk7n5XY63aFxBXIMRpIAqVz3uBPPot6Gk
	jjECOj/ckq41lHHUejxHOYi49IYk6efiDEVR3AZOyo1BZp6sF1Ltg8Lz2t7Ob0+Wv/toROwaL9h
	Q6w0IBYKsK0b8giifqlSFlEVgqlxsUmjTGA=
X-Received: by 2002:a05:622a:310:b0:508:fd42:fd05 with SMTP id
 d75a77b69052e-5099ae71297mr1683051cf.15.1773696701012; Mon, 16 Mar 2026
 14:31:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028182822.3210436-1-xur@google.com> <20251028182822.3210436-2-xur@google.com>
 <abgGnfO5ZrpOUza7@levanger> <CANiq72mCpc9=2TN_zC4NeDMpFQtPXAFvyiP+gRApg2vzspPWmw@mail.gmail.com>
 <CAF1bQ=RarMBKd2KhBje9de-ymjPf+tKUVpgPxspJPm0yTao2Mw@mail.gmail.com>
 <20260316175953.GA1910339@ax162> <CAF1bQ=TqFwmm9NhBPnxaoTCqHOsm1Q6MLhNcqpYq4uObZxzk3A@mail.gmail.com>
 <20260316204311.GA1329928@ax162> <CAF1bQ=TPeLOmRTMcgjVCz2QsJxT4t1FcabPU2ZX2tnanj_QRsA@mail.gmail.com>
In-Reply-To: <CAF1bQ=TPeLOmRTMcgjVCz2QsJxT4t1FcabPU2ZX2tnanj_QRsA@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Mon, 16 Mar 2026 21:31:29 +0000
X-Gm-Features: AaiRm51-EjV_9PptzDc1hWn5HVjHZU-tvc-Lt3FwH0Czwy-xD602aJIwM7imqNU
Message-ID: <CAF1bQ=Sc__tFmGoHQaehTwk6vyx-akGLXcKVGBJ+vXbstyt=zQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nicolas Schier <nsc@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
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
	TAGGED_FROM(0.00)[bounces-11982-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,vger.kernel.org,lists.linux.dev,arndb.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CFE882A103E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I sent the following updated patch:

https://lore.kernel.org/all/20260316212930.120438-1-xur@google.com/T/#t

-Rong

On Mon, Mar 16, 2026 at 8:53=E2=80=AFPM Rong Xu <xur@google.com> wrote:
>
> Sorry that my previous email may have caused some confusion.
> What I really meant was to keep -T (not change to '--thin').
>
> I think Masahiro's change targeted llvm-ar (<=3D 14), where it uses -T
> for "truncate", rather '--thin'. So he used ''--thin" explicitly. But
> this "--thin" was not implemented for some old ar.
>
> Since we the minimal llvm is now 15. The '-T' flag in legacy llvm-ar
> is no longer a problem. We should keep '-T'.
>
> -Rong
>
>
> On Mon, Mar 16, 2026 at 8:43=E2=80=AFPM Nathan Chancellor <nathan@kernel.=
org> wrote:
> >
> > On Mon, Mar 16, 2026 at 11:16:41AM -0700, Rong Xu wrote:
> > > If that's the case, we can just remove flag "--thin". Can we verify i=
f
> > > that works?
> >
> > I think we can only remove it from the second llvm-ar invocation. I
> > tested
> >
> > diff --git a/Makefile b/Makefile
> > index 2b15f0b4a0cb..fb001e02cc0f 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1260,12 +1260,11 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
> >  KBUILD_MODULES :=3D y
> >  endif
> >
> > -# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <=3D 14
> >  quiet_cmd_ar_vmlinux.a =3D AR      $@
> >        cmd_ar_vmlinux.a =3D \
> >         rm -f $@; \
> >         $(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
> > -       $(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -=
F -f $(srctree)/scripts/head-object-list.txt)
> > +       $(AR) mPi $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F=
 -f $(srctree)/scripts/head-object-list.txt)
> >
> >  targets +=3D vmlinux.a
> >  vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
> > --
> >
> > on 7.0-rc4, which showed no issues. This is basically a revert of my
> > suggested workaround for the original issue:
> >
> >   https://lore.kernel.org/YyjjT5gQ2hGMH0ni@dev-arch.thelio-3990X/
> >
> > You could add this as a prerequisite patch, I don't think it should be
> > squashed into the move change, especially since that appears to be why
> > we are in this situation. Why are we converting from the 'T' modifier t=
o
> > '--thin' in the move patch? I know the documentation of llvm-ar and GNU
> > ar says that 'T' is deprecated in favor of '--thin' because it may do
> > different things on various ar implementations but the kernel only
> > supports these two implementations. I think we should just copy the
> > commands as they are and address the deprecation separately, perhaps
> > with an ar-option like Nicolas suggested upthread.
> >
> > How about a v3 that looks like:
> >
> > Patch 1: The diff above because all supported llvm-ar versions do the
> > same thing as GNU ar.
> >
> > Patch 2: The move patch without changing 'T' into '--thin'.
> >
> > Patch 3: The same as before, perhaps without '--thin' as well.
> >
> > You'll need to base on kbuild-next-unstable [1] to address the conflict
> > with Yonghong's "kbuild: Reduce the number of compiler-generated
> > suffixes for clang thin-lto build" [2].
> >
> > [1]: https://git.kernel.org/kbuild/l/kbuild-next-unstable
> > [2]: https://lore.kernel.org/20260307050250.3767489-1-yonghong.song@lin=
ux.dev/
> >
> > Cheers,
> > Nathan

