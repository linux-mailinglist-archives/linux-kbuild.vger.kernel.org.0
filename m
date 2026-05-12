Return-Path: <linux-kbuild+bounces-13128-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECS0K4IxA2oA1gEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13128-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2026 15:56:18 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1476C521C4A
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2026 15:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 253BE31B9CAA
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2026 13:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6449D3E173C;
	Tue, 12 May 2026 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o+KlQdY7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37583E172A
	for <linux-kbuild@vger.kernel.org>; Tue, 12 May 2026 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590518; cv=pass; b=h5JoogrTixAfjsHPfjOKVdw5R8lUDtk+ZRQyB/8nSVNzLNOL/CLt2LEq226dLcgmIY4R368p7MFGnvEItJnK9hBJ36uGVXrVSoTXdkFBrjjzyahRTgGGZJ7Sn9WZNxrfz4CWVsZJvIdstBWrPh2CHfc4zj47M0IQ41m2SlwziTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590518; c=relaxed/simple;
	bh=k001GOwiMb4dRczjtWUwITXHZjyE/lTx6um46NJkiUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEFGY+IqTGDp4hp36QnNOXB0mfTP0DahfthNUdbwZPOQrSRss5TNlorFGQEh5HaEU+/btXoqj+WkCj5XhgolsPMMXfw4To7SMeQGJdz8PXNVs1zTdxuZOhAL3uv8O+k40wc0wwTPHJ4jQVBiOAV0CMjk+cw6uZsxoWkyYmKWaQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o+KlQdY7; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1334825de43so737627c88.0
        for <linux-kbuild@vger.kernel.org>; Tue, 12 May 2026 05:55:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778590516; cv=none;
        d=google.com; s=arc-20240605;
        b=j3xdkQt4szNwwfZtfY2k+uF/pZG7Sw6Yx7d4qz6aVJy1FWh631bc6uQmFL7hN2DY/5
         ZUxaZuPY5HJ9BYqB2ndpUqF/D6ik+O5JcAMcny+cJBbdyPnbcy9uYlHnj+ZjpFLHpmUW
         BR8ha6eshwxRyoUq5GQZcew3S3eRUI3PVPnGSClb1M6+ihLuS1bkQsXGKfGZN9SkAPCH
         4OFhnCUGRsj+R2aasaPRs6vA7cKrtpH97TYv3riCthlFPXJo4fwJLOVCihLdEtuhQ9om
         sVeWvX4lSRucmWcVot+L/xzesaABdwFfdktMhCY8B0YASnBwiLunn3fu5jfgwqcHu6Bi
         TmtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k001GOwiMb4dRczjtWUwITXHZjyE/lTx6um46NJkiUA=;
        fh=mACr5A5LjqShKMtHYGH8zAweRARVJHJK/EIFa2q/Djs=;
        b=YLE8lskAG6+w/7h2H4JrYhbjJq0stC07ai7nNfH783whmA+EL3IWVCatXG6leR8W22
         kszLFGrwCMVF274IGfLv5KehcUIS3x6z3GRDnioTw3viZD3DQ+k1wTPfS6lWoU7uAFXK
         AoWvh75c5YmkexPrS+khu0QaAF1guIsFP9dCoQDuh8dZYl6eY7l47tnsFj8iaEHq3yE7
         LqLVsGOPNOpTwoAUeZPkJJJKBpsHtykRX42s3jkIsbtZdkp+KgVN6ZGFxNRvh0gVUM98
         l7EEeTqYmXB+L0+yGWeQfrcwQ1skvyTkaSuzRGVMMGpP4wtoyXd6r/cTW67chLTDC/5R
         mLmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778590516; x=1779195316; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k001GOwiMb4dRczjtWUwITXHZjyE/lTx6um46NJkiUA=;
        b=o+KlQdY7IlKaDI47VYq+Z/p5ErFxzXeqQYWFACAM73EmoyN5gyb2udD0P5VnMLUtpS
         EYv0YrVctlm3z+mM/lfy4VDdrd6661m7utczoRmNTheX2J62h95G8J16nfEg5xpmWxNQ
         Hk/IRppCdl8iDFwVbYOfvwtCqUgyYI+nGSr4yXh91FCK/I0nQ/QAuCtPHWa2HuRVLayQ
         IN0YFadSi3WJf1lP1dKbMnGsGh0/3jUfDxNxeAB9Q1ENwEmC7SmgReZmpQ1BZ6ZfWcRU
         WL9DWl+NI0hsx7wKKl6+W9Gz9eSwZm5DgBV7iCWwpS6FFqWDKUPJ8WxeWFaSOzrta+cV
         7E7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778590516; x=1779195316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k001GOwiMb4dRczjtWUwITXHZjyE/lTx6um46NJkiUA=;
        b=bd3vvQTaxsjKB4PqVSyGA9V2jFV12nmoe6jVHzCf5K/Kca9MARAKfZPiLHmW7B2UcT
         F5T04UxIGyA3dPVdHL3VltEtvRQoknU4Ql/fN++7sPTXFYQKwcsPpOlB82U62ZIEiDcG
         H5U8uTsFyY4gZ/VNMscjQe/h/+zXX72Z2P85B+AOzvQRfVEQgqHpgse0OOCSXLIEMqAx
         JjxfHGOEWfjHe6rCoeLtGU4NN8O9ibPuWaXPGNn4HHkpcK0RareU25+4ecJfqOrdG6lD
         91UBKOYg3uYf9IYTasDIKZwEcPntsHZiftykwE/jjbNSZ9NlkySSpbZbwW7ZLYZYfNMC
         O43g==
X-Forwarded-Encrypted: i=1; AFNElJ/DSfNB4zP4GF/aMXj/xcYMvaKWDZ1CJWiuV2Mv76dBrzyfdz5qXeDs2w9HYkJM8J0jp+4AqLmG619cAc0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0lBLomJwxj6JP9cFSB4LhAoAVBbDAuXU78DtxrSH+vJfA0lCn
	nVoO6rzJViEpZSRlJm1Ve4c7q76LEB8bIMg+Npd2yh+6yxS/i9Dj4pW4m7hG3CnCrLXdicIEHai
	vdZoKmcKxSyLtAa2Wsy6SRSR6z2q5NvR6sDEkufv9
X-Gm-Gg: Acq92OEEK+eOFt75v6xVPSOlA6rh89RmewpCFkMu9OcsMpcC4LVG68NeUW9HNDIiUCw
	raX8W6CXA9SjGA7zd3DvllBPOW9uNXrwR7T6kEc/aXxqU8hfzwUsGvl7+Y7tqlA17ZRpyexjgFV
	zGpmD+C+sYpQ2woHMX1Jh56GybAImeamPOVm1V/DRB4KMrx+mSFqYRGrsg4VmlwnKk91e+ElscA
	O623OJJmZJy6TPhnky4s8LmupuNTSG6f8K70E6C4lndUeSjf6doAdiwSUsXiPG9RhBRJumnesqw
	rci2JB3l7jGdl0jC/ZXvEzSgOAUR1+vwzPmgQjfkLWVl
X-Received: by 2002:a05:7022:2529:b0:12a:6a64:81ee with SMTP id
 a92af1059eb24-132a7edc7a5mr7596782c88.3.1778590515386; Tue, 12 May 2026
 05:55:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511200136.3201646-1-elver@google.com> <20260511200136.3201646-2-elver@google.com>
 <afc2202a-2e0b-43e0-9556-06be2da33c83@kernel.org>
In-Reply-To: <afc2202a-2e0b-43e0-9556-06be2da33c83@kernel.org>
From: Marco Elver <elver@google.com>
Date: Tue, 12 May 2026 14:54:38 +0200
X-Gm-Features: AVHnY4JQX5cZZPTvWGLXHBJoCN4agKvIY9SusDXvPP6Ojv3wTK7cyl5mLfOsNmM
Message-ID: <CANpmjNN0-b0TG2=7SsPpRuubwTWYfoAiYgnnM_5-39SoVfv=Pw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] slab: improve KMALLOC_PARTITION_RANDOM randomness
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Bill Wendling <morbo@google.com>, 
	David Hildenbrand <david@kernel.org>, David Rientjes <rientjes@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Jann Horn <jannh@google.com>, 
	Justin Stitt <justinstitt@google.com>, KP Singh <kpsingh@kernel.org>, Kees Cook <kees@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Matteo Rizzo <matteorizzo@google.com>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, linux-hardening@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, Alexander Potapenko <glider@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 1476C521C4A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13128-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,oracle.com,gmail.com,google.com,suse.com,linux.dev,vger.kernel.org,gentwo.org,infradead.org,kvack.org,googlegroups.com,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlegroups.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, 12 May 2026 at 12:37, 'Vlastimil Babka (SUSE)' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
> On 5/11/26 22:00, Marco Elver wrote:
> > When using CONFIG_KMALLOC_PARTITION_RANDOM, _RET_IP_ was previously used
> > to identify the allocation site. _RET_IP_, however, evaluates to the
> > caller's parent's instruction pointer rather than the actual allocation
> > site; this would lead to collisions where a function performs multiple
> > allocations.
> >
> > With the generalization to kmalloc_token_t, we now generate the token at
> > the outermost macro, and using _THIS_IP_ would fix this for all cases.
>
> Hm but it means in patch 1 we make things even worse and then fix them
> again, and also improve what was suboptimal prior to the series.
> Would it be instead possible to reorder patches 1 and 2 so we improve the
> current state first, and then introduce typed partitioning without any
> changes to the randomized one? (aside from changing the previously correcly
> used cases _RET_IP_ to _CODE_LOCATION_).

It won't work (it could be made to work if _THIS_IP_ wasn't broken).
The compiler is supposed to maintain semantics of a static variable in
a function, even inline functions, and refer to the same static
variable -- and because kmalloc_type is an inline function, if
_CODE_LOCATION_ is the non-_THIS_IP_ version, it'd break.

Even if _THIS_IP_ wasn't broken, the other complication is introducing
the slab.c vs. outside use of kmalloc_type differentiation.

Both these problems go away if we make this patch 2 (using
_CODE_LOCATION_ on the outer macro, not in an inline function).

While I understand that maybe we could have considered this as a
stable backport, I think it's borderline; the feature isn't broken
per-se, just slightly lower randomness than perhaps intended if size
is a constant expression. A minimal fix prior to the macro rework
currently eludes me.

