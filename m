Return-Path: <linux-kbuild+bounces-9932-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 46562C98B59
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Dec 2025 19:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 970A23443EA
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 18:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162483385A3;
	Mon,  1 Dec 2025 18:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3P/UOa9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DAC337BBC
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Dec 2025 18:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764613629; cv=none; b=HsgnTfjWlqi8pWzQIsM3WzLOcttWo5JTy1xSCQpo1L700hZ8ic5Xwb9bM3D60TPWwdfwGFlrm5glC69FFhcOZtx/ydkFh6v7mk4n7yO9gtutlPA4enj5lUkTT9xbt3PpA9SXKH+vgV1eQMbZiPNNenI6RHbcnJPyM2i/G4fzqLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764613629; c=relaxed/simple;
	bh=Oqw+12WE701l1f1TwGH2seyHYMxYe+Xqgy5HR8nXULk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kFNF5nDO2J26Flf1Ido2JWzjDL0RzCqGF0S/wXhL7jGkaQDukUYqvYQZ5VLPT7snc/WQmBFHWymOSrPx3+Bz04olmCZgWzI4bauoXDAfIpTmFkiTC/qItiDScSJkfDXXM/aJFmBUi0dmWASwH9hNlxtX4zWQe9qrb+7BnBIjeUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3P/UOa9; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29555b384acso51144375ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Dec 2025 10:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764613626; x=1765218426; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t4LngEGfANLHmsHbH8DGsv2GB/mOjSjrOn98fu7nAbY=;
        b=e3P/UOa9m2m08h8YkOTGquYphKgiyKUDZDc7qo4r5tz625igplogDVeAwkh6at+lp1
         lZRTFeEXt7XtqQa7jzr48B8lVKze2qhplwvkOag+45WYalcbT8mSESaT4u8vQFi4HPnj
         HVLEeuP9tXwCs88wicSJ8sOdflhjul5gNlPjw3W3TgjjKc5JNHIuAMEtciQU5uzdv8G4
         NV699GCM6gbxMq9m7o98ymVYth/cCJ3fmZTrXBGyM+PBW/993eetU2Y3Bueg116hRttM
         2BdCHqAsESraxKUBsF5LQm9ePrD524I5Ti9fNnvOYmtw9EX3qpjp9muBTq3nlR4EenUW
         +ckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764613626; x=1765218426;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t4LngEGfANLHmsHbH8DGsv2GB/mOjSjrOn98fu7nAbY=;
        b=m1c6JZsqwTQslRn3qdXT8O3RI5P8M2XroWZYqx1rF8aYJH6y9FIJBmTnbT3Xy+MnLG
         EZ3EQPnjW6vnGgpRkdxEpORmLogHX9ogY4fstSgomHNzQFwKDU20CHjbGllhMQ73najn
         M0823E2Tl654m94+h6Q4YF3wQUAMH+mOcTB97I5lRiKJ2D3YMKih+R20KyEz3YH+F63n
         43pCCa8nxyjCehQ0mI5vSKXDFAqmQk7lGlobekDUt3ljxLa60yH5pAhsZFqqGPKum8GY
         Vi6xVnYvkODBzsnph7EX9H80/VV9UIgcThRubbr49UikwOteXnB8WbXsagRNPVoOU5Yr
         2lig==
X-Forwarded-Encrypted: i=1; AJvYcCVXW6SVGoIQK19JjhEegFg9cd9GYMA6YWf5vjMiTZDT+lKFXYij58Sxcflg1nExZG4mz0iw4afWiS1Es0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTIFuDYn6qfIypjT+cfZaOWbHnmO2Xy5236ZFf1tN5GJwuAiMq
	EUNmjDtDMUPSxRMzDzxS3y8kNo7hxywgt8k4hUVNe6iFAB4Srwi1CDozsiqt+SqPGjk=
X-Gm-Gg: ASbGncvQwkrut9eDuLiy5xEV8Ds9gM3Hyg8IcroOD0lcQ0wRl1MYGFSAwsyu21JXy6l
	ncFbfuvCYu3aMX2/Zzjnv6copzW5BS3m/BBj5ScnrOMOGFMH0B9A2kfMIh6v8FR10Ghi2lQbQgQ
	PXLbQPqZoF0ZWEzGTckdBd43JiftWJXfff91bQFScsz36yy1c5WBT5skO5Dif2wLHZ6tOos3+pb
	prexiGl8UP3dxSxVDOCNusGu30KUN17xWXq273Bel4Yt5oEfYX0qe00RXVvJ2+ui1PxLZ9yMCvO
	Y4TQgLu8WtrSEDfcVXM2861mippr1If9E/KKmNsRfSnDBD2b5s5tQ3IUlqR/cyLF+G31YbTkldz
	PD79v304hf/b7AvIKVeIBI24i1pIHjoCZ3kx6hbCDJUfcj0HThKrBwPyy2GJwGhT7f68GwXMUVg
	unQDWOfFruqfWB4evbgWfKgQlbpiIsTfRz7sq9
X-Google-Smtp-Source: AGHT+IF9K57qoC5IjEjc4mYogefluYvwG/X7Dku4JGaj8S9XO9T4+dQH/sdyPqluw0Wg/ijbBwX56w==
X-Received: by 2002:a17:902:ebca:b0:295:82b4:216a with SMTP id d9443c01a7336-29b6c6b5911mr397778135ad.55.1764613626171;
        Mon, 01 Dec 2025 10:27:06 -0800 (PST)
Received: from ?IPv6:2a03:83e0:115c:1:a2c1:e629:f1e2:84c8? ([2620:10d:c090:500::6:79eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb29fbbsm128466535ad.49.2025.12.01.10.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 10:27:05 -0800 (PST)
Message-ID: <483e9a808bcc400a80e8c9a752fa0163b2d0dd54.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 3/4] resolve_btfids: introduce enum
 btf_id_kind
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,  Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend	
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev	 <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>,  Nathan Chancellor	 <nathan@kernel.org>, Nicolas Schier
 <nicolas.schier@linux.dev>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt	 <justinstitt@google.com>, Alan Maguire <alan.maguire@oracle.com>,
 Donglin Peng	 <dolinux.peng@gmail.com>
Cc: bpf@vger.kernel.org, dwarves@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-kbuild@vger.kernel.org
Date: Mon, 01 Dec 2025 10:27:02 -0800
In-Reply-To: <20251127185242.3954132-4-ihor.solodrai@linux.dev>
References: <20251127185242.3954132-1-ihor.solodrai@linux.dev>
	 <20251127185242.3954132-4-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-11-27 at 10:52 -0800, Ihor Solodrai wrote:
> Instead of using multiple flags, make struct btf_id tagged with an
> enum value indicating its kind in the context of resolve_btfids.
>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

Just a few nits, looks good to me overall.

>  tools/bpf/resolve_btfids/main.c | 62 ++++++++++++++++++++++-----------
>  1 file changed, 42 insertions(+), 20 deletions(-)
>
> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/m=
ain.c
> index b4caae1170dd..c60d303ca6ed 100644
> --- a/tools/bpf/resolve_btfids/main.c
> +++ b/tools/bpf/resolve_btfids/main.c
> @@ -98,6 +98,13 @@
>  # error "Unknown machine endianness!"
>  #endif
>
> +enum btf_id_kind {
> +	BTF_ID_KIND_NONE,
> +	BTF_ID_KIND_SYM,
> +	BTF_ID_KIND_SET,
> +	BTF_ID_KIND_SET8
> +};
> +
>  struct btf_id {
>  	struct rb_node	 rb_node;
>  	char		*name;
> @@ -105,9 +112,8 @@ struct btf_id {
>  		int	 id;
>  		int	 cnt;
>  	};
> -	int		 addr_cnt;
> -	bool		 is_set;
> -	bool		 is_set8;
> +	enum btf_id_kind kind:8;
> +	int		 addr_cnt:8;
                                 ^^

Nit: these bitfields are not really necessary:

  $ pahole -C btf_id ./tools/bpf/resolve_btfids/resolve_btfids
  struct btf_id {
          struct rb_node             rb_node __attribute__((__aligned__(8))=
); /*     0    24 */
          char *                     name;                 /*    24     8 *=
/
          union {
                  int                id;                   /*    32     4 *=
/
                  int                cnt;                  /*    32     4 *=
/
          };                                               /*    32     4 *=
/
          enum btf_id_kind           kind:8;               /*    36: 0  4 *=
/
          int                        addr_cnt:8;           /*    36: 8  4 *=
/

          /* XXX 16 bits hole, try to pack */

          Elf64_Addr                 addr[100];            /*    40   800 *=
/

          /* size: 840, cachelines: 14, members: 6 */
          /* sum members: 836 */
          /* sum bitfield members: 16 bits, bit holes: 1, sum bit holes: 16=
 bits */
          /* forced alignments: 1 */
          /* last cacheline: 8 bytes */
  } __attribute__((__aligned__(8)));

>  	Elf64_Addr	 addr[ADDR_CNT];
>  };
>
> @@ -260,26 +266,33 @@ static char *get_id(const char *prefix_end)
>  	return id;
>  }
>
> -static struct btf_id *add_set(struct object *obj, char *name, bool is_se=
t8)
> +static struct btf_id *add_set(struct object *obj, char *name, enum btf_i=
d_kind kind)
>  {
>  	/*
>  	 * __BTF_ID__set__name
>  	 * name =3D    ^
>  	 * id   =3D         ^
>  	 */
> -	char *id =3D name + (is_set8 ? sizeof(BTF_SET8 "__") : sizeof(BTF_SET "=
__")) - 1;
> +	int prefixlen =3D kind =3D=3D BTF_ID_KIND_SET8 ? sizeof(BTF_SET8 "__") =
: sizeof(BTF_SET "__");

Nit: Should prefixlen be an input parameter as well? (Or adjust the 'name' =
at the callsite?)
     Otherwise the parameter is still a boolean logically.

> +	char *id =3D name + prefixlen - 1;
>  	int len =3D strlen(name);
> +	struct btf_id *btf_id;
>
>  	if (id >=3D name + len) {
>  		pr_err("FAILED to parse set name: %s\n", name);
>  		return NULL;
>  	}
>
> -	return btf_id__add(&obj->sets, id, true);
> +	btf_id =3D btf_id__add(&obj->sets, id, true);
> +	if (btf_id)
> +		btf_id->kind =3D kind;
> +
> +	return btf_id;
>  }
>
>  static struct btf_id *add_symbol(struct rb_root *root, char *name, size_=
t size)
>  {
> +	struct btf_id *btf_id;
>  	char *id;
>
>  	id =3D get_id(name + size);
> @@ -288,7 +301,11 @@ static struct btf_id *add_symbol(struct rb_root *roo=
t, char *name, size_t size)
>  		return NULL;
>  	}
>
> -	return btf_id__add(root, id, false);
> +	btf_id =3D btf_id__add(root, id, false);
> +	if (btf_id)
> +		btf_id->kind =3D BTF_ID_KIND_SYM;
> +
> +	return btf_id;

Agree with Andrii regarding 'kind' being a btf_id__add() parameter.

>  }
>
>  /* Older libelf.h and glibc elf.h might not yet define the ELF compressi=
on types. */
> @@ -491,28 +508,24 @@ static int symbols_collect(struct object *obj)
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
>  				id->cnt =3D sym.st_size / sizeof(int) - 1;
> -				id->is_set =3D true;
> -			}
>  		} else {
>  			pr_err("FAILED unsupported prefix %s\n", prefix);
>  			return -1;
> @@ -643,7 +656,7 @@ static int id_patch(struct object *obj, struct btf_id=
 *id)
>  	int i;
>
>  	/* For set, set8, id->id may be 0 */
> -	if (!id->id && !id->is_set && !id->is_set8) {
> +	if (!id->id && id->kind =3D=3D BTF_ID_KIND_SYM) {
>  		pr_err("WARN: resolve_btfids: unresolved symbol %s\n", id->name);
>  		warnings++;
>  	}
> @@ -696,6 +709,7 @@ static int sets_patch(struct object *obj)
>  {
>  	Elf_Data *data =3D obj->efile.idlist;
>  	struct rb_node *next;
> +	int cnt;
>
>  	next =3D rb_first(&obj->sets);
>  	while (next) {
> @@ -715,11 +729,15 @@ static int sets_patch(struct object *obj)
>  			return -1;
>  		}
>
> -		if (id->is_set) {
> +		switch (id->kind) {
> +		case BTF_ID_KIND_SET:
>  			set =3D data->d_buf + off;
> +			cnt =3D set->cnt;
>  			qsort(set->ids, set->cnt, sizeof(set->ids[0]), cmp_id);
> -		} else {
> +			break;
> +		case BTF_ID_KIND_SET8:
>  			set8 =3D data->d_buf + off;
> +			cnt =3D set8->cnt;
>  			/*
>  			 * Make sure id is at the beginning of the pairs
>  			 * struct, otherwise the below qsort would not work.
> @@ -744,10 +762,14 @@ static int sets_patch(struct object *obj)
>  						bswap_32(set8->pairs[i].flags);
>  				}
>  			}
> +			break;
> +		case BTF_ID_KIND_SYM:
> +		default:

Nit: just default, no need for `case BTF_ID_KIND_SYM:`?

> +			pr_err("Unexpected btf_id_kind %d for set '%s'\n", id->kind, id->name=
);
> +			return -1;
>  		}
>
> -		pr_debug("sorting  addr %5lu: cnt %6d [%s]\n",
> -			 off, id->is_set ? set->cnt : set8->cnt, id->name);
> +		pr_debug("sorting  addr %5lu: cnt %6d [%s]\n", off, cnt, id->name);
>
>  		next =3D rb_next(next);
>  	}

