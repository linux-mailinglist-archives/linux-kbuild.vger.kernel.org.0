Return-Path: <linux-kbuild+bounces-13757-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0AACD0H2MGpSZgUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13757-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 09:07:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADC168CB67
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 09:07:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etsalapatis-com.20251104.gappssmtp.com header.s=20251104 header.b=MopNBGn3;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13757-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13757-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F47E30548A3
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 07:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4326D346AC4;
	Tue, 16 Jun 2026 07:07:33 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787FA349CD3
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 07:07:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781593653; cv=none; b=o0AFj7F+SFyt9wSYSQOtH1r3dI86DuoQhWahgAjYa47H2dGTY9e3jwUd+kNR08aHa3bSw4DlcUdqi31DyqQLoFjTMqDpB0qiRKza83vHGmJaFJBSmT4YbL5rJ2olbkPySsl6aysCZv8G4oxjdkpRvVn7TNLzLnCVhqtg1p/RYdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781593653; c=relaxed/simple;
	bh=mPXdKYwDz0xk4Rh5YVPEDuEuCc1dfd+SD4yHv3OITxI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=bw3eHuf+kr/yb68kwuoHwqWLQoo76M3rKVfjLXggTNpsXngzuJZ+Ulsx8N4JG4zfgufa3poMIbwsWdwYXD8iHO1FsuvsEbGQcyo5gLPzFjdPpYKBAMERu1T7rzqoC/OdKB1A7l3bDIi8kmWAm4p9MyVp5shZUwfQrxZkV4JcQ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=MopNBGn3; arc=none smtp.client-ip=209.85.216.48
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so3352886a91.1
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 00:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781593648; x=1782198448; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efFAPo1eL0J3dsu2A5wxzYPQWfYJHzDPadyLXJxvyQo=;
        b=MopNBGn3xlChpNwDv7oIYdpe7aF4VI1YHvh4+h0rQZlcPqH+v3roqIVSg5KWg+7nBG
         ZS/3qLh/pktH6GDzG81IRpniVpwuuTCNvUnLMYUUDlvvk2u43OU+7EBM4iV9lbELn9yT
         k9U55TE4R4Krm0gpsS7NwHlzErGldQgn5yrSkMBLXa3Xuza1U5LXEi9y+eurvLcUK84t
         FJFOzBPromP7TYIMlTYGYphpOyioWQwf3cmLN9Iqi0OadtqxcuOWMavzihR48ALJVw4m
         oGRSc5x52FscVTwj7F6sEenOhzPP0cjcKhOa1pMU7Q2IwAywPALlENrf4tO2RouwvzlK
         jf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781593648; x=1782198448;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=efFAPo1eL0J3dsu2A5wxzYPQWfYJHzDPadyLXJxvyQo=;
        b=buuHkm4MZDRNKkapz74gI96LzhGJ/eQxTeJ+qB4u2VEqeHifRfVrK305vO3eQKfNpQ
         nbF2I+xPsXB2dfjcq7k8mc5hHfDpzlam0uHeM7Dy8JN0zOt4sHFAe24p3CgsZvgPf9BF
         7YjGxRqYNpCQVzA7Qcte8lGFxhURV1W2p2WUuvsoEqIE5k3MsKCP0iQOkuBHuT+2sYV5
         QLnppwcsBKGjpLa4ajdbC56hNW/vJM9ErphTE8YurdKxq5QkpYniemnqHt3i+MTt6bt/
         NF3PYIznh4Ke7/+bjc3mI0QWs57qv2s5REQv8Cdkol4wp/bSXhUH1Up72NvFrRjPBNsC
         2GtQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zxqBXJfZIgLBF+oA4Klvfu2iktnNO6EHvbs6bULx+1I56/3LoKGNjqHZf3gEDO0wkixfkhvkPi8UYBck=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDDcfsgPAC0GoMVwXoAtieuj0i/OeCaVffwKm48JNWHeSuRicG
	QrxbgXRk8vDN+3pTxqXuy8Vot58ltsKGAJTllCT81LbV4bkIqIatXokPWVx5Ib6ffwE=
X-Gm-Gg: Acq92OEAonvvQeEuw/04jcuMp/C5CbS3wXdni1EOIo+W8nVMXMb0u/tq+jdgz4mYtAT
	KXNIzHDKnZ1guTOGqVz5d2UgddSZnxU4usOjHwBXNay3lCfsV2ZTCtVQsEddbqRY1ObiAWdY23S
	grzoV5ibVsgxYPcOuacNrx20YYWOfP/hKPP0qJ7B03Fnlz09PPuZMNgrRJkalNjRLryOgr7WErm
	O422z9cc9IC8ml392Mu72mpzennCUeHCy64XPgCK+0zzwoYcGpM9moi5RG2GH2OQwgs+feV7BAK
	JT3xylv/jtJeh2X273r98Mk6o3kfRfjfoagDcQbTAKAnsxMroSQtD1dS2MbKQTCTUGm5LbWCtKL
	8HmN7tZCdeec9VK8Nqm5lxuh45dzvtgV518eHhlixmGDvyf71QHN3wwbZXXsoyj5vocatu5L6A/
	yyfZN+OxvYwP7P6oFSciKsZtFShQz7i6nIzYZ0PU9JrEY2siupmbtrAN2h
X-Received: by 2002:a17:90b:4c09:b0:368:3d3e:efa6 with SMTP id 98e67ed59e1d1-37c523fb93cmr2722990a91.20.1781593647586;
        Tue, 16 Jun 2026 00:07:27 -0700 (PDT)
Received: from localhost (d206-116-244-52.bchsia.telus.net. [206.116.244.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e810f98fsm5811867a91.2.2026.06.16.00.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 00:07:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 03:07:26 -0400
Message-Id: <DJAA8M3U5PJ7.W84BYRNJA7UY@etsalapatis.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alexei Starovoitov"
 <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>
Cc: "Alan Maguire" <alan.maguire@oracle.com>, "Jiri Olsa"
 <jolsa@kernel.org>, <bpf@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 04/14] selftests/bpf: Add kfunc set test to
 resolve_btfids
From: "Emil Tsalapatis" <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-5-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-5-ihor.solodrai@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[etsalapatis-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[etsalapatis.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,iogearbox.net,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13757-lists,linux-kbuild=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[emil@etsalapatis.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[etsalapatis-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[emil@etsalapatis.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8ADC168CB67

On Mon Jun 1, 2026 at 6:17 PM EDT, Ihor Solodrai wrote:
> Extend the resolve_btfids selftest to cover kfunc sets defined with
> BTF_KFUNCS_START/BTF_KFUNCS_END.
>
> The test verifies that resolve_btfids correctly processes BTF_ID_FLAGS,
> resolves function IDs, and checks the kfunc set is sorted.
>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

One nit below.

> ---
>  .../selftests/bpf/prog_tests/resolve_btfids.c | 56 +++++++++++++++++++
>  tools/testing/selftests/bpf/progs/btf_data.c  | 10 ++++
>  2 files changed, 66 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c b/to=
ols/testing/selftests/bpf/prog_tests/resolve_btfids.c
> index d0e51979d455..f6fd79b9dd23 100644
> --- a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
> +++ b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
> @@ -10,6 +10,10 @@
>  #include <linux/btf_ids.h>
>  #include "test_progs.h"
> =20
> +#ifndef KF_FASTCALL
> +#define KF_FASTCALL (1 << 12)
> +#endif
> +
>  struct symbol {
>  	const char	*name;
>  	int		 type;
> @@ -26,6 +30,17 @@ struct symbol test_symbols[] =3D {
>  	{ "func",    BTF_KIND_FUNC,    -1 },
>  };
> =20
> +struct kfunc_symbol {
> +	const char	*name;
> +	s32		 id;
> +	u32		 flags;
> +};
> +
> +static struct kfunc_symbol kfunc_symbols[] =3D {
> +	{ "kfunc_a", -1, 0 },
> +	{ "kfunc_b", -1, KF_FASTCALL },
> +};
> +
>  /* Align the .BTF_ids section to 4 bytes */
>  asm (
>  ".pushsection " BTF_IDS_SECTION " ,\"a\"; \n"
> @@ -77,7 +92,13 @@ BTF_ID(union,   U)
>  BTF_ID(func,    func)
>  BTF_SET_END(test_set)
> =20
> +BTF_KFUNCS_START(test_kfunc_set)
> +BTF_ID_FLAGS(func, kfunc_a)
> +BTF_ID_FLAGS(func, kfunc_b, KF_FASTCALL)
> +BTF_KFUNCS_END(test_kfunc_set)
> +
>  #pragma GCC visibility pop
> +
>  static int
>  __resolve_symbol(struct btf *btf, int type_id)
>  {
> @@ -108,6 +129,18 @@ __resolve_symbol(struct btf *btf, int type_id)
>  			test_symbols[i].id =3D type_id;
>  	}
> =20
> +	if (BTF_INFO_KIND(type->info) =3D=3D BTF_KIND_FUNC) {
> +		str =3D btf__name_by_offset(btf, type->name_off);
> +		if (str) {

This can be rewritten to collapse the nesting:
if (BTF_INFO_KIND(type->info) !=3D BTF_KIND_FUNC)=20
	return 0;

str =3D btf__name_by_offset(btf, type->name_off);
if (!str)
	return 0;

<the rest>

> +			for (i =3D 0; i < ARRAY_SIZE(kfunc_symbols); i++) {
> +				if (kfunc_symbols[i].id >=3D 0)
> +					continue;
> +				if (!strcmp(str, kfunc_symbols[i].name))
> +					kfunc_symbols[i].id =3D type_id;
> +			}
> +		}
> +	}
> +
>  	return 0;
>  }
> =20
> @@ -162,6 +195,29 @@ void test_resolve_btfids(void)
>  			ASSERT_LE(test_set.ids[i - 1], test_set.ids[i], "sort_check");
>  	}
> =20
> +	/* Check BTF_KFUNCS_START(test_kfunc_set) */
> +	ASSERT_EQ(test_kfunc_set.flags, BTF_SET8_KFUNCS, "kfunc_set_flags");
> +	ASSERT_EQ(test_kfunc_set.cnt, ARRAY_SIZE(kfunc_symbols), "kfunc_set_cnt=
");
> +
> +	for (i =3D 0; i < test_kfunc_set.cnt; i++) {
> +		bool found =3D false;
> +
> +		for (j =3D 0; j < ARRAY_SIZE(kfunc_symbols); j++) {
> +			if (kfunc_symbols[j].id !=3D (s32)test_kfunc_set.pairs[i].id)
> +				continue;
> +			found =3D true;
> +			ASSERT_EQ(test_kfunc_set.pairs[i].flags,
> +				  kfunc_symbols[j].flags, "kfunc_flags_check");
> +			break;
> +		}
> +
> +		ASSERT_TRUE(found, "kfunc_id_found");
> +
> +		if (i > 0)
> +			ASSERT_LE(test_kfunc_set.pairs[i - 1].id,
> +				  test_kfunc_set.pairs[i].id, "kfunc_sort_check");
> +	}
> +
>  out:
>  	btf__free(btf);
>  }
> diff --git a/tools/testing/selftests/bpf/progs/btf_data.c b/tools/testing=
/selftests/bpf/progs/btf_data.c
> index baa525275bde..8587658012c3 100644
> --- a/tools/testing/selftests/bpf/progs/btf_data.c
> +++ b/tools/testing/selftests/bpf/progs/btf_data.c
> @@ -48,3 +48,13 @@ int func(struct root_struct *root)
>  {
>  	return 0;
>  }
> +
> +int kfunc_a(struct root_struct *root)
> +{
> +	return 0;
> +}
> +
> +int kfunc_b(struct root_struct *root)
> +{
> +	return 0;
> +}


