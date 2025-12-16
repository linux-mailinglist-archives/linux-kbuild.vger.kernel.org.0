Return-Path: <linux-kbuild+bounces-10107-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 126E6CC09DF
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Dec 2025 03:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0B15301E159
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Dec 2025 02:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114582E2846;
	Tue, 16 Dec 2025 02:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KI60THRW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D21223323
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Dec 2025 02:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765852739; cv=none; b=P2KnHmpJQtFbtFz4qps+5ZRSaZ1r493qXY6SqFwGuOVp5Y9zjcPTigApP1Sxiq4t9Yl1j++myc9LE/acpLeb2VbIqVGUvUa+ofxtyK+GysmaGzfVff0neqAH625YPbU4gdNbT6cicJp40X/Yzem+US/MYaj3WtQcFGpDaenfuRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765852739; c=relaxed/simple;
	bh=CRqvv3fNFlF/pMhl/fYHATl3VT03MbTVoZsGl5GO+QA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HkfOdjnxigazn5/rszuB6GFt45VaG4WkynK2NboJwPPtlt+FnnZ8VxQ5kq6b9VwkvQ9D05y7E6MaLhLxkINQaIwHGv7K8pSA+4UrERGnMFYBBnyqrFUSVizb1ntSlcbzVcy/3OuKxnYvgXDMaI7x1QhM/tmbdfhb9NFL+UZcKpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KI60THRW; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7bb3092e4d7so4403604b3a.0
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Dec 2025 18:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765852736; x=1766457536; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PFYZGHPIDqEcscjEAD6wlaUMrMUa0OQ70xZuQLsYAvQ=;
        b=KI60THRWvUfwjZyfazfiOG3enHDWoYijAokjxAqVpx4IL7nsdSmsqS/mxGYpC89QkG
         WXOZ8jTxlOhxLYQwAd6JGB1RKV2lEienrcMv2dX0ht65qsRhrXtPB9samXUejzxBwczh
         HrFDux3KXLJi27iZPYh+6+JelljLCzz1/QCogkkfXlu7N9+DrfkewbjSclTi1XeaH3kL
         LrSIeDPH8YV/rArcldbF01ZPnwniCLf8W+xo10wAi3M4UzWa/jy5IgezhxUMP6giddIN
         3S2biSdvx0n97qmxWa/oVHxocGg1le8OhrMNO7u/CCyHzWvMncXCIaElFvkuMIo5YvsM
         vWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765852736; x=1766457536;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PFYZGHPIDqEcscjEAD6wlaUMrMUa0OQ70xZuQLsYAvQ=;
        b=QYGuzmZ4qniguII0qGXn+hM1Ni3p1OxOCHK217tnN7qnfJufy++B/t7BQDomiIUK3L
         1XSX5efxg7/R/MX1Oo8+Q8pP4gLI7j/e6KXuXK8ubNpvZhOFSIg81GUDx+FGuMnG9tAt
         QZDr5CZNRInhYfkA2HzPAGKzPBriBoi/tVBnaKALp21AKMPnZhI8hA30b/dJIql6Niwr
         8BfQffNYFRc1aptV3ng4x1lASTrY9a6a9GtTvLPvm1iB1ueUhedOf0R44Znk72Mec4G2
         OAOigQGzM5+E/Cftxcsv/7xvbubhy3r7zicnDxoESoZEn/JuqvalK8EBAxwuRzDJhT1K
         DcMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq7i+3i28uN8+5wE689kR0lISsAxinrmiFbWLReBNtlvw8ULM6C5DM1sq1zR3FmZxVycZNVN7lPEwn/lw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7vlUDg/9ellbKIbXDPST/ubj8HgxHzYTVqqz7rJbvbTF68eFa
	AOYBVIqilQ6HGPf2jCDh2CEafpcmegmCyapTpeXWL9p5zPoJfBOQFHBN
X-Gm-Gg: AY/fxX4WxWWYWd8Y2tIHyaGwr2Gi6UWhEYR/kbmTznC9u09VczeGYCFhe6YcY9XXp/B
	Gn6/lNR0YbQCfWreb2UeucZgC2RqlGdeA0AD053+JnZmCSCkCPvYMMACFZfu56Nn392iavNBdPT
	OB02LClDz4ZR0kJTGym6H1K/2DvKhJLMQf1x6QGYSzRVbibh0bj/IbYgFHh4A4t9ACxci0kwZ98
	4uhs71PqMy6GGNqxVoOEbUk/UCzzuxHpvLjutmyh29eB1pAZ36sM8rqD0U9hBWVg/YAOO+temJY
	/zk2lWw0yAfTjGOvnX/fTwMSxKhpGHsA7iTnM/1Dk7efvI3Eu/vDrF+K70rYad1PubQmSGSkiqB
	SmNQE+O51i8Ghy3+0lC8eR9yQbpOts8iFpXDBb9VQVUqnowPpV6YFj5imjiuRDXfXg4dc9gQfuc
	HkgO6b1K2Y
X-Google-Smtp-Source: AGHT+IHEIg3J+lGR4aNsRmfuVPwq4rJAZ56la77XOJ3WlFamSh1GHnswzh6XaH/onObOFEP5iTw7DA==
X-Received: by 2002:a05:6a20:3d05:b0:35d:8881:e6a4 with SMTP id adf61e73a8af0-369b4c32d75mr12649177637.25.1765852736157;
        Mon, 15 Dec 2025 18:38:56 -0800 (PST)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c11d3e8af1asm8153533a12.2.2025.12.15.18.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 18:38:55 -0800 (PST)
Message-ID: <b37bbff7486f47404872017faecba43833116d61.camel@gmail.com>
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
Date: Mon, 15 Dec 2025 18:38:52 -0800
In-Reply-To: <c857acb9-977a-49ca-a03f-ef3fd68fabae@linux.dev>
References: <20251205223046.4155870-1-ihor.solodrai@linux.dev>
	 <20251205223046.4155870-4-ihor.solodrai@linux.dev>
	 <386068b11e146a9dbb502f770d7e012e3dea950f.camel@gmail.com>
	 <c857acb9-977a-49ca-a03f-ef3fd68fabae@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-12-15 at 18:31 -0800, Ihor Solodrai wrote:
> On 12/11/25 11:09 PM, Eduard Zingerman wrote:
> > On Fri, 2025-12-05 at 14:30 -0800, Ihor Solodrai wrote:
> > > Instead of using multiple flags, make struct btf_id tagged with an
> > > enum value indicating its kind in the context of resolve_btfids.
> > >=20
> > > Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> > > ---
> >=20
> > Acked-by: Eduard Zingerman <eddyz87@gmail.com>
> >=20
> > (But see a question below).
> >=20
> > > @@ -213,14 +218,19 @@ btf_id__add(struct rb_root *root, char *name, b=
ool unique)
> > >  			p =3D &(*p)->rb_left;
> > >  		else if (cmp > 0)
> > >  			p =3D &(*p)->rb_right;
> > > -		else
> > > -			return unique ? NULL : id;
> > > +		else if (kind =3D=3D BTF_ID_KIND_SYM && id->kind =3D=3D BTF_ID_KIN=
D_SYM)
> >=20
> > Nit: I'd keep the 'unique' parameter alongside 'kind' and resolve this
> >      condition on the function callsite.
>=20
> I don't like the boolean args, they're always opaque on the callsite.
>=20
> We want to allow duplicates for _KIND_SYM and forbid for other kinds.
> Since we are passing the kind from outside, I think it makes sense to
> check for this inside the function. It makes the usage simpler.

On the contrary, the callsite knows exactly what it wants:
unique or non-unique entries. Here you need additional logic
to figure out the intent.

Arguably the uniqueness is associated not with entry type,
but with a particular tree the entry is added to.
And that is a property of the callsite.

> > > +			return id;
> > > +		else {
> > > +			pr_err("Unexpected duplicate symbol %s of kind %d\n", name, id->k=
ind);
> > > +			return NULL;
> > > +		}
> >=20
> > [...]
> >=20
> > > @@ -491,28 +515,24 @@ static int symbols_collect(struct object *obj)
> > >  			id =3D add_symbol(&obj->funcs, prefix, sizeof(BTF_FUNC) - 1);
> > >  		/* set8 */
> > >  		} else if (!strncmp(prefix, BTF_SET8, sizeof(BTF_SET8) - 1)) {
> > > -			id =3D add_set(obj, prefix, true);
> > > +			id =3D add_set(obj, prefix, BTF_ID_KIND_SET8);
> > >  			/*
> > >  			 * SET8 objects store list's count, which is encoded
> > >  			 * in symbol's size, together with 'cnt' field hence
> > >  			 * that - 1.
> > >  			 */
> > > -			if (id) {
> > > +			if (id)
> > >  				id->cnt =3D sym.st_size / sizeof(uint64_t) - 1;
> > > -				id->is_set8 =3D true;
> > > -			}
> > >  		/* set */
> > >  		} else if (!strncmp(prefix, BTF_SET, sizeof(BTF_SET) - 1)) {
> > > -			id =3D add_set(obj, prefix, false);
> > > +			id =3D add_set(obj, prefix, BTF_ID_KIND_SET);
> > >  			/*
> > >  			 * SET objects store list's count, which is encoded
> > >  			 * in symbol's size, together with 'cnt' field hence
> > >  			 * that - 1.
> > >  			 */
> > > -			if (id) {
> > > +			if (id)
> >=20
> > Current patch is not a culprit, but shouldn't resolve_btfids fail if
> > `id` cannot be added? (here and in a hunk above).
>=20
> By the existing design, resolve_btfids generally fails if
> CONFIG_WERROR is set and `warnings > 0`.
>=20
> And in this particular place it would fails with -ENOMEM a bit below:
>=20
>        [...]
> 		} else if (!strncmp(prefix, BTF_SET, sizeof(BTF_SET) - 1)) {
> 			id =3D add_set(obj, prefix, BTF_ID_KIND_SET);
> 			/*
> 			 * SET objects store list's count, which is encoded
> 			 * in symbol's size, together with 'cnt' field hence
> 			 * that - 1.
> 			 */
> 			if (id)
> 				id->cnt =3D sym.st_size / sizeof(int) - 1;
> 		} else {
> 			pr_err("FAILED unsupported prefix %s\n", prefix);
> 			return -1;
> 		}
>=20
>   /* --> */	if (!id)
> 			return -ENOMEM;
>=20
> So I think an error code change may be appropriate, and that's about it.

Oh, ok, sorry, didn't notice that.

>=20
> >=20
> > >  				id->cnt =3D sym.st_size / sizeof(int) - 1;
> > > -				id->is_set =3D true;
> > > -			}
> > >  		} else {
> > >  			pr_err("FAILED unsupported prefix %s\n", prefix);
> > >  			return -1;
> >=20
> > [...]
> >=20

