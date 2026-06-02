Return-Path: <linux-kbuild+bounces-13474-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g06/BcbVHmqWVgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13474-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 15:08:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE4362E4C7
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 15:08:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mtHO2JWs;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13474-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13474-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1936B306C858
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 13:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8930E3DB647;
	Tue,  2 Jun 2026 13:02:20 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBC63DA5AB
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jun 2026 13:02:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405340; cv=none; b=A9pnQjV9XVNvpZUoWk5iEU2Zxdt4pW6alkX5naz5d4prV/gLr/XNudy/B2PpY4YYWiYRz0V5ZC5OB2kV3LGOidZvXmtAigz8cc4CTuIegWzn12Rfge+iB9NV8nZ1ylU1wghyWtG0kt0Qg6iv+7K0CWXtgflB9C6BmK7zoFcZLh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405340; c=relaxed/simple;
	bh=13Tv+Z1spZT5uGkt505TWNW+HVbJyhrxpNqZ4YKbgcs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbEe2uPU4/O/SbnsBO8ZsOIxO+Q8vxwyPYgSaZOZAE4uWK+Rb4OZnDvOUUMpEL08+hyouQ50LCZS8bbuKmJ14R5mXwFRDIe+8yBRuplg50Xw4L3sVfJWn0pB6GjRKBknh2nKIuh4XK1gmOyCg4eKTgKGwtxof6FJzLxX/w7hyw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtHO2JWs; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so3374299f8f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jun 2026 06:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780405338; x=1781010138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ItCSA6VbxzXe3LEvyJ0NVDfAgln05Oan0qOsUww/kBc=;
        b=mtHO2JWskssmIDiJBnl2xBNO5tDyJEwXhJBQnjRV4FFaQNmkrPCdZn6lNFvOELCLxi
         albfeUS8blriKdebi+ZuHfU8D8/lLuF0UOVblkNaosbWQHRY/8iIKi6Hx+PID6DSKTlQ
         JhuzM6VW9G+5GOPJoguIJEeNDoDpUvH97kcx2smlgu86+1W3uxTqan7Yr/ZoQtwISjDF
         6nHqy58MoeimLNKUtSC2wfGTWARNomUGVadDkTiJbezv781C4nRUaybONKfLDUJT7TYc
         wpxO0kDGJXzHzSB2N3C9fME2LK1vCbX8wG+XhXdfbP4eEdwJl8TCsf6cfXwht0QUhAvz
         YsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405338; x=1781010138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItCSA6VbxzXe3LEvyJ0NVDfAgln05Oan0qOsUww/kBc=;
        b=gyXf0r1KvYpSxKmYA5plC33RzBa5T0HElWs32fE51O9p7Sm3ECp7nwY4ngPYCXpJc8
         zseR0l57ZS4loX9gR326w0jWKCpXsfinGqi1yEIcy2ifpx6SqAqRhWnm23Qy0AkfgDYG
         AiZvEsoJDxInzHbv9Zr8DB9JBEOw4ygctguylxJ7cBlijJO0NM+nh5u9D7+Lz6D6b0nP
         U8wln5TFMoTbQ0IBnD7nUPvJqjAlaYABXhWuKqmaNxPodv31kAWNwHZ33jejZpcwOfWw
         VtZXm1xej1ndSeRynS4APrV0TUwb6ASflbCoRpGYJK8dJTp9eW3IfJDXRJyQu7ulqApk
         SkYg==
X-Forwarded-Encrypted: i=1; AFNElJ9HjdWhdBARWsD+ExUh/6ExwJkW7SvvFHQ7fy8+u+vz0rCsP684CbFeS31fR9ZQuZ2dXco/mCGy2LqglO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcY7R6yvYERlsqP3KtlGCtXdxzzd1qRF20aaNnk2nAMi1bLMVa
	GpMFq2WXNaWhHaXivCD5YA1DrRDOfgnUSiARzNqIPmYHZxxKYYB6PjUy
X-Gm-Gg: Acq92OFFqsohnd9n9pzu15DFrlqyDmMCDoPk/bLSGnaLEJhKZwKhFhTs8iBQEaRim/j
	R97gsyTB9fGu9oF9GVLsZln2DWWS1P7TSqej8lM3eb4k8ju8iWZ+MwrP7fHwDl8wDhrFIcoQKUi
	YR4ZEwl0155RatsNh1TC8Oq5vx4cDsXqhvR3BC3bvQ3hNgR3z61KYa8LBcM/SKz8A810Dj62Iml
	+LvM2at0/i/uiak0kyeV+P132Yv4QM2wfeZhhbCDQJTTK2L0c8nAlbjZt6S/pU86iDc5xCAqN6z
	V2hcYEfWoNxz4fR4TWbveHkDUG2lijbnuoNMsMqCQtIAjGSkH8Q1STurH8AOadIiQZuHasHGS0o
	bTraXH+aF3HTsyD5OuTYhtEOHI9+Zxs0aE9+8z98ddXx807zwCZFClchqwBztqP+YvhhG6gypVt
	9rmdlKAQ4pP5A10Vug4J/ryro4Lfo=
X-Received: by 2002:a05:600c:c3cf:20b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-490b0e6014bmr44665745e9.6.1780405336989;
        Tue, 02 Jun 2026 06:02:16 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490af5f99dbsm26881425e9.9.2026.06.02.06.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:02:16 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 2 Jun 2026 15:02:13 +0200
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <alan.maguire@oracle.com>, bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 02/14] selftests/bpf: Modernize
 resolve_btfids test scaffolding
Message-ID: <ah7UVZLgsBcLDnkJ@krava>
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-3-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601221805.821394-3-ihor.solodrai@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13474-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,oracle.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[olsajiri@gmail.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olsajiri@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,krava:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9EE4362E4C7

On Mon, Jun 01, 2026 at 03:17:53PM -0700, Ihor Solodrai wrote:

SNIP

> -static int resolve_symbols(void)
> +static int resolve_symbols(struct btf *btf)
>  {
> -	struct btf *btf;
> +	__u32 nr = btf__type_cnt(btf);
>  	int type_id;
> -	__u32 nr;
> -
> -	btf = btf__parse_raw("resolve_btfids.test.o.BTF");
> -	if (CHECK(libbpf_get_error(btf), "resolve",
> -		  "Failed to load BTF from resolve_btfids.test.o.BTF\n"))
> -		return -1;
> -
> -	nr = btf__type_cnt(btf);
>  
>  	for (type_id = 1; type_id < nr; type_id++) {
>  		if (__resolve_symbol(btf, type_id))

I think __resolve_symbol uses PRINT_FAIL instead of ASSERT

> -			break;
> +			return -1;
>  	}
> -
> -	btf__free(btf);
>  	return 0;
>  }
>  
> @@ -121,25 +109,22 @@ void test_resolve_btfids(void)
>  {
>  	__u32 *test_list, *test_lists[] = { test_list_local, test_list_global };
>  	unsigned int i, j;
> -	int ret = 0;
> +	struct btf *btf;
>  
> -	if (resolve_symbols())
> -		return;
> +	btf = btf__parse_raw("resolve_btfids.test.o.BTF");
> +	if (!ASSERT_OK_PTR(btf, "btf_parse"))
> +		goto out;

nit, just return?

jirka

> +
> +	if (resolve_symbols(btf))
> +		goto out;
>  

SNIP

