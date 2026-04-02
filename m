Return-Path: <linux-kbuild+bounces-12601-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLZ2KvpjzmmXnQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12601-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 14:41:30 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BA83892A6
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 14:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D199C303F7F0
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 12:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473733BBA00;
	Thu,  2 Apr 2026 12:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SIY+ZsOn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF3A3B5305
	for <linux-kbuild@vger.kernel.org>; Thu,  2 Apr 2026 12:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775133247; cv=pass; b=O4UF96NlGTrjMWrApwvZS5u5PPp/o444Yzf4qIpHnHBEGz7h7UnMDNY7GMXllcWEmbnFxsEC9V7fSyaDQBtWhPSEoAxgPAnrYyd89jhThdCA11WjElmwAb4bGqu1tILqoADifkZtXstKI6hvDWFUkZFDMYmPT58advdjoOKpsMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775133247; c=relaxed/simple;
	bh=AiMIWPP9qpfp57E0slTWmjFd84uAske7ne/VU7eIGiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=orTJBSvBisEDcK1wpoXwQz3lmmWuKfe9zCLVZg3MBJ3OdNTWgzcM6WGnIqasrHIx1mVOoUx2iNO66riJvV9ee9nqf6maQ8wlgImLeN9b8Brs7fjHAH9N2W2bYkxTBuYLbz2ga/ZAl/QKWbXyPOV5SLfeGbP2QW3aEVStUgN/Gjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SIY+ZsOn; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4887eca00c4so5366595e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2026 05:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775133242; cv=none;
        d=google.com; s=arc-20240605;
        b=HBRPJ6FLBXr9/3G2ssm7xjTMF28oVwQfir1N7jqKm6n3qiNLctY4EWGHnoBP8VJkOa
         Ba3lbai/mxMRjbUos9hSTD1ay3RNZB/fQVZhphZkUzMP/BWf/7SqfB1Xi9ng+nw7OzhU
         MZL7an3niQJuEjNGd2LEjl9gO8R2S5IPf5pMSnZdVIzwbPPol60m1ukAcVzHz5kEq6O9
         mPSJG/t0GpYyExhp77xI+Ph/d6ELqXCkqUsxsFowjlJPjEx54XX27bkl6RYhvyTLMfy9
         OkChVzUCBgDydD9D7Fv9pj4rlmudBC3ZHwSoEJXdmH0FngjJMspBdFzHjhePRoIr5QmU
         Wckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H1DwJvkkLXh8IqTYYYFVMuXwsutUIrPuQJIHMRxgnTw=;
        fh=9BCCWN74c503vtu4pku5bYOHoIUbJ4wkfVuHyBNcWBQ=;
        b=Vy/0EiuIoqZxLquSMo9gR+kI/YbypP4oJk1mcWtrQ6dgcPq5EzUDmJhKYTrkWn6AcV
         XWlk4bzUWVqCMnlHL/2fe4utOuU43V62An1rewBbJyUtqq4pPUVr/khucpfbwrFfPgJB
         coq6wDuoyrSfi4fqk0RmJS0iq/XPPjnHvKH9e5Tr26Ldle7kuh/pSfKCKU2vIVCDHRbA
         lmMyppAF8hjg42aBQvRigaeG1L/x0D6VVmdAum3CkY9dprIlVh/QAV7qBHlDqURCFLez
         VO43w2DbSV684i4T6VVe93NiQ0tvBX2VWsd2DjnXkdfI8rvNtww6jpObT3ISUc5Wq5xC
         N2hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775133242; x=1775738042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1DwJvkkLXh8IqTYYYFVMuXwsutUIrPuQJIHMRxgnTw=;
        b=SIY+ZsOnXa7HWPBizbwyCj9Aj+wWDVDfdUpt7GIYvKYfg256yA7L46UJa6Mwl8Plma
         0aB4WSuG7Q6Y066y05d+HDk4dozz+Td4opPXbdmhC7zzl55XkC2Ny3mgv1ZC3m5t5TGO
         6W0nnNssYgM0cwPlDjfzCQdDRAzhkXa3ttW5XrSDVdIWGjGL6+0qltAY20NfdaW2e/8N
         FHHQRz7F5ljfobUHWpyuIfM+X1vKgBUN7qCahVOQElgSyQScjL8cokUwddbp3EA+uU68
         aFWG4wOoR3L2OcW3FQtX4Y4V9iaJtx+Ve2AGCNSwmNG4scN+HIybbtttGIzEza2nsPR3
         I/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775133242; x=1775738042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H1DwJvkkLXh8IqTYYYFVMuXwsutUIrPuQJIHMRxgnTw=;
        b=rAJgiN8rFNE3sdKaMqdFiv8ZyDD5S8WLIN7sSLiRXoJWdxhXBg8GO4iG/reLWS4efM
         mFOaQ/Ou+lHvxYmgNgY1rB5nhiyvDDQKozCArQSR3yZFR7udgvL3ZaZm2A4vTg9Umncw
         UnYvH3cZY2qUA8hk3koJUFKDtZdaUOIAqHwii3lKZ4vtfk8g4tXGloEe05zfUEvRUZTf
         p8PKbRsDCjVQRy6imrqFQemNB/5+ZsjglibNwilI6r8to8qOhBnumjYpyyNIsIhiUx6H
         tZpQvR1Z42qPAkYD7z/Y5aO603ftjyu8fbVjgeVY0LqEqI/ysHoChnLCH4xtWuU/pBMJ
         ExOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVTmC2OHpJppCrGfbBqkxASAWbo2gQhWDng87jJg2n3pjlV2reVgA6mLQfi73U99tpp6srwYcXKW1EiNM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9DDzjrpyadR3Ha/vbA0uvnsHO7uiRMNxTNET0OC1GFW2t5vRn
	3saAWp/TQCMLpASEDf25Ud6t8iC07qf09ye3FPBmtksBWr/hHiqqC+D24cMwyO5BOYdBh3O4OQz
	lN6UkTorenQjPGi3mG+A1kdb7vJz3+sDSLGIvYdW2
X-Gm-Gg: AeBDieusgvIUhX4grdUCHEWfwgSJqygVZJyp2XjvTyt6VRnPOpnJfUwiPpiMMKdIDgI
	0HDhyoAeuYA/gr2aV13R5TlJKLybmUKsSRXF1tdKFTDjeLodumi7j6QHHcxI4ZtbIrt60jyqoyR
	Y8paAOIbPCuSOhbhx5FSsfQelbaXwwmTuAW9hCz0rgurXi3d0OS+EZ9A2p6Zxygc53P5RWk8x/0
	lFrGnPYyQCGQFJfC5b4lUwYbKCGwGPKjOGZQBeDIkG6HPLBgStoax12mgtqw3FVc6OoqWQc7TIN
	95IaPv9lfY4ZLb/0ITqL7hBf6jiJEr9ygEINNQ==
X-Received: by 2002:a5d:5d0b:0:b0:43a:580:f60d with SMTP id
 ffacd0b85a97d-43d150d7683mr14401984f8f.35.1775133241855; Thu, 02 Apr 2026
 05:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com>
 <20260402-binder-crate-name-v4-1-ec3919b87909@google.com> <CA+tqQ4+gzV0vA+u-05b3gQfcFAdNchjZjC4Y+D1pBWhHGVuZqg@mail.gmail.com>
In-Reply-To: <CA+tqQ4+gzV0vA+u-05b3gQfcFAdNchjZjC4Y+D1pBWhHGVuZqg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 2 Apr 2026 14:33:49 +0200
X-Gm-Features: AQROBzDvlygfPuIEFIbAhZTYc87iMuBM9B3lPsJrznB3Xz7EgcczyN5M32UUE48
Message-ID: <CAH5fLggZd4+zZxVeDUjfTUDbBFwrt8ZzK4pQV7KGrMZezYSpJQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: support overriding crate_name
To: Jesung Yang <y.j3ms.n@gmail.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12601-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,linuxfoundation.org,google.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 13BA83892A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 2:23=E2=80=AFPM Jesung Yang <y.j3ms.n@gmail.com> wro=
te:
>
> On Thu, Apr 2, 2026 at 10:55=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> [...]
> > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_=
analyzer.py
> > index b4a55344688d..de6ebf14e2b8 100755
> > --- a/scripts/generate_rust_analyzer.py
> > +++ b/scripts/generate_rust_analyzer.py
> > @@ -12,6 +12,12 @@ import subprocess
> >  import sys
> >  from typing import Dict, Iterable, List, Literal, Optional, TypedDict
> >
> > +def invoke_rustc(args):
> > +    return subprocess.check_output(
> > +        [os.environ["RUSTC"]] + args,
> > +        stdin=3Dsubprocess.DEVNULL,
> > +    ).decode('utf-8').strip()
> > +
> >  def args_crates_cfgs(cfgs: List[str]) -> Dict[str, List[str]]:
> >      crates_cfgs =3D {}
> >      for cfg in cfgs:
> > @@ -69,6 +75,9 @@ def generate_crates(
> >      crates: List[Crate] =3D []
> >      crates_cfgs =3D args_crates_cfgs(cfgs)
> >
> > +    def get_crate_name(path):
> > +        return invoke_rustc(["--print", "crate-name", path])
> > +
>
> Could you add type hints to `invoke_rustc` and `get_crate_name`? You can
> run the following command to verify if it's all good:
>
> mypy --strict scripts/generate_rust_analyzer.py --python-version 3.9

This seems to work.

def invoke_rustc(args: List[str]) -> str:
    return subprocess.check_output(
        [os.environ["RUSTC"]] + args,
        stdin=3Dsubprocess.DEVNULL,
    ).decode('utf-8').strip()

and

def get_crate_name(path: pathlib.Path) -> str:
    return invoke_rustc(["--print", "crate-name", str(path)])

Does that look ok to you? If so, perhaps Miguel can use these on apply?

> Once that's done, for the script part:
>
> Reviewed-by: Jesung Yang <y.jems.n@gmail.com>

Thanks!

Alice

