Return-Path: <linux-kbuild+bounces-13475-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zixEDMzVHmqaVgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13475-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 15:08:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D27A62E4CF
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 15:08:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bzZmFWUG;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13475-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13475-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29D943046D78
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 13:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995952EBB84;
	Tue,  2 Jun 2026 13:02:51 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502783090C1
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jun 2026 13:02:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405371; cv=none; b=qIn9PrY3SiVl54mUdszTPW3gbSqa+MMdHZErZNVhH3T6KaWgvMkeE1+4DosrGmTFwFj2PkejEE38+T1zo5ErZKV0iTGT82nwN/KMN2OtNHH6i25YQ4zQE4dkgJleie8d9qpnx9nmLjq4XIr3EyfIRyW+OE9q0bi+GJMMK1gQ464=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405371; c=relaxed/simple;
	bh=JE9BsHwCXebesj3gPEonc8Cp+dgSTslh4pusv9zboyY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPnmnFhrG4EwsfNpRPktWaVSRmCdiQ9lzbHC+PM1XiuVn8c7PObUwwxie0rkifCCunXeQHHbzfX+a14r3auG/ch2tC8WsHykoQ2cUN+Kc1C8xa2I67wBmXBTJTrqPrqrQJMLKA0xW5GlIOz/gMcE3j2WnpTn8huOWuendGZLzs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzZmFWUG; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so115792335e9.2
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jun 2026 06:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780405369; x=1781010169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5031zl6vzmgMYXl4CWCm+EUkp03qXJKw3CP4zw8608o=;
        b=bzZmFWUGK9PFNcYnlvBOBFkRz2emdpvLJAsUMRIADhCsTAqwhX+aAg2Qkd1lkTEZq+
         agGoGuDVocL9INM742ICIOWhvcpPShaBL0Fb9+Oe8O34p8sxY5DtvI4IXhUsgVuq0bKh
         igDAOpOEk9WffD+mPLjoqmtaLNQKDft98IyJ1ER0LKxwzIpfepVlX/BexqwQ7zwGl5Zk
         7EJFFCZxI5ACPeag7GbJDKIqbvnH4YtalrdR1BmeygNqLaihSpmfS76x6ph73eA3UwwL
         r/DsfAfgd4uBC8pX9aWd7d2AEo1PnNOt535pWWGSFIS9Lc0mVZ4t+ZE+45aaxFJ8F4UJ
         2ZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405369; x=1781010169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5031zl6vzmgMYXl4CWCm+EUkp03qXJKw3CP4zw8608o=;
        b=ZCy7ZPA1ygRVn4bgxoPD3JO3Kpm8enLhYPjucB64GvVzGE5JhSu7z2oPmHD6Ac5SGS
         xF0bBg/lVJbxxHN9ULshnSG9y3W37gh1knyvbHY+rRjd7ptuprqZmM0YaHzefBSr0sv1
         9K1pbIrA1iT7mFbKRpbBRmhTfY1sBSjKnOonoBC4NY5p32dntVqtR60Edcn1MWdxuBlu
         lgW+vB3irdC7LJWjb+GgvzsqJrJgSv4X2lD22eXmi2vSJErduDFr9208ZFVuakEQOUpc
         H1AxAbnVDu2XgcqQjb4/Wi1dzcpthG+NFvOOQEL5V4n6n8cWQWkJvEE/+zdu1kO18ZK3
         TGpA==
X-Forwarded-Encrypted: i=1; AFNElJ95H2+qanjbNJblzvJOpNlOLxXuKKgCD6H+jj/eCHIcVZBlQ65YjzxppG02guKNvuXl1cDQ+X+073tIZNk=@vger.kernel.org
X-Gm-Message-State: AOJu0YysmtfiOq4oCGGcWMEW60l3/mjT2M4+Bz8HvDoZp/gh5yiFGq+/
	4xrTHl25uJM0SDV9gRuUsK0u+evtVjKqFGvBYSEE3zoixz/4ragDcDMP
X-Gm-Gg: Acq92OF/flOSN+TWmlghlGHMmBVrLdFKWh3Me17BGas7FrOe9P7LJdxt3XYiPPAIOZ2
	OJrVse0YUbgCDwWBp8wD00YzmU8L/88M+YMNvhtjypnU4VAH4+8t0ZehdWUdAs03IYjRgaR8h0i
	pyiUOrMhWVIJCgsHjyM2SbDpPOJySZ59AaHa5QyZPPvUQ6PXbrc6eHfhQM/x4TJqg29vabgdHul
	Pd+2W95vqg1/hmBKdmgN+L13GrhFFy6ApDZtwHwtRdAPdqAvqU8shgM+tph4t1znOrwWhsyWtzO
	73pR5adDdDR1wGScSKfLZTqEh+sTQQXsrqvUzmm1ZYmyPsG5wfdm18IGSNrEGJvfKdguc4s4U2v
	WAR5VTeGCeG7IcfTXTXWpeO+ViTNAi6e+ofjoNpRtC2jBEHCaP89oW/i/RfOv0acwYLbwEMZDIN
	1aFrU3XUm82bjm7hdVoF6Ep3qegt8=
X-Received: by 2002:a05:600c:818c:b0:490:48df:2793 with SMTP id 5b1f17b1804b1-490a296df9amr292038265e9.26.1780405368565;
        Tue, 02 Jun 2026 06:02:48 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef3563cb9sm34280753f8f.29.2026.06.02.06.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:02:47 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 2 Jun 2026 15:02:45 +0200
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <alan.maguire@oracle.com>, bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 04/14] selftests/bpf: Add kfunc set test to
 resolve_btfids
Message-ID: <ah7UdYz8Kv-Sekc4@krava>
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-5-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601221805.821394-5-ihor.solodrai@linux.dev>
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
	TAGGED_FROM(0.00)[bounces-13475-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 9D27A62E4CF

On Mon, Jun 01, 2026 at 03:17:55PM -0700, Ihor Solodrai wrote:

SNIP

>  static int
>  __resolve_symbol(struct btf *btf, int type_id)
>  {
> @@ -108,6 +129,18 @@ __resolve_symbol(struct btf *btf, int type_id)
>  			test_symbols[i].id = type_id;
>  	}
>  
> +	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC) {
> +		str = btf__name_by_offset(btf, type->name_off);
> +		if (str) {
> +			for (i = 0; i < ARRAY_SIZE(kfunc_symbols); i++) {
> +				if (kfunc_symbols[i].id >= 0)
> +					continue;
> +				if (!strcmp(str, kfunc_symbols[i].name))
> +					kfunc_symbols[i].id = type_id;
> +			}
> +		}
> +	}
> +
>  	return 0;
>  }
>  
> @@ -162,6 +195,29 @@ void test_resolve_btfids(void)
>  			ASSERT_LE(test_set.ids[i - 1], test_set.ids[i], "sort_check");
>  	}
>  
> +	/* Check BTF_KFUNCS_START(test_kfunc_set) */
> +	ASSERT_EQ(test_kfunc_set.flags, BTF_SET8_KFUNCS, "kfunc_set_flags");
> +	ASSERT_EQ(test_kfunc_set.cnt, ARRAY_SIZE(kfunc_symbols), "kfunc_set_cnt");
> +
> +	for (i = 0; i < test_kfunc_set.cnt; i++) {
> +		bool found = false;
> +
> +		for (j = 0; j < ARRAY_SIZE(kfunc_symbols); j++) {
> +			if (kfunc_symbols[j].id != (s32)test_kfunc_set.pairs[i].id)
> +				continue;
> +			found = true;
> +			ASSERT_EQ(test_kfunc_set.pairs[i].flags,
> +				  kfunc_symbols[j].flags, "kfunc_flags_check");
> +			break;

nit, we could reverse the logic 
			if (match) {
				....
				break
			}

then found is equal to "i < ARRAY_SIZE(kfunc_symbols)"

> +		}
> +
> +		ASSERT_TRUE(found, "kfunc_id_found");
> +
> +		if (i > 0)
> +			ASSERT_LE(test_kfunc_set.pairs[i - 1].id,
> +				  test_kfunc_set.pairs[i].id, "kfunc_sort_check");

nit, should have { .. } braces 

jirka

