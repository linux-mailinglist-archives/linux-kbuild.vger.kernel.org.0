Return-Path: <linux-kbuild+bounces-13560-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NS1YDRe+IGqk7QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13560-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:51:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B56BA63BECD
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 01:51:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YprLbVfg;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13560-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13560-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 613CC300E72E
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 23:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA854A2E03;
	Wed,  3 Jun 2026 23:48:45 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924562DC334
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Jun 2026 23:48:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780530525; cv=pass; b=t2pYDP6DDrRoT9NGnCsiV/Krj0xXa8otBVB6YJbsnpxKlZ6JGzSXBGJ+IDcspQx4tO02OAKTJtOHUqToKvhJL2k1Uge23wgy3+ztjXR8vcWp7BfUPRzr2mwqQbSt72cI0feAUi5hCDpBWhkJuUj52dTawZ48y5ZX8jpgcqSfut0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780530525; c=relaxed/simple;
	bh=f6Hzh8wLZoswfxk2b8mpTTJKEEdA2RpquJ9Y4az24uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KhFGVsw9pUYCCzrnZl1d7eNjOscntdppBeIGnECuCWRD46BR86YeunGzbng76ox3QI9tmS3HZlqvsX96xiYXg2MqYxIqXKzQPetFpi0hYG9Z7FocMGFGq47VEiuI/v/SbYA1rz92C41OPJvvFz3NeUPNC3BtlrtUWgbHgQaK+xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YprLbVfg; arc=pass smtp.client-ip=209.85.218.54
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-beb8a08a6c8so9588466b.2
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Jun 2026 16:48:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780530523; cv=none;
        d=google.com; s=arc-20240605;
        b=H67n4EPXREJAIWTCL6Gi2s/wUhr54FzxK9h8KuHRwcuYqSMWau4MZnoVx80/kw7Am1
         Fz4BM5KPomB2auY959Tc1Ra5SPqCOhkIZFwlGegmbm5qUDaeU6JCTHyZaq1cuJHyUR9R
         cnsVJg0XdQkXi7Lo3zJy49s9kKHMK67yOX5H9qgUi124tQSUhSm2ltIUDWRKfIQ2aM3i
         niDz6s5Ip3tJMVcz2YKt7AoQzNJJr/z19HmVg3L98dTFtAYJ3/1tLNuzGwpmoce//uOi
         5ycLnFCb87vh1xzN68HGFf2GugP8Z30F4ut1tbe7QUzuGke+TM2Wk4VhEHvcnYR3LkCo
         EVAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UrZvLJ0+QctbH+SbOVRfngHn4+RjcqJmVgAZ6B0SozY=;
        fh=CBTFiJEExHTh7aL5/M2gOE3PN6x+QZWxfP2eL3B13Ic=;
        b=Jpr8uIlAAt6w+JYeliPV6kDk+pbUYKytrg8wX4Ou3p+riihMKl5GP5Vj51+IapeKXM
         DyCc5NCCWpo91o90YwUuhdduzdRCvtY2xy9C7KB3welFTi1Awzp61rk3lXKc9FyBwJxZ
         JwD6Mfu8RpaeMmrIr1mnqnNdOamGfRDSaNSkXy5xO507P8ToESAOC8FISkFcBomrB0fO
         U8/rcU5UX8KVuPEzQ+hOUpgdFwAEYXVS6y4z/9iD1A3QGve8WT2ahTLdPHgN+yXztZuF
         s4lNK0oahyVd/cOJ2NBcRoSXpYoSwSECx7LHd+nvswXu7UUHldIzPjlAEA3UBuR/RX3U
         BObg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780530523; x=1781135323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrZvLJ0+QctbH+SbOVRfngHn4+RjcqJmVgAZ6B0SozY=;
        b=YprLbVfgdAD6Tfkc+W3A53M9nVysDkfrHJ9TL0MhOeHR52wMXq+eQ9sGxHee8wpxRl
         sSXvxR30g35gFvbSO1wxrfNHMTI9OhsgXSE/x38H3EpHSBwbm+ICFOW8zAtDRP2RZ9pl
         LpEChdRYDFyokUyD7jfTFx/8EUTIcE9NUyUMXIxZlPjkVsOVMA64Y3thSB9OFOQM6zkv
         Irfnhf02F74upAJ2L3OMiZLlpyX4REgMzrJ6XQMF9Ov5yeEstrSgAez+4R8AixNxhowZ
         NaEq7gTWbxQd1yPcX14oy7ISTK0GSwHFQOf17V6TEjAmSifUxtdJo0lLkBKRVHYiGyYL
         kF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780530523; x=1781135323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UrZvLJ0+QctbH+SbOVRfngHn4+RjcqJmVgAZ6B0SozY=;
        b=ccMxDJnrK9MMQA0Xbmw7RrL46OhXai8hFpsZ93ap3tc9kt3Y5tLvURieq2VlZ+qX0l
         KbXyiPddsWuSJU04K7xGl/DQnteME2uuRZ2OckWWPuZdJg+h0w1rzMRPQuZaU877QYV8
         5SRARcRUWfApy1jvBZni1pXLSlAt66scO0FXkzYLiDHpyz3OsN9xEgh+dZS0Sb9Ryt9o
         FevQCTQ+nfz3fvqOb5/pWimN8zB9QiVetVDkehjgC9aeWldHuVsJG84bUWLauoFIWfZW
         8FcBalXADRkPc6meiHU6wsosvogeUJlcxt2X+asCoeanWJ6WpTTLckK4jaIa6OxM+0wC
         9C/A==
X-Forwarded-Encrypted: i=1; AFNElJ8x+YY4GJgDilwmaf0LEfBvsNiKxSAgLe7eTBVKegUc8mEa4cWh2Tx2zCN5DfN4krlBB4l1/eES0MOnqXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB0YKSPB4qF8VJcsMVKza0yzNZzlgzrFqzGnm5X1RO9h+vuapf
	bvOwNFtzRZ8xTz2XAa7NVmMnfSUoT5h74W2GBeBCu7ZOzFr28TTchxDDsYE1rwDYIwAKrtsKLkZ
	Ah//iNCsCjp5feQEwqaV+Xm3/7EnKYImARA==
X-Gm-Gg: Acq92OG0av9YZy/ydRnlsgm3es/CzH9/OL8ctPmJQlvT3TCC8VnVQBTUl6d+lHytbEX
	7Syp+6umfzGudqMVmXT05DlZFBFUIKvODPAQ7ukjAFzVa6Mod8gn6m1MZ1S7C8FkNV2SUwg04Kv
	HadHUGH5+XwBHAAfj9CE1Rhp8b+GNpPFJF/dkyF9+e7an8+f83mzjklaJTPGMVUBXEBSbv4rAXx
	9dqxmxWgteH6b5jPBBBbbDbFrTRxf1yQWH+dmFsHDi24pKVFmdHdDkSmgDayNRynBDAmdEJjDOA
	C4Zf0wwHqrlY25Xmz1FRECr4rfgvhV2J6m1sV2KMx2OhisIg3gJBnZblArHmJ99J1rW7JqbdFoI
	=
X-Received: by 2002:a17:907:7f9e:b0:bec:f0bb:66f5 with SMTP id
 a640c23a62f3a-bf0b2bd07f8mr322742566b.30.1780530522749; Wed, 03 Jun 2026
 16:48:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601221805.821394-1-ihor.solodrai@linux.dev> <20260601221805.821394-14-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-14-ihor.solodrai@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 3 Jun 2026 16:48:01 -0700
X-Gm-Features: AVHnY4Iu0b0fxJL4EJQE7HKjF47Z2WnKGySX7L4rJ75qadJJeFQdPJkrrK014PE
Message-ID: <CAEf4BzYBHWKiTRF-Mf8ghPVPdWrpN79MjG_eBQ0DybeH90i5_Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 13/14] kbuild: Drop decl_tag_kfuncs and
 attributes from pahole flags
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Alan Maguire <alan.maguire@oracle.com>, Jiri Olsa <jolsa@kernel.org>, 
	bpf@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13560-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andriinakryiko@gmail.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,oracle.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriinakryiko@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B56BA63BECD

On Mon, Jun 1, 2026 at 3:19=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.d=
ev> wrote:
>
> resolve_btfids now emits all kfunc-specific BTF annotations for the
> kernel: the "bpf_kfunc" and "bpf_fastcall" decl tags and the
> address_space(1) type attribute on arena kfunc return/arguments. These
> were previously produced by pahole under the "decl_tag_kfuncs" and
> "attributes" btf_features.
>
> Drop both from the pahole invocation.
>
> Note that "decl_tag" (generic source __attribute__((btf_decl_tag))
> annotations) is a separate feature from "decl_tag_kfuncs" and must be kep=
t.
>

logistically, this pahole flag drop should go in the same commit as
resolve_btfids change that adds all of its functionality... which
probably requires merging few patches, but given all my ranting about
not doing "ensure" pattern, it's unavoidable, IMO



> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---
>  scripts/Makefile.btf | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.btf b/scripts/Makefile.btf
> index e66e13e79653..a1812985a61a 100644
> --- a/scripts/Makefile.btf
> +++ b/scripts/Makefile.btf
> @@ -14,9 +14,7 @@ pahole-flags-$(call test-ge, $(pahole-ver), 125)      +=
=3D --skip_encoding_btf_inconsis
>  else
>
>  # Switch to using --btf_features for v1.26 and later.
> -pahole-flags-$(call test-ge, $(pahole-ver), 126)  =3D -j$(JOBS) --btf_fe=
atures=3Dencode_force,var,float,enum64,decl_tag,type_tag,optimized_func,con=
sistent_func,decl_tag_kfuncs
> -
> -pahole-flags-$(call test-ge, $(pahole-ver), 130) +=3D --btf_features=3Da=
ttributes
> +pahole-flags-$(call test-ge, $(pahole-ver), 126)  =3D -j$(JOBS) --btf_fe=
atures=3Dencode_force,var,float,enum64,decl_tag,type_tag,optimized_func,con=
sistent_func
>
>  pahole-flags-$(call test-ge, $(pahole-ver), 131) +=3D --btf_features=3Dl=
ayout
>
> --
> 2.54.0
>

