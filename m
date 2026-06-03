Return-Path: <linux-kbuild+bounces-13558-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IQBYGEO9IGpx7QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13558-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:48:19 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5357B63BE86
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:48:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Xir5PNzL;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13558-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13558-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66F1E300BC61
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 23:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422DA4DB567;
	Wed,  3 Jun 2026 23:48:14 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88134611E1
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Jun 2026 23:48:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780530494; cv=pass; b=f5x68KuP5xMlPw6pvCnIalSkLZcqx1cQ+aqDPJ8VqqWRMKsE5oZrWuKEk4Qv8aIvmUT0m6YXlXbD7WLY98DUO1v8y5M75DyQM//QEbwOnTkPn+9TFyWWESbCjOLsm8LELdAhhw40tpibLnh1cxZdH4+uS/3eCSXXQk9pZB5e70I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780530494; c=relaxed/simple;
	bh=6Z9vStdVoY+sm0vZkxTWbl1FRA0xSzco601c//yjuzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TBvXTnkH48cBrJotD3ljqz6jEoIMdNhv66drg4qH7ax3FNCByqPsszdllw7BgM8L2umqv5s1Hsv+IinikUFeKOpDMPjT1RYavIuPz+9Jre01rO+b/ih/9mKWyDFDStwmw8bIpHBqKfZfOume/a4We/KHF0hteYZ4kKH37DS/PLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xir5PNzL; arc=pass smtp.client-ip=209.85.218.54
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bed2195323cso11300066b.1
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Jun 2026 16:48:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780530491; cv=none;
        d=google.com; s=arc-20240605;
        b=QhD1DCzvbU/a7KfWsLUd+jVIcmp4Lj5+KsM4RfAdeXZ+MulVBnZvm+2ujUAQ4qXPcE
         Ai/1uMUOOYxlROqfUBcoy4JJ/l3VLhvuL83kw8YPQV66lJJuPrdn5dEsujRWVSFBDops
         /LhNY19ik6jZmRly0RuERv48CCwkuiFH45F7LRa1fNaXfSZUH7hUihCPFuGyYLcg+vKL
         7ZiQswsdN0U2k741qGXL66zOIuP1iaL3IIvdkkNfFwRJunb2D3HooBp/jmuEzkeovJby
         qamf/OD8WgoERiPh3Wnv0SYgpRhRF5rR070wLI1YtA7rF+xHatFtoUNTKfuwKw5s2ZQr
         LmmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TUBXpiUq5JEecRy7kmi+oWzZmqqtKmb4nW09LCQY1iQ=;
        fh=raHjO1231lnbdY3FaoubDEPC+Lhz+NNLPLq38m2moCo=;
        b=lneX5i8Bp+eKdJ3RX48tkygNh11zZXaUeEfVagpYRJTQA/znOAWumcMNnOdTSu2P0T
         NWkuwOgAG/205nnfQWx+K3JCI220X/nek4Se5yzKziYCav0L4TpOHK8bKY1TLurAH8W4
         DLLZCIp6yLw8to4Qe8CQBuYqZa8Xwxmlopw/7T3LuTEM7KtCchT1JJda+231PqhwqjnH
         w2BmQIjBWcdTOTrm9MKltq4mlJFHQ3GEtrx9yEkhhBskMpZhiBXq1n8IC1HMzRk7c0nH
         11ZuQETxb2Dp1yt7XeWAamg3XCuOXyJ1TWJKw1eo+mtLp0aGmo3vu3SXrcoOiLks1Oeo
         tDoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780530491; x=1781135291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUBXpiUq5JEecRy7kmi+oWzZmqqtKmb4nW09LCQY1iQ=;
        b=Xir5PNzL/W2qkce0U9Hvd8W/1a8MFGpExNIb4hwPRG3IBhPW/aTKFQbwGOyXeXy1J4
         YRMTA7PE/u6HtD6qODk5nI/MfG72qv1NLW3DWBYLQy6GSOpGIEYxle6VPkXcKuiG8PeZ
         wgiIs7ZRl5b7YS6Ok9tgVVHjdP1T9JSlQrWNOdpkPBjS4XEqFM2+D4UeTLf9czhAmfYK
         XbVuNKFPHC+MavYzsFL+yAoDD1fgg6aVdQUkeR6/cJXwq8RYpsVezPxVrzEA69tQnofw
         sr1FDsMmXJvNX/G1xnV5M4CIx5+MhwN0bMDkPklkgKk2c6QGP91cvkmIfqcRI6UqZ6Aq
         sAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780530491; x=1781135291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TUBXpiUq5JEecRy7kmi+oWzZmqqtKmb4nW09LCQY1iQ=;
        b=ZuiF9DWDdmN3Dr8Kw22p5mbmWq/pVNllmg639fxazDADdI2sypJw9Do8hCAIY/E6fg
         11UmVAP9WmFG3rEVEgOfWbU5QZZ+VjJRXD5ksECjByTxQom0DvmEO3nNhdylsMQA3PdQ
         SN5mwRCqvyKL210IYHPsoX8YZtUtzntA+oSLnRH0aMxb8tA9G6HYTdyjq1zAGrbu00rQ
         P1IeKtG5R6tfQ6E3BJGCLEPe4Bz7nUTNMZH5eNF8almj8uTCAkOenj9PNpmo9evWhfxH
         pNkQhgc8eBZfDubJxzytXBWjFnLfilbFWHF4VlG6rfIRD1dNU1lhmzjG3bZOV7Bfb9Yi
         Jopg==
X-Forwarded-Encrypted: i=1; AFNElJ/dpitE0jAqnfeZlyEzqc+HEYjSJ9RXoYDMkN0MYZBuc0h3AsQk8Cm0V8qXaYpgS3wC3+3nABIrJjOZ0yw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuYtoHPCOtIcukl4vaTq082Jw/xmT91qqJg6sOO41/sLawQdlE
	Cdivch6ovDbu0wwTgPjY8CDl++vLGo1IPsSlnyl5K2etP+TXmjHG2C+NQAU0/vBtNbt3uZ517vk
	TuKo+W+l5RJ+Yu/WIFRIV4zpCKSWigBo=
X-Gm-Gg: Acq92OHcBQdsEHTIFS9cWQO3x7dMlIpcd72GL1tSmHctCoGX1xy/h8zY/8kATkStjAJ
	fpdU5lFIpP9NebWhpQdQxXHhpY79+Wg0KykklZS0JprVafKhXMdO2P6vhBiN44QczL8s6eGqsQs
	z1uTZ81SCLkLY21nS6BJkqc42vMcRCspr8BXMnKIX0SxyPeIf+NPIyz7C8VjrXTlaYTXPtaQlCY
	BK48x5YUj+jr2uPMvNAV40ENesBtmA8S9C6Q/M6fY83kyCqbdSZLUGesVz63NNM1OYFZN200PSG
	jtMP+sFpv02hagO4ypMKDtPSC7zyD9NpTe5mQ/fb2p5Zg+CkOSwigPKE80cAdcryLBOK3DgXO8Q
	=
X-Received: by 2002:a17:906:7955:b0:bec:d077:c4dd with SMTP id
 a640c23a62f3a-bf0ae9fb19fmr282699166b.32.1780530491132; Wed, 03 Jun 2026
 16:48:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601221805.821394-1-ihor.solodrai@linux.dev> <20260601221805.821394-11-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-11-ihor.solodrai@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 3 Jun 2026 16:47:54 -0700
X-Gm-Features: AVHnY4JQct_cFDvrD2wM-9U7CrdDqWa-_ugyrfOX9dhEe2b_w71d_thBOQIEue8
Message-ID: <CAEf4Bzb2=RvOv_geBt9T0fBvgT23V1NBEgqmG+L+v2nP-0cpYA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 10/14] selftests/bpf: Verify bpf_fastcall decl
 tags in resolve_btfids test
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Alan Maguire <alan.maguire@oracle.com>, Jiri Olsa <jolsa@kernel.org>, 
	bpf@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13558-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andriinakryiko@gmail.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,oracle.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriinakryiko@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5357B63BE86

On Mon, Jun 1, 2026 at 3:19=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.d=
ev> wrote:
>
> Extend test_resolve_btfids() to assert that resolve_btfids emits a
> BTF_KIND_DECL_TAG of name "bpf_fastcall" for each kfunc marked with
> KF_FASTCALL flag.
>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---
>  tools/testing/selftests/bpf/prog_tests/resolve_btfids.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c b/to=
ols/testing/selftests/bpf/prog_tests/resolve_btfids.c
> index 7d9c3460cbed..eeda4e3b6a7f 100644
> --- a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
> +++ b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
> @@ -246,6 +246,13 @@ void test_resolve_btfids(void)
>                                              kfunc_symbols[i].id),
>                             kfunc_symbols[i].name);
>
> +       /* Check resolve_btfids emitted bpf_fastcall decl_tag for fastcal=
l kfuncs */
> +       for (i =3D 0; i < ARRAY_SIZE(kfunc_symbols); i++)
> +               if (kfunc_symbols[i].flags & KF_FASTCALL)
> +                       ASSERT_TRUE(btf_has_decl_tag(btf, "bpf_fastcall",
> +                                                    kfunc_symbols[i].id)=
,
> +                                   kfunc_symbols[i].name);
> +

{}

>  out:
>         btf__free(btf);
>  }
> --
> 2.54.0
>

