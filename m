Return-Path: <linux-kbuild+bounces-10774-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFGoCk4+cWnKfQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10774-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 21:59:58 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A895DBA4
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 21:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 04B357E5459
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 20:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB16A3EFD3F;
	Wed, 21 Jan 2026 20:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PH6hizl0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E23387594
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Jan 2026 20:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769027949; cv=pass; b=kpyX1ucaNG/QPmh3vSwhE/2oPrJloM4a9I93diVXP9NDYZK2m/Ly1/6+n9uWFWY7ZtaOcPX2ex/XSHZqdWrhesTj+w9YZjlQ4ZF8N3NKZomTNIzsm8DKW1G94eh0BamjfClRYlCgTYhNH3lsnSdGkAajDJcYKF1Yd67x2GFlJ30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769027949; c=relaxed/simple;
	bh=IrlVMrCpxU7qFxB8xMuPEjKWpcgvJ6TgZ/UtuwM1idg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFq2nTbzU/EN7z2wvF+Jg9RnPFAHYDE3SOZlepvGbpBkn03D1yweqkGICTXoUM6mp+5O7ulw4IRzL7+BLzJKNtl+QqPjtjjYRNEwmDB0vJFpl+3V/PPBniRWEl5GzX5bqFUcbirMKNp4pMlp7jXVC3Gnmz2un8pYMefdSLvAgEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PH6hizl0; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4359249bbacso827825f8f.0
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Jan 2026 12:39:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769027945; cv=none;
        d=google.com; s=arc-20240605;
        b=CZkh1UUo59dWtdzPDkSkOLEdZuTHBCO5cSza2oLVwmQIA655k4DihDU5L0vCatwnRg
         FLsCWJCBq5WrsOITkI6IH7VFaowQoAFnOn1kSFSGtKezDdx4nvaYxoBd25SPWC2GGXNB
         i1QfGeRv/oNmEC44H/a5w/xoedceUdGyxwPG4cq+KV4+EHYjEJwjCMOS1ExZjdV9Vkkh
         teA274wlxIsjyaUHmp6jGZwHHUkMGtxade595x4WmNB+R/seN0tLjNwR4umvhwbUblif
         bZ+EANDQcMF3nkwrqJyQdeNob3oGTnaQ7bKWmttDLsnPAsvHw2FILkp4RgK4uKJVtDtE
         igHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IrlVMrCpxU7qFxB8xMuPEjKWpcgvJ6TgZ/UtuwM1idg=;
        fh=p/GaU9K+BdnA8OAtPa9qMQPEcU0RvRC4sQqHRZ9Kuck=;
        b=PsguD2Qd/14rxuH7wfzD/4HCNpMQEVX1zxxjwqRTYUr8Gih5AIPCB1TZtjPefBbHNQ
         ZhvXmF41+yQXYyyvTSCwygK/t43wGtmvX9x86A17OQ69lGweY+w6PGJHZ8o8zPNQgUCi
         7fP+S3Ts8WZft5er4C8VbZJ/M/q59+vA6mZEbP7TWlxj06kHpRRsRqzs++jQNcor0koD
         Qsp2PCJIWfUCHZ11T9cb80VghK5BiiZkoIyFGKW+aT4nqasRllCrb598IvSi9nx75NWj
         +1r1oTs9c/xk9S9xEWw3gGYjvH1ZQ0yGwnyOmHeWVVcpNb1x4Vo2AqFabIk4hOAN3zvb
         g3Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769027945; x=1769632745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrlVMrCpxU7qFxB8xMuPEjKWpcgvJ6TgZ/UtuwM1idg=;
        b=PH6hizl0UVkZj1GoNmUqISV/X/4uAPDMap4PFOmUQl+ix6uqWL3yOfDhO46xDbR1M+
         ejCq66Opxc7w+Epk2j7vGYU1i0hxz96PBC6o+ODVvmpWT0CGMR8yqY5UbCEMkXClTu3R
         ySoQbPd98POr3ZuIh+V5DnJB969gaJ34HiG4iTfEUnMq9Rj9Niuauj9DWgi2lJT25PVd
         EBBztZHpBbaPOK8OjTsRsDDhqSxh0XMUYfecueqaRf8Fvgu2xo1b+47le1iGFBt9RFEn
         G2bfbj5yYNYak2acgwaVWcDuF5eEgg3Qsini6mb+E6Y3J2X1xKPl6gaqswzsiTzzVjPm
         TGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769027945; x=1769632745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IrlVMrCpxU7qFxB8xMuPEjKWpcgvJ6TgZ/UtuwM1idg=;
        b=cOzuNoh7wKYeb5LCEb1W1hDGSmlBIQ/OWwjBpMNoqnAwD0AtfabV0PhF0V+xS3EuoW
         dkzefU3TlzqliKjUPFJIzCygcy96jeMTOhnJKdTN+RKS68/Shb6hOM0FZdQXP5dQWl6k
         V5+oT3xLQZjWNQFSl8akNWf+tKWLtHaYBTXmd07RTGuLeojvjW8tuHqfT3D+4FS3haSR
         tpIiEhNpr6/u47Wlx5RWBM8SyywtDK4BdiX/Gfo7W+yPUDGHPBteq9D/TzRPiAIVd8AE
         FrZqTw+x5jI69TMA7OyaT7gvqRLh7xJswo+6wZHrhdKzHMu8tOH4tzzkRWutbCqfjL52
         6h6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyQRjb8Ux925ENypuSG7oVOH3Vt/bJdrAMgxQR/OdKXvy5Kr8xIdhkxQ+KF0Cv3bIHqmquN28w8qpuIZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwcRo+U6pZMoZmc/T7GsV/LZmzZ0Kckes9zGiFpnY+LU5uwVl3
	u/+IWBioqlfmS8JzebVaaSMjBkuXjYTB7q70UxSMfqtM6JF+1amK4oS3fGK/fjZ+QtD4mdnAfQi
	sx253a5NkqepYR8D2Pe/dau2FjS7sTGQ=
X-Gm-Gg: AZuq6aKZoCSnp6OKPMKRniITllVaIIfUvaPl4yw7TXmKivmLyOVyNKEiVBcLyY1uWSp
	Aq4Sy3ip1UfW6nTLIvTpJMZAKx4l/OrkNILkH7zin+28de5sX/JvnKTkD6caAerU75wlNJ7kq/a
	1QbYTutMsOrpf5blRTc2XzKPsiIBYw1K6yIDwxQbWEyHV7yO35Pg3IaScSsaZ10b7IPcYMVcuor
	afVVLESnul+xFcRc+YcQBBlfBhXyH+VF8zIZ3wiHcpOE6dOcSBkVB726VNSonYDRgLlsPPiPiWL
	B7QFhaEVJx9EZkp9uLLLHLHjemnhIwQVhFrUasjlaUTbc0M2UwaOKPDzCyKT24rC8X6twg==
X-Received: by 2002:a05:6000:18a6:b0:435:9336:21f3 with SMTP id
 ffacd0b85a97d-435a5f6d879mr1487785f8f.10.1769027945439; Wed, 21 Jan 2026
 12:39:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121181617.820300-1-ihor.solodrai@linux.dev>
 <DFUH7UI3MM6F.1B30NTZ5NFSKR@garyguo.net> <44168005-28df-4b5b-96a7-b6b9e7494aed@linux.dev>
In-Reply-To: <44168005-28df-4b5b-96a7-b6b9e7494aed@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 21 Jan 2026 12:38:54 -0800
X-Gm-Features: AZwV_Qgx80ntX9zcVrtDFMlR4B0eTCQDAPf9dXFhXan_QLDrY_rXv7gtVvSl1eQ
Message-ID: <CAADnVQKuOyDrp9=tw78UdnjfxATw38Xm0=UkDGdz=N16mY4Crg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1] scripts/gen-btf.sh: Use CONFIG_SHELL for execution
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Gary Guo <gary@garyguo.net>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10774-lists,linux-kbuild=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexeistarovoitov@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,gen-btf.sh:url,linux.dev:email,mail.gmail.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: C5A895DBA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 10:30=E2=80=AFAM Ihor Solodrai <ihor.solodrai@linux=
.dev> wrote:
>
> On 1/21/26 10:24 AM, Gary Guo wrote:
> > On Wed Jan 21, 2026 at 6:16 PM GMT, Ihor Solodrai wrote:
> >> According to the docs [1], kernel build scripts should be executed via
> >> CONFIG_SHELL, which is sh by default.
> >>
> >> Fixup gen-btf.sh to be runnable with sh, and use CONFIG_SHELL at every
> >> invocation site.
> >>
> >> See relevant discussion for context [2].
> >>
> >> [1] https://docs.kernel.org/kbuild/makefiles.html#script-invocation
> >> [2] https://lore.kernel.org/bpf/CAADnVQ+dxmSNoJAGb6xV89ffUCKXe5CJXovXZ=
t22nv5iYFV5mw@mail.gmail.com/
> >>
> >> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> >
> > I can indeed build again when applying this on top of linux-next. Thank=
s.
> >
> > Tested-by: Gary Guo <gary@garyguo.net>
> >
> > You probably also want to carry some Reported-by, Suggested-by and Fixe=
s tags here.
>
> You're right. This should do it:
>
> Reported-by: Gary Guo <gary@garyguo.net>
> Suggested-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Fixes: 522397d05e7d ("resolve_btfids: Change in-place update with raw bin=
ary output")
>
> Alexei, please lmk if I should re-send with tags.

All good. Applied manually.

