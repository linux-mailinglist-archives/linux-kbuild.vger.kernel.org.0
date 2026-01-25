Return-Path: <linux-kbuild+bounces-10860-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFgzHBk3dmmTNgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10860-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Jan 2026 16:30:33 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C50988134A
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Jan 2026 16:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77CEE3006B43
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Jan 2026 15:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D241DDC3F;
	Sun, 25 Jan 2026 15:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E34GO64z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810271C8626
	for <linux-kbuild@vger.kernel.org>; Sun, 25 Jan 2026 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355030; cv=pass; b=e0HBkrL2d/dO/TWIP3X+PxZrFXf5LvjVor5lGr3nstP8Dxj0w2KtIzxr7kFarjbgTLBAggve0NNtSe3Tn3QUF/nG1FoZyv6JivE+lz6PfsmaePQXT4e4WX2gAP+5tKNZHg4pLj02OwvS4s01uKF5SIj3xIhRe6R2pSLvFCH35Us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355030; c=relaxed/simple;
	bh=VNfSPcXC/xEbR7/VkWVrMxFdBfJATYaLK27a9Sr/DKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WA8RXeCHqmj5UZmKnba5MGhIzdDeOYtCIhPaXNjfI3soZ4e45PXm3czKQwtO0dM6meg6w57CzZ4v86KFOwmE3nnxidqsseSIB2xYGixAyS7fleyBwdzGUow1z7K/zNgce/0jLWgqFdQmy2MtxwhhQ5smz5C/nODxXnbMf68aPvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E34GO64z; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b71e7dab12so310368eec.1
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Jan 2026 07:30:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769355028; cv=none;
        d=google.com; s=arc-20240605;
        b=HRgqxt+cr9b4iZlcru3CcSXMQ05n49wzIsHcNwuKsqxb6hzvRwevR/+BuI5DKE7a7q
         Ji3uqOnqpG6gszGciYO5gZFu/TFLKHQ/qGMW2aBy9DpXTSiUc1Pw9CUSqdDk5MI/ALtK
         5MCO2Vm2KAorx8hObdYcYCpdCtJwnA69vXxPfV5SAZpf60h/rLnpJ2QhoTIc7N+X9a2b
         VmbMLQ196ZvUxE8IcoUBO9d6qvG2hLvnC9Q4P1nJU36x8LxN6Uvmi3mXEC93NwgpGhOd
         L7v4ozlcJFoO7lCJnOUz8gCkstaCLZ2KZZ7B4/UTdzWfnlJlbatxSWCLWgG3VEMMYoD3
         9PIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VNfSPcXC/xEbR7/VkWVrMxFdBfJATYaLK27a9Sr/DKY=;
        fh=jGIHQEC9u8MmD6JgUXD/0XJ55dihOse/lNNyxrzq720=;
        b=STQzuqVn3P1CtiRqtvh2ob9ap0HsRNHtv8i1XTFNONt3N243iWEb12CfCKLTfi6BvX
         EaS9FxAV5otAeuzdsOqYWSFcXWY5/oRvsEbrld8qzw3tZ7fMoue5tVN0GP8CcODYWDiW
         Qp2Res5oZwGGzqP8LqAj0Iq7qc6bW9AqQYD4IhlPh51u32zJWMRGO3rcL98/zny1xVE4
         GQ6IctjFj8zvsXKnn2TH0GW/sp3wvOK3n3kt1MzNYlto3XyaBpBVNMIlhH/GEzWMaaZO
         Tdbl+7R7RJDPoJo14BxWEnzidKnhJ/Yw3zo8HhG9Mkwtyu086VYVD/7e4Z6f1cHBIZop
         LcMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769355028; x=1769959828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNfSPcXC/xEbR7/VkWVrMxFdBfJATYaLK27a9Sr/DKY=;
        b=E34GO64zFuOJQqINXN4slIXiZlsxGOGawP88WRhaCs20C9PI7XAtXJTaCTywEPk5c0
         gmjA2VOYhGGAPxT5mT+zyeEFQo1eOgMf7qfzCoIJuQ8SyFxPtb65bAlMx7deLK/ojfQz
         40NFYTkQsNkL4FUHNEYHGbhKvcktxSb1fea0ROpZ1v0tAvEOQNf2CdC4zWlK14lyS5H/
         JznLbgHKFT4suTBD4fG6+3iYX6GqGK1/TilcZ7yOt6L2FbOhEwcY7+6tsbsCFLtjy+fh
         sg2hzyPX5bf3bwToR4rYRYLO0fSYjgZY2nceIgptZoakKwnT5KvZVx81gifx9CGRV8T6
         QHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769355028; x=1769959828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VNfSPcXC/xEbR7/VkWVrMxFdBfJATYaLK27a9Sr/DKY=;
        b=s2s4QseaMvxubd9hTngSDsTybBOs2OZR6RKjai/8iCzw7iyiOUbyZI3JMXfCPXwbbu
         lpQ5U3stqBMLAb1yo7jZXRsLTeHazlb3GNQHBeXBzpftwW2phobL4XPmTR4p1xfpqSs2
         yGA2oLkS3jtmoGZBOGgcl346NzsG2EXKPWoU1C9oCrFJ75t5T2FcGiheN2CiZBSJqcgx
         ZOJZhgfxCV3RWYtC1mPveloDMAHZtT8r4k/d1rlRrIq7hqjl1JbYjx3briUe8xk9zN9G
         CJGAKLchWj038iNOkpxQS5Lc7x8yFHPdeqye/xHuBA21ejXRBsRkX0yAjKKRR/ouj5H0
         Brww==
X-Forwarded-Encrypted: i=1; AJvYcCX1Y2xRgPB1q837B/oeLOyhrAOIkxEoHVtg2/Fj713xCBfQ6QcW+B3sbcQuDqudlf92B3qh7VjjtbFbJ+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAp+yb5zTwMGQBnjZsSItWYs266bJFagfpj6CPtA/5WuRN8bNi
	W+QEmyxFP4wzPxASlTTBSZQbCJ7ntdljLnxMFq/m+wik4S7dCOodnkfu208sgtYWAMepP6pdCN8
	6d3Z3YRlxmPijjc3OvlFH8pmG8qfPAndhTAQq
X-Gm-Gg: AZuq6aJjeGDPp4Q+qMU9yCnaYqgUtaPqisi01F6orp95EbnrVy1sqIkJo0NeMTJqSuB
	6a4/VMUYu0ydZeijw/9gYc9oiL688/Yhmoq4OPYTsNGToQ72da6qNoK9Q2a2lilqNW/G76W/XOj
	BW8JUuy/bU8HE3IjKqRyUrcCyQ7p1Q/WgKs1Yns5rcPjiSfmjJEU7JiD8NJ6e0h0pd5TfupdQ/r
	l2VYvdUlOMwBwSHSwTn1qdXEYBVOtAbE5WIwxPBd0zpBerw+RT+rbFufx4NbJEoZ239UKMZM/yj
	4RKM5TezlmLuEId8N/zJkb7O0UMi3YhFDmryfzqyHUUoOOr7b/iUqQ0gTcwVr8kNDCQ9uebNBIg
	ZNdpjJZMFcaxv
X-Received: by 2002:a05:7300:730f:b0:2b1:79b7:5850 with SMTP id
 5a478bee46e88-2b7648132b1mr423341eec.8.1769355028413; Sun, 25 Jan 2026
 07:30:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120115352.10910-1-luis.augenstein@tngtech.com>
 <CANiq72mtWhjVNNYc6nvxuQ3XAnMWBDiZyOvJ1BNN=M+097Wvpw@mail.gmail.com> <8b756b72-36f1-43d2-96a6-159165faedd6@tngtech.com>
In-Reply-To: <8b756b72-36f1-43d2-96a6-159165faedd6@tngtech.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 Jan 2026 16:30:16 +0100
X-Gm-Features: AZwV_QjV7G3o7Je1Xwr_BQ7pL-cF_gizW1UVEDZWscR27ynh7n1d6D72kzyT-jI
Message-ID: <CANiq72nBt-ndkbGk2YSsrkx4k9nn0cVi4jgjZZqOFbUXjOQkEw@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Add SPDX SBOM generation tool
To: Luis Augenstein <luis.augenstein@tngtech.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	gregkh@linuxfoundation.org, maximilian.huber@tngtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-10860-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C50988134A
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 9:32=E2=80=AFPM Luis Augenstein
<luis.augenstein@tngtech.com> wrote:
>
> The main reason to run the SBOM tool within the main make process is to
> gain direct access to the make/environment variables used during the
> build. The `KERNEL_BUILD_VARIABLES_ALLOWLIST` defines which environment
> variables should be included in the SBOM if they are available. When the
> tool is run outside of the main build, this information is no longer
> accessible.

I was not suggesting to take it out of `make` completely if the
environment is needed, but rather have the user call the target (which
could still depend on the kernel build like you have it now).

For instance, for generating the rust-analyzer configuration, we want
to have the environment too, so we have a Make target that users call
when they need it, rather than making it a configuration of the
kernel.

Now, I can understand there may be other reasons (please see my reply to Gr=
eg).

Thanks!

Cheers,
Miguel

