Return-Path: <linux-kbuild+bounces-13754-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HHzNJSntMGo4YwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13754-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 08:28:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D36A68C82C
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 08:28:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etsalapatis-com.20251104.gappssmtp.com header.s=20251104 header.b=K1oemrk4;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13754-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13754-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1779530128D6
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 06:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1F83DBD43;
	Tue, 16 Jun 2026 06:28:53 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4816B3DB33C
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 06:28:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591333; cv=none; b=EJl3ssMjavGM5gfaAoc5Wze/j3NrfeqOlpI9EbMw3V0pmgh9Hz6j/A+1oZM+MtupZkCHZnEM1yGin8ptZRILUHrrnBz4iCv7OWLZzkuviFfHNYe0QLALvtfiRmcj44olUFu93u5hw+b3BYki36I9cbPoPjmfDHu+frBe6+xMLa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591333; c=relaxed/simple;
	bh=u7xDC0swnatPKTgn6ex4GcA4dvl1kPdMYyASNlMe2bc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qfpUSR7We8riEOA4efYRixLAr7UL6yGnn73XxgGNI46LqN2oTeElh9WgdWVb21GljXb7ZZrSVL5kqfp5WKuVuAkf8J8k37sEnfZCsr9i2GG3CIcFdGOX6Vfvld4FAWhywWa4rbjwKN73dbPBtZCzri+YuNUMx6omaypr0Rr+bag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=K1oemrk4; arc=none smtp.client-ip=209.85.215.181
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c85893bce34so1727172a12.1
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Jun 2026 23:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781591331; x=1782196131; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0otWC+MgUJwYmo1tOj7SD3LRYNlRGR240ZBbyZkfoGk=;
        b=K1oemrk4ZryYth/EwhhuQ9ijZXGpb4bSRKh3EJtWGxXszKsUZ/G4RFxfGs3f4tS7VH
         rEQQkPrpx6xpI2Kg5YUWftbwArxkGhQZkbrB899rgv/uNQtamDc4PkHrFh5t+jrV9gH9
         GcM8NCQbPJAkGj8A4C6iBG8hBOAvDcZwI6eQ2aurRPR28erdnTXv1v8GGpKGKx6Yc/LD
         MUeeKEH+pauAGoyD0xwfmu4OaEnSURhJqcp5rsfA11JU9so6IwpzrMVt0EvKoPEuuWFK
         AsNnalNCcCo87S2hOQz7ps/yvPheaF4bhNftTpJJ19q8CvnObtYnUhVhjkbO7h62kjK+
         GLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781591331; x=1782196131;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0otWC+MgUJwYmo1tOj7SD3LRYNlRGR240ZBbyZkfoGk=;
        b=k6BV6KL5swD4OsAPoIa+SB3gHS96tgdlP1fd+oAUBaOwcaN8VJdHmea8B4Lnyy8eW7
         wG4vgw9jTWCgOquJQazKWu510LnsicTSQQJhASwuYsife650qWc2KPvpdUfYjBEYRByM
         0/1xGH+NKPnZLmVOALdc7JKw7FCOkFu7134/1b1xjzEqjadsBD80mnSUwVhBDCr1pdHv
         o5ufzv5A+7dTEG9HzpqHe/X7fo9IIqoSIhLvHwu5DbCgpGvLRnaREEEHzlv3hLdvya5A
         8kKMtDaBKOw6KY2Aqglu7bJVvy0LQUHMYlWuz79q8+RiWTxOFOyLaMvMhsfeOdYjjZVZ
         s3EQ==
X-Forwarded-Encrypted: i=1; AFNElJ/EG1w5CahidXfzb8NVZJEsTJ/QEYCZ7xvfLLgXO6i6iy3pb1QwI5zBH0rEECGBC5ZnoRHIr8o3vw5Sbh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS3fJGjXm7fSNPZLn9MSbbZmkcVL8/T/2t66cWWytXxtsAVC4H
	hvlaztjPDUpn0GLx1C1GimmI4u+cbRISpuTl4BcqaEkC1tewGUPZY5BnlrUYdw1LTyo=
X-Gm-Gg: Acq92OE3Kd+YKoRVUR/kQt9GDhMqFFPlA+7nhOlBPP+0+7k6Z+q2UQkt2Y1UmzNsiXk
	jTLWSWSMv9wkBLNBG975aqSkXTomlyiQqI7t+LBM1s3x0DIleyXswQAFg8vio+cykd2m4MC3cl2
	y46Mar5qhxGzsy8ZpAOVu5ckNJzToBKYrE+mHqhMq4tHyUw20N+S/7uz0WGGuiW3SHPfglUI+1M
	LmER/xB0ArXTata6l6d/PNAZTeIG+lmlVTY6exfJXvJLNM1rr7CNoZm/AI1JLIDKlr1V0MdQ0YM
	eTzdmuduEJE32Ky3jBN6K0KnSfbQEtWrpnFJFs1fh0v0enaIrsLM4SqFBY7jXPG5TqSVvt9cIJp
	Bttj/5O41SQWCpOkwJFVjZaCr1zB0dOKBfxE5/9GK/OFAw/7AuqRCqg4hkfnpgsnRJ4snfWtDW5
	Tz8Ax5eUTtynlAjbkQOwDO/8fezt2O95+CmodEquBCZ3F7YdaiJVwr9H+C
X-Received: by 2002:a05:6a20:9f48:b0:3b2:86e8:a817 with SMTP id adf61e73a8af0-3b796409353mr15915671637.31.1781591331546;
        Mon, 15 Jun 2026 23:28:51 -0700 (PDT)
Received: from localhost (d206-116-244-52.bchsia.telus.net. [206.116.244.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651aef27sm10560415a12.30.2026.06.15.23.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 23:28:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 02:28:50 -0400
Message-Id: <DJA9F2G6KYZ5.2RSSND5UY6YKW@etsalapatis.com>
Cc: "Alan Maguire" <alan.maguire@oracle.com>, "Jiri Olsa"
 <jolsa@kernel.org>, <bpf@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 01/14] tools/bpf: Sync btf_ids.h to tools
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alexei Starovoitov"
 <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-2-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-2-ihor.solodrai@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[etsalapatis-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[etsalapatis.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,iogearbox.net,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13754-lists,linux-kbuild=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[emil@etsalapatis.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[etsalapatis-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,etsalapatis-com.20251104.gappssmtp.com:dkim,vger.kernel.org:from_smtp,linux.dev:email,etsalapatis.com:email,etsalapatis.com:mid,etsalapatis.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D36A68C82C

On Mon Jun 1, 2026 at 6:17 PM EDT, Ihor Solodrai wrote:
> Sync tools/include/linux/btf_ids.h with include/linux/btf_ids.h so
> tools-side code can use BTF_ID_FLAGS(), BTF_SET8_START(), and
> BTF_KFUNCS_START().
>
> Keep the tools copy's existing compiler header dependency:
> tools/include/linux/compiler.h already provides __maybe_unused and
> tools/include/linux/compiler_attributes.h does not exist.
>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  tools/include/linux/btf_ids.h | 78 ++++++++++++++++++++++++++++++++---
>  1 file changed, 73 insertions(+), 5 deletions(-)
>
> diff --git a/tools/include/linux/btf_ids.h b/tools/include/linux/btf_ids.=
h
> index 72ea363d434d..4fe5c5f1558c 100644
> --- a/tools/include/linux/btf_ids.h
> +++ b/tools/include/linux/btf_ids.h
> @@ -10,6 +10,9 @@ struct btf_id_set {
>  	u32 ids[];
>  };
> =20
> +/* This flag implies BTF_SET8 holds kfunc(s) */
> +#define BTF_SET8_KFUNCS		(1 << 0)
> +
>  struct btf_id_set8 {
>  	u32 cnt;
>  	u32 flags;
> @@ -22,6 +25,7 @@ struct btf_id_set8 {
>  #ifdef CONFIG_DEBUG_INFO_BTF
> =20
>  #include <linux/compiler.h> /* for __PASTE */
> +#include <linux/stringify.h>
> =20
>  /*
>   * Following macros help to define lists of BTF IDs placed
> @@ -35,7 +39,7 @@ struct btf_id_set8 {
> =20
>  #define BTF_IDS_SECTION ".BTF_ids"
> =20
> -#define ____BTF_ID(symbol)				\
> +#define ____BTF_ID(symbol, word)			\
>  asm(							\
>  ".pushsection " BTF_IDS_SECTION ",\"a\";       \n"	\
>  ".local " #symbol " ;                          \n"	\
> @@ -43,10 +47,11 @@ asm(							\
>  ".size  " #symbol ", 4;                        \n"	\
>  #symbol ":                                     \n"	\
>  ".zero 4                                       \n"	\
> +word							\
>  ".popsection;                                  \n");
> =20
> -#define __BTF_ID(symbol) \
> -	____BTF_ID(symbol)
> +#define __BTF_ID(symbol, word) \
> +	____BTF_ID(symbol, word)
> =20
>  #define __ID(prefix) \
>  	__PASTE(__PASTE(prefix, __COUNTER__), __LINE__)
> @@ -56,7 +61,14 @@ asm(							\
>   * to 4 zero bytes.
>   */
>  #define BTF_ID(prefix, name) \
> -	__BTF_ID(__ID(__BTF_ID__##prefix##__##name##__))
> +	__BTF_ID(__ID(__BTF_ID__##prefix##__##name##__), "")
> +
> +#define ____BTF_ID_FLAGS(prefix, name, flags) \
> +	__BTF_ID(__ID(__BTF_ID__##prefix##__##name##__), ".long " #flags "\n")
> +#define __BTF_ID_FLAGS(prefix, name, flags, ...) \
> +	____BTF_ID_FLAGS(prefix, name, flags)
> +#define BTF_ID_FLAGS(prefix, name, ...) \
> +	__BTF_ID_FLAGS(prefix, name, ##__VA_ARGS__, 0)
> =20
>  /*
>   * The BTF_ID_LIST macro defines pure (unsorted) list
> @@ -155,10 +167,58 @@ asm(							\
>  ".popsection;                                 \n");	\
>  extern struct btf_id_set name;
> =20
> +/*
> + * The BTF_SET8_START/END macros pair defines sorted list of
> + * BTF IDs and their flags plus its members count, with the
> + * following layout:
> + *
> + * BTF_SET8_START(list)
> + * BTF_ID_FLAGS(type1, name1, flags)
> + * BTF_ID_FLAGS(type2, name2, flags)
> + * BTF_SET8_END(list)
> + *
> + * __BTF_ID__set8__list:
> + * .zero 8
> + * list:
> + * __BTF_ID__type1__name1__3:
> + * .zero 4
> + * .word (1 << 0) | (1 << 2)
> + * __BTF_ID__type2__name2__5:
> + * .zero 4
> + * .word (1 << 3) | (1 << 1) | (1 << 2)
> + *
> + */
> +#define __BTF_SET8_START(name, scope, flags)		\
> +__BTF_ID_LIST(name, local)				\
> +asm(							\
> +".pushsection " BTF_IDS_SECTION ",\"a\";       \n"	\
> +"." #scope " __BTF_ID__set8__" #name ";        \n"	\
> +"__BTF_ID__set8__" #name ":;                   \n"	\
> +".zero 4                                       \n"	\
> +".long " __stringify(flags)                   "\n"	\
> +".popsection;                                  \n");
> +
> +#define BTF_SET8_START(name)				\
> +__BTF_SET8_START(name, local, 0)
> +
> +#define BTF_SET8_END(name)				\
> +asm(							\
> +".pushsection " BTF_IDS_SECTION ",\"a\";      \n"	\
> +".size __BTF_ID__set8__" #name ", .-" #name "  \n"	\
> +".popsection;                                 \n");	\
> +extern struct btf_id_set8 name;
> +
> +#define BTF_KFUNCS_START(name)				\
> +__BTF_SET8_START(name, local, BTF_SET8_KFUNCS)
> +
> +#define BTF_KFUNCS_END(name)				\
> +BTF_SET8_END(name)
> +
>  #else
> =20
> -#define BTF_ID_LIST(name) static u32 __maybe_unused name[5];
> +#define BTF_ID_LIST(name) static u32 __maybe_unused name[128];
>  #define BTF_ID(prefix, name)
> +#define BTF_ID_FLAGS(prefix, name, ...)
>  #define BTF_ID_UNUSED
>  #define BTF_ID_LIST_GLOBAL(name, n) u32 __maybe_unused name[n];
>  #define BTF_ID_LIST_SINGLE(name, prefix, typename) static u32 __maybe_un=
used name[1];
> @@ -166,6 +226,10 @@ extern struct btf_id_set name;
>  #define BTF_SET_START(name) static struct btf_id_set __maybe_unused name=
 =3D { 0 };
>  #define BTF_SET_START_GLOBAL(name) static struct btf_id_set __maybe_unus=
ed name =3D { 0 };
>  #define BTF_SET_END(name)
> +#define BTF_SET8_START(name) static struct btf_id_set8 __maybe_unused na=
me =3D { 0 };
> +#define BTF_SET8_END(name)
> +#define BTF_KFUNCS_START(name) static struct btf_id_set8 __maybe_unused =
name =3D { .flags =3D BTF_SET8_KFUNCS };
> +#define BTF_KFUNCS_END(name)
> =20
>  #endif /* CONFIG_DEBUG_INFO_BTF */
> =20
> @@ -215,5 +279,9 @@ MAX_BTF_TRACING_TYPE,
>  };
> =20
>  extern u32 btf_tracing_ids[];
> +extern u32 bpf_cgroup_btf_id[];
> +extern u32 bpf_local_storage_map_btf_id[];
> +extern u32 btf_bpf_map_id[];
> +extern u32 bpf_kmem_cache_btf_id[];
> =20
>  #endif


