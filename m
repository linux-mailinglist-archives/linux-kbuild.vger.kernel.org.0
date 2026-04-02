Return-Path: <linux-kbuild+bounces-12602-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDuoJL1qzmmpngYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12602-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 15:10:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E815738971E
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 15:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D66C3122E27
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 12:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEBB3AEF59;
	Thu,  2 Apr 2026 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/G00nu5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4D63DF008
	for <linux-kbuild@vger.kernel.org>; Thu,  2 Apr 2026 12:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134612; cv=pass; b=h8NRnjqabdxciqTh884yB4Ed7tyqS1Udr8m5AN0lMW+Uz81rJq0tCe4ViRvzuX3ReZ3ploI5tfs3pf+XIaIlv/cSHNyUsB0EwTCLKQ/ic4M0SSOmVewxaQiRJNw50Yx7AbuDZi5Yn+KasfTillGqJmBViVssnLca1dc/kt7CkjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134612; c=relaxed/simple;
	bh=Jg6nIajFfRH9vSJFLJsRzwFQUpKa295zG/zt5GLlZXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGVav3Pf4vkhn440coJ8aTpn1SxhfasH/Haq2Dr0jqoPPUJgbrpq8sWKv5fifHBrqUTrMk+stJIiUY9hViAvLMnwFIBlWYqqgYTrNx2j8rKHX4IOGthM80nvNA+/wduvuImHJo4ZNkr34AB90ptxNp/QXm01qqRvX97MuvoBb2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/G00nu5; arc=pass smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-67c20ed3076so502657eaf.1
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2026 05:56:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775134604; cv=none;
        d=google.com; s=arc-20240605;
        b=SLvSL2sV37DrGx8XgI4XBQYiCf9fUws+vqFxeia1y/qBwYY6QpwIsKeiGyj4vuFi+9
         0Ocjkhui4IFfLZTaCbOmDcDuVbLln9N8ERs4GiMwJhY5sLEMPLiO4ApHnHGI2Qv3uEPR
         7i+OSeeqD1B/D316njbow1/UpFUfezGYcYKJAIt/xMtJUMMWCD31wgygOArBiA2PNCKm
         9qL39GkGLK8HORv33AGf3ELM6niYaZzjZObD4aIysBhhhX4lKG+eFh4tO2UUzNTXDUBq
         +5xyWuyhbwsVICwIsuxY/Zda4wv4g6Nos51/7UzydKaJifxzWvRjFUZAjpoGUBiZVQGD
         Lu3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/OydiP/AOYU5IADePHXxe+ZlFCsiBEsu0HT8Da/mHMA=;
        fh=v+aRDpdhTb0Pr7tm2spQVtlMFnYZx5p2zhKKrJNY568=;
        b=Jq5AWrxgzdHeWq/gsSn1B/6hcwagPbkZZf+PG65szLUnGr+PaOwZFPZies/Bf8rAvp
         qFYzBekl1TEncPsZKSUUJPLyppMVwnrUn2vgzsy6iuz7Ul5Uq2gSfHHVVWv/wDnpNJrA
         HkIZVhqt+BvF7uBpEJ2JX6LUpkvkkWntN8W3encWa48baBmgxs9R+faD2gGCYMSGBgK1
         zFLk/K53iQI2JRlU3UEk2zwcadxZ7gQyh+eRlzUITU/i0KWCIK+RQinEJTpaOva69/dc
         QIrYP4aBdb3XqmTf/RVSaeVd4UXtyHtmU8ZdsHm3MJqH2W0mqOMnJhdX3quFnYM72FKx
         CPFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775134604; x=1775739404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OydiP/AOYU5IADePHXxe+ZlFCsiBEsu0HT8Da/mHMA=;
        b=U/G00nu5QEVCRxbM5ooBGWGROXS6k69z9kD6pght6f0Zxa+i+xgpdMH5BZBdCGCH36
         sj12HmsTHmUHehFu3M7XvEWSd9lXen8cSR2uTqE4hYmAdCfczZ/9KCfT8MsFePhdYcgB
         DDMz+lnePGKN+/esMiU6Op3AWR3Of3xuo55UkxEsKgERX+SOvmtU1ooy7ssoudLYClkd
         rlR7tLh4UThFla7PrqBhr4hOGNSSBRmb6PSMjZv8y0iuC2/mATjpBHz0FzJ+5C+4NEA+
         STKvHtRRUjcuDJ8LuM+KXeXaLlA1ycvs/YuiOo+FPpkB8CWlITi/jYndb+/Xz3GQ5bAo
         6zNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134604; x=1775739404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/OydiP/AOYU5IADePHXxe+ZlFCsiBEsu0HT8Da/mHMA=;
        b=oqD1I8zWWrvojAcrdcSGiaz7qwbBOuWs60rCp67CxX/jiaSZzDt51Fj4Y3SlFE6vds
         Pvbo7FWTEIMyPH/CiMVXpFalUCUJg/fbnLjrdkdj7W9ZFsXg17bFpfsFYO6hcw/fDCVj
         8IUduDm0IFLytbF4VsBz9vVPxHswj6RGJbygvjkd71yv0h46RoCj4j2LHykBFsRmd1Cm
         PfXmi3SjoV88+OI48cd3Zj0DilkU0KqSYc6xg/ViaEZvZCit+TqYA00rxDcXFgKmziKR
         XJSue8Mi/Lrh3R7VZVXfwKSZfzRZ3N+k90GhmAEKhLuB3QLxufsmVUBRHC0Ha0kJjq95
         c8Bg==
X-Forwarded-Encrypted: i=1; AJvYcCW7M/+1o13a2bcqWaUR99+Yg3aHNf1B9sSAJK7STwMWq4wpQqIGbZ3u5cVU3a6RxKN9jBfb1gkx7shUJHI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/QTSphvYkRm/o2Jt4sZbrgrw2UtpwwyCcd4mnLAq3/Tewlwp8
	2d6Bm6/xfxefVfiQ6cSjglf4U68Pdxlh1a3XfSltjrtSQrFgts4fREUeXrPea5vvMf7JA9aw02Z
	E31/T3OegsjdDpY57c/beWgQuZvY69as=
X-Gm-Gg: ATEYQzzlT6++5N9/A7uxvACZNQJ0IZ5sqO11EKDFvG0ZLMbzlzb6nCP8NTQFP3+N1eM
	qTGYOu65xn4ie7WlFYjOomPDmNeOHPwkNHCL9d0kbpAS6zhUnOzgq7Q6Qjqj2Cb+amHqDPN52V1
	+lNk5AGoxahcEoBo7Blt3Y9IUz7+d+BrpldeJhIQvI77h2NHNf6CVguvk/WY0KMT1UxdLIYF6JY
	FWU8oUpmgzRc3beGfv/zCTEmwZ77AYe8laeeEnMAVxD/ziuB7ncJDG25O19UouqQO0iSp2H3PTJ
	Ak6eyIs=
X-Received: by 2002:a05:6820:6aca:b0:67e:d8c:9f88 with SMTP id
 006d021491bc7-67fabbd3504mr3869605eaf.14.1775134603941; Thu, 02 Apr 2026
 05:56:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com>
 <20260402-binder-crate-name-v4-1-ec3919b87909@google.com> <CA+tqQ4+gzV0vA+u-05b3gQfcFAdNchjZjC4Y+D1pBWhHGVuZqg@mail.gmail.com>
 <CAH5fLggZd4+zZxVeDUjfTUDbBFwrt8ZzK4pQV7KGrMZezYSpJQ@mail.gmail.com>
In-Reply-To: <CAH5fLggZd4+zZxVeDUjfTUDbBFwrt8ZzK4pQV7KGrMZezYSpJQ@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Thu, 2 Apr 2026 12:56:32 +0000
X-Gm-Features: AQROBzAPTlf7kltJfBPgGEkGGYBpTdo7e8jWVC60MWTQKD6NskR_jWXC9nL3suY
Message-ID: <CA+tqQ4JAqVOhrXXr8+ed17dRcv0A+zPmesm4F2KmsLn=-1rM_g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: support overriding crate_name
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12602-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,linuxfoundation.org,google.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yj3msn@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E815738971E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 12:34=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> On Thu, Apr 2, 2026 at 2:23=E2=80=AFPM Jesung Yang <y.j3ms.n@gmail.com> w=
rote:
> > On Thu, Apr 2, 2026 at 10:55=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > [...]
> > > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rus=
t_analyzer.py
> > > index b4a55344688d..de6ebf14e2b8 100755
> > > --- a/scripts/generate_rust_analyzer.py
> > > +++ b/scripts/generate_rust_analyzer.py
> > > @@ -12,6 +12,12 @@ import subprocess
> > >  import sys
> > >  from typing import Dict, Iterable, List, Literal, Optional, TypedDic=
t
> > >
> > > +def invoke_rustc(args):
> > > +    return subprocess.check_output(
> > > +        [os.environ["RUSTC"]] + args,
> > > +        stdin=3Dsubprocess.DEVNULL,
> > > +    ).decode('utf-8').strip()
> > > +
> > >  def args_crates_cfgs(cfgs: List[str]) -> Dict[str, List[str]]:
> > >      crates_cfgs =3D {}
> > >      for cfg in cfgs:
> > > @@ -69,6 +75,9 @@ def generate_crates(
> > >      crates: List[Crate] =3D []
> > >      crates_cfgs =3D args_crates_cfgs(cfgs)
> > >
> > > +    def get_crate_name(path):
> > > +        return invoke_rustc(["--print", "crate-name", path])
> > > +
> >
> > Could you add type hints to `invoke_rustc` and `get_crate_name`? You ca=
n
> > run the following command to verify if it's all good:
> >
> > mypy --strict scripts/generate_rust_analyzer.py --python-version 3.9
>
> This seems to work.
>
> def invoke_rustc(args: List[str]) -> str:
>     return subprocess.check_output(
>         [os.environ["RUSTC"]] + args,
>         stdin=3Dsubprocess.DEVNULL,
>     ).decode('utf-8').strip()
>
> and
>
> def get_crate_name(path: pathlib.Path) -> str:
>     return invoke_rustc(["--print", "crate-name", str(path)])
>
> Does that look ok to you? If so, perhaps Miguel can use these on apply?

Looks good to me!

> > Once that's done, for the script part:
> >
> > Reviewed-by: Jesung Yang <y.jems.n@gmail.com>
>
> Thanks!

You're welcome :)

Best regards,
Jesung

