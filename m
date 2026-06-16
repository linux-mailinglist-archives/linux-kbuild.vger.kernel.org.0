Return-Path: <linux-kbuild+bounces-13755-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dk4qKG7uMGqUYwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13755-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 08:34:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB09968C8B5
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 08:34:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etsalapatis-com.20251104.gappssmtp.com header.s=20251104 header.b=J2kG4VTX;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13755-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13755-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 668C830421D4
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 06:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C082C3E0080;
	Tue, 16 Jun 2026 06:33:39 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0E63E168C
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 06:33:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591619; cv=none; b=q6iQMtrEQ65+W9VD3gD8B98fji6wlL+xH8HuPP8/sKK8Ch4CBltP+ZwqG/MHkmSDSCdlnajc+JOZsQ33HG0V+km1DWeY1A22ARr4NZumZ0hBQAMwfIh96tTnEd2ncv9WwlNbrDSk5w9YHM91R5v3mbiMvOKdJWQkS0ArWDgDJ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591619; c=relaxed/simple;
	bh=UeuCMINapsR5SpBtSghJeUH5E+bHG6j3AAxRFbvUaQ0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Zpei1oTPqs0J+tt+k+eBGZbPbzJVUAORdRD8++sUvxvIm3MsjwAWFsCCydNL5wY4WpLvSwJlzG6n9LBnKxQeKz/MJ750BRw5zojprPBM3rLdLCrkDC4xqzSK0rTysWEnZgTRULO4jkOna6P4WlR6K3ifYjcJgZBsGuEaIRiQq1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=J2kG4VTX; arc=none smtp.client-ip=209.85.216.51
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36bba9a1089so2446578a91.3
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Jun 2026 23:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781591615; x=1782196415; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGRIaPvdUzg+ueBfQuakIepjwNDKmjuhE3vFhhrEoHc=;
        b=J2kG4VTXq21cXpfiQrLKFHdXSgoZPN1y0pKAddXzyD22uYO1SvNthUhwVmLiuxVRtA
         pWfWYXqYf+WUQtt8VoeLU/6WwDWjUuWIZsPrj5u9SGkgsfU9vL3J2NG2Gtt5Nsc7I5Dz
         aF0XyusE7CiPJH/LH+TtxtZeXPyZyqwHKZYWt+tXDtMLoekmV/bqmewPgzCH6quGr2Z+
         SWdeAPfnbwKf7BNkxA49D9WltxHKdRMuYevvWifkbM43eAOdo8Dkmdsi4ZFs2l9G6ER9
         kX1ft6hFflE1Bvroi+uL+pr73GGpX8C2O/P3xoxzqTPtGGn41m+1qCQyy+2/0XNAfe5F
         WlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781591615; x=1782196415;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DGRIaPvdUzg+ueBfQuakIepjwNDKmjuhE3vFhhrEoHc=;
        b=cAmBpTlfLl93Ye+ZMr6CQPY4ngJ+NJszqr+ZPfnDiarA0ApHP7UzujvWZO6b90pGXn
         AAsFQ4SjIsZgRK+WcZzMNttvkbBl/oqU4axf2wPk8uAl0N/Hfk2lmw8JhaNuFPUEGnkQ
         Jsi9E9MT/2NJV5heGUX0jPe0KtlPlsmw9LnqqJd6U4qq/qg8YPEK57M5aQ1RSTq02PN4
         5YYUO4lpJJigdZMqvMr0CZhAL5SvBaZ7fK3nJaRn5wCNCE8Z8WzZ+I/j9SyMCJTjAovk
         EeYlYm9PB+28nppcE7mtHKghBKzF4PCHifMziWgQSAt3YAEvHzOPVO3tb7+23BS/kyyd
         ZgoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Tu0xf327lQLjKn7jaO+FSTHzSrR+Ujt0FsAOB497bO5Oz3s8W3x+80LQNXpzcQ1RSdru6Q3isN3kug2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPqfQcA8tvDX9YND0943agrKNCutomQCq3lwa6Tjvc3Luftj8o
	U5jC91FREanbGXJjRdarAFbnIbFyVqO5z+5a5z0HJd6OXSUqnagQcY+1zPKQ0kB2qOI=
X-Gm-Gg: Acq92OEnGTLl0izduOQ16+vSSdEzRAeB99EsvbC8oe41tYESuKrjmhFkth2SJQyE/Cx
	S8YmCuTyqgXkqTF4pGf2LBUvQ9NwF0SL5YRYirV5ImeaspUvIgLn99DFD5ZH2WlfZOcX52x8Smg
	AQ5U1OGzwrxWGrfYG+K7RIn2SoZUlX8DbCEQ5CdM8bayILL9vSmoxB7K++New7IY/CIP5J/r7e7
	42Ogz9EbBM6lGThL1otgtSuXkAdShU7e7t5BbbvKujNKQmXwwR96fuMYoe/E/dxQ/E0lzTcWL33
	szzVrz09vs+7HQVvrufam5sgR1XQuKEIZq1nVG9apvzfSxu67RNcRtBa7ubt5bvaOKzSm/w5X1J
	M4YffKqP+7VHdI/bD028Bydvzd/Q/ruzcj84S6gZDQo/7Qolb3hTn+mljX1GT59DajZfHxwpcIW
	8LY3v/VzQsX830J+O/rPtDdZtTbVbkW34r4KprsB6HPwTAqrNyqCYqN67g
X-Received: by 2002:a17:90b:3bc8:b0:36a:8240:2477 with SMTP id 98e67ed59e1d1-37c2bd3325dmr13622453a91.19.1781591614779;
        Mon, 15 Jun 2026 23:33:34 -0700 (PDT)
Received: from localhost (d206-116-244-52.bchsia.telus.net. [206.116.244.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521d96ddsm1612226a91.6.2026.06.15.23.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 23:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 02:33:33 -0400
Message-Id: <DJA9IOJTM7K9.7G9QVJMZYSRZ@etsalapatis.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alexei Starovoitov"
 <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>
Cc: "Alan Maguire" <alan.maguire@oracle.com>, "Jiri Olsa"
 <jolsa@kernel.org>, <bpf@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 02/14] selftests/bpf: Modernize
 resolve_btfids test scaffolding
From: "Emil Tsalapatis" <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-3-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-3-ihor.solodrai@linux.dev>
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
	TAGGED_FROM(0.00)[bounces-13755-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.dev:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,etsalapatis.com:email,etsalapatis.com:mid,etsalapatis.com:from_mime,etsalapatis-com.20251104.gappssmtp.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB09968C8B5

On Mon Jun 1, 2026 at 6:17 PM EDT, Ihor Solodrai wrote:
> Refactor resolve_btfids test in order to:
>   * use newer ASSERT_* macros instead of CHECK
>   * extend the lifetime of loaded BTF to enable additional checks
>   * cleanup unused/unnecessary code
>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

One nit below.

> ---
>  .../selftests/bpf/prog_tests/resolve_btfids.c | 54 +++++++------------
>  1 file changed, 18 insertions(+), 36 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c b/to=
ols/testing/selftests/bpf/prog_tests/resolve_btfids.c
> index 41dfaaabb73f..d742ecb2ca8e 100644
> --- a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
> +++ b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
> @@ -10,8 +10,6 @@
>  #include <linux/btf_ids.h>
>  #include "test_progs.h"
> =20
> -static int duration;
> -
>  struct symbol {
>  	const char	*name;
>  	int		 type;
> @@ -95,25 +93,15 @@ __resolve_symbol(struct btf *btf, int type_id)
>  	return 0;
>  }
> =20
> -static int resolve_symbols(void)
> +static int resolve_symbols(struct btf *btf)
>  {
> -	struct btf *btf;
> +	__u32 nr =3D btf__type_cnt(btf);
>  	int type_id;
> -	__u32 nr;
> -
> -	btf =3D btf__parse_raw("resolve_btfids.test.o.BTF");

Nit; Maybe #define the file name instead of using it directly in
the code?

> -	if (CHECK(libbpf_get_error(btf), "resolve",
> -		  "Failed to load BTF from resolve_btfids.test.o.BTF\n"))
> -		return -1;
> -
> -	nr =3D btf__type_cnt(btf);
> =20
>  	for (type_id =3D 1; type_id < nr; type_id++) {
>  		if (__resolve_symbol(btf, type_id))
> -			break;
> +			return -1;
>  	}
> -
> -	btf__free(btf);
>  	return 0;
>  }
> =20
> @@ -121,25 +109,22 @@ void test_resolve_btfids(void)
>  {
>  	__u32 *test_list, *test_lists[] =3D { test_list_local, test_list_global=
 };
>  	unsigned int i, j;
> -	int ret =3D 0;
> +	struct btf *btf;
> =20
> -	if (resolve_symbols())
> -		return;
> +	btf =3D btf__parse_raw("resolve_btfids.test.o.BTF");
> +	if (!ASSERT_OK_PTR(btf, "btf_parse"))
> +		goto out;
> +
> +	if (resolve_symbols(btf))
> +		goto out;
> =20
>  	/* Check BTF_ID_LIST(test_list_local) and
>  	 * BTF_ID_LIST_GLOBAL(test_list_global) IDs
>  	 */
>  	for (j =3D 0; j < ARRAY_SIZE(test_lists); j++) {
>  		test_list =3D test_lists[j];
> -		for (i =3D 0; i < ARRAY_SIZE(test_symbols); i++) {
> -			ret =3D CHECK(test_list[i] !=3D test_symbols[i].id,
> -				    "id_check",
> -				    "wrong ID for %s (%d !=3D %d)\n",
> -				    test_symbols[i].name,
> -				    test_list[i], test_symbols[i].id);
> -			if (ret)
> -				return;
> -		}
> +		for (i =3D 0; i < ARRAY_SIZE(test_symbols); i++)
> +			ASSERT_EQ(test_list[i], test_symbols[i].id, test_symbols[i].name);
>  	}
> =20
>  	/* Check BTF_SET_START(test_set) IDs */
> @@ -153,15 +138,12 @@ void test_resolve_btfids(void)
>  			break;
>  		}
> =20
> -		ret =3D CHECK(!found, "id_check",
> -			    "ID %d not found in test_symbols\n",
> -			    test_set.ids[i]);
> -		if (ret)
> -			break;
> +		ASSERT_TRUE(found, "id_in_test_symbols");
> =20
> -		if (i > 0) {
> -			if (!ASSERT_LE(test_set.ids[i - 1], test_set.ids[i], "sort_check"))
> -				return;
> -		}
> +		if (i > 0)
> +			ASSERT_LE(test_set.ids[i - 1], test_set.ids[i], "sort_check");
>  	}
> +
> +out:
> +	btf__free(btf);
>  }


