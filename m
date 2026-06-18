Return-Path: <linux-kbuild+bounces-13816-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HxQwJDDlM2olHwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13816-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jun 2026 14:31:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7236A00F9
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jun 2026 14:31:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JoNpDUB0;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13816-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13816-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA732302AD09
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jun 2026 12:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18473F44F7;
	Thu, 18 Jun 2026 12:31:41 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5FF40D560
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Jun 2026 12:31:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785901; cv=none; b=sG0E9s1E4GB6jlyZX0TuB6hpysG9v/HFFeFijIzRdtFMz1iUbnup2I99IUbCJNCwEnEp6vswJDf4vX4uTuTsdptDWhia/YAF1l36hFHitKLSJb/jMqdxGk5YvW1BqUrgN18gM4LmXjXXr+Lx4usq0ep/f9HCviXU1v88Yf0qsjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785901; c=relaxed/simple;
	bh=HUmGOYE/C8TU/uUS16RtcpM+syCs0OHKlLWtF5Qgk+w=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hh5istz/gyJaOKJHT9N6wWI8bezKLg/TlRPDuDui4o9xqPOGr9dDK0t/N5cYxpqh6vl8ycyhuk2Ywu+ZGFgfSFWjZp/1mrWAK6BzcIxgyPM1zW8wi6EtdvoT9UWBLS2EUSJ062Ue2rlV411ejgRSVCUvuSmjIEKBMHEThPsUmRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoNpDUB0; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso10125095e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Jun 2026 05:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781785899; x=1782390699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PSGbxDjo+2rjoOObMeaDBZSVpoYq1jILY+Z8HnHA6Oc=;
        b=JoNpDUB0z9Y6f8YJHfMfDAwpI3A7vZCYWwhLtOaf7NjgmEj0TIuGCYkpOEvvL2U64i
         718YaYxWrKZQ1ilnQd2frDHit2F6sq+WIrI9UHaQGBu5/ZKWHyAkeeQEeULg3h7x/+gj
         LvVGH6sB9GgQVpBSO+R5jeK3PPaxPd80iPmBeTN91/atqvYfQOqk7TdhXsFjYMZbqb9M
         7dcnHaaKDVGCgHcfz6FY+1odsJpMCNzBKQ4VcExYN0vji09wbp7RpAqPMgLSE/hGvZkE
         BbZuhElCSEvI/NnsB9CxIIwY7sot7g3Q1m1OPHJet81IUnZNrZYFlYqsSBHzmMGQZAKt
         bV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785899; x=1782390699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSGbxDjo+2rjoOObMeaDBZSVpoYq1jILY+Z8HnHA6Oc=;
        b=YrkzCus6BhdvzCCWYbyz9hqObJ0UdU0UYGG+1O9aKfjljE+veZmwGOR1pLODemyUOG
         ur0ZczUyWeaRfhVrIhmPpfO2Opjt3cgscs1EEcUGzaEwTQfKv/dn8K5ONYuyTmQGacKk
         KeVaPoL7UcFiknFJccFXVPtJNBVsQslXdUIXU7Y0E3I0o2wI9ODPtX4TMZrYObPYehQd
         hatQoFKCrd5JxRwC1snocACRrdNI0IUufDba9OdJhZAuaD65SORVTC17rEqjMkczqV8s
         ZC/cFf4tDNchUIsLfMkrF6jmPLaIkLQWFC2fTQ377VxE5dFffdGPQuhRrdMMeoiqbT0A
         stuw==
X-Forwarded-Encrypted: i=1; AFNElJ92+PWG+SADWXGtJo5UNApdPQrjwW5qAJz0P48imCbTT/jTOfzC7huwxEjOc5smqOz78UkL+0szxWwBlcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwISqMs6GiqiVeSAdWRau6412atHjMSe7g4O06mTl91/XuOh5M8
	Aly2qXAKl5lt4rNwb5YYVWXG5lgkaaoVonmonSmAcvScRgP6ycKOuMW7
X-Gm-Gg: AfdE7ckDc1HwOWS7yyCC+tJ5os0dEDaEjjqkacoX49zfmNjTAggfJo9FoPFLl4o6+0Y
	8OIoODNozfv+BSDjEhCOu6IDAf+XunAOiEh8Hmg9CpKoZv9ZjLcqvKsZsbAZa6yHFlFWTDw3jlG
	g+te+RCug2yfpYZVIHiqPp6UQ0oti8Zpvje9uNhaEXEbeK4ewwqPz3dpdpMa5cNHrchoADUdutX
	ekk11eYZ1F9jnDvwwvp1nzGfIaR3krpV6HZOvBp8b1GuPK8xU8R9rCJHot0JpYTh4zlpzmx0AwX
	lvdWXJvIwdHdbNAgQ0abq1RCON6T1CpyAYBBbVio4AF4WsG3P69EXUo61YUftZxTZB20TKBLNuR
	1ywGYxFLdf+ijxk8Qwu3L+MAWqQg4r8M/vmAXjHuUBwesL+lH0Oc664G2ljXXlZsPGjwKgoGnPQ
	vd
X-Received: by 2002:a05:600c:e547:10b0:491:9969:739d with SMTP id 5b1f17b1804b1-4923822eed4mr39446355e9.29.1781785898507;
        Thu, 18 Jun 2026 05:31:38 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4601esm267646685e9.1.2026.06.18.05.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:31:37 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 18 Jun 2026 14:31:35 +0200
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <alan.maguire@oracle.com>,
	Emil Tsalapatis <emil@etsalapatis.com>, bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 4/4] selftests/bpf: Add kfunc set test to
 resolve_btfids
Message-ID: <ajPlJ81PL_YaHsBo@krava>
References: <20260617210619.1562858-1-ihor.solodrai@linux.dev>
 <20260617210619.1562858-5-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617210619.1562858-5-ihor.solodrai@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13816-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,oracle.com,etsalapatis.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:emil@etsalapatis.com,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,etsalapatis.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA7236A00F9

On Wed, Jun 17, 2026 at 02:06:19PM -0700, Ihor Solodrai wrote:
> Extend the resolve_btfids selftest to cover kfunc sets defined with
> BTF_KFUNCS_START/BTF_KFUNCS_END.
> 
> The test verifies that resolve_btfids correctly processes BTF_ID_FLAGS,
> resolves function IDs, and checks the kfunc set is sorted.
> 
> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---
>  .../selftests/bpf/prog_tests/resolve_btfids.c | 63 ++++++++++++++++---
>  tools/testing/selftests/bpf/progs/btf_data.c  | 10 +++
>  2 files changed, 66 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
> index 6bcadee50bb8..65ede3ac5845 100644
> --- a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
> +++ b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
> @@ -12,6 +12,10 @@
>  
>  #define BTF_DATA_FILE "resolve_btfids.test.o.BTF"
>  
> +#ifndef KF_FASTCALL
> +#define KF_FASTCALL (1 << 12)
> +#endif
> +
>  struct symbol {
>  	const char	*name;
>  	int		 type;
> @@ -28,6 +32,17 @@ struct symbol test_symbols[] = {
>  	{ "func",    BTF_KIND_FUNC,    -1 },
>  };
>  
> +struct kfunc_symbol {
> +	const char	*name;
> +	s32		 id;
> +	u32		 flags;
> +};
> +
> +static struct kfunc_symbol kfunc_symbols[] = {
> +	{ "kfunc_a", -1, 0 },
> +	{ "kfunc_b", -1, KF_FASTCALL },
> +};
> +
>  /* Align the .BTF_ids section to 4 bytes */
>  asm (
>  ".pushsection " BTF_IDS_SECTION " ,\"a\"; \n"
> @@ -35,9 +50,9 @@ asm (
>  ".popsection;                             \n");
>  
>  /*
> - * test_list_local and test_set are .local symbols placed in .BTF_ids by
> - * inline asm, and are read here directly by C name. To the compiler they
> - * are plain, default-visibility extern objects.
> + * test_list_local, test_set and test_kfunc_set are .local symbols placed
> + * in .BTF_ids by inline asm, and are read here directly by C name. To the
> + * compiler they are plain, default-visibility extern objects.
>   *
>   * When test_progs is linked as a position-independent executable (PIE),
>   * taking the address of such an extern is routed through the GOT. The
> @@ -69,6 +84,11 @@ BTF_ID(struct,  S)
>  BTF_ID(union,   U)
>  BTF_ID(func,    func)
>  BTF_SET_END(test_set)
> +
> +BTF_KFUNCS_START(test_kfunc_set)
> +BTF_ID_FLAGS(func, kfunc_a)
> +BTF_ID_FLAGS(func, kfunc_b, KF_FASTCALL)
> +BTF_KFUNCS_END(test_kfunc_set)
>  #pragma GCC visibility pop
>  
>  extern __u32 test_list_global[];
> @@ -92,6 +112,8 @@ __resolve_symbol(struct btf *btf, int type_id)
>  	if (!ASSERT_OK_PTR(type, "btf__type_by_id"))
>  		return -1;
>  
> +	str = btf__name_by_offset(btf, type->name_off);

should we assert str != NULL like below?

jirka

> +
>  	for (i = 0; i < ARRAY_SIZE(test_symbols); i++) {
>  		if (test_symbols[i].id >= 0)
>  			continue;
> @@ -99,14 +121,20 @@ __resolve_symbol(struct btf *btf, int type_id)
>  		if (BTF_INFO_KIND(type->info) != test_symbols[i].type)
>  			continue;
>  
> -		str = btf__name_by_offset(btf, type->name_off);
> -		if (!ASSERT_OK_PTR(str, "btf__name_by_offset"))
> -			return -1;
> -
>  		if (!strcmp(str, test_symbols[i].name))
>  			test_symbols[i].id = type_id;
>  	}
>  

SNIP

