Return-Path: <linux-kbuild+bounces-10073-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF629CB8119
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Dec 2025 08:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E564300ADB0
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Dec 2025 07:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34CB2D0C84;
	Fri, 12 Dec 2025 07:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ubz2INzF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2C92773F4
	for <linux-kbuild@vger.kernel.org>; Fri, 12 Dec 2025 07:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765523371; cv=none; b=LnScLhJKCdonTZej7Q47bHu3tZJlAMjznO5FmLb181wuuGVMjSQp3q4HYZZYf+nhPSnxZjBh61AlBK3f4Y4eJPajeOIK40M3hGGli/JiYjlY/6mWaAaAM87I8n67u0Apk2QbGZiWGODXOOzoFIg8Vgyzz4KMvslSwpW/bJhOGWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765523371; c=relaxed/simple;
	bh=rcFIJSID1VDJnjvbTDVTD6FbXH4CfZBKvwp6ewb69eI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wq/iFXmLESDbJfh1aoLIUpKLDvjaZ0h13kpmuEVXDh6cq7IVWP+Bp50SwKVjgOB+/J2eVdyEbAcBy94rZRbRHl7zdHIoRPr1VXbLT31OkTxmIZ0orcsw/GOUh68zUN3moNeujekYdJ9ZHyoiYOoCBJSenNjJlAwuTeNL/GnFb5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ubz2INzF; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2956d816c10so11132755ad.1
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Dec 2025 23:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765523369; x=1766128169; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=taRaJ5VlWHSJuUogRunxbYADYYPRbeksELcn5Rh5qyI=;
        b=Ubz2INzFYWzJluuIuAe6UXjiqDjUq7/PsZsMLuX40oyGYZwEhENyjbAz3EnZN07AmD
         t60BW5maS5asuN1Pj9yjR4PY6Z7Z+RK4hhB0KmUwQOirC03p04HojfaYdwaND/Cyc+kl
         jKqzBanw94QMeYUW+GdqePZsZf9IsSQyL4T0BGOiWNrzQnFYgETncM8BzXkVaheTROKF
         KEIEaCmjmJGd7JJb22kLnkBbZjLBp12rzi/yKTJIFjfKtvkcy42gvz7pSh676SFmKpDw
         ZVuUbDZlJ04Z0atZD0GV9X8wlEwOHwkXjUF0FHqAbVeeYl/zuNrR4EQiiWAHUkX3igSB
         NoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765523369; x=1766128169;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=taRaJ5VlWHSJuUogRunxbYADYYPRbeksELcn5Rh5qyI=;
        b=oiKeaoiUcE4FZcz1r5sh1fKz4/JePgfAp6TLlndWuF4HQiZ6CUrwuy75YOCLIVMR+z
         +O7qTpCo5r/tIG7dblnlTwdhsrQbRG63g3ly9h0U7G+gxIgkdYJ1mbAdhQUv4Ictz225
         /7aCU2Csuabkkl20BNDvDW3cf8ASFYjZdhWYZ/wHgYSk+w1R+zB8FfQzRyNUmysCMZ93
         KbdTT89WKgk/oNhVuODMA2h02dYyZAQexG2eXKDrVwU23sIpAtbI/EeZPpN9nKxEYCEg
         OujVj8Ypa/DLIobcSjCqwf1g6IxE8sLUACSAg2n2pplUouqgKF2ElJlV2QqfzAUNrGxO
         4h2w==
X-Forwarded-Encrypted: i=1; AJvYcCU32thL6WrFfvc/VMQc5FxbD3ZxE04u8rJbuksEYMKinlUEEcujbO3h9PG8ZxJoJR/oc2RNPAiV+FshF/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW4EQ+co+8iAFKP4HpEDt9Am+P7t6VHlckEn0oJkqmIjfEzfho
	ymQuqAlPn5sDBZWYZFxUQxi9ygeYEpf2ukGuWyUtWZbkaF7dtmIPow3V
X-Gm-Gg: AY/fxX5bZu8mX/ZK3l8gVY1th6UuENjtgge1r4B9lBHCXKJ8rIHz+CeCHGoimMD6ZDA
	ADiRjrkazj8ic2MhK/bIqXF/dQ1MUNVqgBQQXPUobkW5emcpVEe4WOMTxeXU2H7STVpmEC/8xN1
	qV5ToaD+WDM4jM9VFx1DwqHoXSPy64Ax24mTA/KKoebhdD13f1rJ5Y+Uc93FNDVmp2yNJ7NNAOt
	RRA0L1n31D+FujyCV6uKtUpxJfsp4gkWbkO/EZWsnY/iWxJvwfQKUJt4FyCndW0cK5gXW7orBu0
	qhBbicdNgNZYZJgjVkaMGPQAiC+5JBmS+XDQ7+d0+tgxRGV3IwrJjD9upcScMU7Lra9iCd++AeJ
	rTIX5DEOXMCtLl2xzj4tDnusdF8Gd2Cw9+jR8qyF/3Or+EE8TJaN+1XMksxu8b9+uewW6y/qxYR
	kgsAVtOg9YLiGaVo2crS79WXZzovSdOv12al4h0HaiVQk=
X-Google-Smtp-Source: AGHT+IFofls55I9SmzDD+JUpzLkrd9iqjAHtwopQZ9d48ulj+lsYXpWt5ararv/5zaraLa80YwAWHQ==
X-Received: by 2002:a17:903:46c6:b0:29d:9b3c:4fc8 with SMTP id d9443c01a7336-29f23d40decmr12993205ad.61.1765523368880;
        Thu, 11 Dec 2025 23:09:28 -0800 (PST)
Received: from [10.200.2.32] (fs98a57d9c.tkyc007.ap.nuro.jp. [152.165.125.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b37356sm43756675ad.2.2025.12.11.23.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 23:09:28 -0800 (PST)
Message-ID: <386068b11e146a9dbb502f770d7e012e3dea950f.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 3/6] resolve_btfids: Introduce enum
 btf_id_kind
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,  Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend	
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev	 <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier	 <nsc@kernel.org>, Tejun Heo
 <tj@kernel.org>, David Vernet <void@manifault.com>,  Andrea Righi
 <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, Shuah Khan
 <shuah@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt	 <justinstitt@google.com>,
 Alan Maguire <alan.maguire@oracle.com>, Donglin Peng	
 <dolinux.peng@gmail.com>
Cc: bpf@vger.kernel.org, dwarves@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-kbuild@vger.kernel.org
Date: Fri, 12 Dec 2025 16:09:21 +0900
In-Reply-To: <20251205223046.4155870-4-ihor.solodrai@linux.dev>
References: <20251205223046.4155870-1-ihor.solodrai@linux.dev>
		 <20251205223046.4155870-4-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-12-05 at 14:30 -0800, Ihor Solodrai wrote:
> Instead of using multiple flags, make struct btf_id tagged with an
> enum value indicating its kind in the context of resolve_btfids.
>=20
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

(But see a question below).

> @@ -213,14 +218,19 @@ btf_id__add(struct rb_root *root, char *name, bool =
unique)
>  			p =3D &(*p)->rb_left;
>  		else if (cmp > 0)
>  			p =3D &(*p)->rb_right;
> -		else
> -			return unique ? NULL : id;
> +		else if (kind =3D=3D BTF_ID_KIND_SYM && id->kind =3D=3D BTF_ID_KIND_SY=
M)

Nit: I'd keep the 'unique' parameter alongside 'kind' and resolve this
     condition on the function callsite.

> +			return id;
> +		else {
> +			pr_err("Unexpected duplicate symbol %s of kind %d\n", name, id->kind)=
;
> +			return NULL;
> +		}

[...]

> @@ -491,28 +515,24 @@ static int symbols_collect(struct object *obj)
>  			id =3D add_symbol(&obj->funcs, prefix, sizeof(BTF_FUNC) - 1);
>  		/* set8 */
>  		} else if (!strncmp(prefix, BTF_SET8, sizeof(BTF_SET8) - 1)) {
> -			id =3D add_set(obj, prefix, true);
> +			id =3D add_set(obj, prefix, BTF_ID_KIND_SET8);
>  			/*
>  			 * SET8 objects store list's count, which is encoded
>  			 * in symbol's size, together with 'cnt' field hence
>  			 * that - 1.
>  			 */
> -			if (id) {
> +			if (id)
>  				id->cnt =3D sym.st_size / sizeof(uint64_t) - 1;
> -				id->is_set8 =3D true;
> -			}
>  		/* set */
>  		} else if (!strncmp(prefix, BTF_SET, sizeof(BTF_SET) - 1)) {
> -			id =3D add_set(obj, prefix, false);
> +			id =3D add_set(obj, prefix, BTF_ID_KIND_SET);
>  			/*
>  			 * SET objects store list's count, which is encoded
>  			 * in symbol's size, together with 'cnt' field hence
>  			 * that - 1.
>  			 */
> -			if (id) {
> +			if (id)

Current patch is not a culprit, but shouldn't resolve_btfids fail if
`id` cannot be added? (here and in a hunk above).

>  				id->cnt =3D sym.st_size / sizeof(int) - 1;
> -				id->is_set =3D true;
> -			}
>  		} else {
>  			pr_err("FAILED unsupported prefix %s\n", prefix);
>  			return -1;

[...]


