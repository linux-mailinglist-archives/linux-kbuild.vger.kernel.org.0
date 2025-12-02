Return-Path: <linux-kbuild+bounces-9945-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D035DC9CB8D
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Dec 2025 20:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C48A64E3E1B
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Dec 2025 19:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C062D47F3;
	Tue,  2 Dec 2025 19:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eaVg1VHa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6502D3732;
	Tue,  2 Dec 2025 19:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764702528; cv=none; b=ouUHZnE92/8tyaWTM7+JaHxZ5I2+1y44aOluIlIo2ovqIrYxo8Cb9RM9EfpxJKWR0UdJXWDmhpDWq+2fH4Cl1CuO0ic+kZnAJfCeTPXclXL0CM+smywlB3WYzuxFIcSJzG5gRMe1r89mROsp8aqmb9RkNgfJHjbfm+oftjFdfOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764702528; c=relaxed/simple;
	bh=ar4ZMYmNGGuktek8mF2bDDERYiPWFCukyWLOPoUcc/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KTU8f4WTMy6eSDzNVcqiUkejOPCyxezAF29nc4uaSKcpryhBwDYxHBNz8VLxsmPFITq6CLy8nI2MfdVLDyzKlhM0Ah/Uq9KHlkFaZt53ATnmhQ0Gy0OVknObjJKXTQdGMrYXh1H/+qayMzSbH5IkMSo5Lo3Jc4skGATQETg92wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eaVg1VHa; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <3f60cb6e-a36c-44b3-b80a-3a99d013e0a3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764702513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1O5gtbVuRm3/hxxP89eo2s5fhbmgYhtby5Tb7ixZAA4=;
	b=eaVg1VHa4BVWlcLJTpk2jb8rdrvYCaZF604wbC5ETx1RKCpQTHzqPoo5GHULUXm4CGC+ct
	K9ppVVefV9OVULCWSaZkksAq5/jD/k4rUDEObpwf2FbB/e0x4m/bgvDZGjFoAjVHsWYygI
	kmDgACgmtwOXNc+aJREtZfUIWTE3k7I=
Date: Tue, 2 Dec 2025 11:08:25 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 3/4] resolve_btfids: introduce enum
 btf_id_kind
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Alan Maguire <alan.maguire@oracle.com>, Donglin Peng
 <dolinux.peng@gmail.com>, bpf@vger.kernel.org, dwarves@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20251127185242.3954132-1-ihor.solodrai@linux.dev>
 <20251127185242.3954132-4-ihor.solodrai@linux.dev>
 <CAEf4Bza+L_RL_d7JFFLmzkYj2dbnT8rDgqwCat2zLOekToRm-g@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <CAEf4Bza+L_RL_d7JFFLmzkYj2dbnT8rDgqwCat2zLOekToRm-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 12/1/25 9:27 AM, Andrii Nakryiko wrote:
> On Thu, Nov 27, 2025 at 10:53 AM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:
>>
>> Instead of using multiple flags, make struct btf_id tagged with an
>> enum value indicating its kind in the context of resolve_btfids.
>>
>> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
>> ---
>>  tools/bpf/resolve_btfids/main.c | 62 ++++++++++++++++++++++-----------
>>  1 file changed, 42 insertions(+), 20 deletions(-)
> 
> [...]
> 
>>
>> -static struct btf_id *add_set(struct object *obj, char *name, bool is_set8)
>> +static struct btf_id *add_set(struct object *obj, char *name, enum btf_id_kind kind)
>>  {
>>         /*
>>          * __BTF_ID__set__name
>>          * name =    ^
>>          * id   =         ^
>>          */
>> -       char *id = name + (is_set8 ? sizeof(BTF_SET8 "__") : sizeof(BTF_SET "__")) - 1;
>> +       int prefixlen = kind == BTF_ID_KIND_SET8 ? sizeof(BTF_SET8 "__") : sizeof(BTF_SET "__");
>> +       char *id = name + prefixlen - 1;
>>         int len = strlen(name);
>> +       struct btf_id *btf_id;
>>
>>         if (id >= name + len) {
>>                 pr_err("FAILED to parse set name: %s\n", name);
>>                 return NULL;
>>         }
>>
>> -       return btf_id__add(&obj->sets, id, true);
>> +       btf_id = btf_id__add(&obj->sets, id, true);
>> +       if (btf_id)
>> +               btf_id->kind = kind;
>> +
>> +       return btf_id;
>>  }
>>
>>  static struct btf_id *add_symbol(struct rb_root *root, char *name, size_t size)
>>  {
>> +       struct btf_id *btf_id;
>>         char *id;
>>
>>         id = get_id(name + size);
>> @@ -288,7 +301,11 @@ static struct btf_id *add_symbol(struct rb_root *root, char *name, size_t size)
>>                 return NULL;
>>         }
>>
>> -       return btf_id__add(root, id, false);
>> +       btf_id = btf_id__add(root, id, false);
>> +       if (btf_id)
>> +               btf_id->kind = BTF_ID_KIND_SYM;
> 
> seeing this pattern repeated, wouldn't it make sense to just pass this
> kind to btf_id__add() and set it there?

I like the idea, because we could get rid the "unique" flag then.

But the btf_id__add() does not necessarily create a new struct, and so
if we pass the kind in, what do we do with existing objects?
Overwrite the kind? If not, do we check for a mismatch?

> 
>> +
>> +       return btf_id;
>>  }
>>
> 
> [...]
> 
>> @@ -643,7 +656,7 @@ static int id_patch(struct object *obj, struct btf_id *id)
>>         int i;
>>
>>         /* For set, set8, id->id may be 0 */
>> -       if (!id->id && !id->is_set && !id->is_set8) {
>> +       if (!id->id && id->kind == BTF_ID_KIND_SYM) {
> 
> nit: comment says the exception is specifically for SET and SET8, so I
> think checking for those two instead of for SYM (implying that only
> other possible options are set and set8) would be a bit more
> future-proof?

ok

> 
>>                 pr_err("WARN: resolve_btfids: unresolved symbol %s\n", id->name);
>>                 warnings++;
>>         }
> 
> [...]


